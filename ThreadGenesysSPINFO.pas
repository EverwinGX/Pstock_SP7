unit ThreadGenesysSPINFO;

interface

uses
    Classes, stdctrls, comctrls, wwstorep, SysUtils, AdvEdit, wwriched, Wwquery;

type
    TThreadGenesysSPINFO = class(TThread)
    private
        { Déclarations privées }
        LabelCommentaireCaption: string;

        LabelCommentaire: TadvEdit;

        SP: TwwStoredProc;
        SP_Memos: TwwStoredProc;

        Edit_S: TwwDBRichEdit;
        Edit_D: TwwDBRichEdit;
        wq_Update: Twwquery;

        procedure rafraichitLabels;
    protected
        procedure Execute; override;
    public
        Stopped: Boolean;
        constructor Create(L1: TadvEdit; I0: TwwStoredProc; I1: TwwStoredProc; M0: TwwDBRichEdit; M1: TwwDBRichEdit; Q0: TwwQuery);
    end;

implementation

{ Important : Les méthodes et propriétés des objets des VCL ne peuvent être
  utilisées que dans des méthodes appelées avec Synchronize; par exemple :

      Synchronize(UpdateCaption);

  et UpdateCaption pourrait être :

    procedure TThreadGenesysSPINFO.UpdateCaption;
    begin
      Form1.Caption := 'Mise à jour dans un thread';
    end; }

{ TThreadGenesysSPINFO }

uses
    forms;

constructor TThreadGenesysSPINFO.Create(L1: TadvEdit; I0: TwwStoredProc; I1: TwwStoredProc; M0: TwwDBRichEdit; M1: TwwDBRichEdit; Q0: TwwQuery);
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

procedure TThreadGenesysSPINFO.RafraichitLabels;
begin
    LabelCommentaire.text := LabelCommentaireCaption;
end;

procedure TThreadGenesysSPINFO.Execute;
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
            SP.close;
            SP.open;
            LabelCommentaireCaption := sp.fieldbyname('Msg').asstring;
        end;
    except
        erreur := True;
        LabelCommentaireCaption := 'Un problème a été rencontré !';
        Synchronize(RafraichitLabels);
        Application.HandleException(Self);
    end;


    Synchronize(RafraichitLabels);
end;

end.

