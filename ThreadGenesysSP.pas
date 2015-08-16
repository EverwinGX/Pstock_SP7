unit ThreadGenesysSP;

interface

uses
    Classes, stdctrls, comctrls, wwstorep, SysUtils, AdvEdit, wwriched, Wwquery,uADCompClient ;

type
    TThreadGenesysSP = class(TThread)
    private
        { Déclarations privées }
        LabelCommentaireCaption: string;

        LabelCommentaire: TadvEdit;

        SP: TADStoredProc;
        SP_Memos: TADStoredProc;

        Edit_S: TwwDBRichEdit;
        Edit_D: TwwDBRichEdit;
        wq_Update: TADQuery;
        FException: Exception;
        procedure rafraichitLabels;
        procedure Concatene_Memos;

         procedure DoHandleException;
    protected
        procedure Execute; override;
        procedure HandleException; virtual;
    public
        Stopped: Boolean;
        constructor Create(L1: TadvEdit; I0: TADStoredProc; I1: TADStoredProc; M0: TwwDBRichEdit; M1: TwwDBRichEdit; Q0: TADQuery);
    end;

implementation

{ Important : Les méthodes et propriétés des objets des VCL ne peuvent être
  utilisées que dans des méthodes appelées avec Synchronize; par exemple :

      Synchronize(UpdateCaption);

  et UpdateCaption pourrait être :

    procedure TThreadGenesysSP.UpdateCaption;
    begin
      Form1.Caption := 'Mise à jour dans un thread';
    end; }

{ TThreadGenesysSP }

uses
    forms;

constructor TThreadGenesysSP.Create(L1: TadvEdit; I0: TADStoredProc; I1: TADStoredProc; M0: TwwDBRichEdit; M1: TwwDBRichEdit; Q0: TADQuery);
begin
    LabelCommentaire := L1;
    SP := I0;
    SP_Memos := I1;
    Edit_S := M0;
    Edit_D := M1;
    wq_Update := Q0;
    FreeOnTerminate := True;
    inherited Create(False);
end;

procedure TThreadGenesysSP.RafraichitLabels;
begin
    LabelCommentaire.text := LabelCommentaireCaption;
end;
procedure TThreadGenesysSP.DoHandleException;
begin
  // Cancel the mouse capture

  // Now actually show the exception
  if FException is Exception then
    Application.ShowException(FException)
  else
    SysUtils.ShowException(FException, nil);
end;
procedure TThreadGenesysSP.HandleException;
begin
  // This function is virtual so you can override it
  // and add your own functionality.
  FException := Exception(ExceptObject);
  try
    // Don't show EAbort messages
    if not (FException is EAbort) then
      Synchronize(DoHandleException);
  finally
    FException := nil;
  end;
end;

procedure TThreadGenesysSP.Execute;
var dir: string;
    erreur: Boolean;
    Temp_String: string;
    Table: string;
    Champ: string;
    Memo: string;
    Cle: string;
    Table_Old: string;
    Champ_Old: string;
    Memo_Old: string;
    Cle_Old: string;
begin
    { Placez le code du thread ici }
    try
        erreur := False;
        LabelCommentaireCaption := 'Traitement en cours ...';
        Synchronize(RafraichitLabels);

        if (not Terminated and not Stopped) then
        begin
            SP.ExecProc;
            //Concatene_Memos;
        end;
    except
        HandleException;
        erreur := True;
        LabelCommentaireCaption := 'Un problème a été rencontré !';
        Synchronize(RafraichitLabels);
        //Application.HandleException(Self);
    end;

    if (erreur = True) then
    begin
        LabelCommentaireCaption := 'Erreur...';
    end
    else
        if (Stopped = True) then
        begin
            LabelCommentaireCaption := 'Interrompu par l''utilisateur...';
        end
        else
        begin
            LabelCommentaireCaption := 'Fin de traitement ...';
        end;
    Synchronize(RafraichitLabels);
end;

