unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, wwstorep, fcImage, fcimageform,
  AdvPicture, rtflabel, ExtCtrls, Shader, EllipsLabel, ThreadGenesysSP,
  ThreadGenesysSPINFO,
  AdvEdit, ShellAPI, ImgList, ComCtrls, wwriched, Wwquery, FileCtrl, ShlObj,
  GradientLabel, fcLabel, StrCryptage, Wwdatsrc, Grids, Excel_TLB, ADODB, inifiles, Wwdbigrd, Wwdbgrid;

type
  TForm1 = class(TForm)
    fcImageForm1: TfcImageForm;
    AdvPicture1: TAdvPicture;
    AdvEdit1: TAdvEdit;
    Shader1: TShader;
    OpenDlg: TOpenDialog;
    IconesListe: TImageList;
    wq_memos0: TwwQuery;
    Edit1: TwwDBRichEdit;
    Edit2: TwwDBRichEdit;
    wq_GETINIT0: TwwQuery;
    QueryGetUser0: TwwQuery;
    wq_Exist0: TwwQuery;
    wq_Exist0Nom: TStringField;
    IconesListe_Plus: TImageList;
    AdvEdit2: TAdvEdit;
    wq_custom0: TwwQuery;
    wq_custom0Liste1: TStringField;
    wq_custom0Liste2: TStringField;
    wq_custom0Liste1width: TIntegerField;
    wq_custom0Liste2width: TIntegerField;
    wq_custom0Liste3: TStringField;
    wq_custom0Liste3width: TIntegerField;
    wq_custom0SaisieLibre: TIntegerField;
    wq_wm0: TwwQuery;
    fcLabel1: TfcLabel;
    Cryptage1: TCryptage;
    wq_EXCEL_READ_FIC0: TwwQuery;
    wq_EXCEL_READ_VAL0: TwwQuery;
    wq_EXCEL_READ_LOG0: TwwQuery;
    TU_Valeurs: TUpdateSQL;
    wq_EXCEL_READ_TAB0: TwwQuery;
    TU_TAB: TUpdateSQL;
    Database: TADOConnection;
    wq_Exist: TADOQuery;
    wq_GETINIT: TADOQuery;
    wq_wm: TADOQuery;
    wq_memos: TADOQuery;
    QueryGetUser: TADOQuery;
    wq_custom: TADOQuery;
    SP_OPEN_APPLI: TADOStoredProc;
    SP_COPY_FILE: TADOStoredProc;
    SP_PRINT_BEFORE: TADOStoredProc;
    SP_CLOSE_BEFORE: TADOStoredProc;
    SP_CLOSE_AFTER: TADOStoredProc;
    SP_COPY_FILE_AFTER: TADOStoredProc;
    SP_PRINT: TADOStoredProc;
    SP_CLOSE: TADOStoredProc;
    SP_TXT_AFTER: TADOStoredProc;
    SP_TXT_BEFORE: TADOStoredProc;
    SP_TXT_VALIDE: TADOStoredProc;
    SP_TXT: TADOStoredProc;
    SP_CREATE_DIR: TADOStoredProc;
    SP_COPY_FILE_BEFORE: TADOStoredProc;
    SP_REFRESH: TADOStoredProc;
    SP_REFRESH_BEFORE: TADOStoredProc;
    SP_PARAM_AFTER: TADOStoredProc;
    SP_PARAM: TADOStoredProc;
    SP_FICHIER: TADOStoredProc;
    SP_MEMOS: TADOStoredProc;
    SP: TADOStoredProc;
    SP_BEFORE: TADOStoredProc;
    SP_LISTE_FICHES_BEFORE: TADOStoredProc;
    SP_LISTE_FICHES: TADOStoredProc;
    SP_OPEN_APPLI_BEFORE: TADOStoredProc;
    SP_EXCEL_READ_MOVE: TADOStoredProc;
    SP_EXCEL_READ_END: TADOStoredProc;
    SP_LOCK_AFTER: TADOStoredProc;
    SP_EXCEL: TADOStoredProc;
    SP_EXCEL_BEFORE: TADOStoredProc;
    SP_OUTLOOK_AFTER: TADOStoredProc;
    SP_OUTLOOK_BEFORE: TADOStoredProc;
    SP_OUTLOOK: TADOStoredProc;
    SP_EXCEL_READ_REP: TADOStoredProc;
    SP_EXCEL_READ_START: TADOStoredProc;
    SP_EXCEL_READ: TADOStoredProc;
    SP_NAV: TADOStoredProc;
    SP_LOCK: TADOStoredProc;
    SP_LOCK_BEFORE: TADOStoredProc;
    wq_EXCEL_READ_FIC: TADOQuery;
    wq_EXCEL_READ_LOG: TADOQuery;
    wq_EXCEL_READ_VAL: TADOQuery;
    wq_EXCEL_READ_TAB: TADOQuery;
    ADODataSet1: TADODataSet;
    ADODataSet2: TADODataSet;
    procedure BitBtn1Click(Sender: TObject);

    procedure AppException(Sender: TObject; E: Exception);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Fin_Appli;
    procedure AdvPicture1FrameChange(Sender: TObject);
    procedure Finalise_Traitement;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AdvEdit1Change(Sender: TObject);
    function copier(Handle: HWND; Source, Cible: string): Integer;
    procedure Transfert_Ico;
    procedure FormActivate(Sender: TObject);
    procedure Voir_Fiche(N_fiche: Integer; Fiche: Integer);
    function BrowseforFile(Handle: THandle; Title: string; Filename: string): string;
    function Procedure_Exist(Nom_procedure: string): Boolean;
    procedure AdvEdit2Change(Sender: TObject);
    procedure Fenetre_Position(Fenetre: TForm);
    procedure Fichiers_Rep(Source: string; N_user: Integer; Cle_Session: string);
    procedure Read_Excel_Log(Code_Log, Message_Log, Fichier, Feuille: string; N_user: Integer; Cle_Session: string);
  private
    Find_Fenetre: AnsiString;
    Handle_Fenetre: THandle;

    msgreussite, msgerreur: AnsiString;
    Ouverture_Fiche: Integer;
    Type_Fiche: Integer;
    N_fiche: Integer;
    Refresh: Integer;
    Nom_Fenetre: AnsiString;
    Plusieurs_Fiches: Integer;
    N_Wait, N_Visible, N_Refresh, WM_OPEN: Integer;
    choix: Integer;
    iCptFic: Integer;
    Handle_Application: Integer;
    encours: Boolean;
    ThreadSP: TThreadGenesysSP;
    ThreadSPinfo: TThreadGenesysSPINFO;
    Tab_Params: array [0 .. 9] of AnsiString;
    HandleGeneMail: Integer;
    First_active: Boolean;
    Nom_Societe: AnsiString;
    Nom_Fenetre_Genesys: AnsiString;

    User: AnsiString;

    Timer: Integer;

    { Déclarations publiques }
    Olexls: Variant;
  public
    IsQuitter: Boolean;
    Nom_procedure: AnsiString;
    cle: Integer;
    N_user: Integer;
    P1_Procedure, P2_Procedure: AnsiString;
    Handle_ouverture: Integer;
    Db: AnsiString;
    Param_Top_Most: Integer;
    N_Handle: Integer;
    Chemin_Fic: AnsiString;
    Handle_Genesys: Integer;
  end;

var
  Form1: TForm1;

implementation

uses Attendre, U_params, WM_GENESYS, U_Mail_OUTLOOK, ComObj, U_Navigation;
{$R *.DFM}
{$R Manifest.res}
// ! procedure récursive

procedure RechercheEnfants(HParent: THandle);
// Handle : Handle de l'enafant
// Index  : Ordre du parent dans le TreeView
var
  Handle: THandle;
  p: PChar;
  s: string;

begin

  Handle := GetWindow(HParent, GW_CHILD); // Recherche de la première fenêtre enfant direct
  while (Handle <> 0) do // Tant qu'on en trouve ....
  begin
    p := StrAlloc(256);
    GetWindowText(Handle, p, 256);
    if p = Form1.Find_Fenetre then
    begin
      Form1.Handle_Fenetre := Handle;
      // libération de la chaîne
      StrDispose(p);
      Break;
    end;

    // libération de la chaîne
    StrDispose(p);
    RechercheEnfants(Handle); // Recherche de ses propres enfants
    Handle := GetNextWindow(Handle, GW_HWNDNEXT);
    // recherche de la fenete suivante
  end;
end;

function ListeChild(Handle: HWND; Info: LParam): Boolean; stdcall;
// Handle : Handle de l'enfant trouvé
var
  p: PChar;
  s: string;
  Nom_Fenetre: string;
begin
  p := StrAlloc(256);
  GetWindowText(Handle, p, 256); // Texte (éventuel) de la fenêtre
  s := inttostr(Handle) + ' - ' + p;
  Nom_Fenetre := PChar(p);
  if (copy(Nom_Fenetre, 1, 9) = 'GENESYS -') then
  begin
    RechercheEnfants(Handle); // Recherche des fenetres enfants
  end;

  StrDispose(p);
  if (Form1.Handle_Fenetre > 0) then
  begin
    Result := False;
  end
  else
  begin
    Result := True; // pour continuer
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.CreateParams(var Params: TCreateParams);
begin
  // permet l'affichage en avant par surcharge de la procedure createparams
  inherited CreateParams(Params);
  with Params do
  begin
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TForm1.AppException(Sender: TObject; E: Exception);
var
  mess1: string;
  _pos: Integer;
begin
  mess1 := E.Message;
  _pos := Pos('[SQL Server]', mess1);
  if (_pos > 0) then
  begin
    Delete(mess1, 1, _pos - 1);
    E.Message := mess1;
  end;
  AdvPicture1.Animate := False;
  Application.MessageBox(PChar(E.message), 'Erreur', MB_OK + MB_ICONERROR + MB_TOPMOST);
end;

procedure TForm1.Fenetre_Position(Fenetre: TForm);
var
  Hauteur: Integer;
  Largeur: Integer;
  Top: Integer;
  Left: Integer;
  R: TRect;
begin
  if Handle_Genesys <> 0 then
  begin
    GetWindowRect(Handle_Genesys, R);
    Hauteur := R.Bottom - R.Top;
    Largeur := R.Right - R.Left;
    Top := R.Top;
    Left := R.Left;

    Fenetre.Left := Left + ((Largeur - Fenetre.Width) div 2);
    Fenetre.Top := Top + ((Hauteur - Fenetre.Height) div 2);
  end;
end;

procedure TForm1.Transfert_Ico;
var
  i: Integer;
  Ico: Ticon;
begin
  Ico := Ticon.Create;
  for i := IconesListe.Count + 1 to 150 do
  begin
    IconesListe_Plus.GetIcon(0, Ico);
    IconesListe.AddIcon(Ico);
  end;

  for i := 0 to IconesListe_Plus.Count - 1 do
  begin
    IconesListe_Plus.GetIcon(i, Ico);
    IconesListe.AddIcon(Ico);
  end;

  if Ico <> nil then
    Ico := nil;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ConnexionCryptee: Boolean;
  LoginCrypte: AnsiString;
  PasswordCrypte: AnsiString;
  iniFile: TIniFile;
  Chaine_Connexion: AnsiString;

begin
  Application.OnException := AppException;

  try
    Transfert_Ico;
    HandleGeneMail := 0;
    N_Visible := 0;

    // Base de donnée
    Db := ParamStr(1);

    cle := StrToIntdef(ParamStr(2), 0);

    // Récupération du N_user
    N_user := StrToIntdef(ParamStr(3), 0);

    // Récupération du Handle
    N_Handle := StrToIntdef(ParamStr(4), 0);

    Nom_procedure := ParamStr(5);

    N_Wait := StrToInt(ParamStr(6));

    N_Visible := StrToInt(ParamStr(7));

    N_Refresh := StrToInt(ParamStr(8));

    WM_OPEN := StrToInt(ParamStr(9));

    P1_Procedure := ParamStr(10);

    P2_Procedure := ParamStr(11);

    ThreadSP := nil;
    ThreadSPinfo := nil;

    // *************************************************************
    // ATTENTION
    // Récupération de handle de Genesys en fonction de l'utilisateur
    //
    // *************************************************************
    Handle_ouverture := N_Handle;
    // Database.AliasName := Db;

    iniFile := TIniFile.Create(ExtractFileDir(ParamStr(0)) + '\' + 'GX-ODBC.ini');
    Database.close;
    Cryptage1.AliasBD := Db;

    if iniFile.ReadString(Db, 'Authentification_Windows', '') = 'FALSE' then
    begin
      Chaine_Connexion := iniFile.ReadString(Db, 'Connexion_SQL', '');

    end
    else
    begin
      Chaine_Connexion := iniFile.ReadString(Db, 'Connexion_Windows', '');
    end;
    Chaine_Connexion := stringreplace(Chaine_Connexion, '$PASSWORD$', Cryptage1.getPassword,
      [rfReplaceAll, rfIgnoreCase]);
    Chaine_Connexion := stringreplace(Chaine_Connexion, '$USER$', Cryptage1.GetLogin, [rfReplaceAll, rfIgnoreCase]);
    Chaine_Connexion := stringreplace(Chaine_Connexion, '$SERVEUR$', iniFile.ReadString(Db, 'Serveur', ''),
      [rfReplaceAll, rfIgnoreCase]);
    Chaine_Connexion := stringreplace(Chaine_Connexion, '$BASE$', iniFile.ReadString(Db, 'base', ''),
      [rfReplaceAll, rfIgnoreCase]);


    // Reconstruction de la chaine de connexion

    Database.ConnectionString := Chaine_Connexion;
    iniFile.Free;
    Try
      Database.Open;
    except
      Application.HandleException(Self);
      Fin_Appli;
    End;
    wq_GETINIT.Open;

    if N_user > 0 then
    begin
      wq_GETINIT.Open;
      Nom_Societe := wq_GETINIT.fieldbyname('Nom_societe').AsAnsiString;
      wq_GETINIT.close;
      QueryGetUser.close;
      QueryGetUser.Parameters.ParamByName('N_user').Value := N_user;
      QueryGetUser.Open;
      User := lowercase(QueryGetUser.fieldbyname('Login').AsAnsiString);
      //QueryGetUser.close;
      Nom_Fenetre_Genesys := 'GENESYS - ' + Nom_Societe + ' - ' + User;
      Handle_Genesys := findwindow(nil, PChar(Nom_Fenetre_Genesys));
      if Handle_Genesys = 0 then
      begin
        Nom_Fenetre_Genesys := 'EVERWIN-GX - ' + Nom_Societe + ' - ' + User;
        Handle_Genesys := findwindow(nil, PwideChar(Nom_Fenetre_Genesys));
      end;

      if Handle_Genesys > 0 then
        Handle_ouverture := Handle_Genesys;

    end;

    SetWindowLong(Application.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle,
        GWL_EXSTYLE) and not WS_EX_APPWINDOW or WS_EX_TOOLWINDOW);
  except
    Application.HandleException(Self);
  end;

  // application.ShowMainForm:=false;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  i: Integer;
