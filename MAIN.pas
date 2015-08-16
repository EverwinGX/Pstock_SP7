unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, wwstorep, fcImage, fcimageform,
  AdvPicture, rtflabel, ExtCtrls, Shader, EllipsLabel, ThreadGenesysSP,
  ThreadGenesysSPINFO,
  AdvEdit, ShellAPI, ImgList, ComCtrls, wwriched, Wwquery, FileCtrl, ShlObj,
  GradientLabel, fcLabel, StrCryptage, Wwdatsrc, Grids, Excel_TLB, ADODB, inifiles, Wwdbigrd, Wwdbgrid, OleServer, uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, uADGUIxIntf, uADGUIxFormsWait, uADStanDef, uADStanPool, uADPhysManager, uADCompClient, uADPhysODBCBase, uADPhysODBC, uADCompGUIx, ConnexionSecurise,
  AdvToolBar, AdvToolBarStylers, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvPanel, uADCompDataSet, AdvAppStyler, aniicon, AdvShape;

type
  TForm1 = class(TForm)
    AdvEdit1: TAdvEdit;
    Shader1: TShader;
    OpenDlg: TOpenDialog;
    IconesListe: TImageList;
    Edit1: TwwDBRichEdit;
    Edit2: TwwDBRichEdit;
    IconesListe_Plus: TImageList;
    AdvEdit2: TAdvEdit;
    wq_EXCEL_READ_FIC0: TwwQuery;
    wq_EXCEL_READ_VAL0: TwwQuery;
    wq_EXCEL_READ_LOG0: TwwQuery;
    TU_Valeurs2: TUpdateSQL;
    wq_EXCEL_READ_TAB0: TwwQuery;
    TU_TAB2: TUpdateSQL;
    wq_EXCEL_READ_FIC2: TADOQuery;
    wq_EXCEL_READ_LOG2: TADOQuery;
    wq_EXCEL_READ_VAL2: TADOQuery;
    wq_EXCEL_READ_TAB2: TADOQuery;
    ADODataSet1: TADODataSet;
    ADODataSet2: TADODataSet;
    wq_LISTE_FICHIERS2: TADOQuery;
    AdvFormStyler1: TAdvFormStyler;
    AdvAppStyler1: TAdvAppStyler;
    wq_EXCEL_READ_VAL: TADQuery;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    ConnexionSecuriseFireDac: TConnexionSecurise;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysODBCDriverLink1: TADPhysODBCDriverLink;
    Database: TADConnection;
    Cryptage: TCryptage;
    Q_GetConnectSQLCrypte: TADQuery;
    SP: TADStoredProc;
    SP_LISTE_FICHIERS: TADStoredProc;
    SP_MEMOS: TADStoredProc;
    SP_FICHIER: TADStoredProc;
    SP_CREATE_DIR: TADStoredProc;
    SP_TXT_AFTER: TADStoredProc;
    SP_TXT_BEFORE: TADStoredProc;
    SP_TXT_VALIDE: TADStoredProc;
    SP_TXT: TADStoredProc;
    SP_PARAM_AFTER: TADStoredProc;
    SP_PARAM: TADStoredProc;
    SP_LISTE_FICHES_BEFORE: TADStoredProc;
    SP_EXCEL_READ_END: TADStoredProc;
    SP_LISTE_FICHES: TADStoredProc;
    SP_EXCEL_READ_REP: TADStoredProc;
    SP_EXCEL_READ_START: TADStoredProc;
    SP_EXCEL_READ: TADStoredProc;
    SP_NAV: TADStoredProc;
    SP_LOCK: TADStoredProc;
    SP_LOCK_BEFORE: TADStoredProc;
    SP_LOCK_AFTER: TADStoredProc;
    SP_OPEN_APPLI_BEFORE: TADStoredProc;
    SP_OPEN_APPLI: TADStoredProc;
    SP_EXCEL: TADStoredProc;
    SP_EXCEL_BEFORE: TADStoredProc;
    SP_OUTLOOK_AFTER: TADStoredProc;
    SP_OUTLOOK_BEFORE: TADStoredProc;
    SP_OUTLOOK: TADStoredProc;
    SP_COPY_FILE: TADStoredProc;
    SP_COPY_FILE_BEFORE: TADStoredProc;
    SP_COPY_FILE_AFTER: TADStoredProc;
    SP_PRINT_BEFORE: TADStoredProc;
    SP_PRINT: TADStoredProc;
    SP_CLOSE: TADStoredProc;
    SP_CLOSE_BEFORE: TADStoredProc;
    SP_CLOSE_AFTER: TADStoredProc;
    SP_REFRESH: TADStoredProc;
    SP_REFRESH_BEFORE: TADStoredProc;
    SP_BEFORE: TADStoredProc;
    wq_GETINIT: TADQuery;
    wq_LISTE_FICHIERS: TADQuery;
    wq_Session: TADQuery;
    wq_Exist: TADQuery;
    QueryGetUser: TADQuery;
    wq_memos: TADQuery;
    wq_wm: TADQuery;
    wq_EXCEL_READ_TAB: TADQuery;
    wq_EXCEL_READ_LOG: TADQuery;
    TU_TAB: TADUpdateSQL;
    TU_Valeurs: TADUpdateSQL;
    SP_EXCEL_READ_MOVE: TADStoredProc;
    AdvShape1: TAdvShape;
    Image1: TImage;
    AdvPicture1: TAdvPicture;
    fcLabel1: TfcLabel;
    IconeListePNG: TImageList;
    IconesFiches16PNG: TImageList;
    wq_Exist_Param: TADQuery;
    wq_EXCEL_READ_FIC: TADQuery;
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
    function Deplacer(Handle: HWND; Source, Cible: string): Integer;
    procedure Transfert_Ico;
    procedure FormActivate(Sender: TObject);
    procedure Voir_Fiche(N_fiche: Integer; Fiche: Integer);
    function BrowseforFile(Handle: THandle; Title: string; Filename: string): string;
    function Procedure_Exist(Nom_procedure: string): Boolean;
    procedure AdvEdit2Change(Sender: TObject);
    procedure Fenetre_Position(Fenetre: TForm);
    procedure Read_Excel_Log(Code_Log, Message_Log, Fichier, Feuille: string; N_user: Integer; Cle_Session: string);
    procedure FileSearch(const PathName, Filename: string; const InDir: Boolean; N_user: Integer; Cle_Session: string);
    procedure FileSearch_FIC(const PathName, Filename: string; const InDir: Boolean; N_user: Integer; Cle_Session: string);
    function Param_Exist(Nom_procedure: string; Nom_Parametre: string): Boolean;

  private
    Find_Fenetre: AnsiString;
    Handle_Fenetre: THandle;

    msgreussite, msgerreur: String;
    Ouverture_Fiche: Integer;
    Type_Fiche: Integer;
    N_fiche: Integer;
    Refresh: Integer;
    Nom_Fenetre: String;
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
    Nom_Societe: String;
    Nom_Fenetre_Genesys: String;

    User: String;

    Timer: Integer;

    { Déclarations publiques }
    Olexls: Variant;
    ID_Session: String;
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
    ExStyle := ExStyle or WS_EX_TOPMOST or WS_EX_APPWINDOW;
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
  IsQuitter := True;
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

  for i := IconeListePNG.Count + 1 to 150 do
  begin
    IconesListe_Plus.GetIcon(0, Ico);
    IconeListePNG.AddIcon(Ico);
  end;

  for i := 0 to IconesListe_Plus.Count - 1 do
  begin
    IconesListe_Plus.GetIcon(i, Ico);
    IconesListe.AddIcon(Ico);
    IconeListePNG.AddIcon(Ico);
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
    Database.Params.Clear;

    Try
      // Connexion FireDac
      ConnexionSecuriseFireDac.AliasBD := Db;
      ConnexionSecuriseFireDac.Connexion;
    Except
      MessageDlg('Problème d''ouverture de la base de données : ' + Db + #13 + #10 + 'Veuillez vérifier que SQL Server est démarré.' + #13 + #10 + 'Veuillez vérifier les sources de données ODBC.' + #13 + #10 + Database.ConnectionString, mtError, [mbOK], 0);
      Database.close;
      Application.Terminate;
      Exit;
    End;

    // ****************
    // ID de session
    // ****************
    wq_Session.open;
    ID_Session := wq_Session.FieldByName('ID').AsAnsiString;
    wq_Session.close;
    if Pos('$ID_SESSION$', uppercase(P1_Procedure)) > 0 then
    begin
      P1_Procedure := stringreplace(P1_Procedure, '$ID_SESSION$', ID_Session, [rfReplaceAll, rfIgnoreCase]);
    end;
    if Pos('$ID_SESSION$', uppercase(P2_Procedure)) > 0 then
    begin
      P2_Procedure := stringreplace(P2_Procedure, '$ID_SESSION$', ID_Session, [rfReplaceAll, rfIgnoreCase]);
    end;

    wq_GETINIT.open;

    if N_user > 0 then
    begin
      wq_GETINIT.open;
      Nom_Societe := wq_GETINIT.FieldByName('Nom_societe').AsAnsiString;
      wq_GETINIT.close;
      QueryGetUser.close;
      QueryGetUser.ParamByName('N_user').asinteger := N_user;
      QueryGetUser.open;
      User := lowercase(QueryGetUser.FieldByName('Login').AsAnsiString);
      // QueryGetUser.close;
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

    SetWindowLong(Application.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle, GWL_EXSTYLE) and not WS_EX_APPWINDOW or WS_EX_TOOLWINDOW);
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

  wq_Session.close;

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
  wq_Session.close;

  Database.close;
  Application.Terminate;

end;

function TForm1.Procedure_Exist(Nom_procedure: string): Boolean;
begin
  Result := wq_Exist.locate('Nom', Nom_procedure, [loCaseInsensitive]);
end;

function TForm1.Param_Exist(Nom_procedure: string; Nom_Parametre: string): Boolean;
begin
  Result := wq_Exist_Param.locate('Recherche', Nom_procedure + '-' + Nom_Parametre, [loCaseInsensitive]);
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
  Param: TADParam;
  Print_ID: string;

  Read_Excel_Rep_Chemin: string;
  Read_Excel_Rep_Indir: Boolean;
  Read_Excel_Rep_Fichier: string;
  Before_Principal: string;
  Result_Deplacer: Integer;
  Move: Integer;

label
  Suite;
