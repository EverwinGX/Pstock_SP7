unit ThreadGenesysSP;

interface

uses
  Classes, stdctrls, comctrls, wwstorep, SysUtils, AdvEdit, wwriched, Wwquery, uADCompClient, uADStanError, windows;

type
  TThreadGenesysSP = class(TThread)
  private
    { Déclarations privées }
    LabelCommentaireCaption: string;

    LabelCommentaire: Tedit;

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
    constructor Create(L1: Tedit; I0: TADStoredProc; I1: TADStoredProc; M0: TwwDBRichEdit; M1: TwwDBRichEdit; Q0: TADQuery);
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

constructor TThreadGenesysSP.Create(L1: Tedit; I0: TADStoredProc; I1: TADStoredProc; M0: TwwDBRichEdit; M1: TwwDBRichEdit; Q0: TADQuery);
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

procedure TThreadGenesysSP.rafraichitLabels;
begin
  LabelCommentaire.text := LabelCommentaireCaption;
end;

procedure TThreadGenesysSP.DoHandleException;
var
  mess1: string;
  _pos: Integer;
  MessSQL: EADDBEngineException;
  MessUser: string;
  i: Integer;
begin

  // Traitement d'exception de base de données : reconstruit un message avec l'ensemble des erreurs retournées
  if FException is EADDBEngineException then
  begin
    MessSQL := EADDBEngineException(FException);
    for i := 0 to MessSQL.ErrorCount - 1 do
    begin
      mess1 := MessSQL.Errors[i].message;
      _pos := Pos('[SQL Server]', mess1);
      if (_pos > 0) then
      begin
        Delete(mess1, 1, _pos - 1);
        _pos := Pos('la valeur NULL est éliminée par un agrégat', mess1);
        if (_pos = 0) then
        begin
          MessUser := MessUser + mess1 + #13 + #10;
        end;
      end;

    end;

    Application.MessageBox(PChar(MessUser), 'Erreur', MB_OK + MB_ICONERROR + MB_TOPMOST)
  end
  else
  begin

    // Now actually show the exception
    if FException is Exception then
      // Application.MessageBox(PChar(FException.message), 'Erreur', MB_OK + MB_ICONERROR + MB_TOPMOST)
      Application.ShowException(FException)
    else
      SysUtils.ShowException(FException, nil);
  end;
end;

procedure TThreadGenesysSP.HandleException;
begin
  // This function is virtual so you can override it
  // and add your own functionality.
  FException := Exception(ExceptObject);
  try
    // Don't show EAbort messages
    if not(FException is EAbort) then
      Synchronize(DoHandleException);
  finally
    FException := nil;
  end;
end;

procedure TThreadGenesysSP.Execute;
var
  dir: string;
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
    Synchronize(rafraichitLabels);

    if (not Terminated and not Stopped) then
    begin
      SP.ExecProc;
      // Concatene_Memos;
    end;
  except
    HandleException;
    erreur := True;
    LabelCommentaireCaption := 'Un problème a été rencontré !';
    Synchronize(rafraichitLabels);
    // Application.HandleException(Self);
  end;

  if (erreur = True) then
  begin
    LabelCommentaireCaption := 'Erreur...';
  end
  else if (Stopped = True) then
  begin
    LabelCommentaireCaption := 'Interrompu par l''utilisateur...';
  end
  else
  begin
    LabelCommentaireCaption := 'Fin de traitement ...';
  end;
  Synchronize(rafraichitLabels);
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
      Synchronize(rafraichitLabels);

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
        if Edit_D.Lines.text <> '' then
          Edit_D.Lines.Append('');

        while not SP_Memos.Eof do
        begin
          Table := SP_Memos.fieldbyname('Nom_Table').asansistring;
          Champ := SP_Memos.fieldbyname('Champ').asansistring;
          Cle := SP_Memos.fieldbyname('Cle').asansistring;

          // Sur changement de table ou de champ on applique la modif
          if (Table <> Table_Old) or (Champ <> Champ_Old) or (Nom_Cle <> Nom_Cle_Old) or (Cle <> Cle_Old) then
          begin
            wq_Update.close;
            wq_Update.SQL.Clear;
            wq_Update.SQL.Add('SELECT ');
            wq_Update.SQL.Add(Champ_Old);
            wq_Update.SQL.Add('FROM ' + Table_Old);
            wq_Update.SQL.Add('WHERE ' + Nom_Cle_Old + ' = ' + Cle_Old);
            wq_Update.Open;

            wq_Update.Edit;
            Edit_D.CopyRichEdittoBlob(wq_Update.fieldbyname(Champ_Old));
            wq_Update.Post;

            Table_Old := SP_Memos.fieldbyname('Nom_Table').asansistring;
            Champ_Old := SP_Memos.fieldbyname('Champ').asansistring;
            Nom_Cle_Old := SP_Memos.fieldbyname('Nom_Cle').asansistring;
            Cle_Old := SP_Memos.fieldbyname('Cle').asansistring;

            Edit_D.Lines.Clear;
            Edit_D.CopyRichEditFromBlob(SP_Memos.fieldbyname('Memo_Destination'));
            // Edit_D.Lines.Append('');

          end;

          // on ajoute les lignes
          Edit_S.CopyRichEditFromBlob(SP_Memos.fieldbyname('Memo_Ajout'));
          Edit_D.AppendRichEditFrom(Edit_S);

          SP_Memos.Next;
        end;

        // Mise a jour du dernier enregistrement
        wq_Update.close;
        wq_Update.SQL.Clear;
        wq_Update.SQL.Add('SELECT ');
        wq_Update.SQL.Add(Champ_Old);
        wq_Update.SQL.Add('FROM ' + Table_Old);
        wq_Update.SQL.Add('WHERE ' + Nom_Cle_Old + ' = ' + Cle_Old);
        wq_Update.Open;

        wq_Update.Edit;
        Edit_D.CopyRichEdittoBlob(wq_Update.fieldbyname(Champ_Old));
        wq_Update.Post;
      finally

      end;

    end;
  end;
end;

end.