begin

  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TDataSet) and ((Components[i] as TDataSet).Active = True) then (Components[i] as TDataSet)
      .close;

  Database.close;

  if ThreadSP <> nil then
  begin
    ThreadSP.Terminate;
    // attente de la fin du Thread Ferme quand même au bout de 10 secondes
    // WaitForSingleObject(Threadsp.Handle,10000);
    ThreadSP := nil;
  end;
  if ThreadSPinfo <> nil then
  begin
    ThreadSPinfo.Terminate;
    // attente de la fin du Thread Ferme quand même au bout de 10 secondes
    // WaitForSingleObject(Threadsp.Handle,10000);
    ThreadSPinfo := nil;
  end;
end;

procedure TForm1.Fin_Appli;
var
  i: Integer;
begin

  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TDataSet) and ((Components[i] as TDataSet).Active = True) then (Components[i] as TDataSet)
      .close;

  if ThreadSP <> nil then
  begin
    ThreadSP.Terminate;
    // attente de la fin du Thread Ferme quand même au bout de 10 secondes
    // WaitForSingleObject(Threadsp.Handle,10000);
    ThreadSP := nil;
  end;
  if ThreadSPinfo <> nil then
  begin
    ThreadSPinfo.Terminate;
    // attente de la fin du Thread Ferme quand même au bout de 10 secondes
    // WaitForSingleObject(Threadsp.Handle,10000);
    ThreadSPinfo := nil;
  end;

  Database.close;

  close;

end;

function TForm1.Procedure_Exist(Nom_procedure: string): Boolean;
begin
  Result := wq_Exist.locate('Nom', Nom_procedure, [loCaseInsensitive]);
end;

procedure TForm1.AdvPicture1FrameChange(Sender: TObject);
var
  i, j, cpt: Integer;
var
  Chemin_dest: string;
var
  Nom_fic: string;
var
  temp: string;
var
  Choix_Entree: Integer;
var
  Resultat_copie: Integer;
var
  Directory_Only: Integer;
var
  Exist_Copy_After: Boolean;
  Fichier_excel: string;
  Fichier_excel_Save: string;
  Fichier_excel_old: string;
  Fichier_excel_Save_old: string;
  Fermer_excel: string;
  Quit_Excel: string;
  Str_Feuille, Range_Clear, Range_Fit: string;
  Str_Feuille_Old: string;
  int_Line, int_col, int_line_End, int_col_end, Col_Cpt_vide, Plag_Cpt_vide, Cpt_vide: Integer;
  Read_Excel_session: string;
  Read_Excel_File_Ok: Boolean;
  Read_Excel_Valeur: string;
  Read_Excel_Vide: string;
  Result_Move: longbool;
  Param: Tparameter;
  Print_ID:string;