begin
  if (encours = True) or (IsQuitter = True) then
    Exit;

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
      wq_Exist.open;

      wq_Exist_Param.close;
      wq_Exist_Param.SQL[6] := 'AND o.NAME LIKE ' + quotedstr(Nom_procedure + '%');
      wq_Exist_Param.open;
    except
      Application.HandleException(Self);
      Fin_Appli;
      Exit;
    end;

    choix := 0;
    SP_BEFORE.StoredProcName := Nom_procedure + '_BEFORE';
    With SP_BEFORE do
    begin
      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      if Param_Exist(SP_BEFORE.StoredProcName, '@P1') = True then
      begin
        Param := Params.Add;
        Param.Name := '@P1';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := P1_Procedure;

      end;

      if Param_Exist(SP_BEFORE.StoredProcName, '@P2') = True then
      begin
        Param := Params.Add;
        Param.Name := '@P2';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := P2_Procedure;
      end;

    end;

    try
      if (Procedure_Exist(Nom_procedure + '_BEFORE') = True) then
      begin
        SP_BEFORE.open;

        if (SP_BEFORE.FieldByName('Msg').Asstring <> '') then
        begin
          Choix_Entree := Application.MessageBox(PChar(SP_BEFORE.FieldByName('Msg').Asstring), PChar(SP_BEFORE.FieldByName('Caption').Asstring), SP_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);
        end;
        if (SP_BEFORE.FieldByName('Result').asinteger <> 1) then
        begin
          SP_BEFORE.close;
          Fin_Appli;
          Exit;
        end;
        SP_BEFORE.close;
      end;
    except
      Application.HandleException(Self);
      SP_BEFORE.close;
      Fin_Appli;
      Exit;
    end;

    SP_PARAM.StoredProcName := Nom_procedure + '_PARAMS';
    With SP_PARAM do
    begin

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@P1';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      Param.Value := P1_Procedure;

      Param := Params.Add;
      Param.Name := '@P2';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      Param.Value := P2_Procedure;

      Param := Params.Add;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := Choix_Entree;
    end;

    if (Procedure_Exist(Nom_procedure + '_PARAMS') = True) then
    begin
      try
        SP_PARAM.open;
      except
        ;
      end;
      if SP_PARAM.Active = True then
      begin
        try
          try
            // Enleve le topmost
            SetWindowPos(HWND(Form1.Handle), // handle of window
              HWND_NOTOPMOST or WS_EX_APPWINDOW, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                );
            // form1.Visible := False;

            HandleGeneMail := 0;
            Param_Top_Most := 0;

            if SP_PARAM.FindField('Top_Most') <> nil then
              Param_Top_Most := SP_PARAM.FieldByName('Top_Most').asinteger;

            F_Params := TF_Params.Create(Self);
            HandleGeneMail := F_Params.Handle;
            F_Params.wsp_Filtres := SP_PARAM;
            F_Params.ApplicationHandle := Form1.Handle;

            F_Params.Timer := 0;

            if SP_PARAM.FindField('Timer') <> nil then
              F_Params.Timer := SP_PARAM.FieldByName('Timer').asinteger;

            F_Params.Init;
            ShowWindow(Form1.Handle, SW_HIDE);
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
              Exit;
            end;
          finally
            // Form1.Visible := True;
            SetWindowPos(HWND(Form1.Handle), // handle of window
              HWND_TOPMOST or WS_EX_APPWINDOW, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
                );
            HandleGeneMail := 0;
            ShowWindow(Form1.Handle, SW_SHOW);

            SP_PARAM.close;
          end;
        except
          Application.HandleException(Self);
          SP_PARAM.close;
          Fin_Appli;
          Exit;
        end;
      end;
    end;

    // Gestion du message PARAMS_AFTER
    SP_PARAM_AFTER.StoredProcName := Nom_procedure + '_PARAMS_AFTER';
    With SP_PARAM_AFTER do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@P1';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      Param.Value := P1_Procedure;

      Param := Params.Add;
      Param.Name := '@P2';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      Param.Value := P2_Procedure;

      Param := Params.Add;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := Choix_Entree;

      for j := 0 to 8 do
      begin
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_PARAMS_AFTER') = True) then
      begin
        SP_PARAM_AFTER.open;

        if (SP_PARAM_AFTER.FieldByName('Msg').Asstring <> '') then
        begin
          Choix_Entree := Application.MessageBox(PChar(SP_PARAM_AFTER.FieldByName('Msg').Asstring), PChar(SP_PARAM_AFTER.FieldByName('Caption').Asstring), SP_PARAM_AFTER.FieldByName('Flags').asinteger + MB_TOPMOST);
        end;
        if (SP_PARAM_AFTER.FieldByName('Result').asinteger <> 1) then
        begin
          SP_PARAM_AFTER.close;
          Fin_Appli;
          Exit;
        end;
        SP_PARAM_AFTER.close;
      end;
    except
      Application.HandleException(Self);
      SP_PARAM_AFTER.close;
      Fin_Appli;
      Exit;
    end;

    SP_FICHIER.StoredProcName := Nom_procedure + '_SELECT_FILE';
    With SP_FICHIER do
    begin

      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := Choix_Entree;

      for j := 0 to 8 do
      begin
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_SELECT_FILE') = True) then
      begin

        SP_FICHIER.open;

        if (SP_FICHIER.FieldByName('Title').AsAnsiString <> '') then
        begin
          // gestion de la selection d'un repertoire uniquement
          Directory_Only := 0;

          if SP_FICHIER.FindField('Directory_Only') <> nil then
            Directory_Only := SP_FICHIER.FieldByName('Directory_Only').asinteger;

          if Directory_Only = 0 then
          begin
            OpenDlg.DefaultExt := SP_FICHIER.FieldByName('DefaultExt').AsAnsiString;
            OpenDlg.Filter := SP_FICHIER.FieldByName('Filter').AsAnsiString;
            OpenDlg.InitialDir := SP_FICHIER.FieldByName('InitialDir').AsAnsiString;
            OpenDlg.Title := SP_FICHIER.FieldByName('Title').AsAnsiString;
            OpenDlg.Filename := SP_FICHIER.FieldByName('FileName').AsAnsiString;

            if SP_FICHIER.FieldByName('HideReadOnly').asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofHideReadOnly]
            else
              OpenDlg.Options := OpenDlg.Options + [ofHideReadOnly];

            if SP_FICHIER.FieldByName('AllowMultiSelect').asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofAllowMultiSelect]
            else
              OpenDlg.Options := OpenDlg.Options + [ofAllowMultiSelect];

            if SP_FICHIER.FieldByName('NoChangeDir').asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofNoChangeDir]
            else
              OpenDlg.Options := OpenDlg.Options + [ofNoChangeDir];

            if SP_FICHIER.FieldByName('PathMustExist').asinteger = 0 then
              OpenDlg.Options := OpenDlg.Options - [ofPathMustExist]
            else
              OpenDlg.Options := OpenDlg.Options + [ofPathMustExist];

            if SP_FICHIER.FieldByName('FileMustExist').asinteger = 0 then
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
                Exit;
              end;
            end
            else
            begin
              Chemin_Fic := BrowseforFile(Handle, SP_FICHIER.FieldByName('Title').AsAnsiString, SP_FICHIER.FieldByName('InitialDir').AsAnsiString);

              if (Chemin_Fic = '') then
              begin
                SP_FICHIER.close;
                Fin_Appli;
                Exit;
              end;
            end;
          finally
            SetWindowPos(HWND(Form1.Handle), // handle of window
              HWND_TOPMOST or WS_EX_APPWINDOW, // placement-order handle
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
      Exit;
    end;

    // Récupères les fichiers à traiter
    if (Procedure_Exist(Nom_procedure + '_LISTE_FICHIERS') = True) then
    begin
      SP_LISTE_FICHIERS.StoredProcName := Nom_procedure + '_LISTE_FICHIERS';
      With SP_LISTE_FICHIERS do
      begin
        Params.Clear;

        Param := Params.Add;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.ParamType := ptResult;

        Param := Params.Add;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := cle;

        Param := Params.Add;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := N_user;

        Param := Params.Add;
        Param.Name := '@P1';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := P1_Procedure;

        Param := Params.Add;
        Param.Name := '@P2';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
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
          Param := Params.Add;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Tab_Params[j];
        end;

        Param := Params.Add;
        Param.Name := '@ID_Session';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := ID_Session;

      end;

      SP_LISTE_FICHIERS.open;
      SP_LISTE_FICHIERS.first;

      wq_LISTE_FICHIERS.close;
      wq_LISTE_FICHIERS.SQL.Clear;
      wq_LISTE_FICHIERS.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_LISTE_FICHIERS');
      wq_LISTE_FICHIERS.open;

      while not SP_LISTE_FICHIERS.Eof do
      begin
        Read_Excel_Rep_Chemin := SP_LISTE_FICHIERS.FieldByName('Repertoire').AsAnsiString;
        if SP_LISTE_FICHIERS.FindField('Fichier') <> nil then
        begin
          Read_Excel_Rep_Fichier := SP_LISTE_FICHIERS.FieldByName('Fichier').AsAnsiString;
        end
        else
        begin
          Read_Excel_Rep_Fichier := '*.*';
        end;
        if SP_LISTE_FICHIERS.FindField('Indir') <> nil then
        begin
          if SP_LISTE_FICHIERS.FieldByName('Indir').AsAnsiString = 'Oui' then
          begin
            Read_Excel_Rep_Indir := True;
          end
          else
          begin
            Read_Excel_Rep_Indir := False;
          end;
        end
        else
        begin
          Read_Excel_Rep_Indir := False;
        end;

        FileSearch_FIC(Read_Excel_Rep_Chemin, Read_Excel_Rep_Fichier, Read_Excel_Rep_Indir, N_user, ID_Session);
        SP_LISTE_FICHIERS.Next;
      end;

      SP_LISTE_FICHIERS.close;
      wq_LISTE_FICHIERS.close;
    end;

    // Lance la copie de fichiers
    SP_COPY_FILE_BEFORE.StoredProcName := Nom_procedure + '_COPY_FILE_BEFORE';
    With SP_COPY_FILE_BEFORE do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@File_Name';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileName(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Params.Add;
      Param.Name := '@File_Dir';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileDir(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Params.Add;
      Param.Name := '@File';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
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
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_COPY_FILE_BEFORE') = True) then
      begin
        SP_COPY_FILE_BEFORE.open;

        if (SP_COPY_FILE_BEFORE.FieldByName('Msg').Asstring <> '') then
        begin
          choix := Application.MessageBox(PChar(SP_COPY_FILE_BEFORE.FieldByName('Msg').Asstring), PChar(SP_COPY_FILE_BEFORE.FieldByName('Caption').Asstring), SP_COPY_FILE_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);
        end;

        if (SP_COPY_FILE_BEFORE.FieldByName('Result').asinteger <> 1) then
        begin
          SP_COPY_FILE_BEFORE.close;
          Fin_Appli;
          Exit;
        end;

        SP_COPY_FILE_BEFORE.close;
      end;
    except
      Application.HandleException(Self);
      SP_COPY_FILE_BEFORE.close;
      Fin_Appli;
      Exit;
    end;

    SP_CREATE_DIR.StoredProcName := Nom_procedure + '_CREATE_DIR';
    With SP_CREATE_DIR do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := choix;

      Param := Params.Add;
      Param.Name := '@File_Name';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileName(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Params.Add;
      Param.Name := '@File_Dir';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileDir(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Params.Add;
      Param.Name := '@File';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
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
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    SP_COPY_FILE.StoredProcName := Nom_procedure + '_COPY_FILE';
    With SP_COPY_FILE do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := choix;

      Param := Params.Add;
      Param.Name := '@File_Name';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileName(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Params.Add;
      Param.Name := '@File_Dir';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := ExtractFileDir(Chemin_Fic);
      end
      else
      begin
        Param.Value := '';
      end;

      Param := Params.Add;
      Param.Name := '@File';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
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
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    SP_COPY_FILE_AFTER.StoredProcName := Nom_procedure + '_COPY_FILE_AFTER';
    With SP_COPY_FILE_AFTER do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@Fonction';
      Param.DataType := ftString;
      Param.ParamType := ptInput;

      Param := Params.Add;
      Param.Name := '@FileS_Name';
      Param.DataType := ftString;
      Param.ParamType := ptInput;

      Param := Params.Add;
      Param.Name := '@FileS_Dir';
      Param.DataType := ftString;
      Param.ParamType := ptInput;

      Param := Params.Add;
      Param.Name := '@FileS';
      Param.DataType := ftString;
      Param.ParamType := ptInput;

      Param := Params.Add;
      Param.Name := '@FileD_Name';
      Param.DataType := ftString;
      Param.ParamType := ptInput;

      Param := Params.Add;
      Param.Name := '@FileD_Dir';
      Param.DataType := ftString;
      Param.ParamType := ptInput;

      Param := Params.Add;
      Param.Name := '@FileD';
      Param.DataType := ftString;
      Param.ParamType := ptInput;

      Param := Params.Add;
      Param.Name := '@Resultat';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;

      for j := 0 to 8 do
      begin
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    // Create Dir
    try

      if (Procedure_Exist(Nom_procedure + '_CREATE_DIR') = True) then
      begin
        SP_CREATE_DIR.open;

        while (not SP_CREATE_DIR.Eof) do
        begin
          if SP_CREATE_DIR.FieldByName('Directory').AsAnsiString <> '' then
          begin
            if not DirectoryExists(SP_CREATE_DIR.FieldByName('Directory').AsAnsiString) then
            begin
              if SP_CREATE_DIR.FieldByName('Force_Dir').asinteger = 1 then
              begin
                ForceDirectories(SP_CREATE_DIR.FieldByName('Directory').AsAnsiString);
              end
              else
              begin
                CreateDir(SP_CREATE_DIR.FieldByName('Directory').AsAnsiString);
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
      Exit;
    end;

    // Copy File
    try
      if (Procedure_Exist(Nom_procedure + '_COPY_FILE') = True) then
      begin
        SP_COPY_FILE.open;

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
            Chemin_Fic := SP_COPY_FILE.FieldByName('Source').AsAnsiString;
            Chemin_dest := SP_COPY_FILE.FieldByName('Destination').AsAnsiString;

            if SP_COPY_FILE.FieldByName('Fonction').AsAnsiString <> '' then
            begin
              Resultat_copie := copier(Form1.Handle, Chemin_Fic, Chemin_dest);

              SP_COPY_FILE_AFTER.Params.ParamByName('@Cle').asinteger := cle;
              SP_COPY_FILE_AFTER.Params.ParamByName('@N_User').asinteger := N_user;
              SP_COPY_FILE_AFTER.Params.ParamByName('@Fonction').AsAnsiString := SP_COPY_FILE.FieldByName('Fonction').AsAnsiString; // ['{E2F63D47-F74C-47B5-B90D-A5C009BA00FB}']
              SP_COPY_FILE_AFTER.Params.ParamByName('@FileS_Name').AsAnsiString := ExtractFileName(Chemin_Fic);
              SP_COPY_FILE_AFTER.Params.ParamByName('@FileS_Dir').AsAnsiString := ExtractFileDir(Chemin_Fic);
              SP_COPY_FILE_AFTER.Params.ParamByName('@FileS').AsAnsiString := Chemin_Fic;
              SP_COPY_FILE_AFTER.Params.ParamByName('@FileD_Name').AsAnsiString := ExtractFileName(Chemin_dest);
              SP_COPY_FILE_AFTER.Params.ParamByName('@FileD_Dir').AsAnsiString := ExtractFileDir(Chemin_dest);
              SP_COPY_FILE_AFTER.Params.ParamByName('@FileD').AsAnsiString := Chemin_dest;
              SP_COPY_FILE_AFTER.Params.ParamByName('@Resultat').asinteger := Resultat_copie;

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
                  Exit;
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
      Exit;
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
      wq_EXCEL_READ_LOG.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_LOG');
      wq_EXCEL_READ_LOG.open;
      wq_EXCEL_READ_LOG.Append;

      wq_EXCEL_READ_VAL.close;
      wq_EXCEL_READ_VAL.SQL.Clear;
      wq_EXCEL_READ_VAL.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_CEL');
      wq_EXCEL_READ_VAL.open;

      wq_EXCEL_READ_TAB.close;
      wq_EXCEL_READ_TAB.SQL.Clear;
      wq_EXCEL_READ_TAB.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_TAB');
      wq_EXCEL_READ_TAB.open;

      { TU_Valeurs.InsertSQL.Clear;
        Tu_valeurs.InsertSQL.Add('insert into ' + stringreplace(nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_VAL');
        Tu_valeurs.InsertSQL.Add('(N_user, Cle_Session, Fichier, Feuille, Ligne, Colonne, Valeur)');
        Tu_valeurs.InsertSQL.Add('values');
        Tu_valeurs.InsertSQL.Add('(:N_user, :Cle_Session, :Fichier, :Feuille, :Ligne, :Colonne, :Valeur) ');
        }

      SP_EXCEL_READ_START.StoredProcName := Nom_procedure + '_READ_XLS_START';
      With SP_EXCEL_READ_START do
      begin

        Param := Params.Add;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.ParamType := ptResult;

        Param := Params.Add;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := cle;

        Param := Params.Add;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := N_user;

        Param := Params.Add;
        Param.Name := '@P1';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := P1_Procedure;

        Param := Params.Add;
        Param.Name := '@P2';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        if Chemin_Fic <> '' then
        begin
          Param.Value := Chemin_Fic;
        end
        else
        begin
          Param.Value := P2_Procedure;
        end;

        Param := Params.Add;
        Param.Name := '@Choix_Before';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := choix;

        for j := 0 to 8 do
        begin
          Param := Params.Add;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      SP_EXCEL_READ_START.open;

      if SP_EXCEL_READ_START.FieldByName('Cle_Session').AsAnsiString <> '' then
      begin
        // récupère la clé de session
        Read_Excel_session := SP_EXCEL_READ_START.FieldByName('Cle_Session').AsAnsiString;

        // Récupères les fichiers à traiter
        if (Procedure_Exist(Nom_procedure + '_READ_XLS_REP') = True) then
        begin
          SP_EXCEL_READ_REP.StoredProcName := Nom_procedure + '_READ_XLS_REP';
          With SP_EXCEL_READ_REP do
          begin
            Params.Clear;

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            Param := Params.Add;
            Param.Name := '@P1';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := P1_Procedure;

            Param := Params.Add;
            Param.Name := '@P2';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
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
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;

            Param := Params.Add;
            Param.Name := '@Cle_Session';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Read_Excel_session;

          end;

          SP_EXCEL_READ_REP.open;
          SP_EXCEL_READ_REP.first;

          wq_EXCEL_READ_FIC.close;
          wq_EXCEL_READ_FIC.SQL.Clear;
          wq_EXCEL_READ_FIC.SQL.Add('SELECT * FROM ' + stringreplace(Nom_procedure, '_SP_', '_TB_', [rfReplaceAll, rfIgnoreCase]) + '_READ_XLS_FIC');
          wq_EXCEL_READ_FIC.open;

          while not SP_EXCEL_READ_REP.Eof do
          begin
            Read_Excel_Rep_Chemin := SP_EXCEL_READ_REP.FieldByName('Repertoire').AsAnsiString;
            if SP_EXCEL_READ_REP.FindField('Fichier') <> nil then
            begin
              Read_Excel_Rep_Fichier := SP_EXCEL_READ_REP.FieldByName('Fichier').AsAnsiString;
            end
            else
            begin
              Read_Excel_Rep_Fichier := '*.*';
            end;
            if SP_EXCEL_READ_REP.FindField('Indir') <> nil then
            begin
              if SP_EXCEL_READ_REP.FieldByName('Indir').AsAnsiString = 'Oui' then
              begin
                Read_Excel_Rep_Indir := True;
              end
              else
              begin
                Read_Excel_Rep_Indir := False;
              end;
            end
            else
            begin
              Read_Excel_Rep_Indir := False;
            end;

            FileSearch(Read_Excel_Rep_Chemin, Read_Excel_Rep_Fichier, Read_Excel_Rep_Indir, N_user, Read_Excel_session);
            SP_EXCEL_READ_REP.Next;
          end;

          SP_EXCEL_READ_REP.close;
          wq_EXCEL_READ_FIC.close;
        end;

        SP_EXCEL_READ.StoredProcName := Nom_procedure + '_READ_XLS';
        With SP_EXCEL_READ do
        begin

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          Param := Params.Add;
          Param.Name := '@P1';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := P1_Procedure;

          Param := Params.Add;
          Param.Name := '@P2';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
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
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;

          Param := Params.Add;
          Param.Name := '@Cle_Session';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Read_Excel_session;

        end;

        SP_EXCEL_READ.open;
        SP_EXCEL_READ.first;
        Read_Excel_Log('', 'Ouverture Excel', Fichier_excel, '', N_user, Read_Excel_session);
        VarClear(Olexls);
        Olexls := CreateOleObject('Excel.application');

        Read_Excel_Log('', 'Debut de parcours des fichiers', Fichier_excel, '', N_user, Read_Excel_session);

        if SP_EXCEL_READ.FieldByName('Fichier').AsAnsiString <> '' then
        begin
          Read_Excel_Log('', 'Entré dans la boucle', Fichier_excel, '', N_user, Read_Excel_session);

          Olexls.Visible := False;
          Fichier_excel_old := '';
          Str_Feuille_Old := '';

          while not SP_EXCEL_READ.Eof do
          begin
            Fichier_excel := SP_EXCEL_READ.FieldByName('Fichier').AsAnsiString;
            Read_Excel_Log('', 'Debut Lecture', Fichier_excel, '', N_user, Read_Excel_session);
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

                  Read_Excel_Log('KO', 'Problème rencontré à l''ouverture du fichier', Fichier_excel, '', N_user, Read_Excel_session);
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
            Str_Feuille := SP_EXCEL_READ.FieldByName('Feuille').AsAnsiString;

            int_Line := SP_EXCEL_READ.FieldByName('ligne').asinteger;
            int_col := SP_EXCEL_READ.FieldByName('colonne').asinteger;
            int_line_End := SP_EXCEL_READ.FieldByName('Ligne_End').asinteger;
            int_col_end := SP_EXCEL_READ.FieldByName('colonne_End').asinteger;
            Plag_Cpt_vide := SP_EXCEL_READ.FieldByName('Plage_Vide_Cpt').asinteger;
            Col_Cpt_vide := SP_EXCEL_READ.FieldByName('Plage_Vide_Col').asinteger;

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

            if SP_EXCEL_READ.FieldByName('Mode').AsAnsiString = 'TAB' then
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
                wq_EXCEL_READ_TAB.FieldByName('N_user').asinteger := N_user;
                wq_EXCEL_READ_TAB.FieldByName('Cle_Session').AsAnsiString := Read_Excel_session;
                wq_EXCEL_READ_TAB.FieldByName('Fichier').AsAnsiString := Fichier_excel;
                wq_EXCEL_READ_TAB.FieldByName('Feuille').AsAnsiString := Str_Feuille;
                wq_EXCEL_READ_TAB.FieldByName('Ligne').asinteger := j;

                for i := int_col to int_col_end do
                begin
                  try
                    Read_Excel_Valeur := Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[j, i].Value;

                    wq_EXCEL_READ_TAB.FieldByName('Col_' + inttostr(i)).AsAnsiString := Read_Excel_Valeur;

                  except
                    Read_Excel_Log('KO', 'Problème de lecture', Fichier_excel, Str_Feuille, N_user, Read_Excel_session);
                    Break;
                  end;
                end;
                wq_EXCEL_READ_TAB.post;

                Read_Excel_Vide := Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[j, Col_Cpt_vide].Value;

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

            if SP_EXCEL_READ.FieldByName('Mode').AsAnsiString = 'CEL' then
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
                    Read_Excel_Valeur := Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[j, i].Value;

                    wq_EXCEL_READ_VAL.Append;
                    wq_EXCEL_READ_VAL.FieldByName('N_user').asinteger := N_user;
                    wq_EXCEL_READ_VAL.FieldByName('Cle_Session').AsAnsiString := Read_Excel_session;
                    wq_EXCEL_READ_VAL.FieldByName('Fichier').AsAnsiString := Fichier_excel;
                    wq_EXCEL_READ_VAL.FieldByName('Feuille').AsAnsiString := Str_Feuille;
                    wq_EXCEL_READ_VAL.FieldByName('Ligne').asinteger := j;
                    wq_EXCEL_READ_VAL.FieldByName('Colonne').asinteger := i;
                    wq_EXCEL_READ_VAL.FieldByName('Valeur').AsAnsiString := Read_Excel_Valeur;
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

        if wq_EXCEL_READ_VAL.Active = True then
          wq_EXCEL_READ_VAL.close;

        if wq_EXCEL_READ_TAB.Active = True then
          wq_EXCEL_READ_TAB.close;

        SP_EXCEL_READ.close;
        if (Procedure_Exist(Nom_procedure + '_READ_XLS_MOVE') = True) then
        begin
          SP_EXCEL_READ_MOVE.StoredProcName := Nom_procedure + '_READ_XLS_MOVE';
          With SP_EXCEL_READ_MOVE do
          begin

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            Param := Params.Add;
            Param.Name := '@P1';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := P1_Procedure;

            Param := Params.Add;
            Param.Name := '@P2';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
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
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;

            Param := Params.Add;
            Param.Name := '@Cle_Session';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Read_Excel_session;

          end;

          SP_EXCEL_READ_MOVE.open;

          SP_EXCEL_READ_MOVE.first;

          while not SP_EXCEL_READ_MOVE.Eof do
          begin
            Read_Excel_Log('', 'Deplacement du ficher', SP_EXCEL_READ_MOVE.FieldByName('Fichier_Source').AsAnsiString, SP_EXCEL_READ_MOVE.FieldByName('Fichier_Destination').AsAnsiString, N_user, Read_Excel_session);
            Result_Deplacer := Deplacer(Form1.Handle, SP_EXCEL_READ_MOVE.FieldByName('Fichier_Source').AsAnsiString, SP_EXCEL_READ_MOVE.FieldByName('Fichier_Destination').AsAnsiString);
            Read_Excel_Log('', 'Résultat move', inttostr(Result_Deplacer), '', N_user, Read_Excel_session);
            // if Integer(Result_Move) <> 0 then
            // begin
            // Read_Excel_Log('KO', 'Problème de déplacement', SP_EXCEL_READ_MOVE.fieldbyname('Fichier_Source').AsAnsiString, '', N_user, Read_Excel_session);
            //
            // end;
            SP_EXCEL_READ_MOVE.Next;
          end;

          SP_EXCEL_READ_MOVE.close;

        end;

        if (Procedure_Exist(Nom_procedure + '_READ_XLS_END') = True) then
        begin
          SP_EXCEL_READ_END.StoredProcName := Nom_procedure + '_READ_XLS_END';
          With SP_EXCEL_READ_END do
          begin

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            Param := Params.Add;
            Param.Name := '@P1';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := P1_Procedure;

            Param := Params.Add;
            Param.Name := '@P2';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
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
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;

            Param := Params.Add;
            Param.Name := '@Cle_Session';
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Read_Excel_session;

          end;

          SP_EXCEL_READ_END.ExecProc;
          SP_EXCEL_READ_END.close;
        end;

      end;
    end;

    if wq_EXCEL_READ_LOG.Active = True then
      wq_EXCEL_READ_LOG.close;

    // Gestion de la fusion excel
    try
      if (Procedure_Exist(Nom_procedure + '_EXCEL') = True) then
      begin
        SP_EXCEL_BEFORE.StoredProcName := Nom_procedure + '_EXCEL_BEFORE';
        With SP_EXCEL_BEFORE do
        begin

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_EXCEL_BEFORE') = True) then
          begin
            SP_EXCEL_BEFORE.open;

            if (SP_EXCEL_BEFORE.FieldByName('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_EXCEL_BEFORE.FieldByName('Msg').Asstring), PChar(SP_EXCEL_BEFORE.FieldByName('Caption').Asstring), SP_EXCEL_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_EXCEL_BEFORE.close;
                Fin_Appli;
                Exit;
              end;
            end;

            if (SP_EXCEL_BEFORE.FieldByName('Result').asinteger <> 1) then
            begin
              SP_EXCEL_BEFORE.close;
              Fin_Appli;
              Exit;
            end;

            SP_EXCEL_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_EXCEL_BEFORE.close;
          Fin_Appli;
          Exit;
        end;

        SP_EXCEL.StoredProcName := Nom_procedure + '_EXCEL';
        With SP_EXCEL do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          Param := Params.Add;
          Param.Name := '@P1';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := P1_Procedure;

          Param := Params.Add;
          Param.Name := '@P2';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          if Chemin_Fic <> '' then
          begin
            Param.Value := Chemin_Fic;
          end
          else
          begin
            Param.Value := P2_Procedure;
          end;

          Param := Params.Add;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := choix;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        SP_EXCEL.open;

        SP_EXCEL.first;

        Quit_Excel := 'Oui';
        VarClear(Olexls);
        Olexls := CreateOleObject('Excel.application');

        if SP_EXCEL.FieldByName('Fichier').AsAnsiString <> '' then
        begin
          if SP_EXCEL.FieldByName('Excel_Visible').AsAnsiString = 'Oui' then
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
          Fermer_excel := SP_EXCEL.FieldByName('Fermer_Fichier').AsAnsiString;
          while not SP_EXCEL.Eof do
          begin
            Fichier_excel := SP_EXCEL.FieldByName('Fichier').AsAnsiString;

            if SP_EXCEL.FindField('Fichier_Dest') <> nil then
            begin
              Fichier_excel_Save := SP_EXCEL.FieldByName('Fichier_Dest').AsAnsiString;
            end;

            if (Fichier_excel <> Fichier_excel_old) or (Fichier_excel_Save <> Fichier_excel_Save_old) then
            begin
              if (Fichier_excel_old <> '') or (Fichier_excel_Save_old <> '') then
              begin
                if Fichier_excel_Save_old <> '' then
                begin
                  Olexls.ActiveWorkbook.SaveAs(Fichier_excel_Save_old, xlWorkbookNormal);
                end
                else
                begin

                  Olexls.ActiveWorkbook.SaveAs(Fichier_excel_old, xlWorkbookNormal);
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

              Fermer_excel := SP_EXCEL.FieldByName('Fermer_Fichier').AsAnsiString;
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
            Str_Feuille := SP_EXCEL.FieldByName('Feuille').AsAnsiString;

            if Str_Feuille <> Str_Feuille_Old then
            begin
              if SP_EXCEL.FieldByName('Range_Clear_Avant').AsAnsiString <> '' then
              begin
                Range_Clear := SP_EXCEL.FieldByName('Range_Clear_Avant').AsAnsiString;

                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].select;
                Olexls.Range[Range_Clear].clearcontents;
              end;
              Str_Feuille_Old := Str_Feuille;
            end;

            int_Line := SP_EXCEL.FieldByName('line').asinteger;
            int_col := SP_EXCEL.FieldByName('col').asinteger;
            try
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].activate;

            except
              Olexls.ActiveWorkbook.Worksheets.Add;
              Olexls.ActiveWorkbook.Worksheets[1].name := Str_Feuille;
            end;

            if (SP_EXCEL.FieldByName('Type_Valeur').asinteger = 1) then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].NumberFormat := SP_EXCEL.FieldByName('Format_Valeur').AsAnsiString;
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Formula := SP_EXCEL.FieldByName('Valeur_Texte').AsAnsiString;
            end;

            if (SP_EXCEL.FieldByName('Type_Valeur').asinteger = 2) then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].NumberFormat := SP_EXCEL.FieldByName('Format_Valeur').AsAnsiString;
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Formula := SP_EXCEL.FieldByName('Valeur_Date').AsAnsiString;
            end;

            if (SP_EXCEL.FieldByName('Type_Valeur').asinteger = 3) then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].NumberFormat := SP_EXCEL.FieldByName('Format_Valeur').AsAnsiString;
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Formula := SP_EXCEL.FieldByName('Valeur_Numeric').asFloat;
            end;

            if SP_EXCEL.FindField('ColorFond') <> nil then
            begin
              if SP_EXCEL.FieldByName('ColorFond').asinteger <> 0 then
              begin
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Interior.Color := SP_EXCEL.FieldByName('ColorFond').asinteger;
              end;
            end;

            if SP_EXCEL.FindField('ColorTexte') <> nil then
            begin
              if SP_EXCEL.FieldByName('ColorTexte').asinteger <> 0 then
              begin
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.Color := SP_EXCEL.FieldByName('ColorTexte').asinteger;
              end;
            end;

            if SP_EXCEL.FindField('StyleFonte') <> nil then
            begin
              if ((SP_EXCEL.FieldByName('StyleFonte').asinteger and 1) = 1) then
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.Bold := True;

              if ((SP_EXCEL.FieldByName('StyleFonte').asinteger and 2) = 2) then
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.Italic := True;

              if ((SP_EXCEL.FieldByName('StyleFonte').asinteger and 4) = 4) then
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.Underline := True;

            end;

            if SP_EXCEL.FindField('SizeTexte') <> nil then
            begin
              if SP_EXCEL.FieldByName('SizeTexte').asinteger <> 0 then
              begin
                Olexls.ActiveWorkbook.Worksheets[Str_Feuille].Cells[int_Line, int_col].Font.size := SP_EXCEL.FieldByName('SizeTexte').asinteger;
              end;
            end;

            if SP_EXCEL.FindField('Range_Rows_AutoFit') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Rows_AutoFit').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Rows_AutoFit').AsAnsiString;
                Olexls.Range[Range_Fit].Rows.Autofit;
              end;
            end;

            if SP_EXCEL.FindField('Range_Columns_AutoFit') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Columns_AutoFit').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Columns_AutoFit').AsAnsiString;
                Olexls.Range[Range_Fit].Columns.Autofit;
              end;
            end;

            if SP_EXCEL.FindField('Range_Rows_Group') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Rows_Group').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Rows_Group').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.Group;
              end;
            end;

            if SP_EXCEL.FindField('Range_Columns_Group') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Columns_Group').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Columns_Group').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.Group;
              end;
            end;

            if SP_EXCEL.FindField('Range_Rows_UnGroup') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Rows_UnGroup').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Rows_UnGroup').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.UnGroup;
              end;
            end;

            if SP_EXCEL.FindField('Range_Columns_UnGroup') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Columns_UnGroup').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Columns_UnGroup').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.UnGroup;
              end;
            end;
            if SP_EXCEL.FindField('Range_Rows_Hide') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Rows_Hide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Rows_Hide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.Hidden := True;
              end;
            end;
            if SP_EXCEL.FindField('Range_Columns_Hide') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Columns_Hide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Columns_Hide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.Hidden := True;
              end;
            end;
            if SP_EXCEL.FindField('Range_Rows_UnHide') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Rows_UnHide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Rows_UnHide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireRow.Hidden := False;
              end;
            end;
            if SP_EXCEL.FindField('Range_Columns_UnHide') <> nil then
            begin
              if SP_EXCEL.FieldByName('Range_Columns_UnHide').AsAnsiString <> '' then
              begin
                Range_Fit := SP_EXCEL.FieldByName('Range_Columns_UnHide').AsAnsiString;
                Olexls.Range[Range_Fit].EntireColumn.Hidden := False;
              end;
            end;

            SP_EXCEL.Next;
          end;

          if SP_EXCEL.FindField('outline_ShowLevels') <> nil then
          begin
            if SP_EXCEL.FieldByName('outline_ShowLevels').asinteger > 0 then
            begin
              Olexls.ActiveWorkbook.Worksheets[Str_Feuille].outline.ShowLevels(SP_EXCEL.FieldByName('outline_ShowLevels').asinteger);
            end;
          end;

          if SP_EXCEL.FindField('Fichier_Dest') <> nil then
          begin
            Fichier_excel_Save := SP_EXCEL.FieldByName('Fichier_Dest').AsAnsiString;
            Olexls.ActiveWorkbook.SaveAs(Fichier_excel_Save, xlWorkbookNormal);
          end
          else
          begin

            Olexls.ActiveWorkbook.SaveAs(Fichier_excel, xlWorkbookNormal);

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
      Exit;
    end;

    // Gestion des Mails OUTLOOK
    try
      if (Procedure_Exist(Nom_procedure + '_OUTLOOK') = True) then
      begin
        SP_OUTLOOK_BEFORE.StoredProcName := Nom_procedure + '_OUTLOOK_BEFORE';
        With SP_OUTLOOK_BEFORE do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_OUTLOOK_BEFORE') = True) then
          begin
            SP_OUTLOOK_BEFORE.open;

            if (SP_OUTLOOK_BEFORE.FieldByName('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_OUTLOOK_BEFORE.FieldByName('Msg').Asstring), PChar(SP_OUTLOOK_BEFORE.FieldByName('Caption').Asstring), SP_OUTLOOK_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_OUTLOOK_BEFORE.close;
                Fin_Appli;
                Exit;
              end;
            end;

            if (SP_OUTLOOK_BEFORE.FieldByName('Result').asinteger <> 1) then
            begin
              SP_OUTLOOK_BEFORE.close;
              Fin_Appli;
              Exit;
            end;

            SP_OUTLOOK_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_OUTLOOK_BEFORE.close;
          Fin_Appli;
          Exit;
        end;

        SP_OUTLOOK.StoredProcName := Nom_procedure + '_OUTLOOK';
        With SP_OUTLOOK do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          Param := Params.Add;
          Param.Name := '@P1';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := P1_Procedure;

          Param := Params.Add;
          Param.Name := '@P2';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          if Chemin_Fic <> '' then
          begin
            Param.Value := Chemin_Fic;
          end
          else
          begin
            Param.Value := P2_Procedure;
          end;

          Param := Params.Add;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := choix;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
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

        SP_OUTLOOK_AFTER.StoredProcName := Nom_procedure + '_OUTLOOK_AFTER';
        With SP_OUTLOOK_AFTER do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_OUTLOOK_AFTER') = True) then
          begin
            SP_OUTLOOK_AFTER.open;

            if (SP_OUTLOOK_AFTER.FieldByName('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_OUTLOOK_AFTER.FieldByName('Msg').Asstring), PChar(SP_OUTLOOK_AFTER.FieldByName('Caption').Asstring), SP_OUTLOOK_AFTER.FieldByName('Flags').asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_OUTLOOK_AFTER.close;
                Fin_Appli;
                Exit;
              end;
            end;

            if (SP_OUTLOOK_AFTER.FieldByName('Result').asinteger <> 1) then
            begin
              SP_OUTLOOK_AFTER.close;
              Fin_Appli;
              Exit;
            end;

            SP_OUTLOOK_AFTER.close;
          end;
        except
          Application.HandleException(Self);
          SP_OUTLOOK_AFTER.close;
          Fin_Appli;
          Exit;
        end;
      end;
    except
      Application.HandleException(Self);
      SP_OUTLOOK.close;
      Fin_Appli;
      Exit;
    end;

    // Gestion des impressions
    try
      if (Procedure_Exist(Nom_procedure + '_PRINT') = True) then
      begin
        SP_PRINT_BEFORE.StoredProcName := Nom_procedure + '_PRINT_BEFORE';
        With SP_PRINT_BEFORE do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          Param := Params.Add;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := choix;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_PRINT_BEFORE') = True) then
          begin
            SP_PRINT_BEFORE.open;

            if (SP_PRINT_BEFORE.FieldByName('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_PRINT_BEFORE.FieldByName('Msg').Asstring), PChar(SP_PRINT_BEFORE.FieldByName('Caption').Asstring), SP_PRINT_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_PRINT_BEFORE.close;
                Fin_Appli;
                Exit;
              end;
            end;

            if (SP_PRINT_BEFORE.FieldByName('Result').asinteger <> 1) then
            begin
              SP_PRINT_BEFORE.close;
              Fin_Appli;
              Exit;
            end;

            SP_PRINT_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_PRINT_BEFORE.close;
          Fin_Appli;
          Exit;
        end;

        SP_PRINT.StoredProcName := Nom_procedure + '_PRINT';
        With SP_PRINT do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          Param := Params.Add;
          Param.Name := '@P1';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := P1_Procedure;

          Param := Params.Add;
          Param.Name := '@P2';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          if Chemin_Fic <> '' then
          begin
            Param.Value := Chemin_Fic;
          end
          else
          begin
            Param.Value := P2_Procedure;
          end;

          Param := Params.Add;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := choix;

          Param := Params.Add;
          Param.Name := '@DB';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Db;

          Param := Params.Add;
          Param.Name := '@Handle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_Handle;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
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
      Exit;
    end;

    // Gestion des impressions nouvelle méthode
    try
      if (Procedure_Exist(Nom_procedure + '_PRINT_MAIL') = True) then
      begin

        SP_PRINT_BEFORE.StoredProcName := Nom_procedure + '_PRINT_MAIL_BEFORE';
        With SP_PRINT_BEFORE do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          Param := Params.Add;
          Param.Name := '@P1';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := P1_Procedure;

          Param := Params.Add;
          Param.Name := '@P2';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
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
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;

          if Param_Exist(SP_PRINT_BEFORE.StoredProcName, '@Choix_Before_Principal') = True then
          begin
            Param := Params.Add;
            Param.Name := '@Choix_Before_Principal';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := Choix_Entree;
          end;

        end;

        try
          if (Procedure_Exist(Nom_procedure + '_PRINT_MAIL_BEFORE') = True) then
          begin
            SP_PRINT_BEFORE.open;
            if SP_PRINT_BEFORE.FindField('ID') <> nil then
            Begin
              Print_ID := SP_PRINT_BEFORE.FieldByName('ID').Asstring;
            End;

            if (SP_PRINT_BEFORE.FieldByName('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_PRINT_BEFORE.FieldByName('Msg').Asstring), PChar(SP_PRINT_BEFORE.FieldByName('Caption').AsAnsiString), SP_PRINT_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_PRINT_BEFORE.close;
                Fin_Appli;
                Exit;
              end;
            end;

            if (SP_PRINT_BEFORE.FieldByName('Result').asinteger <> 1) then
            begin
              SP_PRINT_BEFORE.close;
              Fin_Appli;
              Exit;
            end;

            SP_PRINT_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_PRINT_BEFORE.close;
          Fin_Appli;
          Exit;
        end;

        SP_PRINT.StoredProcName := Nom_procedure + '_PRINT_MAIL';
        With SP_PRINT do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          Param := Params.Add;
          Param.Name := '@P1';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := P1_Procedure;

          Param := Params.Add;
          Param.Name := '@P2';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          if Chemin_Fic <> '' then
          begin
            Param.Value := Chemin_Fic;
          end
          else
          begin
            Param.Value := P2_Procedure;
          end;

          Param := Params.Add;
          Param.Name := '@Choix_Before';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := choix;

          Param := Params.Add;
          Param.Name := '@DB';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Db;

          Param := Params.Add;
          Param.Name := '@Handle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_Handle;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;

          Param := Params.Add;
          Param.Name := '@ID';
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Print_ID;

          if Param_Exist(SP_PRINT_BEFORE.StoredProcName, '@Choix_Before_Principal') = True then
          begin
            Param := Params.Add;
            Param.Name := '@Choix_Before_Principal';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := Choix_Entree;
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
      Exit;
    end;

    choix := 0;

    // Prépare la sp principal
    SP.StoredProcName := Nom_procedure;

    With SP do
    begin
      Params.Clear;
      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@P1';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      Param.Value := P1_Procedure;

      Param := Params.Add;
      Param.Name := '@P2';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := Chemin_Fic;
      end
      else
      begin
        Param.Value := P2_Procedure;
      end;

      Param := Params.Add;
      Param.Name := '@msg_err';
      Param.DataType := ftString;
      Param.ParamType := ptInputOutput;
      Param.size := 255;

      Param := Params.Add;
      Param.Name := '@msg_OK';
      Param.DataType := ftString;
      Param.ParamType := ptInputOutput;
      Param.size := 255;

      Param := Params.Add;
      Param.Name := '@Ouverture_Fiche';
      Param.DataType := ftInteger;
      Param.ParamType := ptInputOutput;

      Param := Params.Add;
      Param.Name := '@Type_Fiche';
      Param.DataType := ftInteger;
      Param.ParamType := ptInputOutput;

      Param := Params.Add;
      Param.Name := '@N_fiche';
      Param.DataType := ftInteger;
      Param.ParamType := ptInputOutput;

      Param := Params.Add;
      Param.Name := '@Plusieurs_Fiches';
      Param.DataType := ftInteger;
      Param.ParamType := ptInputOutput;

      Param := Params.Add;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := Choix_Entree;

      for j := 0 to 8 do
      begin
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;

      if Param_Exist(SP.StoredProcName, '@Nav_Fiche') then
      begin
        Param := Params.Add;
        Param.Name := '@Nav_Fiche';
        Param.DataType := ftInteger;
        Param.ParamType := ptInputOutput;
      end;

    end;

    // Prépare la sp principal Memos
    SP_MEMOS.StoredProcName := Nom_procedure + '_MEMOS';

    With SP_MEMOS do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      Param := Params.Add;
      Param.Name := '@P1';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      Param.Value := P1_Procedure;

      Param := Params.Add;
      Param.Name := '@P2';
      Param.DataType := ftString;
      Param.ParamType := ptInput;
      if Chemin_Fic <> '' then
      begin
        Param.Value := Chemin_Fic;
      end
      else
      begin
        Param.Value := P2_Procedure;
      end;

      Param := Params.Add;
      Param.Name := '@Choix_Before';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := choix;

      for j := 0 to 8 do
      begin
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
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
        Exit;

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
        Exit;
      end;
    end;

  except
    Application.HandleException(Self);
    Fin_Appli;
    Exit;
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
  Param: TADParam;
  Nav_Fiche: Integer;
begin
  try
    try
      try
        Application.ProcessMessages;

        // Récupération du paramètre @msg_Ok
        msgreussite := SP.Params.ParamByName('@msg_Ok').AsAnsiString;

        // Récupération du paramètre @msg_err
        msgerreur := SP.Params.ParamByName('@msg_err').AsAnsiString;

        // Récupération du paramètre @Ouverture_Fiche
        Ouverture_Fiche := SP.Params.ParamByName('@Ouverture_Fiche').asinteger;

        // Récupération du paramètre @Type_Fiche
        Type_Fiche := SP.Params.ParamByName('@Type_Fiche').asinteger;

        // Récupération du paramètre @N_Fiche
        N_fiche := SP.Params.ParamByName('@N_Fiche').asinteger;

        // Récupération du paramètre @Plusieurs_Fiches
        Plusieurs_Fiches := SP.Params.ParamByName('@Plusieurs_Fiches').asinteger;

        if Param_Exist(SP.StoredProcName, '@Nav_Fiche') then
        begin
          Nav_Fiche := SP.Params.ParamByName('@Nav_Fiche').asinteger;
        end;
      finally

      end;

      // Lance prccédure de genere txt
      SP_TXT.StoredProcName := Nom_procedure + '_TXT';
      With SP_TXT do
      begin
        Params.Clear;

        Param := Params.Add;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.ParamType := ptResult;

        Param := Params.Add;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := cle;

        Param := Params.Add;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := N_user;

        for j := 0 to 8 do
        begin
          Param := Params.Add;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      try
        if (Procedure_Exist(Nom_procedure + '_TXT') = True) then
        begin
          SP_TXT_BEFORE.StoredProcName := Nom_procedure + '_TXT_BEFORE';
          With SP_TXT_BEFORE do
          begin
            Params.Clear;

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_TXT_BEFORE') = True) then
            begin
              SP_TXT_BEFORE.open;

              if (SP_TXT_BEFORE.FieldByName('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_TXT_BEFORE.FieldByName('Msg').Asstring), PChar(SP_TXT_BEFORE.FieldByName('Caption').Asstring), SP_TXT_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_TXT_BEFORE.close;
                  Fin_Appli;
                  Exit;
                end;
              end;

              if (SP_TXT_BEFORE.FieldByName('Result').asinteger <> 1) then
              begin
                SP_TXT_BEFORE.close;
                Fin_Appli;
                Exit;
              end;

              SP_TXT_BEFORE.close;
            end;
          except
            Application.HandleException(Self);
            SP_TXT_BEFORE.close;
            Fin_Appli;
            Exit;
          end;

          // comptage de la vue
          SP_TXT.open;
          SP_TXT.first;
          StringList := TStringList.Create;

          while not SP_TXT.Eof do
          begin

            if (nom_fichier <> SP_TXT.FieldByName('Repertoire').AsAnsiString + '\' + SP_TXT.FieldByName('Fichier').AsAnsiString) then
            begin
              // si fichier change ferme l'ncien et ouvre le nouveau (si deja ouvert on ajoute a la fin)
              if (nom_fichier <> '') then
                closefile(Fichier);
              nom_fichier := SP_TXT.FieldByName('Repertoire').AsAnsiString + '\' + SP_TXT.FieldByName('Fichier').AsAnsiString;

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
                Exit;
              end;
              // ajoute a la liste le nom du nouveau fichier traité
              StringList.Add(nom_fichier);
            end;

            if (not SP_TXT.FieldByName('DATA').isnull) then
            begin
              Stream := TBlobStream.Create(SP_TXT.FieldByName('DATA') as TBlobField, bmRead);
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
            SP_TXT_VALIDE.StoredProcName := Nom_procedure + '_TXT_VALIDE';
            With SP_TXT_VALIDE do
            begin
              Params.Clear;

              Param := Params.Add;
              Param.Name := '@RETURN_VALUE';
              Param.DataType := ftInteger;
              Param.ParamType := ptResult;

              Param := Params.Add;
              Param.Name := '@cle';
              Param.DataType := ftInteger;
              Param.ParamType := ptInput;
              Param.Value := cle;

              Param := Params.Add;
              Param.Name := '@N_User';
              Param.DataType := ftInteger;
              Param.ParamType := ptInput;
              Param.Value := N_user;

              Param := Params.Add;
              Param.Name := '@N_cle';
              Param.DataType := ftInteger;
              Param.ParamType := ptInput;

              for j := 0 to 8 do
              begin
                Param := Params.Add;
                Param.Name := '@Param' + inttostr(j);
                Param.DataType := ftString;
                Param.ParamType := ptInput;
                Param.Value := Tab_Params[j];
              end;
            end;

            SP_TXT.first;
            while not SP_TXT.Eof do
            begin
              SP_TXT_VALIDE.Params.ParamByName('@n_cle').asinteger := SP_TXT.FieldByName('n_cle').asinteger;
              SP_TXT_VALIDE.ExecProc;
              SP_TXT.Next;
            end;
          end;

          SP_TXT.close;
          StringList.Clear;
          StringList.Free;

          SP_TXT_AFTER.StoredProcName := Nom_procedure + '_TXT_AFTER';
          With SP_TXT_AFTER do
          begin
            Params.Clear;

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_TXT_AFTER') = True) then
            begin
              SP_TXT_AFTER.open;

              if (SP_TXT_AFTER.FieldByName('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_TXT_AFTER.FieldByName('Msg').Asstring), PChar(SP_TXT_AFTER.FieldByName('Caption').Asstring), SP_TXT_AFTER.FieldByName('Flags').asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_TXT_AFTER.close;
                  Fin_Appli;
                  Exit;
                end;
              end;

              if (SP_TXT_AFTER.FieldByName('Result').asinteger <> 1) then
              begin
                SP_TXT_AFTER.close;
                Fin_Appli;
                Exit;
              end;

              SP_TXT_AFTER.close;
            end;
          except
            Application.HandleException(Self);
            SP_TXT_AFTER.close;
            Fin_Appli;
            Exit;
          end;
        end;
      except
        Application.HandleException(Self);
        SP_TXT.close;
        Fin_Appli;
        Exit;
      end;

      // Lance la navigation
      SP_NAV.StoredProcName := Nom_procedure + '_NAV';
      With SP_NAV do
      begin
        Params.Clear;

        Param := Params.Add;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.ParamType := ptResult;

        Param := Params.Add;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := cle;

        Param := Params.Add;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := N_user;

        Param := Params.Add;
        Param.Name := '@P1';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := P1_Procedure;

        Param := Params.Add;
        Param.Name := '@P2';
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := P2_Procedure;

        for j := 0 to 8 do
        begin
          Param := Params.Add;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      if (Procedure_Exist(Nom_procedure + '_NAV') = True) then
      begin
        try
          SP_NAV.open;
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
                  Param_Top_Most := SP_NAV.FieldByName('Top_Most').asinteger;

                F_Nav := TF_Nav.Create(Self);
                HandleGeneMail := F_Nav.Handle;

                F_Nav.sp_Niveau := SP_NAV;
                F_Nav.ApplicationHandle := Form1.Handle;

                F_Nav.Timer := 0;

                if SP_NAV.FindField('Timer') <> nil then
                  F_Nav.Timer := SP_NAV.FieldByName('Timer').asinteger;

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
                  Exit;
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
            Exit;
          end;
        end;
      end;

      // Lance la liste de Close
      SP_CLOSE.StoredProcName := Nom_procedure + '_CLOSE';
      With SP_CLOSE do
      begin
        Params.Clear;

        Param := Params.Add;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.ParamType := ptResult;

        Param := Params.Add;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := cle;

        Param := Params.Add;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := N_user;

        for j := 0 to 8 do
        begin
          Param := Params.Add;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      try
        if (Procedure_Exist(Nom_procedure + '_CLOSE') = True) then
        begin
          SP_CLOSE_BEFORE.StoredProcName := Nom_procedure + '_CLOSE_BEFORE';
          With SP_CLOSE_BEFORE do
          begin
            Params.Clear;

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_CLOSE_BEFORE') = True) then
            begin
              SP_CLOSE_BEFORE.open;

              if (SP_CLOSE_BEFORE.FieldByName('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_CLOSE_BEFORE.FieldByName('Msg').Asstring), PChar(SP_CLOSE_BEFORE.FieldByName('Caption').Asstring), SP_CLOSE_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_CLOSE_BEFORE.close;
                  Fin_Appli;
                  Exit;
                end;
              end;

              if (SP_CLOSE_BEFORE.FieldByName('Result').asinteger <> 1) then
              begin
                SP_CLOSE_BEFORE.close;
                Fin_Appli;
                Exit;
              end;

              SP_CLOSE_BEFORE.close;
            end;
          except
            Application.HandleException(Self);
            SP_CLOSE_BEFORE.close;
            Fin_Appli;
            Exit;
          end;

          SP_CLOSE.open;

          while (not SP_CLOSE.Eof) do
          begin
            HAndle_close := SP_CLOSE.FieldByName('HAndle').asinteger;
            Nom_Fenetre := SP_CLOSE.FieldByName('Nom_Fenetre').AsAnsiString;

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

          SP_CLOSE_AFTER.StoredProcName := Nom_procedure + '_CLOSE_AFTER';
          With SP_CLOSE_AFTER do
          begin
            Params.Clear;

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_CLOSE_AFTER') = True) then
            begin
              SP_CLOSE_AFTER.open;

              if (SP_CLOSE_AFTER.FieldByName('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_CLOSE_AFTER.FieldByName('Msg').Asstring), PChar(SP_CLOSE_AFTER.FieldByName('Caption').Asstring), SP_CLOSE_AFTER.FieldByName('Flags').asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_CLOSE_AFTER.close;
                  Fin_Appli;
                  Exit;
                end;
              end;

              if (SP_CLOSE_AFTER.FieldByName('Result').asinteger <> 1) then
              begin
                SP_CLOSE_AFTER.close;
                Fin_Appli;
                Exit;
              end;

              SP_CLOSE_AFTER.close;
            end;
          except
            Application.HandleException(Self);
            SP_CLOSE_AFTER.close;
            Fin_Appli;
            Exit;
          end;

        end;
      except
        Application.HandleException(Self);
        SP_CLOSE.close;
        Fin_Appli;
        Exit;
      end;

      // Lance la liste de Lock
      SP_LOCK.StoredProcName := Nom_procedure + '_LOCK';
      With SP_LOCK do
      begin
        Params.Clear;

        Param := Params.Add;
        Param.Name := '@RETURN_VALUE';
        Param.DataType := ftInteger;
        Param.ParamType := ptResult;

        Param := Params.Add;
        Param.Name := '@cle';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := cle;

        Param := Params.Add;
        Param.Name := '@Handle';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := N_Handle;

        Param := Params.Add;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.ParamType := ptInput;
        Param.Value := N_user;

        for j := 0 to 8 do
        begin
          Param := Params.Add;
          Param.Name := '@Param' + inttostr(j);
          Param.DataType := ftString;
          Param.ParamType := ptInput;
          Param.Value := Tab_Params[j];
        end;
      end;

      try
        if (Procedure_Exist(Nom_procedure + '_LOCK') = True) then
        begin
          SP_LOCK_BEFORE.StoredProcName := Nom_procedure + '_LOCK_BEFORE';
          With SP_LOCK_BEFORE do
          begin
            Params.Clear;

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@Handle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_Handle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_LOCK_BEFORE') = True) then
            begin
              SP_LOCK_BEFORE.open;

              if (SP_LOCK_BEFORE.FieldByName('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_LOCK_BEFORE.FieldByName('Msg').Asstring), PChar(SP_LOCK_BEFORE.FieldByName('Caption').Asstring), SP_LOCK_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_LOCK_BEFORE.close;
                  Fin_Appli;
                  Exit;
                end;
              end;

              if (SP_LOCK_BEFORE.FieldByName('Result').asinteger <> 1) then
              begin
                SP_LOCK_BEFORE.close;
                Fin_Appli;
                Exit;
              end;

              SP_LOCK_BEFORE.close;
            end;
          except
            Application.HandleException(Self);
            SP_LOCK_BEFORE.close;
            Fin_Appli;
            Exit;
          end;

          SP_LOCK.open;

          while (not SP_LOCK.Eof) do
          begin
            HAndle_close := SP_LOCK.FieldByName('HAndle').asinteger;
            Nom_Fenetre := SP_LOCK.FieldByName('Nom_Fenetre').AsAnsiString;
            if SP_LOCK.FindField('Lock') <> nil then
            begin
              Lock := SP_LOCK.FieldByName('Lock').asinteger;
            end
            else
            begin
              Lock := 1;
            end;

            if HAndle_close <> 0 then
            begin
              SendMessage(HWND(HAndle_close), 3100, Lock, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
              postmessage(HWND(HAndle_close), 3100, Lock, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

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
                postmessage(HWND(HAndle_close), 3100, Lock, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

              end;
            end;
            SP_LOCK.Next;
          end;

          SP_LOCK.close;

          SP_LOCK_AFTER.StoredProcName := Nom_procedure + '_LOCK_AFTER';
          With SP_LOCK_AFTER do
          begin
            Params.Clear;

            Param := Params.Add;
            Param.Name := '@RETURN_VALUE';
            Param.DataType := ftInteger;
            Param.ParamType := ptResult;

            Param := Params.Add;
            Param.Name := '@cle';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := cle;

            Param := Params.Add;
            Param.Name := '@N_User';
            Param.DataType := ftInteger;
            Param.ParamType := ptInput;
            Param.Value := N_user;

            for j := 0 to 8 do
            begin
              Param := Params.Add;
              Param.Name := '@Param' + inttostr(j);
              Param.DataType := ftString;
              Param.ParamType := ptInput;
              Param.Value := Tab_Params[j];
            end;
          end;

          try
            if (Procedure_Exist(Nom_procedure + '_LOCK_AFTER') = True) then
            begin
              SP_LOCK_AFTER.open;

              if (SP_LOCK_AFTER.FieldByName('Msg').Asstring <> '') then
              begin
                choix := Application.MessageBox(PChar(SP_LOCK_AFTER.FieldByName('Msg').Asstring), PChar(SP_LOCK_AFTER.FieldByName('Caption').Asstring), SP_LOCK_AFTER.FieldByName('Flags').asinteger + MB_TOPMOST);

                if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                begin
                  SP_LOCK_AFTER.close;
                  Fin_Appli;
                  Exit;
                end;
              end;

              if (SP_LOCK_AFTER.FieldByName('Result').asinteger <> 1) then
              begin
                SP_LOCK_AFTER.close;
                Fin_Appli;
                Exit;
              end;

              SP_LOCK_AFTER.close;
            end;
          except
            Application.HandleException(Self);
            SP_LOCK_AFTER.close;
            Fin_Appli;
            Exit;
          end;

        end;
      except
        Application.HandleException(Self);
        SP_LOCK.close;
        Fin_Appli;
        Exit;
      end;

      // Lance le refresh
      try
        if (N_Refresh > 0) then
        begin
          if N_Handle <> 0 then
            SendMessage(HWND(N_Handle), WM_G_RAFRAICHIR, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

        end;

        // Navigation
        if (Nav_Fiche <> 0) then
        begin
          if N_Handle <> 0 then
          begin
            if Nav_Fiche > 0 then
            begin
              postmessage(HWND(N_Handle), 3152, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
            end;
            if Nav_Fiche < 0 then
              postmessage(HWND(N_Handle), 3153, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

          end;
        end;

        if (Ouverture_Fiche > 0) then
        begin
          if Plusieurs_Fiches = 1 then
          begin
            SP_LISTE_FICHES.StoredProcName := Nom_procedure + '_LISTE_FICHES';
            With SP_LISTE_FICHES do
            begin
              Params.Clear;

              Param := Params.Add;
              Param.Name := '@RETURN_VALUE';
              Param.DataType := ftInteger;
              Param.ParamType := ptResult;

              Param := Params.Add;
              Param.Name := '@cle';
              Param.DataType := ftInteger;
              Param.ParamType := ptInput;
              Param.Value := cle;

              Param := Params.Add;
              Param.Name := '@N_User';
              Param.DataType := ftInteger;
              Param.ParamType := ptInput;
              Param.Value := N_user;

              for j := 0 to 8 do
              begin
                Param := Params.Add;
                Param.Name := '@Param' + inttostr(j);
                Param.DataType := ftString;
                Param.ParamType := ptInput;
                Param.Value := Tab_Params[j];
              end;
            end;

            try
              if (Procedure_Exist(Nom_procedure + '_LISTE_FICHES') = True) then
              begin
                SP_LISTE_FICHES.open;

                SP_LISTE_FICHES_BEFORE.StoredProcName := Nom_procedure + '_LISTE_FICHES_BEFORE';
                With SP_LISTE_FICHES_BEFORE do
                begin
                  Params.Clear;

                  Param := Params.Add;
                  Param.Name := '@RETURN_VALUE';
                  Param.DataType := ftInteger;
                  Param.ParamType := ptResult;

                  Param := Params.Add;
                  Param.Name := '@cle';
                  Param.DataType := ftInteger;
                  Param.ParamType := ptInput;
                  Param.Value := cle;

                  Param := Params.Add;
                  Param.Name := '@N_User';
                  Param.DataType := ftInteger;
                  Param.ParamType := ptInput;
                  Param.Value := N_user;

                  for j := 0 to 8 do
                  begin
                    Param := Params.Add;
                    Param.Name := '@Param' + inttostr(j);
                    Param.DataType := ftString;
                    Param.ParamType := ptInput;
                    Param.Value := Tab_Params[j];
                  end;
                end;
                try
                  if (Procedure_Exist(Nom_procedure + '_LISTE_FICHES_BEFORE') = True) then
                  begin
                    SP_LISTE_FICHES_BEFORE.open;

                    if (SP_LISTE_FICHES_BEFORE.FieldByName('Msg').Asstring <> '') then
                    begin
                      choix := Application.MessageBox(PChar(SP_LISTE_FICHES_BEFORE.FieldByName('Msg').Asstring), PChar(SP_LISTE_FICHES_BEFORE.FieldByName('Caption').Asstring), SP_LISTE_FICHES_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);
                      if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
                      begin
                        SP_LISTE_FICHES_BEFORE.close;
                        Fin_Appli;
                        Exit;
                      end;
                    end;

                    if (SP_LISTE_FICHES_BEFORE.FieldByName('Result').asinteger <> 1) then
                    begin
                      SP_LISTE_FICHES_BEFORE.close;
                      Fin_Appli;
                      Exit;
                    end;
                    SP_LISTE_FICHES_BEFORE.close;
                  end;
                except
                  Application.HandleException(Self);
                  SP_LISTE_FICHES_BEFORE.close;
                  Fin_Appli;
                  Exit;
                end;

                while (not SP_LISTE_FICHES.Eof) do
                begin
                  Type_Fiche := SP_LISTE_FICHES.FieldByName('Type_Fiche').asinteger;
                  N_fiche := SP_LISTE_FICHES.FieldByName('N_Fiche').asinteger;

                  if (N_fiche > 0) then
                  begin
                    if Type_Fiche < 100 then
                      Type_Fiche := Type_Fiche + 100;

                    if (SP_LISTE_FICHES.FindField('Tempo') <> nil) then
                    begin
                      sleep(SP_LISTE_FICHES.FieldByName('Tempo').asinteger);
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
              Exit;
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
        Exit;
      end;
    except
      Application.HandleException(Self);
      Fin_Appli;
      Exit;
    end;

    // Lance la liste de refresh
    SP_REFRESH.StoredProcName := Nom_procedure + '_REFRESH';
    With SP_REFRESH do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      for j := 0 to 8 do
      begin
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_REFRESH') = True) then
      begin
        SP_REFRESH_BEFORE.StoredProcName := Nom_procedure + '_REFRESH_BEFORE';
        With SP_REFRESH_BEFORE do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try
          if (Procedure_Exist(Nom_procedure + '_REFRESH_BEFORE') = True) then
          begin
            SP_REFRESH_BEFORE.open;

            if (SP_REFRESH_BEFORE.FieldByName('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_REFRESH_BEFORE.FieldByName('Msg').Asstring), PChar(SP_REFRESH_BEFORE.FieldByName('Caption').Asstring), SP_REFRESH_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);

              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_REFRESH_BEFORE.close;
                Fin_Appli;
                Exit;
              end;
            end;

            if (SP_REFRESH_BEFORE.FieldByName('Result').asinteger <> 1) then
            begin
              SP_REFRESH_BEFORE.close;
              Fin_Appli;
              Exit;
            end;

            SP_REFRESH_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_REFRESH_BEFORE.close;
          Fin_Appli;
          Exit;
        end;

        SP_REFRESH.open;

        while (not SP_REFRESH.Eof) do
        begin
          Type_Fiche := SP_REFRESH.FieldByName('Type_Fiche').asinteger;
          N_fiche := SP_REFRESH.FieldByName('N_Fiche').asinteger;
          Nom_Fenetre := SP_REFRESH.FieldByName('Nom_Fenetre').AsAnsiString;

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
      Exit;
    end;

    // Lance la liste des fichiers a ouvrir
    SP_OPEN_APPLI.StoredProcName := Nom_procedure + '_OPEN_APPLI';
    With SP_OPEN_APPLI do
    begin
      Params.Clear;

      Param := Params.Add;
      Param.Name := '@RETURN_VALUE';
      Param.DataType := ftInteger;
      Param.ParamType := ptResult;

      Param := Params.Add;
      Param.Name := '@cle';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := cle;

      Param := Params.Add;
      Param.Name := '@N_User';
      Param.DataType := ftInteger;
      Param.ParamType := ptInput;
      Param.Value := N_user;

      for j := 0 to 8 do
      begin
        Param := Params.Add;
        Param.Name := '@Param' + inttostr(j);
        Param.DataType := ftString;
        Param.ParamType := ptInput;
        Param.Value := Tab_Params[j];
      end;
    end;

    try
      if (Procedure_Exist(Nom_procedure + '_OPEN_APPLI') = True) then
      begin
        SP_OPEN_APPLI.open;

        SP_OPEN_APPLI_BEFORE.StoredProcName := Nom_procedure + '_OPEN_APPLI_BEFORE';
        With SP_OPEN_APPLI_BEFORE do
        begin
          Params.Clear;

          Param := Params.Add;
          Param.Name := '@RETURN_VALUE';
          Param.DataType := ftInteger;
          Param.ParamType := ptResult;

          Param := Params.Add;
          Param.Name := '@cle';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := cle;

          Param := Params.Add;
          Param.Name := '@N_User';
          Param.DataType := ftInteger;
          Param.ParamType := ptInput;
          Param.Value := N_user;

          for j := 0 to 8 do
          begin
            Param := Params.Add;
            Param.Name := '@Param' + inttostr(j);
            Param.DataType := ftString;
            Param.ParamType := ptInput;
            Param.Value := Tab_Params[j];
          end;
        end;

        try

          if (Procedure_Exist(Nom_procedure + '_OPEN_APPLI_BEFORE') = True) then
          begin

            SP_OPEN_APPLI_BEFORE.open;

            if (SP_OPEN_APPLI_BEFORE.FieldByName('Msg').Asstring <> '') then
            begin
              choix := Application.MessageBox(PChar(SP_OPEN_APPLI_BEFORE.FieldByName('Msg').Asstring), PChar(SP_OPEN_APPLI_BEFORE.FieldByName('Caption').Asstring), SP_OPEN_APPLI_BEFORE.FieldByName('Flags').asinteger + MB_TOPMOST);
              if (choix = IDCANCEL) or (choix = IDNO) or (choix = IDABORT) then
              begin
                SP_OPEN_APPLI_BEFORE.close;
                Fin_Appli;
                Exit;
              end;
            end;
            if (SP_OPEN_APPLI_BEFORE.FieldByName('Result').asinteger <> 1) then
            begin
              SP_OPEN_APPLI_BEFORE.close;
              Fin_Appli;
              Exit;
            end;
            SP_OPEN_APPLI_BEFORE.close;
          end;
        except
          Application.HandleException(Self);
          SP_OPEN_APPLI_BEFORE.close;
          Fin_Appli;
          Exit;
        end;

        while (not SP_OPEN_APPLI.Eof) do
        begin
          Param_Str := SP_OPEN_APPLI.FieldByName('Parametres').Asstring;
          Param_Str := stringreplace(Param_Str, '$DB', Db, []);
          Param_Str := stringreplace(Param_Str, '$USER', inttostr(N_user), []);
          Param_Str := stringreplace(Param_Str, '$N', inttostr(cle), []);
          Param_Str := stringreplace(Param_Str, '$HANDLE', inttostr(Handle), []);

          Fexe := SP_OPEN_APPLI.FieldByName('Appli').Asstring;
          if Pos('\', Fexe) <= 0 then
          begin
            Fexe := ExtractFileDir(ParamStr(0)) + '\' + Fexe;
          end;

          ShellExecute(0, 'open', PChar(Fexe), PChar(Param_Str), nil, SP_OPEN_APPLI.FieldByName('Mode').Value);

          SP_OPEN_APPLI.Next;
        end;
      end;

      SP_OPEN_APPLI.close;

    except
      Application.HandleException(Self);
      SP_OPEN_APPLI.close;
      Fin_Appli;
      Exit;

    end;

    // Fermeture

    // Si un message alors affichage du message
    if (msgreussite = '') and (msgerreur = '') and (N_Visible > 0) then
    begin
      Application.MessageBox('Fin du processus', 'Information', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
      Fin_Appli;
      Exit;
    end;

    if msgreussite <> '' then
    begin
      Application.MessageBox(PChar(msgreussite), 'Information', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
      Fin_Appli;
      Exit;
    end;

    // Si aucun message spécifié alors message par défaut
    if msgerreur <> '' then
    begin

      // Affiche la boite de dialogue
      Application.MessageBox(PChar(msgerreur), 'Erreur', MB_OK + MB_ICONERROR + MB_TOPMOST);
      Fin_Appli;
      Exit;
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
  wq_Session.close;

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

  if SP_COPY_FILE.FieldByName('Fonction').AsAnsiString = 'Copier' then
  begin
    lpFileOp.wFunc := FO_COPY;
    lpFileOp.pTo := PwideChar(Cible);
  end;
  if SP_COPY_FILE.FieldByName('Fonction').AsAnsiString = 'Effacer' then
  begin
    lpFileOp.wFunc := FO_DELETE;
    lpFileOp.pTo := '';
  end;
  if SP_COPY_FILE.FieldByName('Fonction').AsAnsiString = 'Deplacer' then
  begin
    lpFileOp.wFunc := FO_MOVE;
    lpFileOp.pTo := PwideChar(Cible);
  end;
  if SP_COPY_FILE.FieldByName('Fonction').AsAnsiString = 'Renommer' then
  begin
    lpFileOp.wFunc := FO_RENAME;
    lpFileOp.pTo := PwideChar(Cible);
  end;

  if SP_COPY_FILE.FieldByName('PossibleAnnuler').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_ALLOWUNDO;
  end;
  if SP_COPY_FILE.FieldByName('ChangeNomSiCollision').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_RENAMEONCOLLISION;
  end;
  if SP_COPY_FILE.FieldByName('SansConfirmation').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_NOCONFIRMATION;
  end;
  if SP_COPY_FILE.FieldByName('SansProgression').AsAnsiString = 'Oui' then
  begin
    FlagsOptions := FlagsOptions + FOF_SILENT;
  end;

  if SP_COPY_FILE.FindField('Fichiers_Seulement') <> nil then
  begin
    if SP_COPY_FILE.FieldByName('Fichiers_Seulement').AsAnsiString = 'Oui' then
    begin
      FlagsOptions := FlagsOptions + FOF_FILESONLY;
    end;
  end;

  if SP_COPY_FILE.FindField('SansConfirmation_Rep') <> nil then
  begin
    if SP_COPY_FILE.FieldByName('SansConfirmation_Rep').AsAnsiString = 'Oui' then
    begin
      FlagsOptions := FlagsOptions + FOF_NOCONFIRMMKDIR;
    end;
  end;

  if SP_COPY_FILE.FindField('PasMessageErreur') <> nil then
  begin
    if SP_COPY_FILE.FieldByName('PasMessageErreur').AsAnsiString = 'Oui' then
    begin
      FlagsOptions := FlagsOptions + FOF_NOERRORUI;
    end;
  end;

  if SP_COPY_FILE.FindField('SimpleProgress') <> nil then
  begin
    if SP_COPY_FILE.FieldByName('SimpleProgress').AsAnsiString = 'Oui' then
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

function TForm1.Deplacer(Handle: HWND; Source, Cible: string): Integer;
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

  lpFileOp.wFunc := FO_MOVE;
  lpFileOp.pTo := PwideChar(Cible);

  FlagsOptions := FlagsOptions + FOF_ALLOWUNDO;

  FlagsOptions := FlagsOptions + FOF_RENAMEONCOLLISION;

  FlagsOptions := FlagsOptions + FOF_NOCONFIRMATION;

  FlagsOptions := FlagsOptions + FOF_FILESONLY;

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

  ShowWindow(Application.Handle, SW_HIDE);
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
    wq_wm.Params.ParamByName('Type_Fiche').asinteger := Fiche;
    wq_wm.open;
    WM_GENESYS := wq_wm.FieldByName('WM_Genesys').asinteger;
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

procedure TForm1.FileSearch_FIC(const PathName, Filename: string; const InDir: Boolean; N_user: Integer; Cle_Session: string);
var
  Rec: TSearchRec;
  Path: string;
begin
  Path := IncludeTrailingBackslash(PathName);
  if FindFirst(Path + Filename, faAnyFile - faDirectory, Rec) = 0 then
    try
      repeat
        wq_LISTE_FICHIERS.Append;
        wq_LISTE_FICHIERS.FieldByName('N_user').asinteger := N_user;
        wq_LISTE_FICHIERS.FieldByName('ID_Session').AsAnsiString := Cle_Session;
        wq_LISTE_FICHIERS.FieldByName('Repertoire').AsAnsiString := Path;
        wq_LISTE_FICHIERS.FieldByName('Fichier').AsAnsiString := Rec.Name;
        wq_LISTE_FICHIERS.post;

      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;

  If not InDir then
    Exit;

  if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
    try
      repeat
        if ((Rec.Attr and faDirectory) <> 0) and (Rec.Name <> '.') and (Rec.Name <> '..') then
          FileSearch_FIC(Path + Rec.Name, Filename, True, N_user, Cle_Session);
      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;
end;

procedure TForm1.FileSearch(const PathName, Filename: string; const InDir: Boolean; N_user: Integer; Cle_Session: string);
var
  Rec: TSearchRec;
  Path: string;
begin
  Path := IncludeTrailingBackslash(PathName);
  if FindFirst(Path + Filename, faAnyFile - faDirectory, Rec) = 0 then
    try
      repeat
        wq_EXCEL_READ_FIC.Append;
        wq_EXCEL_READ_FIC.FieldByName('N_user').asinteger := N_user;
        wq_EXCEL_READ_FIC.FieldByName('Cle_Session').AsAnsiString := Cle_Session;
        wq_EXCEL_READ_FIC.FieldByName('Repertoire').AsAnsiString := Path;
        wq_EXCEL_READ_FIC.FieldByName('Fichier').AsAnsiString := Rec.Name;
        wq_EXCEL_READ_FIC.post;

      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;

  If not InDir then
    Exit;

  if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
    try
      repeat
        if ((Rec.Attr and faDirectory) <> 0) and (Rec.Name <> '.') and (Rec.Name <> '..') then
          FileSearch(Path + Rec.Name, Filename, True, N_user, Cle_Session);
      until FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;
end;

procedure TForm1.Read_Excel_Log(Code_Log, Message_Log, Fichier, Feuille: string; N_user: Integer; Cle_Session: string);
begin

  wq_EXCEL_READ_LOG.Append;
  wq_EXCEL_READ_LOG.FieldByName('N_user').asinteger := N_user;
  wq_EXCEL_READ_LOG.FieldByName('Cle_Session').AsAnsiString := Cle_Session;
  wq_EXCEL_READ_LOG.FieldByName('Fichier').AsAnsiString := Fichier;
  wq_EXCEL_READ_LOG.FieldByName('Feuille').AsAnsiString := Feuille;
  wq_EXCEL_READ_LOG.FieldByName('Code_Log').AsAnsiString := Code_Log;
  wq_EXCEL_READ_LOG.FieldByName('Message_Log').AsAnsiString := Message_Log;
  wq_EXCEL_READ_LOG.FieldByName('Date_Log').asdatetime := now;
  wq_EXCEL_READ_LOG.post;

end;

end.