procedure TThreadGenesysSP.Concatene_Memos;
var
    Table: string;
    Champ: string;
    Nom_Cle: string;
    Memo: string;
    Cle: string;
    Table_Old: string;
    Champ_Old: string;
    Nom_Cle_Old: string;
    Memo_Old: string;
    Cle_Old: string;
begin
    // On tente la copie des memo

    if SP_Memos <> nil then
    begin
        try
            SP_Memos.close;
            SP_Memos.Open;
        except
            HandleException;
            LabelCommentaireCaption := 'Un problème a été rencontré !';
            Synchronize(RafraichitLabels);

        end;

        if SP_Memos.Active = True then
        begin
            try
                SP_Memos.First;
                Table := SP_Memos.fieldbyname('Nom_Table').asansistring;
                Table_Old := SP_Memos.fieldbyname('Nom_Table').asansistring;
                Champ := SP_Memos.fieldbyname('Champ').asansistring;
                Champ_Old := SP_Memos.fieldbyname('Champ').asansistring;
                Nom_Cle := SP_Memos.fieldbyname('Nom_Cle').asansistring;
                Nom_Cle_Old := SP_Memos.fieldbyname('Nom_Cle').asansistring;
                Cle := SP_Memos.fieldbyname('Cle').asansistring;
                Cle_Old := SP_Memos.fieldbyname('Cle').asansistring;

                Edit_D.Lines.Clear;
                Edit_D.CopyRichEditFromBlob(SP_Memos.fieldbyname('Memo_Destination'));
                if Edit_D.Lines.Text <> '' then
                    Edit_D.Lines.Append('');

                while not SP_Memos.Eof do
                begin
                    Table := SP_Memos.fieldbyname('Nom_Table').asansistring;
                    Champ := SP_Memos.fieldbyname('Champ').asansistring;
                    Cle := SP_Memos.fieldbyname('Cle').asansistring;


                    //Sur changement de table ou de champ on applique la modif
                    if (Table <> Table_old) or (Champ <> Champ_Old) or (Nom_Cle <> Nom_Cle_Old) or (Cle <> Cle_Old) then
                    begin
                        wq_Update.Close;
                        wq_Update.SQL.Clear;
                        wq_Update.SQL.Add('SELECT ');
                        wq_Update.SQL.Add(Champ_old);
                        wq_Update.SQL.Add('FROM ' + Table_old);
                        wq_Update.SQL.Add('WHERE ' + Nom_Cle_Old + ' = ' + Cle_Old);
                        wq_Update.Open;

                        wq_Update.Edit;
                        Edit_D.CopyRichEdittoBlob(wq_Update.FieldByName(Champ_old));
                        wq_Update.Post;

                        Table_Old := SP_Memos.fieldbyname('Nom_Table').asansistring;
                        Champ_Old := SP_Memos.fieldbyname('Champ').asansistring;
                        Nom_Cle_Old := SP_Memos.fieldbyname('Nom_Cle').asansistring;
                        Cle_Old := SP_Memos.fieldbyname('Cle').asansistring;

                        Edit_D.Lines.Clear;
                        Edit_D.CopyRichEditFromBlob(SP_Memos.fieldbyname('Memo_Destination'));
                        //Edit_D.Lines.Append('');

                    end;

                    // on ajoute les lignes
                    Edit_S.CopyRichEditFromBlob(SP_Memos.fieldbyname('Memo_Ajout'));
                    Edit_D.AppendRichEditFrom(Edit_S);

                    Sp_Memos.Next;
                end;

                //Mise a jour du dernier enregistrement
                wq_Update.Close;
                wq_Update.SQL.Clear;
                wq_Update.SQL.Add('SELECT ');
                wq_Update.SQL.Add(Champ_old);
                wq_Update.SQL.Add('FROM ' + Table_old);
                wq_Update.SQL.Add('WHERE ' + Nom_Cle_Old + ' = ' + Cle_Old);
                wq_Update.Open;

                wq_Update.Edit;
                Edit_D.CopyRichEdittoBlob(wq_Update.FieldByName(Champ_old));
                wq_Update.Post;
            finally

            end;

        end;
    end;
end;

end.