label Suite;
begin
  if encours = True then
    exit;

  encours := True;

  try
    Application.ProcessMessages;
    AdvPicture1.Animate := True;
    AdvPicture1.Repaint;
    AdvPicture1.Refresh;
    Application.ProcessMessages;
    Application.ProcessMessages;

    ShowWindow(Application.Handle, SW_SHOW);

    Chemin_Fic := '';

    // On ouvre la procédure d'existance
    try
      wq_Exist.close;
      wq_Exist.SQL[5] := 'AND NAME LIKE ' + quotedstr(Nom_procedure + '%');
      wq_Exist.Open;
    except
      Application.HandleException(Self);
      Fin_Appli;
      exit;
    end;

    choix := 0;
    SP_BEFORE.ProcedureName := Nom_procedure + '_BEFORE';
    With SP_BEFORE do
    begin

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

    end;

    try
      if (Procedure_Exist(Nom_procedure + '_BEFORE') = True) then
      begin
        SP_BEFORE.Open;

        if (SP_BEFORE.fieldbyname('Msg').Asstring <> '') then
        begin
          Choix_Entree := Application.MessageBox(PChar(SP_BEFORE.fieldbyname('Msg').Asstring),
            PChar(SP_BEFORE.fieldbyname('Caption').AsString),
            SP_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);
        end;
        if (SP_BEFORE.fieldbyname('Result').Asinteger <> 1) then
        begin
          SP_BEFORE.close;
          Fin_Appli;
          exit;
        end;
        SP_BEFORE.close;
      end;
    except
      Application.HandleException(Self);
      SP_BEFORE.close;
      Fin_Appli;
      exit;
    end;

    SP_PARAM.ProcedureName := Nom_procedure + '_PARAMS';
    With SP_PARAM do
    begin

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@P1';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      Param.Value := P1_Procedure;

      Param := Parameters.AddParameter;
      Param.Name := '@P2';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      Param.Value := P2_Procedure;

      Param := Parameters.AddParameter;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := Choix_Entree;
    end;

    if (Procedure_Exist(Nom_procedure + '_PARAMS') = True) then
    begin
      try
        SP_PARAM.Open;
      except
        ;
      end;
      if SP_PARAM.Active = True then
      begin
        try
          try
            // Enleve le topmost
            SetWindowPos(HWND(Form1.Handle), // handle of window
              HWND_NOTOPMOST, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                );
            Form1.Visible := False;
            HandleGeneMail := 0;
            Param_Top_Most := 0;

            if SP_PARAM.FindField('Top_Most') <> nil then
              Param_Top_Most := SP_PARAM.fieldbyname('Top_Most').Asinteger;

            F_Params := TF_params.Create(Self);
            HandleGeneMail := F_Params.Handle;
            F_Params.wsp_Filtres := SP_PARAM;
            F_Params.ApplicationHandle := Form1.Handle;

            F_Params.Timer := 0;

            if SP_PARAM.FindField('Timer') <> nil then
              F_Params.Timer := SP_PARAM.fieldbyname('Timer').Asinteger;

            F_Params.Init;

            if F_Params.ShowModal = mrok then
            begin
              for i := 0 to 9 do
              begin
                Tab_Params[i] := F_Params.Tab_Params[i];
              end;

              F_Params.close;
              F_Params.Free;
              SP_PARAM.close;
              HandleGeneMail := 0;
            end
            else
            begin
              F_Params.close;
              F_Params.Free;
              SP_PARAM.close;
              Fin_Appli;
              exit;
            end;
          finally
            Form1.Visible := True;
            SetWindowPos(HWND(Form1.Handle), // handle of window
              HWND_TOPMOST, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                );
            HandleGeneMail := 0;
            ShowWindow(Form1.Handle, SW_SHOW);
          end;
        except
          Application.HandleException(Self);
          SP_PARAM.close;
          Fin_Appli;
          exit;
        end;
      end;
    end;

    // Gestion du message PARAMS_AFTER
    SP_PARAM_AFTER.ProcedureName := Nom_procedure + '_PARAMS_AFTER';
    With SP_PARAM_AFTER do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@P1';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      Param.Value := P1_Procedure;

      Param := Parameters.AddParameter;
      Param.Name := '@P2';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      Param.Value := P2_Procedure;

      Param := Parameters.AddParameter;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := Choix_Entree;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_PARAMS_AFTER') = True) then
      begin
        SP_PARAM_AFTER.Open;

        if (SP_PARAM_AFTER.fieldbyname('Msg').Asstring <> '') then
        begin
          Choix_Entree := Application.MessageBox(PChar(SP_PARAM_AFTER.fieldbyname('Msg').Asstring),
            PChar(SP_PARAM_AFTER.fieldbyname('Caption').AsString),
            SP_PARAM_AFTER.fieldbyname('Flags').Asinteger + MB_TOPMOST);
        end;
        if (SP_PARAM_AFTER.fieldbyname('Result').Asinteger <> 1) then
        begin
          SP_PARAM_AFTER.close;
          Fin_Appli;
          exit;
        end;
        SP_PARAM_AFTER.close;
      end;
    except
      Application.HandleException(Self);
      SP_PARAM_AFTER.close;
      Fin_Appli;
      exit;
    end;

    SP_FICHIER.ProcedureName := Nom_procedure + '_SELECT_FILE';
    With SP_FICHIER do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := Choix_Entree;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_SELECT_FILE') = True) then
      begin

        SP_FICHIER.Open;

        if (SP_FICHIER.fieldbyname('Title').AsAnsiString <> '') then
        begin
          // gestion de la selection d'un repertoire uniquement
          Directory_Only := 0;

          if SP_FICHIER.FindField('Directory_Only') <> nil then
            Directory_Only := SP_FICHIER.fieldbyname('Directory_Only').Asinteger;

          if Directory_Only = 0 then
          begin
            OpenDlg.DefaultExt := SP_FICHIER.fieldbyname('DefaultExt').AsAnsiString;
            OpenDlg.Filter := SP_FICHIER.fieldbyname('Filter').AsAnsiString;
            OpenDlg.InitialDir := SP_FICHIER.fieldbyname('InitialDir').AsAnsiString;
            OpenDlg.Title := SP_FICHIER.fieldbyname('Title').AsAnsiString;
            OpenDlg.Filename := SP_FICHIER.fieldbyname('FileName').AsAnsiString;

            if SP_FICHIER.fieldbyname('HideReadOnly').Asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofHideReadOnly]
            else
              OpenDlg.Options := OpenDlg.Options + [ofHideReadOnly];

            if SP_FICHIER.fieldbyname('AllowMultiSelect').Asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofAllowMultiSelect]
            else
              OpenDlg.Options := OpenDlg.Options + [ofAllowMultiSelect];

            if SP_FICHIER.fieldbyname('NoChangeDir').Asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofNoChangeDir]
            else
              OpenDlg.Options := OpenDlg.Options + [ofNoChangeDir];

            if SP_FICHIER.fieldbyname('PathMustExist').Asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofPathMustExist]
            else
              OpenDlg.Options := OpenDlg.Options + [ofPathMustExist];

            if SP_FICHIER.fieldbyname('FileMustExist').Asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofFileMustExist]
            else
              OpenDlg.Options := OpenDlg.Options + [ofFileMustExist];
          end;

          try
            // Enleve le topmost
            SetWindowPos(HWND(Form1.Handle), // handle of window
              HWND_NOTOPMOST, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                );

            if Directory_Only = 0 then
            begin
              if OpenDlg.Execute = True then
              begin
                Chemin_Fic := OpenDlg.Filename;
              end
              else
              begin
                SP_FICHIER.close;
                Fin_Appli;
                exit;
              end;
            end
            else
            begin
              Chemin_Fic := BrowseforFile(Handle, SP_FICHIER.fieldbyname('Title').AsAnsiString,
                SP_FICHIER.fieldbyname('InitialDir').AsAnsiString);

              if (Chemin_Fic = '') then
              begin
                SP_FICHIER.close;
                Fin_Appli;
                exit;
              end;
            end;
          finally
            SetWindowPos(HWND(Form1.Handle), // handle of window
              HWND_TOPMOST, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                );
          end;
        end;
      end;
    except
      Application.HandleException(Self);
      SP_FICHIER.close;
      Fin_Appli;
      exit;
    end;

    // Lance la copie de fichiers
    SP_COPY_FILE_BEFORE.ProcedureName := Nom_procedure + '_COPY_FILE_BEFORE';
    With SP_COPY_FILE_BEFORE do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@File_Name';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileName(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@File_Dir';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileDir(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@File';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := Chemin_Fic;
      end
      else
      begin
        Param.Value := '';
      end;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_COPY_FILE_BEFORE') = True) then
      begin
        SP_COPY_FILE_BEFORE.Open;

        if (SP_COPY_FILE_BEFORE.fieldbyname('Msg').Asstring <> '') then
        begin
          choix := Application.MessageBox(PChar(SP_COPY_FILE_BEFORE.fieldbyname('Msg').Asstring),
            PChar(SP_COPY_FILE_BEFORE.fieldbyname('Caption').AsString),
            SP_COPY_FILE_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);
        end;

        if (SP_COPY_FILE_BEFORE.fieldbyname('Result').Asinteger <> 1) then
        begin
          SP_COPY_FILE_BEFORE.close;
          Fin_Appli;
          exit;
        end;

        SP_COPY_FILE_BEFORE.close;
      end;
    except
      Application.HandleException(Self);
      SP_COPY_FILE_BEFORE.close;
      Fin_Appli;
      exit;
    end;

    SP_CREATE_DIR.ProcedureName := Nom_procedure + '_CREATE_DIR';
    With SP_CREATE_DIR do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := choix;

      Param := Parameters.AddParameter;
      Param.Name := '@File_Name';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileName(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@File_Dir';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileDir(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@File';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := Chemin_Fic;
      end
      else
      begin
        Param.Value := '';
      end;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    SP_COPY_FILE.ProcedureName := Nom_procedure + '_COPY_FILE';
    With SP_COPY_FILE do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := choix;

      Param := Parameters.AddParameter;
      Param.Name := '@File_Name';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileName(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@File_Dir';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileDir(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@File';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := Chemin_Fic;
      end
      else
      begin
        Param.Value := '';
      end;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    SP_COPY_FILE_AFTER.ProcedureName := Nom_procedure + '_COPY_FILE_AFTER';
    With SP_COPY_FILE do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@Fonction';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;

      Param := Parameters.AddParameter;
      Param.Name := '@FileS_Name';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;

      Param := Parameters.AddParameter;
      Param.Name := '@FileS_Dir';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;

      Param := Parameters.AddParameter;
      Param.Name := '@FileS';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;

      Param := Parameters.AddParameter;
      Param.Name := '@FileD_Name';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;

      Param := Parameters.AddParameter;
      Param.Name := '@FileD_Dir';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;

      Param := Parameters.AddParameter;
      Param.Name := '@FileD';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;

      Param := Parameters.AddParameter;
      Param.Name := '@Resultat';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    // Create Dir
    try

      if (Procedure_Exist(Nom_procedure + '_CREATE_DIR') = True) then
      begin
        SP_CREATE_DIR.Open;

        while (not SP_CREATE_DIR.Eof) do
        begin
          if SP_CREATE_DIR.fieldbyname('Directory').AsAnsiString <> '' then
          begin
            if not DirectoryExists(SP_CREATE_DIR.fieldbyname('Directory').AsAnsiString) then
            begin
              if SP_CREATE_DIR.fieldbyname('Force_Dir').Asinteger = 1 then
              begin
                ForceDirectories(SP_CREATE_DIR.fieldbyname('Directory').AsAnsiString);
              end
              else
              begin
                CreateDir(SP_CREATE_DIR.fieldbyname('Directory').AsAnsiString);
              end;
            end;
          end;

          SP_CREATE_DIR.Next;
        end;

        SP_CREATE_DIR.close;
      end;
    except
      Application.HandleException(Self);
      SP_CREATE_DIR.close;
      Fin_Appli;
      exit;
    end;

    // Copy File
    try
      if (Procedure_Exist(Nom_procedure + '_COPY_FILE') = True) then
      begin
        SP_COPY_FILE.Open;

        try
          SetWindowPos(HWND(Form1.Handle), // handle of window
            HWND_NOTOPMOST, // placement-order handle
            0, // horizontal position
            0, // vertical position
            0, // width
            0, // height
            SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
              );

          Exist_Copy_After := False;

          while (not SP_COPY_FILE.Eof) do
          begin
            Chemin_Fic := SP_COPY_FILE.fieldbyname('Source').AsAnsiString;
            Chemin_dest := SP_COPY_FILE.fieldbyname('Destination').AsAnsiString;

            if SP_COPY_FILE.fieldbyname('Fonction').AsAnsiString <> '' then
            begin
              Resultat_copie := copier(Form1.Handle, Chemin_Fic, Chemin_dest);

              SP_COPY_FILE_AFTER.Parameters.ParamByName('@Cle').Value := cle;
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@N_User').Value := N_user;
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@Fonction').Value := SP_COPY_FILE.fieldbyname('Fonction')
                  .Value;
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@FileS_Name').Value := ExtractFileName(Chemin_Fic);
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@FileS_Dir').Value := ExtractFileDir(Chemin_Fic);
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@FileS').Value := Chemin_Fic;
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@FileD_Name').Value := ExtractFileName(Chemin_dest);
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@FileD_Dir').Value := ExtractFileDir(Chemin_dest);
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@FileD').Value := Chemin_dest;
              SP_COPY_FILE_AFTER.Parameters.ParamByName('@Resultat').Value := Resultat_copie;

              if (Exist_Copy_After = True) or (Procedure_Exist(Nom_procedure + '_COPY_FILE_AFTER') = True) then
              begin
                Exist_Copy_After := True;

                try
                  SP_COPY_FILE_AFTER.ExecProc;
                except
                  Application.HandleException(Self);
                  SP_COPY_FILE_AFTER.close;
                  SP_COPY_FILE.close;
                  Fin_Appli;
                  exit;
                end;
              end;
            end;

            SP_COPY_FILE.Next;
          end;
        finally
          SetWindowPos(HWND(Form1.Handle), // handle of window
            HWND_TOPMOST, // placement-order handle
            0, // horizontal position
            0, // vertical position
            0, // width
            0, // height
            SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
              );
        end;

        SP_COPY_FILE.close;
      end;
    except
      Application.HandleException(Self);
      SP_COPY_FILE.close;
      Fin_Appli;
      exit;
    end;

    if Chemin_dest <> '' then
    begin
      Chemin_Fic := Chemin_dest;
    end;

    // Lecture excel
    if (Procedure_Exist(Nom_procedure + '_READ_XLS') = True) then
    begin
      wq_EXCEL_READ_LOG.close;
      wq_EXCEL_READ_LOG.SQL.Clear;
      wq_EXCEL_READ_LOG.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_',
          [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_LOG');
      wq_EXCEL_READ_LOG.Open;

      wq_EXCEL_READ_VAL.close;
      wq_EXCEL_READ_VAL.SQL.Clear;
      wq_EXCEL_READ_VAL.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_',
          [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_CEL');
      wq_EXCEL_READ_VAL.Open;

      wq_EXCEL_READ_TAB.close;
      wq_EXCEL_READ_TAB.SQL.Clear;
      wq_EXCEL_READ_TAB.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_',
          [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_TAB');
      wq_EXCEL_READ_TAB.Open;

      { TU_Valeurs.InsertSQL.Clear;
        Tu_valeurs.InsertSQL.Add('insert into ' + stringreplace(nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_VAL');
        Tu_valeurs.InsertSQL.Add('(N_user, Cle_Session, Fichier, Feuille, Ligne, Colonne, Valeur)');
        Tu_valeurs.InsertSQL.Add('values');
        Tu_valeurs.InsertSQL.Add('(:N_user, :Cle_Session, :Fichier, :Feuille, :Ligne, :Colonne, :Valeur) ');
        }

      SP_EXCEL_READ_START.ProcedureName := Nom_procedure + '_READ_XLS_START';
      With SP_EXCEL_READ_START do
      begin

        Param := Parameters.AddParameter;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.Direction := pdReturnValue;

        Param := Parameters.AddParameter;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := N_user;

        Param := Parameters.AddParameter;
        Param.Name := '@P1';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := P1_Procedure;

        Param := Parameters.AddParameter;
        Param.Name := '@P2';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := P2_Procedure;

        Param := Parameters.AddParameter;
        Param.Name := '@Choix_Before';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := choix;

        for j := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      SP_EXCEL_READ_START.Open;

      if SP_EXCEL_READ_START.fieldbyname('Cle_Session').AsAnsiString <> '' then
      begin
        // récupère la clé de session
        Read_Excel_session := SP_EXCEL_READ_START.fieldbyname('Cle_Session').AsAnsiString;

        // Récupères les fichiers à traiter
        if (Procedure_Exist(Nom_procedure + '_READ_XLS_REP') = True) then
        begin
          SP_EXCEL_READ_REP.ProcedureName := Nom_procedure + '_READ_XLS_REP';
          With SP_EXCEL_READ_REP do
          begin
            Parameters.Clear;

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            Param := Parameters.AddParameter;
            Param.Name := '@P1';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := P1_Procedure;

            Param := Parameters.AddParameter;
            Param.Name := '@P2';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := P2_Procedure;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;

            Param := Parameters.AddParameter;
            Param.Name := '@Cle_Session';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Read_Excel_session;

          end;

          SP_EXCEL_READ_REP.Open;
          SP_EXCEL_READ_REP.first;

          wq_EXCEL_READ_FIC.close;
          wq_EXCEL_READ_FIC.SQL.Clear;
          wq_EXCEL_READ_FIC.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_',
              [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_FIC');
          wq_EXCEL_READ_FIC.Open;

          while not SP_EXCEL_READ_REP.Eof do
          begin
            Fichiers_Rep(SP_EXCEL_READ_REP.fieldbyname('Repertoire').AsAnsiString, N_user, Read_Excel_session);
            SP_EXCEL_READ_REP.Next;
          end;

          SP_EXCEL_READ_REP.close;
          wq_EXCEL_READ_FIC.close;
        end;

        SP_EXCEL_READ.ProcedureName := Nom_procedure + '_READ_XLS';
        With SP_EXCEL_READ do
        begin

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          Param := Parameters.AddParameter;
          Param.Name := '@P1';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := P1_Procedure;

          Param := Parameters.AddParameter;
          Param.Name := '@P2';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := P2_Procedure;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;

          Param := Parameters.AddParameter;
          Param.Name := '@Cle_Session';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := Read_Excel_session;

        end;

        SP_EXCEL_READ.Open;
        SP_EXCEL_READ.first;

        VarClear(Olexls);
        Olexls := CreateOleObject('Excel.application');

        if SP_EXCEL_READ.fieldbyname('Fichier').AsAnsiString <> '' then
        begin

          Olexls.Visible := False;
          Fichier_excel_old := '';
          Str_Feuille_Old := '';

          while not SP_EXCEL_READ.Eof do
          begin
            Fichier_excel := SP_EXCEL_READ.fieldbyname('Fichier').AsAnsiString;

            if (Fichier_excel <> Fichier_excel_old) or (Read_Excel_File_Ok = False) then
            begin
              if (Fichier_excel_old <> '') and (Read_Excel_File_Ok = True) then
              begin
                Olexls.ActiveWorkbook.close;
              end;
              Fichier_excel_old := Fichier_excel;

              if FileExists(Fichier_excel) = True then
              begin
                try
                  Olexls.workbooks.Add(Fichier_excel);
                  Read_Excel_File_Ok := True;
                  Read_Excel_Log('OK', '', Fichier_excel, '', N_user, Read_Excel_session);
                  Read_Excel_File_Ok := True;
                except

                  Read_Excel_Log('KO', 'Problème rencontré à l''ouverture du fichier', Fichier_excel, '', N_user,
                    Read_Excel_session);
                  Read_Excel_File_Ok := False;
                end;

              end
              else
              begin
                Read_Excel_File_Ok := False;
                Read_Excel_Log('KO', 'Fichier non trouvé', Fichier_excel, '', N_user, Read_Excel_session);
                goto Suite;

              end;
              Olexls.displayalerts := False;
              Olexls.screenupdating := False;
              Str_Feuille_Old := ''

            end;

            if Read_Excel_File_Ok = False then
            begin
              goto Suite;
            end;

            // Mise a jour du fichier
            Str_Feuille := SP_EXCEL_READ.fieldbyname('Feuille').AsAnsiString;

            int_Line := SP_EXCEL_READ.fieldbyname('ligne').Asinteger;
            int_col := SP_EXCEL_READ.fieldbyname('colonne').Asinteger;
            int_line_End := SP_EXCEL_READ.fieldbyname('Ligne_End').Asinteger;
            int_col_end := SP_EXCEL_READ.fieldbyname('colonne_End').Asinteger;
            Plag_Cpt_vide := SP_EXCEL_READ.fieldbyname('Plage_Vide_Cpt').Asinteger;
            Col_Cpt_vide := SP_EXCEL_READ.fieldbyname('Plage_Vide_Col').Asinteger;

            try
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].activate;
              Read_Excel_File_Ok := True;
            except
              Read_Excel_Log('KO', 'Feuille non trouvée', Fichier_excel, Str_Feuille, N_user, Read_Excel_session);
              Read_Excel_File_Ok := False;
            end;

            if Read_Excel_File_Ok = False then
            begin
              goto Suite;
            end;

            if SP_EXCEL_READ.fieldbyname('Mode').AsAnsiString = 'TAB' then
            begin
              if int_line_End < 1 then
                int_line_End := int_Line;

              if int_col_end < 1 then
                int_col_end := int_col;

              if int_line_End < int_Line then
                int_line_End := int_Line;

              if int_col_end < int_col then
                int_col_end := int_col;

              { TU_Tab.InsertSQL.Clear;
                TU_Tab.InsertSQL.Add('insert into ' + stringreplace(nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_TAB');
                TU_Tab.InsertSQL.Add('(N_user, Cle_Session, Fichier, Feuille, Ligne');
                for I := int_col to int_col_End do
                begin
                TU_Tab.InsertSQL.Add(',Col_' + inttostr(i));
                end;
                TU_Tab.InsertSQL.Add(')');
                TU_Tab.InsertSQL.Add('values');
                TU_Tab.InsertSQL.Add('(:N_user, :Cle_Session, :Fichier, :Feuille, :Ligne');
                for I := int_col to int_col_End do
                begin
                TU_Tab.InsertSQL.Add(',:Col_' + inttostr(i));
                end;
                TU_Tab.InsertSQL.Add(')');

                edit1.Lines.AddStrings(tu_tab.InsertSQL);
                edit1.SelectAll;
                edit1.CopyToClipboard;
                }
              Cpt_vide := 0;

              for j := int_Line to int_line_End do
              begin
                wq_EXCEL_READ_TAB.Append;
                wq_EXCEL_READ_TAB.fieldbyname('N_user').Asinteger := N_user;
                wq_EXCEL_READ_TAB.fieldbyname('Cle_Session').AsAnsiString := Read_Excel_session;
                wq_EXCEL_READ_TAB.fieldbyname('Fichier').AsAnsiString := Fichier_excel;
                wq_EXCEL_READ_TAB.fieldbyname('Feuille').AsAnsiString := Str_Feuille;
                wq_EXCEL_READ_TAB.fieldbyname('Ligne').Asinteger := j;

                for i := int_col to int_col_end do
                begin
                  try
                    Read_Excel_Valeur := Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[j, i].Formula;

                    wq_EXCEL_READ_TAB.fieldbyname('Col_' + inttostr(i)).AsAnsiString := Read_Excel_Valeur;

                  except
                    Read_Excel_Log('KO', 'Problème de lecture', Fichier_excel, Str_Feuille, N_user, Read_Excel_session);
                    Break;
                  end;
                end;
                wq_EXCEL_READ_TAB.post;

                Read_Excel_Vide := Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[j, Col_Cpt_vide].Formula;

                if Read_Excel_Vide = '' then
                begin
                  Cpt_vide := Cpt_vide + 1;
                end
                else
                begin
                  Cpt_vide := 0;
                end;

                if (Cpt_vide = Plag_Cpt_vide) and (Plag_Cpt_vide > 0) then
                  Break;
              end;
            end;

            if SP_EXCEL_READ.fieldbyname('Mode').AsAnsiString = 'CEL' then
            begin
              if int_line_End < 1 then
                int_line_End := int_Line;

              if int_col_end < 1 then
                int_col_end := int_col;

              if int_line_End < int_Line then
                int_line_End := int_Line;

              if int_col_end < int_col then
                int_col_end := int_col;

              Cpt_vide := 0;

              for i := int_col to int_col_end do
              begin
                for j := int_Line to int_line_End do
                begin
                  try
                    Read_Excel_Valeur := Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[j, i].Formula;

                    wq_EXCEL_READ_VAL.Append;
                    wq_EXCEL_READ_VAL.fieldbyname('N_user').Asinteger := N_user;
                    wq_EXCEL_READ_VAL.fieldbyname('Cle_Session').AsAnsiString := Read_Excel_session;
                    wq_EXCEL_READ_VAL.fieldbyname('Fichier').AsAnsiString := Fichier_excel;
                    wq_EXCEL_READ_VAL.fieldbyname('Feuille').AsAnsiString := Str_Feuille;
                    wq_EXCEL_READ_VAL.fieldbyname('Ligne').Asinteger := j;
                    wq_EXCEL_READ_VAL.fieldbyname('Colonne').Asinteger := i;
                    wq_EXCEL_READ_VAL.fieldbyname('Valeur').AsAnsiString := Read_Excel_Valeur;
                    wq_EXCEL_READ_VAL.post;

                    if Read_Excel_Valeur = '' then
                    begin
                      Cpt_vide := Cpt_vide + 1;
                    end
                    else
                    begin
                      Cpt_vide := 0;
                    end;

                    if (Cpt_vide = Plag_Cpt_vide) and (Plag_Cpt_vide > 0) then
                      Break;
                  except
                    Read_Excel_Log('KO', 'Problème de lecture', Fichier_excel, Str_Feuille, N_user, Read_Excel_session);
                  end;
                end;
              end;
            end;

            { if wq_EXCEL_READ_TAB.UpdatesPending then
              begin
              wq_EXCEL_READ_TAB.ApplyUpdates;
              end;

              if wq_EXCEL_READ_VAL.UpdatesPending then
              begin
              wq_EXCEL_READ_VAL.ApplyUpdates;
              end;
              }
          Suite :
            SP_EXCEL_READ.Next;
          end;

          Olexls.displayalerts := True;
          Olexls.screenupdating := True;
          try
            Olexls.ActiveWorkbook.close;
          except

          end;

        end;

        Olexls.quit;
        VarClear(Olexls);

        SP_EXCEL_READ.close;
        if (Procedure_Exist(Nom_procedure + '_READ_XLS_MOVE') = True) then
        begin
          SP_EXCEL_READ_MOVE.ProcedureName := Nom_procedure + '_READ_XLS_MOVE';
          With SP_EXCEL_READ_MOVE do
          begin

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            Param := Parameters.AddParameter;
            Param.Name := '@P1';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := P1_Procedure;

            Param := Parameters.AddParameter;
            Param.Name := '@P2';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := P2_Procedure;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;

            Param := Parameters.AddParameter;
            Param.Name := '@Cle_Session';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Read_Excel_session;

          end;

          SP_EXCEL_READ_MOVE.Open;

          SP_EXCEL_READ_MOVE.first;

          while not SP_EXCEL_READ_MOVE.Eof do
          begin

            Result_Move := MoveFileEx(PChar(SP_EXCEL_READ_MOVE.fieldbyname('Fichier_Source').AsAnsiString),
              PChar(SP_EXCEL_READ_MOVE.fieldbyname('Fichier_Destination').AsAnsiString),
              MOVEFILE_COPY_ALLOWED + MOVEFILE_REPLACE_EXISTING);
            // if Integer(Result_Move) <> 0 then
            // begin
            // Read_Excel_Log('KO', 'Problème de déplacement', SP_EXCEL_READ_MOVE.fieldbyname('Fichier_Source').AsAnsiString, '', N_user, Read_Excel_session);
            //
            // end;
            SP_EXCEL_READ_MOVE.Next;
          end;

        end;

        if (Procedure_Exist(Nom_procedure + '_READ_XLS_END') = True) then
        begin
          SP_EXCEL_READ_END.ProcedureName := Nom_procedure + '_READ_XLS_END';
          With SP_EXCEL_READ_END do
          begin

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            Param := Parameters.AddParameter;
            Param.Name := '@P1';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := P1_Procedure;

            Param := Parameters.AddParameter;
            Param.Name := '@P2';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := P2_Procedure;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;

            Param := Parameters.AddParameter;
            Param.Name := '@Cle_Session';
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Read_Excel_session;

          end;

          SP_EXCEL_READ_END.ExecProc;

        end;

      end;
    end;

    // Gestion de la fusion excel
    try
      if (Procedure_Exist(Nom_procedure + '_EXCEL') = True) then
      begin
        SP_EXCEL_BEFORE.ProcedureName := Nom_procedure + '_EXCEL_BEFORE';
        With SP_EXCEL_BEFORE do
        begin

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_EXCEL_BEFORE') = True) then
          begin
            SP_EXCEL_BEFORE.Open;

            if (SP_EXCEL_BEFORE.fieldbyname('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_EXCEL_BEFORE.fieldbyname('Msg').Asstring),
                PChar(SP_EXCEL_BEFORE.fieldbyname('Caption').AsString),
                SP_EXCEL_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_EXCEL_BEFORE.close;
                Fin_Appli;
                exit;
              end;
            end;

            if (SP_EXCEL_BEFORE.fieldbyname('Result').Asinteger <> 1) then
            begin
              SP_EXCEL_BEFORE.close;
              Fin_Appli;
              exit;
            end;

            SP_EXCEL_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_EXCEL_BEFORE.close;
          Fin_Appli;
          exit;
        end;

        SP_EXCEL.ProcedureName := Nom_procedure + '_EXCEL';
        With SP_EXCEL do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          Param := Parameters.AddParameter;
          Param.Name := '@P1';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := P1_Procedure;

          Param := Parameters.AddParameter;
          Param.Name := '@P2';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          if Chemin_Fic <> '' then
          begin
            Param.Value := Chemin_Fic;
          end
          else
          begin
            Param.Value := P2_Procedure;
          end;

          Param := Parameters.AddParameter;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := choix;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        SP_EXCEL.Open;

        SP_EXCEL.first;

        Quit_Excel := 'Oui';
        VarClear(Olexls);
        Olexls := CreateOleObject('Excel.application');

        if SP_EXCEL.fieldbyname('Fichier').AsAnsiString <> '' then
        begin
          if SP_EXCEL.fieldbyname('Excel_Visible').AsAnsiString = 'Oui' then
          begin
            Olexls.Visible := True;
            Olexls.screenupdating := False;
          end
          else
          begin
            Olexls.Visible := False;
          end;

          Fichier_excel_old := '';
          Fichier_excel_Save_old := '';

          Str_Feuille_Old := '';
          Fermer_excel := SP_EXCEL.fieldbyname('Fermer_Fichier').AsAnsiString;
          while not SP_EXCEL.Eof do
          begin
            Fichier_excel := SP_EXCEL.fieldbyname('Fichier').AsAnsiString;

            if SP_EXCEL.FindField('Fichier_Dest') <> nil then
            begin
              Fichier_excel_Save := SP_EXCEL.fieldbyname('Fichier_Dest').AsAnsiString;
            end;

            if (Fichier_excel <> Fichier_excel_old) or (Fichier_excel_Save <> Fichier_excel_Save_old) then
            begin
              if (Fichier_excel_old <> '') or (Fichier_excel_Save_old <> '') then
              begin
                if Fichier_excel_Save_old <> '' then
                begin
                  Olexls.ActiveWorkbook.SaveAs(Fichier_excel_Save_old);
                end
                else
                begin

                  Olexls.ActiveWorkbook.SaveAs(Fichier_excel_old);
                end;

                if (Fermer_excel = 'Oui') then
                begin
                  Olexls.ActiveWorkbook.close;
                end
                else
                begin
                  if Olexls.Visible = False then
                  begin
                    Olexls.Visible := True;
                  end;
                  Quit_Excel := 'Non';
                end;
              end;

              Fermer_excel := SP_EXCEL.fieldbyname('Fermer_Fichier').AsAnsiString;
              Fichier_excel_old := Fichier_excel;
              Fichier_excel_Save_old := Fichier_excel_Save;

              if FileExists(Fichier_excel) = True then
              begin
                Olexls.workbooks.Add(Fichier_excel);
              end
              else
              begin
                Olexls.workbooks.Add;
              end;
              Olexls.displayalerts := False;
              Olexls.screenupdating := False;
              Str_Feuille_Old := ''

            end;

            // Mise a jour du fichier
            Str_Feuille := SP_EXCEL.fieldbyname('Feuille').AsAnsiString;

            if Str_Feuille <> Str_Feuille_Old then
            begin
              if SP_EXCEL.fieldbyname('Range_Clear_Avant').AsAnsiString <> '' then
              begin
                Range_Clear := SP_EXCEL.fieldbyname('Range_Clear_Avant').AsAnsiString;

                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].select;
                Olexls.Range[Range_Clear].clearcontents;
              end;
              Str_Feuille_Old := Str_Feuille;
            end;

            int_Line := SP_EXCEL.fieldbyname('line').Asinteger;
            int_col := SP_EXCEL.fieldbyname('col').Asinteger;
            try
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].activate;

            except
              Olexls.ActiveWorkbook.Worksheets.Add;
              Olexls.ActiveWorkbook.Worksheets[1].name := Str_Feuille;
            end;

            if (SP_EXCEL.fieldbyname('Type_Valeur').Asinteger = 1) then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].NumberFormat :=
                  SP_EXCEL.fieldbyname('Format_Valeur').AsAnsiString;
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Formula := SP_EXCEL.fieldbyname
                  ('Valeur_Texte').AsAnsiString;
            end;

            if (SP_EXCEL.fieldbyname('Type_Valeur').Asinteger = 2) then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].NumberFormat :=
                  SP_EXCEL.fieldbyname('Format_Valeur').AsAnsiString;
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Formula := SP_EXCEL.fieldbyname
                  ('Valeur_Date').AsAnsiString;
            end;

            if (SP_EXCEL.fieldbyname('Type_Valeur').Asinteger = 3) then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].NumberFormat :=
                  SP_EXCEL.fieldbyname('Format_Valeur').AsAnsiString;
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Formula := SP_EXCEL.fieldbyname
                  ('Valeur_Numeric').asFloat;
            end;

            if SP_EXCEL.FindField('ColorFond') <> nil then
            begin
              if SP_EXCEL.fieldbyname('ColorFond').Asinteger <> 0 then
              begin
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Interior.Color :=
                    SP_EXCEL.fieldbyname('ColorFond').Asinteger;
              end;
            end;

            if SP_EXCEL.FindField('ColorTexte') <> nil then
            begin
              if SP_EXCEL.fieldbyname('ColorTexte').Asinteger <> 0 then
              begin
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line,
                    int_col].Font.Color := SP_EXCEL.fieldbyname('ColorTexte').Asinteger;
              end;
            end;

            if SP_EXCEL.FindField('StyleFonte') <> nil then
            begin
              if ((SP_EXCEL.fieldbyname('StyleFonte').Asinteger and 1) = 1) then
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.Bold := True;

              if ((SP_EXCEL.fieldbyname('StyleFonte').Asinteger and 2) = 2) then
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.Italic := True;

              if ((SP_EXCEL.fieldbyname('StyleFonte').Asinteger and 4) = 4) then
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.Underline := True;

            end;

            if SP_EXCEL.FindField('SizeTexte') <> nil then
            begin
              if SP_EXCEL.fieldbyname('SizeTexte').Asinteger <> 0 then
              begin
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.size := SP_EXCEL.fieldbyname
                    ('SizeTexte').Asinteger;
              end;
            end;

            if SP_EXCEL.FindField('Range_Rows_AutoFit') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Rows_AutoFit').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Rows_AutoFit').AsAnsiString;
                Olexls.Range[Range_Fit].Rows.Autofit;
              end;
            end;

            if SP_EXCEL.FindField('Range_Columns_AutoFit') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Columns_AutoFit').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Columns_AutoFit').AsAnsiString;
                Olexls.Range[Range_Fit].Columns.Autofit;
              end;
            end;

            if SP_EXCEL.FindField('Range_Rows_Group') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Rows_Group').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Rows_Group').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.Group;
              end;
            end;

            if SP_EXCEL.FindField('Range_Columns_Group') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Columns_Group').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Columns_Group').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.Group;
              end;
            end;

            if SP_EXCEL.FindField('Range_Rows_UnGroup') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Rows_UnGroup').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Rows_UnGroup').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.UnGroup;
              end;
            end;

            if SP_EXCEL.FindField('Range_Columns_UnGroup') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Columns_UnGroup').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Columns_UnGroup').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.UnGroup;
              end;
            end;
            if SP_EXCEL.FindField('Range_Rows_Hide') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Rows_Hide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Rows_Hide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.Hidden := True;
              end;
            end;
            if SP_EXCEL.FindField('Range_Columns_Hide') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Columns_Hide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Columns_Hide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.Hidden := True;
              end;
            end;
            if SP_EXCEL.FindField('Range_Rows_UnHide') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Rows_UnHide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Rows_UnHide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.Hidden := False;
              end;
            end;
            if SP_EXCEL.FindField('Range_Columns_UnHide') <> nil then
            begin
              if SP_EXCEL.fieldbyname('Range_Columns_UnHide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.fieldbyname('Range_Columns_UnHide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.Hidden := False;
              end;
            end;

            SP_EXCEL.Next;
          end;

          if SP_EXCEL.FindField('outline_ShowLevels') <> nil then
          begin
            if SP_EXCEL.fieldbyname('outline_ShowLevels').Asinteger > 0 then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].outline.ShowLevels
                  (SP_EXCEL.fieldbyname('outline_ShowLevels').Asinteger);
            end;
          end;

          if SP_EXCEL.FindField('Fichier_Dest') <> nil then
          begin
            Fichier_excel_Save := SP_EXCEL.fieldbyname('Fichier_Dest').AsAnsiString;
            Olexls.ActiveWorkbook.SaveAs(Fichier_excel_Save);
          end
          else
          begin

            Olexls.ActiveWorkbook.SaveAs(Fichier_excel);

          end;
          Olexls.displayalerts := True;
          Olexls.screenupdating := True;
          if Fermer_excel = 'Oui' then
          begin
            Olexls.ActiveWorkbook.close;
          end
          else
          begin
            if Olexls.Visible = False then
            begin
              Olexls.Visible := True;
            end;

            Quit_Excel := 'Non';
          end;

        end;

        if Quit_Excel = 'Oui' then
        begin
          Olexls.quit;
        end;

        VarClear(Olexls);
        SP_EXCEL.close;

      end;
    except
      Application.HandleException(Self);
      SP_EXCEL.close;
      Olexls.ActiveWorkbook.close;
      Olexls.quit;
      VarClear(Olexls);
      Fin_Appli;
      exit;
    end;

    // Gestion des Mails OUTLOOK
    try
      if (Procedure_Exist(Nom_procedure + '_OUTLOOK') = True) then
      begin
        SP_OUTLOOK_BEFORE.ProcedureName := Nom_procedure + '_OUTLOOK_BEFORE';
        With SP_OUTLOOK_BEFORE do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_OUTLOOK_BEFORE') = True) then
          begin
            SP_OUTLOOK_BEFORE.Open;

            if (SP_OUTLOOK_BEFORE.fieldbyname('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_OUTLOOK_BEFORE.fieldbyname('Msg').Asstring),
                PChar(SP_OUTLOOK_BEFORE.fieldbyname('Caption').AsString),
                SP_OUTLOOK_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_OUTLOOK_BEFORE.close;
                Fin_Appli;
                exit;
              end;
            end;

            if (SP_OUTLOOK_BEFORE.fieldbyname('Result').Asinteger <> 1) then
            begin
              SP_OUTLOOK_BEFORE.close;
              Fin_Appli;
              exit;
            end;

            SP_OUTLOOK_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_OUTLOOK_BEFORE.close;
          Fin_Appli;
          exit;
        end;

        SP_OUTLOOK.ProcedureName := Nom_procedure + '_OUTLOOK';
        With SP_OUTLOOK do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          Param := Parameters.AddParameter;
          Param.Name := '@P1';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := P1_Procedure;

          Param := Parameters.AddParameter;
          Param.Name := '@P2';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          if Chemin_Fic <> '' then
          begin
            Param.Value := Chemin_Fic;
          end
          else
          begin
            Param.Value := P2_Procedure;
          end;

          Param := Parameters.AddParameter;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := choix;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        SP_OUTLOOK.ExecProc;

        // lance la création des mails
        F_Mail_Outlook := TF_Mail_Outlook.Create(Self);
        try
          F_Mail_Outlook.Send_Mail(N_user);
          // F_Mail_Outlook.ShowModal;

        finally
          F_Mail_Outlook.Free;
        end;
        SP_OUTLOOK.close;

        SP_OUTLOOK_AFTER.ProcedureName := Nom_procedure + '_OUTLOOK_AFTER';
        With SP_OUTLOOK_AFTER do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_OUTLOOK_AFTER') = True) then
          begin
            SP_OUTLOOK_AFTER.Open;

            if (SP_OUTLOOK_AFTER.fieldbyname('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_OUTLOOK_AFTER.fieldbyname('Msg').Asstring),
                PChar(SP_OUTLOOK_AFTER.fieldbyname('Caption').AsString),
                SP_OUTLOOK_AFTER.fieldbyname('Flags').Asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_OUTLOOK_AFTER.close;
                Fin_Appli;
                exit;
              end;
            end;

            if (SP_OUTLOOK_AFTER.fieldbyname('Result').Asinteger <> 1) then
            begin
              SP_OUTLOOK_AFTER.close;
              Fin_Appli;
              exit;
            end;

            SP_OUTLOOK_AFTER.close;
          end;
        except
          Application.HandleException(Self);
          SP_OUTLOOK_AFTER.close;
          Fin_Appli;
          exit;
        end;
      end;
    except
      Application.HandleException(Self);
      SP_OUTLOOK.close;
      Fin_Appli;
      exit;
    end;

    // Gestion des impressions
    try
      if (Procedure_Exist(Nom_procedure + '_PRINT') = True) then
      begin
        SP_PRINT_BEFORE.ProcedureName := Nom_procedure + '_PRINT_BEFORE';
        With SP_PRINT_BEFORE do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          Param := Parameters.AddParameter;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := choix;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_PRINT_BEFORE') = True) then
          begin
            SP_PRINT_BEFORE.Open;

            if (SP_PRINT_BEFORE.fieldbyname('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_PRINT_BEFORE.fieldbyname('Msg').Asstring),
                PChar(SP_PRINT_BEFORE.fieldbyname('Caption').AsString),
                SP_PRINT_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_PRINT_BEFORE.close;
                Fin_Appli;
                exit;
              end;
            end;

            if (SP_PRINT_BEFORE.fieldbyname('Result').Asinteger <> 1) then
            begin
              SP_PRINT_BEFORE.close;
              Fin_Appli;
              exit;
            end;

            SP_PRINT_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_PRINT_BEFORE.close;
          Fin_Appli;
          exit;
        end;

        SP_PRINT.ProcedureName := Nom_procedure + '_PRINT';
        With SP_PRINT do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          Param := Parameters.AddParameter;
          Param.Name := '@P1';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := P1_Procedure;

          Param := Parameters.AddParameter;
          Param.Name := '@P2';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          if Chemin_Fic <> '' then
          begin
            Param.Value := Chemin_Fic;
          end
          else
          begin
            Param.Value := P2_Procedure;
          end;

          Param := Parameters.AddParameter;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := choix;

          Param := Parameters.AddParameter;
          Param.Name := '@DB';
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := Db;

          Param := Parameters.AddParameter;
          Param.Name := '@Handle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_Handle;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        SP_PRINT.ExecProc;
        // Envoi d'un message de print
        if (Form1.Handle_ouverture > 0) then
        begin
          postmessage(HWND(Form1.Handle_ouverture), 2101, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
        end;

        SP_PRINT.close;
      end;
    except
      Application.HandleException(Self);
      SP_PRINT.close;
      Fin_Appli;
      exit;
    end;

    //Gestion des impressions nouvelle méthode
        try
            if (Procedure_exist(nom_procedure + '_PRINT_MAIL') = True) then
            begin

              SP_PRINT_BEFORE.ProcedureName := Nom_procedure + '_PRINT_MAIL_BEFORE';
              With SP_PRINT_BEFORE do
              begin
                Parameters.Clear;

                Param := Parameters.AddParameter;
                Param.Name := '@RETURN_VALUE';
                Param.DataType := ftInteger;
                Param.Direction := pdReturnValue;

                Param := Parameters.AddParameter;
                Param.Name := '@cle';
                Param.DataType := ftInteger;
                Param.Direction := pdInput;
                Param.Value := cle;

                Param := Parameters.AddParameter;
                Param.Name := '@N_User';
                Param.DataType := ftInteger;
                Param.Direction := pdInput;
                Param.Value := N_user;

                Param := Parameters.AddParameter;
                Param.Name := '@P1';
                Param.DataType := ftWideString;
                Param.Direction := pdInput;
                Param.Value := P1_Procedure;

                Param := Parameters.AddParameter;
                Param.Name := '@P2';
                Param.DataType := ftWideString;
                Param.Direction := pdInput;
                if Chemin_Fic <> '' then
                begin
                  Param.Value := Chemin_Fic;
                end
                else
                begin
                  Param.Value := P2_Procedure;
                end;

                for j := 0 to 8 do
                begin
                  Param := Parameters.AddParameter;
                  Param.Name := '@Param' + inttostr(j);
                  Param.DataType := ftWideString;
                  Param.Direction := pdInput;
                  Param.Value := Tab_Params[j];
                end;
              end;


                try
                    if (Procedure_exist(nom_procedure + '_PRINT_MAIL_BEFORE') = True) then
                    begin
                        SP_PRINT_BEFORE.Open;

                        if SP_PRINT_BEFORE.FindField('ID')<>nil then
                        Begin
                            Print_ID:=  SP_PRINT_BEFORE.FieldByName('ID').asstring;
                        End;

                        if (SP_PRINT_BEFORE.FieldByName('Msg').AsString <> '') then
                        begin
                            choix := Application.Messagebox(PChar(SP_PRINT_BEFORE.FieldByName('Msg').AsString), PChar(SP_PRINT_BEFORE.FieldByName('Caption').AsAnsiString), SP_PRINT_BEFORE.FieldByName('Flags').asInteger + MB_TOPMOST);

                            if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                            begin
                                SP_PRINT_BEFORE.Close;
                                Fin_Appli;
                                exit;
                            end;
                        end;

                        if (SP_PRINT_BEFORE.FieldByName('Result').asInteger <> 1) then
                        begin
                            SP_PRINT_BEFORE.Close;
                            Fin_Appli;
                            exit;
                        end;

                        SP_PRINT_BEFORE.Close;
                    end;
                except
                    Application.HandleException(Self);
                    SP_PRINT_BEFORE.Close;
                    Fin_Appli;
                    exit;
                end;

                SP_PRINT.ProcedureName := Nom_procedure + '_PRINT_MAIL';
                With SP_PRINT do
                begin
                  Parameters.Clear;

                  Param := Parameters.AddParameter;
                  Param.Name := '@RETURN_VALUE';
                  Param.DataType := ftInteger;
                  Param.Direction := pdReturnValue;

                  Param := Parameters.AddParameter;
                  Param.Name := '@cle';
                  Param.DataType := ftInteger;
                  Param.Direction := pdInput;
                  Param.Value := cle;

                  Param := Parameters.AddParameter;
                  Param.Name := '@N_User';
                  Param.DataType := ftInteger;
                  Param.Direction := pdInput;
                  Param.Value := N_user;

                  Param := Parameters.AddParameter;
                  Param.Name := '@P1';
                  Param.DataType := ftWideString;
                  Param.Direction := pdInput;
                  Param.Value := P1_Procedure;

                  Param := Parameters.AddParameter;
                  Param.Name := '@P2';
                  Param.DataType := ftWideString;
                  Param.Direction := pdInput;
                  if Chemin_Fic <> '' then
                  begin
                    Param.Value := Chemin_Fic;
                  end
                  else
                  begin
                    Param.Value := P2_Procedure;
                  end;

                  Param := Parameters.AddParameter;
                  Param.Name := '@Choix_Before';
                  Param.DataType := ftInteger;
                  Param.Direction := pdInput;
                  Param.Value := choix;

                  Param := Parameters.AddParameter;
                  Param.Name := '@DB';
                  Param.DataType := ftWideString;
                  Param.Direction := pdInput;
                  Param.Value := Db;

                  Param := Parameters.AddParameter;
                  Param.Name := '@Handle';
                  Param.DataType := ftInteger;
                  Param.Direction := pdInput;
                  Param.Value := N_Handle;

                  for j := 0 to 8 do
                  begin
                    Param := Parameters.AddParameter;
                    Param.Name := '@Param' + inttostr(j);
                    Param.DataType := ftWideString;
                    Param.Direction := pdInput;
                    Param.Value := Tab_Params[j];
                  end;

                  Param := Parameters.AddParameter;
                  Param.Name := '@ID';
                  Param.DataType := ftWideString;
                  Param.Direction := pdInput;
                  Param.Value := Print_ID;

                end;
                

                SP_PRINT.ExecProc;
                //Envoi d'un message de print
                if (Form1.Handle_Ouverture > 0) then
                begin
                    postmessage(HWND(Form1.Handle_Ouverture), 2101, 0, 0); //où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
                end;

                SP_PRINT.Close;
            end;
        except
            Application.HandleException(Self);
            SP_PRINT.Close;
            Fin_Appli;
            exit;
        end;

    choix := 0;

    // Prépare la sp principal
    SP.ProcedureName := Nom_procedure;

    With SP do
    begin
      Parameters.Clear;
      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@P1';
      Param.DataType := ftstring;
      Param.Direction := pdInput;
      Param.Value := P1_Procedure;

      Param := Parameters.AddParameter;
      Param.Name := '@P2';
      Param.DataType := ftstring;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := Chemin_Fic;
      end
      else
      begin
        Param.Value := P2_Procedure;
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@msg_err';
      Param.DataType := ftstring;
      Param.Direction := pdInputOutput;
      Param.size := 255;

      Param := Parameters.AddParameter;
      Param.Name := '@msg_OK';
      Param.DataType := ftstring;
      Param.Direction := pdInputOutput;
      Param.size := 255;

      Param := Parameters.AddParameter;
      Param.Name := '@Ouverture_Fiche';
      Param.DataType := ftInteger;
      Param.Direction := pdInputOutput;

      Param := Parameters.AddParameter;
      Param.Name := '@Type_Fiche';
      Param.DataType := ftInteger;
      Param.Direction := pdInputOutput;

      Param := Parameters.AddParameter;
      Param.Name := '@N_fiche';
      Param.DataType := ftInteger;
      Param.Direction := pdInputOutput;

      Param := Parameters.AddParameter;
      Param.Name := '@Plusieurs_Fiches';
      Param.DataType := ftInteger;
      Param.Direction := pdInputOutput;

      Param := Parameters.AddParameter;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := Choix_Entree;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftstring;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    // Prépare la sp principal Memos
    SP_MEMOS.ProcedureName := Nom_procedure + '_MEMOS';

    With SP_MEMOS do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      Param := Parameters.AddParameter;
      Param.Name := '@P1';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      Param.Value := P1_Procedure;

      Param := Parameters.AddParameter;
      Param.Name := '@P2';
      Param.DataType := ftWideString;
      Param.Direction := pdInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := Chemin_Fic;
      end
      else
      begin
        Param.Value := P2_Procedure;
      end;

      Param := Parameters.AddParameter;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := choix;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    // 2 Type d'appels en fonction des memos
    if (Procedure_Exist(Nom_procedure + '_MEMOS') = True) then
    begin
      try
        AdvPicture1.Repaint;
        Application.ProcessMessages;
        ThreadSP := TThreadGenesysSP.Create(AdvEdit1, SP, SP_MEMOS, Edit1, Edit2, wq_memos);
        ThreadSP.Priority := tpNormal;
        ThreadSP.Resume;
      except
        Application.HandleException(Self);
        Fin_Appli;
        exit;

      end;
    end
    else
    begin
      try
        AdvPicture1.Repaint;
        Application.ProcessMessages;
        ThreadSP := TThreadGenesysSP.Create(AdvEdit1, SP, nil, Edit1, Edit2, wq_memos);
        ThreadSP.Priority := tpNormal;
        ThreadSP.Resume;
      except
        Application.HandleException(Self);
        Fin_Appli;
        exit;
      end;
    end;

  except
    Application.HandleException(Self);
    Fin_Appli;
    exit;
  end;

end;

procedure TForm1.Finalise_Traitement;
var
  i, j, cpt, cpt_dest: Integer;
  Param_Str: string;
  HAndle_close: Integer;
  Choix_Entree: Integer;
  Dossier: string;
  dir: string;
  erreur: Boolean;
  StringList: TStringList;
  Temp_String: string;
  Fichier: textfile;
  nom_fichier: string;
  bcl: Integer;
  nombre: Integer;
  Buffer: PChar;
  MemSize: Integer;
  Stream: TBlobStream;
  Fexe: string;
  Lock: Integer;
  Param: Tparameter;
begin
  try
    try
      try
        Application.ProcessMessages;

        // Récupération du paramètre @msg_Ok
        msgreussite := SP.Parameters.ParamByName('@msg_Ok').Value;

        // Récupération du paramètre @msg_err
        msgerreur := SP.Parameters.ParamByName('@msg_err').Value;

        // Récupération du paramètre @Ouverture_Fiche
        Ouverture_Fiche := SP.Parameters.ParamByName('@Ouverture_Fiche').Value;

        // Récupération du paramètre @Type_Fiche
        Type_Fiche := SP.Parameters.ParamByName('@Type_Fiche').Value;

        // Récupération du paramètre @N_Fiche
        N_fiche := SP.Parameters.ParamByName('@N_Fiche').Value;

        // Récupération du paramètre @Plusieurs_Fiches
        Plusieurs_Fiches := SP.Parameters.ParamByName('@Plusieurs_Fiches').Value;

      finally

      end;

      // Lance prccédure de genere txt
      SP_TXT.ProcedureName := Nom_procedure + '_TXT';
      With SP_TXT do
      begin
        Parameters.Clear;

        Param := Parameters.AddParameter;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.Direction := pdReturnValue;

        Param := Parameters.AddParameter;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := N_user;

        for j := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      try
        if (Procedure_Exist(Nom_procedure + '_TXT') = True) then
        begin
          SP_TXT_BEFORE.ProcedureName := Nom_procedure + '_TXT_BEFORE';
          With SP_TXT_BEFORE do
          begin
            Parameters.Clear;

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_TXT_BEFORE') = True) then
            begin
              SP_TXT_BEFORE.Open;

              if (SP_TXT_BEFORE.fieldbyname('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_TXT_BEFORE.fieldbyname('Msg').Asstring),
                  PChar(SP_TXT_BEFORE.fieldbyname('Caption').AsString),
                  SP_TXT_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_TXT_BEFORE.close;
                  Fin_Appli;
                  exit;
                end;
              end;

              if (SP_TXT_BEFORE.fieldbyname('Result').Asinteger <> 1) then
              begin
                SP_TXT_BEFORE.close;
                Fin_Appli;
                exit;
              end;

              SP_TXT_BEFORE.close;
            end;
          except
            Application.HandleException(Self);
            SP_TXT_BEFORE.close;
            Fin_Appli;
            exit;
          end;

          // comptage de la vue
          SP_TXT.Open;
          SP_TXT.first;
          StringList := TStringList.Create;

          while not SP_TXT.Eof do
          begin

            if (nom_fichier <> SP_TXT.fieldbyname('Repertoire').AsAnsiString + '\' + SP_TXT.fieldbyname('Fichier')
                  .AsAnsiString) then
            begin
              // si fichier change ferme l'ncien et ouvre le nouveau (si deja ouvert on ajoute a la fin)
              if (nom_fichier <> '') then
                closefile(Fichier);
              nom_fichier := SP_TXT.fieldbyname('Repertoire').AsAnsiString + '\' + SP_TXT.fieldbyname('Fichier')
                  .AsAnsiString;

              AssignFile(Fichier, nom_fichier);

              StringList.Sort;

              try
                if StringList.IndexOf(nom_fichier) >= 0 then
                  Append(Fichier)
                else
                  Rewrite(Fichier);
              except
                Application.HandleException(Self);
                StringList.Clear;
                StringList.Free;
                Fin_Appli;
                exit;
              end;
              // ajoute a la liste le nom du nouveau fichier traité
              StringList.Add(nom_fichier);
            end;

            if (not SP_TXT.fieldbyname('DATA').isnull) then
            begin
              Stream := TBlobStream.Create(SP_TXT.fieldbyname('DATA') as TBlobField, bmRead);
              try
                MemSize := Stream.size;
                Inc(MemSize); { pour l'espace du zéro terminal. }
                Buffer := AllocMem(MemSize); { Alloue la mémoire. }
                try
                  Stream.Read(Buffer^, MemSize);
                  { Lit le champ Notes dans buffer. }
                  write(Fichier, Buffer);
                  writeln(Fichier, '');
                finally
                  FreeMem(Buffer, MemSize);
                end;
              finally
                Stream.Free;
              end;
            end;
            SP_TXT.Next;
          end;
          SP_TXT.Last;
          closefile(Fichier);

          // Parcours la vue pour validation des données
          if (Procedure_Exist(Nom_procedure + '_TXT_VALIDE') = True) then
          begin
            SP_TXT_VALIDE.ProcedureName := Nom_procedure + '_TXT_VALIDE';
            With SP_TXT_VALIDE do
            begin
              Parameters.Clear;

              Param := Parameters.AddParameter;
              Param.Name := '@RETURN_VALUE';
              Param.DataType := ftInteger;
              Param.Direction := pdReturnValue;

              Param := Parameters.AddParameter;
              Param.Name := '@cle';
              Param.DataType := ftInteger;
              Param.Direction := pdInput;
              Param.Value := cle;

              Param := Parameters.AddParameter;
              Param.Name := '@N_User';
              Param.DataType := ftInteger;
              Param.Direction := pdInput;
              Param.Value := N_user;

              Param := Parameters.AddParameter;
              Param.Name := '@N_cle';
              Param.DataType := ftInteger;
              Param.Direction := pdInput;

              for j := 0 to 8 do
              begin
                Param := Parameters.AddParameter;
                Param.Name := '@Param' + inttostr(j);
                Param.DataType := ftWideString;
                Param.Direction := pdInput;
                Param.Value := Tab_Params[j];
              end;
            end;

            SP_TXT.first;
            while not SP_TXT.Eof do
            begin
              SP_TXT_VALIDE.Parameters.ParamByName('@n_cle').Value := SP_TXT.fieldbyname('n_cle').Value;
              SP_TXT_VALIDE.ExecProc;
              SP_TXT.Next;
            end;
          end;

          SP_TXT.close;
          StringList.Clear;
          StringList.Free;

          SP_TXT_AFTER.ProcedureName := Nom_procedure + '_TXT_AFTER';
          With SP_TXT_AFTER do
          begin
            Parameters.Clear;

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_TXT_AFTER') = True) then
            begin
              SP_TXT_AFTER.Open;

              if (SP_TXT_AFTER.fieldbyname('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_TXT_AFTER.fieldbyname('Msg').Asstring),
                  PChar(SP_TXT_AFTER.fieldbyname('Caption').AsString),
                  SP_TXT_AFTER.fieldbyname('Flags').Asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_TXT_AFTER.close;
                  Fin_Appli;
                  exit;
                end;
              end;

              if (SP_TXT_AFTER.fieldbyname('Result').Asinteger <> 1) then
              begin
                SP_TXT_AFTER.close;
                Fin_Appli;
                exit;
              end;

              SP_TXT_AFTER.close;
            end;
          except
            Application.HandleException(Self);
            SP_TXT_AFTER.close;
            Fin_Appli;
            exit;
          end;
        end;
      except
        Application.HandleException(Self);
        SP_TXT.close;
        Fin_Appli;
        exit;
      end;

      // Lance la navigation
      SP_NAV.ProcedureName := Nom_procedure + '_NAV';
      With SP_NAV do
      begin
        Parameters.Clear;

        Param := Parameters.AddParameter;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.Direction := pdReturnValue;

        Param := Parameters.AddParameter;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := N_user;

        Param := Parameters.AddParameter;
        Param.Name := '@P1';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := P1_Procedure;

        Param := Parameters.AddParameter;
        Param.Name := '@P2';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := P2_Procedure;

        for j := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      if (Procedure_Exist(Nom_procedure + '_NAV') = True) then
      begin
        try
          SP_NAV.Open;
        except
          ;
        end;

        if SP_NAV.Active = True then
        begin
          try
            SP_NAV.first;
            SP_NAV.Last;
            if SP_NAV.RecordCount > 0 then
            begin

              try

                // Enleve le topmost
                SetWindowPos(HWND(Form1.Handle), // handle of window
                  HWND_NOTOPMOST, // placement-order handle
                  0, // horizontal position
                  0, // vertical position
                  0, // width
                  0, // height
                  SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                    );

                Form1.Visible := False;

                HandleGeneMail := 0;
                Param_Top_Most := 0;

                if SP_NAV.FindField('Top_Most') <> nil then
                  Param_Top_Most := SP_NAV.fieldbyname('Top_Most').Asinteger;

                F_Nav := TF_Nav.Create(Self);
                HandleGeneMail := F_Nav.Handle;

                F_Nav.sp_Niveau := SP_NAV;
                F_Nav.ApplicationHandle := Form1.Handle;

                F_Nav.Timer := 0;

                if SP_NAV.FindField('Timer') <> nil then
                  F_Nav.Timer := SP_NAV.fieldbyname('Timer').Asinteger;

                F_Nav.Init;

                if F_Nav.ShowModal = mrok then
                begin

                  F_Nav.close;
                  F_Nav.Free;
                  SP_NAV.close;
                  HandleGeneMail := 0;
                end
                else
                begin
                  F_Nav.close;
                  F_Nav.Free;
                  SP_NAV.close;
                  Fin_Appli;
                  exit;
                end;
              finally
                Form1.Visible := True;
                SetWindowPos(HWND(Form1.Handle), // handle of window
                  HWND_TOPMOST, // placement-order handle
                  0, // horizontal position
                  0, // vertical position
                  0, // width
                  0, // height
                  SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                    );
                HandleGeneMail := 0;
                ShowWindow(Form1.Handle, SW_SHOW);
              end;
            end;

          except
            Application.HandleException(Self);
            SP_NAV.close;
            Fin_Appli;
            exit;
          end;
        end;
      end;

      // Lance la liste de Close
      SP_CLOSE.ProcedureName := Nom_procedure + '_CLOSE';
      With SP_CLOSE do
      begin
        Parameters.Clear;

        Param := Parameters.AddParameter;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.Direction := pdReturnValue;

        Param := Parameters.AddParameter;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := N_user;

        for j := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      try
        if (Procedure_Exist(Nom_procedure + '_CLOSE') = True) then
        begin
          SP_CLOSE_BEFORE.ProcedureName := Nom_procedure + '_CLOSE_BEFORE';
          With SP_CLOSE_BEFORE do
          begin
            Parameters.Clear;

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_CLOSE_BEFORE') = True) then
            begin
              SP_CLOSE_BEFORE.Open;

              if (SP_CLOSE_BEFORE.fieldbyname('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_CLOSE_BEFORE.fieldbyname('Msg').Asstring),
                  PChar(SP_CLOSE_BEFORE.fieldbyname('Caption').AsString),
                  SP_CLOSE_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_CLOSE_BEFORE.close;
                  Fin_Appli;
                  exit;
                end;
              end;

              if (SP_CLOSE_BEFORE.fieldbyname('Result').Asinteger <> 1) then
              begin
                SP_CLOSE_BEFORE.close;
                Fin_Appli;
                exit;
              end;

              SP_CLOSE_BEFORE.close;
            end;
          except
            Application.HandleException(Self);
            SP_CLOSE_BEFORE.close;
            Fin_Appli;
            exit;
          end;

          SP_CLOSE.Open;

          while (not SP_CLOSE.Eof) do
          begin
            HAndle_close := SP_CLOSE.fieldbyname('HAndle').Asinteger;
            Nom_Fenetre := SP_CLOSE.fieldbyname('Nom_Fenetre').AsAnsiString;

            if HAndle_close <> 0 then
            begin
              SendMessage(HWND(HAndle_close), WM_CLOSE, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
            end
            else
            begin
              // Recherche la fenetre demandé
              Handle_Fenetre := 0;
              Find_Fenetre := Nom_Fenetre;
              EnumWindows(@ListeChild, 0); // énumération des fenêtres Top-level

              if (Handle_Fenetre > 0) then
              begin
                SendMessage(HWND(Handle_Fenetre), WM_CLOSE, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
              end;
            end;
            SP_CLOSE.Next;
          end;

          SP_CLOSE.close;

          SP_CLOSE_AFTER.ProcedureName := Nom_procedure + '_CLOSE_AFTER';
          With SP_CLOSE_AFTER do
          begin
            Parameters.Clear;

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_CLOSE_AFTER') = True) then
            begin
              SP_CLOSE_AFTER.Open;

              if (SP_CLOSE_AFTER.fieldbyname('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_CLOSE_AFTER.fieldbyname('Msg').Asstring),
                  PChar(SP_CLOSE_AFTER.fieldbyname('Caption').AsString),
                  SP_CLOSE_AFTER.fieldbyname('Flags').Asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_CLOSE_AFTER.close;
                  Fin_Appli;
                  exit;
                end;
              end;

              if (SP_CLOSE_AFTER.fieldbyname('Result').Asinteger <> 1) then
              begin
                SP_CLOSE_AFTER.close;
                Fin_Appli;
                exit;
              end;

              SP_CLOSE_AFTER.close;
            end;
          except
            Application.HandleException(Self);
            SP_CLOSE_AFTER.close;
            Fin_Appli;
            exit;
          end;

        end;
      except
        Application.HandleException(Self);
        SP_CLOSE.close;
        Fin_Appli;
        exit;
      end;

      // Lance la liste de Lock
      SP_LOCK.ProcedureName := Nom_procedure + '_LOCK';
      With SP_LOCK do
      begin
        Parameters.Clear;

        Param := Parameters.AddParameter;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.Direction := pdReturnValue;

        Param := Parameters.AddParameter;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.Value := N_user;

        for j := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      try
        if (Procedure_Exist(Nom_procedure + '_LOCK') = True) then
        begin
          SP_LOCK_BEFORE.ProcedureName := Nom_procedure + '_LOCK_BEFORE';
          With SP_LOCK_BEFORE do
          begin
            Parameters.Clear;

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_LOCK_BEFORE') = True) then
            begin
              SP_LOCK_BEFORE.Open;

              if (SP_LOCK_BEFORE.fieldbyname('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_LOCK_BEFORE.fieldbyname('Msg').Asstring),
                  PChar(SP_LOCK_BEFORE.fieldbyname('Caption').AsString),
                  SP_LOCK_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_LOCK_BEFORE.close;
                  Fin_Appli;
                  exit;
                end;
              end;

              if (SP_LOCK_BEFORE.fieldbyname('Result').Asinteger <> 1) then
              begin
                SP_LOCK_BEFORE.close;
                Fin_Appli;
                exit;
              end;

              SP_LOCK_BEFORE.close;
            end;
          except
            Application.HandleException(Self);
            SP_LOCK_BEFORE.close;
            Fin_Appli;
            exit;
          end;

          SP_LOCK.Open;

          while (not SP_LOCK.Eof) do
          begin
            HAndle_close := SP_LOCK.fieldbyname('HAndle').Asinteger;
            Nom_Fenetre := SP_LOCK.fieldbyname('Nom_Fenetre').AsAnsiString;
            if SP_LOCK.FindField('Lock') <> nil then
            begin
              Lock := SP_LOCK.fieldbyname('Lock').Asinteger;
            end
            else
            begin
              Lock := 1;
            end;

            if HAndle_close <> 0 then
            begin
              SendMessage(HWND(HAndle_close), 3100, Lock, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
            end
            else
            begin
              // Recherche la fenetre demandé
              Handle_Fenetre := 0;
              Find_Fenetre := Nom_Fenetre;
              EnumWindows(@ListeChild, 0); // énumération des fenêtres Top-level

              if (Handle_Fenetre > 0) then
              begin
                SendMessage(HWND(Handle_Fenetre), 3100, Lock, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
              end;
            end;
            SP_LOCK.Next;
          end;

          SP_LOCK.close;

          SP_LOCK_AFTER.ProcedureName := Nom_procedure + '_LOCK_AFTER';
          With SP_LOCK_AFTER do
          begin
            Parameters.Clear;

            Param := Parameters.AddParameter;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.Direction := pdReturnValue;

            Param := Parameters.AddParameter;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := cle;

            Param := Parameters.AddParameter;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.Direction := pdInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Parameters.AddParameter;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftWideString;
              Param.Direction := pdInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_LOCK_AFTER') = True) then
            begin
              SP_LOCK_AFTER.Open;

              if (SP_LOCK_AFTER.fieldbyname('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_LOCK_AFTER.fieldbyname('Msg').Asstring),
                  PChar(SP_LOCK_AFTER.fieldbyname('Caption').AsString),
                  SP_LOCK_AFTER.fieldbyname('Flags').Asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_LOCK_AFTER.close;
                  Fin_Appli;
                  exit;
                end;
              end;

              if (SP_LOCK_AFTER.fieldbyname('Result').Asinteger <> 1) then
              begin
                SP_LOCK_AFTER.close;
                Fin_Appli;
                exit;
              end;

              SP_LOCK_AFTER.close;
            end;
          except
            Application.HandleException(Self);
            SP_LOCK_AFTER.close;
            Fin_Appli;
            exit;
          end;

        end;
      except
        Application.HandleException(Self);
        SP_LOCK.close;
        Fin_Appli;
        exit;
      end;

      // Lance le refresh
      try
        if (N_Refresh > 0) then
        begin
          if N_Handle <> 0 then
            SendMessage(HWND(N_Handle), WM_G_RAFRAICHIR, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

        end;

        if (Ouverture_Fiche > 0) then
        begin
          if Plusieurs_Fiches = 1 then
          begin
            SP_LISTE_FICHES.ProcedureName := Nom_procedure + '_LISTE_FICHES';
            With SP_LISTE_FICHES do
            begin
              Parameters.Clear;

              Param := Parameters.AddParameter;
              Param.Name := '@RETURN_VALUE';
              Param.DataType := ftInteger;
              Param.Direction := pdReturnValue;

              Param := Parameters.AddParameter;
              Param.Name := '@cle';
              Param.DataType := ftInteger;
              Param.Direction := pdInput;
              Param.Value := cle;

              Param := Parameters.AddParameter;
              Param.Name := '@N_User';
              Param.DataType := ftInteger;
              Param.Direction := pdInput;
              Param.Value := N_user;

              for j := 0 to 8 do
              begin
                Param := Parameters.AddParameter;
                Param.Name := '@Param' + inttostr(j);
                Param.DataType := ftWideString;
                Param.Direction := pdInput;
                Param.Value := Tab_Params[j];
              end;
            end;

            try
              if (Procedure_Exist(Nom_procedure + '_LISTE_FICHES') = True) then
              begin
                SP_LISTE_FICHES.Open;

                SP_LISTE_FICHES_BEFORE.ProcedureName := Nom_procedure + '_LISTE_FICHES_BEFORE';
                With SP_LISTE_FICHES_BEFORE do
                begin
                  Parameters.Clear;

                  Param := Parameters.AddParameter;
                  Param.Name := '@RETURN_VALUE';
                  Param.DataType := ftInteger;
                  Param.Direction := pdReturnValue;

                  Param := Parameters.AddParameter;
                  Param.Name := '@cle';
                  Param.DataType := ftInteger;
                  Param.Direction := pdInput;
                  Param.Value := cle;

                  Param := Parameters.AddParameter;
                  Param.Name := '@N_User';
                  Param.DataType := ftInteger;
                  Param.Direction := pdInput;
                  Param.Value := N_user;

                  for j := 0 to 8 do
                  begin
                    Param := Parameters.AddParameter;
                    Param.Name := '@Param' + inttostr(j);
                    Param.DataType := ftWideString;
                    Param.Direction := pdInput;
                    Param.Value := Tab_Params[j];
                  end;
                end;
                try
                  if (Procedure_Exist(Nom_procedure + '_LISTE_FICHES_BEFORE') = True) then
                  begin
                    SP_LISTE_FICHES_BEFORE.Open;

                    if (SP_LISTE_FICHES_BEFORE.fieldbyname('Msg').Asstring <> '') then
                    begin
                      choix := Application.MessageBox(PChar(SP_LISTE_FICHES_BEFORE.fieldbyname('Msg').Asstring),
                        PChar(SP_LISTE_FICHES_BEFORE.fieldbyname('Caption').AsString),
                        SP_LISTE_FICHES_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);
                      if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                      begin
                        SP_LISTE_FICHES_BEFORE.close;
                        Fin_Appli;
                        exit;
                      end;
                    end;

                    if (SP_LISTE_FICHES_BEFORE.fieldbyname('Result').Asinteger <> 1) then
                    begin
                      SP_LISTE_FICHES_BEFORE.close;
                      Fin_Appli;
                      exit;
                    end;
                    SP_LISTE_FICHES_BEFORE.close;
                  end;
                except
                  Application.HandleException(Self);
                  SP_LISTE_FICHES_BEFORE.close;
                  Fin_Appli;
                  exit;
                end;

                while (not SP_LISTE_FICHES.Eof) do
                begin
                  Type_Fiche := SP_LISTE_FICHES.fieldbyname('Type_Fiche').Asinteger;
                  N_fiche := SP_LISTE_FICHES.fieldbyname('N_Fiche').Asinteger;

                  if (N_fiche > 0) then
                  begin
                    if Type_Fiche < 100 then
                      Type_Fiche := Type_Fiche + 100;

                    if (SP_LISTE_FICHES.FindField('Tempo') <> nil) then
                    begin
                      sleep(SP_LISTE_FICHES.fieldbyname('Tempo').Asinteger);
                    end;

                    Voir_Fiche(N_fiche, Type_Fiche);

                    iCptFic := iCptFic + 1;
                  end;

                  SP_LISTE_FICHES.Next;
                end;
              end;
              SP_LISTE_FICHES.close;

            except
              Application.HandleException(Self);
              SP_LISTE_FICHES.close;
              Fin_Appli;
              exit;
            end;
          end
          else
          begin
            // Reconstruit le Type de fiche à ouvrir
            if (N_fiche > 0) then
            begin
              if Type_Fiche < 100 then
                Type_Fiche := Type_Fiche + 100;

              Voir_Fiche(N_fiche, Type_Fiche);
            end;
          end;
        end;
      except
        Application.HandleException(Self);
        Fin_Appli;
        exit;
      end;
    except
      Application.HandleException(Self);
      Fin_Appli;
      exit;
    end;

    // Lance la liste de refresh
    SP_REFRESH.ProcedureName := Nom_procedure + '_REFRESH';
    With SP_REFRESH do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_REFRESH') = True) then
      begin
        SP_REFRESH_BEFORE.ProcedureName := Nom_procedure + '_REFRESH_BEFORE';
        With SP_REFRESH_BEFORE do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_REFRESH_BEFORE') = True) then
          begin
            SP_REFRESH_BEFORE.Open;

            if (SP_REFRESH_BEFORE.fieldbyname('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_REFRESH_BEFORE.fieldbyname('Msg').Asstring),
                PChar(SP_REFRESH_BEFORE.fieldbyname('Caption').AsString),
                SP_REFRESH_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_REFRESH_BEFORE.close;
                Fin_Appli;
                exit;
              end;
            end;

            if (SP_REFRESH_BEFORE.fieldbyname('Result').Asinteger <> 1) then
            begin
              SP_REFRESH_BEFORE.close;
              Fin_Appli;
              exit;
            end;

            SP_REFRESH_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_REFRESH_BEFORE.close;
          Fin_Appli;
          exit;
        end;

        SP_REFRESH.Open;

        while (not SP_REFRESH.Eof) do
        begin
          Type_Fiche := SP_REFRESH.fieldbyname('Type_Fiche').Asinteger;
          N_fiche := SP_REFRESH.fieldbyname('N_Fiche').Asinteger;
          Nom_Fenetre := SP_REFRESH.fieldbyname('Nom_Fenetre').AsAnsiString;

          // Recherche la fenetre demandé
          Handle_Fenetre := 0;
          Find_Fenetre := Nom_Fenetre;
          EnumWindows(@ListeChild, 0); // énumération des fenêtres Top-level

          if (Handle_Fenetre > 0) then
          begin
            SendMessage(HWND(Handle_Fenetre), WM_G_RAFRAICHIR, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
          end;

          SP_REFRESH.Next;
        end;

        SP_REFRESH.close;
      end;
    except
      Application.HandleException(Self);
      SP_REFRESH.close;
      Fin_Appli;
      exit;
    end;

    // Lance la liste des fichiers a ouvrir
    SP_OPEN_APPLI.ProcedureName := Nom_procedure + '_OPEN_APPLI';
    With SP_OPEN_APPLI do
    begin
      Parameters.Clear;

      Param := Parameters.AddParameter;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.Direction := pdReturnValue;

      Param := Parameters.AddParameter;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := cle;

      Param := Parameters.AddParameter;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.Direction := pdInput;
      Param.Value := N_user;

      for j := 0 to 8 do
      begin
        Param := Parameters.AddParameter;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_OPEN_APPLI') = True) then
      begin
        SP_OPEN_APPLI.Open;

        SP_OPEN_APPLI_BEFORE.ProcedureName := Nom_procedure + '_OPEN_APPLI_BEFORE';
        With SP_OPEN_APPLI_BEFORE do
        begin
          Parameters.Clear;

          Param := Parameters.AddParameter;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.Direction := pdReturnValue;

          Param := Parameters.AddParameter;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := cle;

          Param := Parameters.AddParameter;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.Direction := pdInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Parameters.AddParameter;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftWideString;
            Param.Direction := pdInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try

          if (Procedure_Exist(Nom_procedure + '_OPEN_APPLI_BEFORE') = True) then
          begin

            SP_OPEN_APPLI_BEFORE.Open;

            if (SP_OPEN_APPLI_BEFORE.fieldbyname('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_OPEN_APPLI_BEFORE.fieldbyname('Msg').Asstring),
                PChar(SP_OPEN_APPLI_BEFORE.fieldbyname('Caption').AsString),
                SP_OPEN_APPLI_BEFORE.fieldbyname('Flags').Asinteger + MB_TOPMOST);
              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_OPEN_APPLI_BEFORE.close;
                Fin_Appli;
                exit;
              end;
            end;
            if (SP_OPEN_APPLI_BEFORE.fieldbyname('Result').Asinteger <> 1) then
            begin
              SP_OPEN_APPLI_BEFORE.close;
              Fin_Appli;
              exit;
            end;
            SP_OPEN_APPLI_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_OPEN_APPLI_BEFORE.close;
          Fin_Appli;
          exit;
        end;

        while (not SP_OPEN_APPLI.Eof) do
        begin
          Param_Str := SP_OPEN_APPLI.fieldbyname('Parametres').AsString;
          Param_Str := stringreplace(Param_Str, '$DB', Db, []);
          Param_Str := stringreplace(Param_Str, '$USER', inttostr(N_user), []);
          Param_Str := stringreplace(Param_Str, '$N', inttostr(cle), []);
          Param_Str := stringreplace(Param_Str, '$HANDLE', inttostr(Handle), []);

          Fexe := SP_OPEN_APPLI.fieldbyname('Appli').AsString;
          if Pos('\', Fexe) <= 0 then
          begin
            Fexe := ExtractFileDir(ParamStr(0)) + '\' + Fexe;
          end;

          ShellExecute(0, 'open', PChar(Fexe), PChar(Param_Str), nil, SP_OPEN_APPLI.fieldbyname('Mode').Value);

          SP_OPEN_APPLI.Next;
        end;
      end;

      SP_OPEN_APPLI.close;

    except
      Application.HandleException(Self);
      SP_OPEN_APPLI.close;
      Fin_Appli;
      exit;

    end;

    // Fermeture

    // Si un message alors affichage du message
    if (msgreussite = '') and (msgerreur = '') and (N_Visible > 0) then
    begin
      Application.MessageBox('Fin du processus', 'Information', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
      Fin_Appli;
      exit;
    end;

    if msgreussite <> '' then
    begin
      Application.MessageBox(PChar(msgreussite), 'Information', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
      Fin_Appli;
      exit;
    end;

    // Si aucun message spécifié alors message par défaut
    if msgerreur <> '' then
    begin

      // Affiche la boite de dialogue
      Application.MessageBox(PChar(msgerreur), 'Erreur', MB_OK + MB_ICONERROR + MB_TOPMOST);
      Fin_Appli;
      exit;
    end;
  finally
    Fin_Appli;
  end;

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
begin

  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TDataSet) and ((Components[i] as TDataSet).Active = True) then (Components[i] as TDataSet)
      .close;

  Database.close;

  if ThreadSP <> nil then
  begin
    ThreadSP.Terminate;
    // attente de la fin du Thread Ferme quand même au bout de 10 secondes
    // WaitForSingleObject(Threadsp.Handle,10000);
    ThreadSP := nil;
  end;
  if ThreadSPinfo <> nil then
  begin
    ThreadSPinfo.Terminate;
    // attente de la fin du Thread Ferme quand même au bout de 10 secondes
    // WaitForSingleObject(Threadsp.Handle,10000);
    ThreadSPinfo := nil;
  end;

end;

procedure TForm1.AdvEdit1Change(Sender: TObject);
begin
  fcLabel1.Caption := AdvEdit1.Text;

  if AdvEdit1.Text = 'Fin de traitement ...' then
  begin
    AdvPicture1.Visible := False;
    Finalise_Traitement;
  end;

  if AdvEdit1.Text = 'Erreur...' then
  begin
    AdvPicture1.Visible := False;
    Fin_Appli;
  end;

  if AdvEdit1.Text = 'Un problème a été rencontré !' then
  begin
    AdvPicture1.Visible := False;
  end;

end;

function TForm1.copier(Handle: HWND; Source, Cible: string): Integer;
var
  lpFileOp: TSHFileOpStructW;
  TabFrom: array [0 .. 16383] of char;
  i: Integer;
  FlagsOptions: FILEOP_FLAGS;
  Resultat_copie: Integer;
begin
  for i := 0 to length(Source) - 1 do
    TabFrom[i] := Source[i + 1];
  // pFrom peut contenir plusieurs noms de fichier.
  // Les noms doivent être séparés par le caractère #0.
  // d'après mes essais, le dernier nom de fichier doit être suivi
  // de deux caractères #0.
  TabFrom[length(Source)] := #0;
  TabFrom[length(Source) + 1] := #0;
  FlagsOptions := 0;

  if SP_COPY_FILE.fieldbyname('Fonction').AsAnsiString = 'Copier' then
  begin
    lpFileOp.wFunc := FO_COPY;
    lpFileOp.pTo := PWideChar(Cible);
  end;
  if SP_COPY_FILE.fieldbyname('Fonction').AsAnsiString = 'Effacer' then
  begin
    lpFileOp.wFunc := FO_DELETE;
    lpFileOp.pTo := '';
  end;
  if SP_COPY_FILE.fieldbyname('Fonction').AsAnsiString = 'Deplacer' then
  begin
    lpFileOp.wFunc := FO_MOVE;
    lpFileOp.pTo := PWideChar(Cible);
  end;
  if SP_COPY_FILE.fieldbyname('Fonction').AsAnsiString = 'Renommer' then
  begin
    lpFileOp.wFunc := FO_RENAME;
    lpFileOp.pTo := PWideChar(Cible);
  end;

  if SP_COPY_FILE.fieldbyname('PossibleAnnuler').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_ALLOWUNDO;
  end;
  if SP_COPY_FILE.fieldbyname('ChangeNomSiCollision').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_RENAMEONCOLLISION;
  end;
  if SP_COPY_FILE.fieldbyname('SansConfirmation').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_NOCONFIRMATION;
  end;
  if SP_COPY_FILE.fieldbyname('SansProgression').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_SILENT;
  end;

  if SP_COPY_FILE.FindField('Fichiers_Seulement') <> nil then
  begin
    if SP_COPY_FILE.fieldbyname('Fichiers_Seulement').AsAnsiString = 'Oui' then
    begin
      FlagsOptions := FlagsOptions + FOF_FILESONLY;
    end;
  end;

  if SP_COPY_FILE.FindField('SansConfirmation_Rep') <> nil then
  begin
    if SP_COPY_FILE.fieldbyname('SansConfirmation_Rep').AsAnsiString = 'Oui' then
    begin
      FlagsOptions := FlagsOptions + FOF_NOCONFIRMMKDIR;
    end;
  end;

  if SP_COPY_FILE.FindField('PasMessageErreur') <> nil then
  begin
    if SP_COPY_FILE.fieldbyname('PasMessageErreur').AsAnsiString = 'Oui' then
    begin
      FlagsOptions := FlagsOptions + FOF_NOERRORUI;
    end;
  end;

  if SP_COPY_FILE.FindField('SimpleProgress') <> nil then
  begin
    if SP_COPY_FILE.fieldbyname('SimpleProgress').AsAnsiString = 'Oui' then
    begin
      FlagsOptions := FlagsOptions + FOF_SIMPLEPROGRESS;
    end;
  end;

  { -----préparation du paramètre lpFileOp ----- }
  lpFileOp.Wnd := Handle;
  lpFileOp.pFrom := TabFrom; // On aurait aussi put ecrire pFrom := @Chaine[1]
  lpFileOp.fFlags := FlagsOptions;
  { fin de la préparation du paramètre lpFileOp }
  Resultat_copie := SHFileOperation(lpFileOp); // procède à la copie
  if lpFileOp.fAnyOperationsAborted = True then
  begin
    Resultat_copie := -1;
  end;

  Result := Resultat_copie;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if (HandleGeneMail <> 0) then
  begin

    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
    SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

    SetWindowPos(HandleGeneMail, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
    SetWindowPos(HandleGeneMail, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end
  else
    ShowWindow(Form1.Handle, SW_SHOW);

  Fenetre_Position(Form1);
end;

procedure TForm1.Voir_Fiche(N_fiche: Integer; Fiche: Integer);
var
  Param: WPARAM;
  WM_GENESYS: Integer;
begin

  // Envoi d'un message à la fiche
  if (Form1.Handle_ouverture > 0) then
  begin
    wq_wm.close;
    wq_wm.Parameters.ParamByName('Type_Fiche').Value := Fiche;
    wq_wm.Open;
    WM_GENESYS := wq_wm.fieldbyname('WM_Genesys').Asinteger;
    wq_wm.close;

    postmessage(HWND(Form1.Handle_ouverture), WM_GENESYS, N_fiche, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

  end;
  SetForegroundWindow(Handle);
end;

function TForm1.BrowseforFile(Handle: THandle; Title: string; Filename: string): string;
var
  BrowseInfo: TBrowseInfo;
  RetBuffer, FName, ResultBuffer: array [0 .. 255] of char;
  PIDL: PItemIDList;
begin
  StrPCopy(FName, Filename);

  // Initialize buffers
  FillChar(BrowseInfo, SizeOf(TBrowseInfo), #0);
  FillChar(RetBuffer, SizeOf(RetBuffer), #0);
  FillChar(ResultBuffer, SizeOf(ResultBuffer), #0);

  BrowseInfo.hwndOwner := Handle;
  BrowseInfo.pszDisplayName := @RetBuffer;
  BrowseInfo.lpszTitle := @Title[1];

  // we want a status-text
  BrowseInfo.ulFlags := BIF_StatusText;

  // Our call-back function cheching for fileexist
  // BrowseInfo.lpfn := @BrowseCallBack;
  // BrowseInfo.lParam := Integer(@FName);

  // Show BrowseForDlg
  PIDL := SHBrowseForFolder(BrowseInfo);

  // Return fullpath to file
  if SHGetPathFromIDList(PIDL, ResultBuffer) then
    Result := StrPas(ResultBuffer)
  else
    Result := '';

  GlobalFreePtr(PIDL); // Clean up
end;

procedure TForm1.AdvEdit2Change(Sender: TObject);
begin
  fcLabel1.Caption := AdvEdit2.Text;
end;

procedure TForm1.Fichiers_Rep(Source: string; N_user: Integer; Cle_Session: string);
var
  Info: TSearchRec;
  Chemin: string;
begin

  { Pour être sur que la barre oblique finisse le nom du chemin }
  // Chemin := IncludeTrailingPathDelimiter(Source);
  Chemin := Source;
  { Recherche de la première entrée du répertoire }
  if FindFirst(Chemin + '*.*', faAnyFile, Info) = 0 then
  begin
    repeat
      { Les fichiers sont affichés dans ListBox1 }
      { Les répertoires sont affichés dans ListBox2 }
      if ((Info.Attr and faDirectory) = 0) then
      begin
        wq_EXCEL_READ_FIC.Append;
        wq_EXCEL_READ_FIC.fieldbyname('N_user').Asinteger := N_user;
        wq_EXCEL_READ_FIC.fieldbyname('Cle_Session').AsAnsiString := Cle_Session;
        wq_EXCEL_READ_FIC.fieldbyname('Repertoire').AsAnsiString := Chemin;
        wq_EXCEL_READ_FIC.fieldbyname('Fichier').AsAnsiString := Info.FindData.cFileName;
        wq_EXCEL_READ_FIC.post;
      end;

      { Il faut ensuite rechercher l'entrée suivante }
    until FindNext(Info) <> 0;

    { Dans le cas ou une entrée au moins est trouvée il faut }
    { appeler FindClose pour libérer les ressources de la recherche }
    FindClose(Info);
  end;
end;

procedure TForm1.Read_Excel_Log(Code_Log, Message_Log, Fichier, Feuille: string; N_user: Integer; Cle_Session: string);
begin

  wq_EXCEL_READ_LOG.Append;
  wq_EXCEL_READ_LOG.fieldbyname('N_user').Asinteger := N_user;
  wq_EXCEL_READ_LOG.fieldbyname('Cle_Session').AsAnsiString := Cle_Session;
  wq_EXCEL_READ_LOG.fieldbyname('Fichier').AsAnsiString := Fichier;
  wq_EXCEL_READ_LOG.fieldbyname('Feuille').AsAnsiString := Feuille;
  wq_EXCEL_READ_LOG.fieldbyname('Code_Log').AsAnsiString := Code_Log;
  wq_EXCEL_READ_LOG.fieldbyname('Message_Log').AsAnsiString := Message_Log;
  wq_EXCEL_READ_LOG.fieldbyname('Date_Log').asdatetime := now;
  wq_EXCEL_READ_LOG.post;

end;

end.
