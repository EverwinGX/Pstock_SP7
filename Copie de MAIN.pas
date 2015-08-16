unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, wwstorep, fcImage, fcimageform,
  AdvPicture, rtflabel, ExtCtrls, Shader, EllipsLabel,ThreadGenesysSP,
  AdvEdit,ShellAPI, ImgList, ComCtrls, wwriched, Wwquery,FileCtrl,ShlObj;

type
  TForm1 = class(TForm)
    SP: TwwStoredProc;
    Database: TDatabase;
    SP_BEFORE: TwwStoredProc;
    SP_LISTE_FICHES: TwwStoredProc;
    SP_LISTE_FICHES_BEFORE: TwwStoredProc;
    SP_REFRESH_BEFORE: TwwStoredProc;
    SP_REFRESH: TwwStoredProc;
    fcImageForm1: TfcImageForm;
    AdvPicture1: TAdvPicture;
    AdvEdit1: TAdvEdit;
    Shader1: TShader;
    EllipsLabel1: TEllipsLabel;
    OpenDlg: TOpenDialog;
    SP_FICHIER: TwwStoredProc;
    SP_OPEN_APPLI_BEFORE: TwwStoredProc;
    SP_OPEN_APPLI: TwwStoredProc;
    SP_COPY_FILE_BEFORE: TwwStoredProc;
    SP_COPY_FILE: TwwStoredProc;
    SP_COPY_FILE_AFTER: TwwStoredProc;
    IconesListe_Plus: TImageList;
    IconesListe: TImageList;
    SP_PARAM: TwwStoredProc;
    SP_MEMOS: TwwStoredProc;
    wq_memos: TwwQuery;
    Edit1: TwwDBRichEdit;
    Edit2: TwwDBRichEdit;
    wq_GETINIT: TwwQuery;
    QueryGetUser: TwwQuery;
    SP_CREATE_DIR: TwwStoredProc;
    wq_Exist: TwwQuery;
    procedure BitBtn1Click(Sender: TObject);

    procedure AppException(Sender: TObject; E: Exception);
     procedure CreateParams(var Params: TCreateParams); override;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Fin_Appli;
    procedure AdvPicture1FrameChange(Sender: TObject);
    procedure Finalise_Traitement;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AdvEdit1Change(Sender: TObject);
    function copier(Handle:HWND;Source,Cible:string):Integer;
    procedure Transfert_Ico;
    procedure FormActivate(Sender: TObject);
    Procedure Voir_Fiche(N_fiche :Integer;Fiche :Integer);
    function BrowseforFile(Handle : THandle; Title : String; Filename : String) : String;
  private
  Find_Fenetre:string;
    Handle_Fenetre:THandle;

    N_Handle : integer;
    Nom_procedure:string;
    msgreussite,msgerreur : String;
    Ouverture_Fiche:Integer;
    Type_Fiche:integer;
    N_fiche:integer;
    Nom_Fenetre : string;
    Plusieurs_Fiches :integer;
    N_Wait, N_Visible, N_Refresh, WM_OPEN : integer;
    choix : integer;
    iCptFic : integer;
    Handle_Application:integer;
    encours : boolean;
    ThreadSP : TThreadGenesysSP;
    Tab_Params : array [0..9] of string ;
    HandleGeneMail : integer;
    First_active : boolean;
    Nom_Societe: string;
    Nom_Fenetre_Genesys:String;
    Handle_Genesys:integer;
    User : string;

  public
    IsQuitter : boolean;
        cle : integer;
    N_User : integer;
    P1_Procedure,P2_Procedure :string;
    Handle_ouverture :integer;
        db:String;
    Param_Top_Most : integer;
  end;

var
  Form1: TForm1;

implementation

uses Attendre,U_params, WM_GENESYS;

{$R *.DFM}
{$R Manifest.res}

// ! procedure récursive
Procedure RechercheEnfants(HParent : THandle);
// Handle : Handle de l'enafant
// Index  : Ordre du parent dans le TreeView
var
  Handle : THandle;
  p : PChar;
  s : string;

begin

  Handle := GetWindow(HParent,GW_CHILD);  // Recherche de la première fenêtre enfant direct
  while (Handle<>0) do  // Tant qu'on en trouve ....
    begin
      p:=StrAlloc(256);
      GetWindowText(Handle,p,256);
      IF p= Form1.Find_Fenetre then
      Begin
           Form1.Handle_Fenetre:= Handle;
           //libération de la chaîne
           StrDispose(p);
           Break;
      End;

      //libération de la chaîne
      StrDispose(p);
      RechercheEnfants( Handle) ; // Recherche de ses propres enfants
      Handle := GetNextWindow(Handle,GW_HWNDNEXT); // recherche de la fenete suivante
    end;
end;

function ListeChild (Handle: HWND; Info: LParam): BOOLEAN; stdcall;
// Handle : Handle de l'enfant trouvé
var
  p : pchar;
  s : string;
  Nom_fenetre:string;
begin
  p:=StrAlloc(256);
  GetWindowText(Handle,p,256);     // Texte (éventuel) de la fenêtre
  s:=inttostr(Handle)+' - '+p;
  Nom_fenetre:=Pchar(p);
  If (copy(Nom_fenetre,1,9) ='GENESYS -') THEN
    Begin
     RechercheEnfants( Handle) ;  // Recherche des fenetres enfants
    end;

  StrDispose(p);
  IF (Form1.Handle_fenetre>0) Then
  Begin
       Result :=False;
  End
  Else
  Begin
       Result := True; // pour continuer
  End;
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
     close;
end;

procedure TForm1.CreateParams(var Params: TCreateParams);
begin
//permet l'affichage en avant par surcharge de la procedure createparams
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

procedure TForm1.AppException(Sender: TObject; E: Exception);
Var
    mess1 : string;
   _pos : integer;   
begin
   mess1 := E.Message;
   _pos := Pos( '[SQL Server]', mess1 );
   if( _pos > 0 ) Then
       begin
           Delete( mess1, 1, _pos - 1 );
           E.Message := mess1;
       end;
  Application.MessageBox(pchar(E.message),'Erreur',MB_OK+ MB_ICONERROR + MB_TOPMOST );
end;


procedure TForm1.FormShow(Sender: TObject);
Begin
 //application.ProcessMessages;
end;
procedure TForm1.Transfert_Ico;
Var i : integer;
Ico : Ticon;
begin
Ico := TIcon.Create;
For i:= iconesliste.Count + 1 to 150 Do
Begin
     IconesListe_Plus.GetIcon(0,Ico);
     iconesliste.AddIcon (Ico);
End;

For i:= 0 to IconesListe_Plus.Count-1 Do
Begin
     IconesListe_Plus.GetIcon(i,Ico);
     iconesliste.AddIcon (Ico);
End;

If Ico<>Nil Then Ico:=Nil;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
Application.OnException := AppException;

Try
        Transfert_IcO;
       HandleGeneMail := 0;
       N_Visible := 0;

       //Base de donnée
       db := ParamStr(1);

       Cle := StrToInt(Paramstr(2));

       //Récupération du N_user
       N_user:= StrToInt(paramstr(3));

       //Récupération du Handle
       N_Handle:= StrToInt(paramstr(4));

       Nom_procedure := ParamStr(5);

       N_Wait := StrToInt(ParamStr(6));

       N_Visible := StrToInt(ParamStr(7));

       N_Refresh := StrToInt(ParamStr(8));

       WM_OPEN := StrToInt(ParamStr(9));

       P1_Procedure := ParamStr(10);

       P2_Procedure := ParamStr(11);

       Threadsp := nil;

        //*************************************************************
        //                          ATTENTION
        //  Récupération de handle de Genesys en fonction de l'utilisateur
        //
        //*************************************************************
        Handle_Ouverture:=N_Handle;
               Database.AliasName := Db;

        if N_user >0 Then
        Begin
            wq_GETINIT.Open;
            Nom_Societe:= wq_GETINIT.fieldbyname('Nom_societe').asstring;
            wq_GETINIT.Close;
            QueryGetUser.close;
            QueryGetUser.ParamByName('N_user').asinteger := N_user;
            QueryGetUser.Open;
            User := QueryGetUser.fieldbyname('Login').asstring;
            QueryGetUser.close;
            Nom_Fenetre_Genesys:='GENESYS - '+ Nom_Societe+ ' - '+ User;
            HANDLE_Genesys:=findwindow(nil,Pchar(Nom_Fenetre_Genesys));
            if Handle_Genesys>0 THen
               Handle_ouverture := HANDLE_Genesys;
        end;


  SetWindowLong(Application.Handle, GWL_EXSTYLE,
  GetWindowLong(Application.Handle, GWL_EXSTYLE) and not WS_EX_APPWINDOW
  or WS_EX_TOOLWINDOW);
Except
      Application.HandleException( Self );
End;

//application.ShowMainForm:=false;
end;

procedure TForm1.FormDestroy(Sender: TObject);
Var i:integer;
begin
{   For I := 0 to ComponentCount -1 do
       if( Components[I] is TDataSet )AND( ( Components[i] as TDataSet ).Active = True ) Then
           ( Components[i] as TDataSet ).Close;

   if( ( Threadsp <> nil )) Then
       begin
           Threadsp:=nil;
       end;   }
end;


procedure TForm1.Fin_Appli;
Var i:integer;
begin

   For I := 0 to ComponentCount -1 do
       if( Components[I] is TDataSet )AND( ( Components[i] as TDataSet ).Active = True ) Then
          ( Components[i] as TDataSet ).Close;

    if( ( Threadsp <> nil )) Then
       begin
           Threadsp:=nil;
       end;

   Database.Close;

   close;



end;

procedure TForm1.AdvPicture1FrameChange(Sender: TObject);
var    I,j: Integer;
Var Chemin_Fic : string;
Var Chemin_dest : string;
Var Nom_fic : string;
Var temp:string;
Var Choix_Entree : integer;
Var Resultat_copie : integer;
Var Directory_Only : integer;
begin
if encours= true then exit;

encours:=true;

Try
        application.ProcessMessages;
        AdvPicture1.Animate:=true;
        AdvPicture1.Repaint;
        AdvPicture1.Refresh;
        application.ProcessMessages;
        application.ProcessMessages;

        ShowWindow( application.Handle, SW_SHOW );

       Chemin_Fic:='';

       //On ouvre la procédure d'existance
       wq_Exist.close;
       wq_Exist.ParamByName('nom_procedure').asstring :=  nom_procedure;
       wq_Exist.Open;


       //SP.DatabaseName := db;
       choix:=0;
       SP_BEFORE.StoredProcName := nom_procedure+ '_BEFORE';
       SP_BEFORE.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
       SP_BEFORE.Params.CreateParam(ftInteger, '@cle', ptInput);
       SP_BEFORE.ParamByName('@Cle').Asinteger := Cle;
       SP_BEFORE.Params.CreateParam(ftInteger, '@N_User', ptInput);
       SP_BEFORE.ParamByName('@N_User').Asinteger := N_User;
       Try

           if( Procedure_exist(nom_procedure+ '_BEFORE') = True ) Then
               begin

                   SP_BEFORE.Open;

                   if( SP_BEFORE.FieldByName( 'Msg' ).asString <> '' ) Then
                       begin
                           Choix_Entree := Application.Messagebox( PChar( SP_BEFORE.FieldByName( 'Msg' ).asString ), PChar( SP_BEFORE.FieldByName( 'Caption' ).asString ), SP_BEFORE.FieldByName( 'Flags' ).asInteger + MB_TOPMOST );
                        end;
                   if( SP_BEFORE.FieldByName( 'Result' ).asInteger <> 1 ) Then
                       begin
                           SP_BEFORE.Close;
                           Fin_Appli;
                           Exit;
                       end;
                   SP_BEFORE.Close;
               end;
       Except
           Application.HandleException( Self );
           SP_BEFORE.Close;
           Fin_Appli;
           Exit;
       End;


       SP_PARAM.StoredProcName := nom_procedure+'_PARAMS';
       SP_PARAM.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
       SP_PARAM.Params.CreateParam(ftInteger, '@cle', ptInput);
       SP_PARAM.ParamByName('@Cle').Asinteger := Cle;
       SP_PARAM.Params.CreateParam(ftInteger, '@N_User', ptInput);
       SP_PARAM.ParamByName('@N_User').Asinteger := N_User;
       SP_PARAM.Params.CreateParam(ftString, '@P1', ptInput);
       SP_PARAM.ParamByName('@P1').Asstring := P1_Procedure;
       SP_PARAM.Params.CreateParam(ftString, '@P2', ptInput);
       SP_PARAM.ParamByName('@P2').Asstring := P2_Procedure;
       SP_PARAM.Params.CreateParam(ftInteger, '@Choix_Before', ptInput);
       SP_PARAM.ParamByName('@Choix_Before').Asinteger := Choix_Entree;
       Try
           if ( Procedure_exist(nom_procedure+ '_PARAMS') = True )  Then
               begin

                               Try
               SP_PARAM.Open;
           Except
           End;
                      Try
                        //Enleve le topmost
                        SetWindowPos(
                            HWND(Form1.handle),	// handle of window
                            HWND_NOTOPMOST			,	// placement-order handle
                            0,	// horizontal position
                            0,	// vertical position
                            0,	// width
                            0,	// height
                            SWP_NOSIZE + SWP_NOMOVE	 	// window-positioning flags
                           ) ;
                           HandleGeneMail:=0;
                           Param_Top_Most:=0;

                           If SP_PARAM.FindField('Top_Most')<>Nil Then
                              Param_Top_Most:=SP_PARAM.fieldbyname('Top_Most').asinteger;

                           F_Params := TF_params.create(self);
                           HandleGeneMail:=F_params.handle;
                           F_Params.wsp_Filtres := SP_PARAM;
                           F_params.ApplicationHandle:=Form1.handle;

                           F_Params.Timer:=0;
                           
                           If SP_PARAM.FindField('Timer')<>Nil Then
                              F_Params.Timer:=SP_PARAM.fieldbyname('Timer').asinteger;

                           F_Params.Init;

                           if F_Params.ShowModal = mrok Then
                           Begin
                                for i:=0 TO 9 Do
                                Begin
                                     Tab_Params[i]:= F_Params.Tab_Params[i];
                                End;
                                F_Params.close;
                                F_Params.free;
                                SP_PARAM.Close;
                                HandleGeneMail:=0;
                           End
                           Else
                           Begin
                                F_Params.close;
                                F_Params.free;
                                SP_PARAM.Close;
                                Fin_Appli;
                                Exit;
                           End;
                      Finally
                          SetWindowPos(
                              HWND(Form1.handle),	// handle of window
                              HWND_TOPMOST			,	// placement-order handle
                              0,	// horizontal position
                              0,	// vertical position
                              0,	// width
                              0,	// height
                              SWP_NOSIZE + SWP_NOMOVE	 	// window-positioning flags
                             ) ;
                          HandleGeneMail:=0;
                          ShowWindow( Form1.Handle, SW_SHOW );
                      End;

               end;
       Except
           Application.HandleException( Self );
           SP_PARAM.Close;
           Fin_Appli;
           Exit;
       End;


       SP_FICHIER.StoredProcName := nom_procedure+ '_SELECT_FILE';
       SP_FICHIER.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
       SP_FICHIER.Params.CreateParam(ftInteger, '@cle', ptInput);
       SP_FICHIER.ParamByName('@Cle').Asinteger := Cle;
       SP_FICHIER.Params.CreateParam(ftInteger, '@N_User', ptInput);
       SP_FICHIER.ParamByName('@N_User').Asinteger := N_User;
       SP_FICHIER.Params.CreateParam(ftInteger, '@Choix_Before', ptInput);
       SP_FICHIER.ParamByName('@Choix_Before').Asinteger := Choix_Entree;
       For j:= 0 TO 8 Do
       Begin
          SP_FICHIER.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
          SP_FICHIER.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
       End;

       Try
           Try
               SP_FICHIER.Open;
           Except
           End;

           if( SP_FICHIER.Active = True ) Then
               begin
                   if( SP_FICHIER.FieldByName( 'Title' ).asString <> '' ) Then
                       begin
                            // gestion de la selection d'un repertoire uniquement
                            Directory_Only:=0;

                            if SP_FICHIER.FindField('Directory_Only') <> Nil Then
                               Directory_Only:= SP_FICHIER.FieldByName('Directory_Only').asinteger;

                            If Directory_Only =0 Then
                            Begin
                                OpenDlg.DefaultExt:= SP_FICHIER.FieldByName( 'DefaultExt' ).asString;
                                openDlg.Filter := SP_FICHIER.FieldByName( 'Filter' ).asString;
                                OpenDlg.InitialDir := SP_FICHIER.FieldByName( 'InitialDir' ).asString;
                                Opendlg.Title:= SP_FICHIER.FieldByName( 'Title' ).asString;
                                Opendlg.FileName:= SP_FICHIER.FieldByName( 'FileName' ).asString;

                                if SP_FICHIER.FieldByName( 'HideReadOnly' ).asinteger=0 Then
                                   Opendlg.Options:= Opendlg.Options - [ofHideReadOnly]
                                Else
                                    Opendlg.Options:= Opendlg.Options + [ofHideReadOnly];

                                if SP_FICHIER.FieldByName( 'AllowMultiSelect' ).asinteger=0 Then
                                   Opendlg.Options:= Opendlg.Options - [ofAllowMultiSelect]
                                Else
                                    Opendlg.Options:= Opendlg.Options + [ofAllowMultiSelect];

                                if SP_FICHIER.FieldByName( 'NoChangeDir' ).asinteger=0 Then
                                   Opendlg.Options:= Opendlg.Options - [ofNoChangeDir]
                                Else
                                    Opendlg.Options:= Opendlg.Options + [ofNoChangeDir];

                                if SP_FICHIER.FieldByName( 'PathMustExist' ).asinteger=0 Then
                                   Opendlg.Options:= Opendlg.Options - [ofPathMustExist]
                                Else
                                    Opendlg.Options:= Opendlg.Options + [ofPathMustExist];

                                if SP_FICHIER.FieldByName( 'FileMustExist' ).asinteger=0 Then
                                   Opendlg.Options:= Opendlg.Options - [ofFileMustExist]
                                Else
                                    Opendlg.Options:= Opendlg.Options + [ofFileMustExist];
                            End;

                            Try
                              //Enleve le topmost
                              SetWindowPos(
                                  HWND(Form1.handle),	// handle of window
                                  HWND_NOTOPMOST			,	// placement-order handle
                                  0,	// horizontal position
                                  0,	// vertical position
                                  0,	// width
                                  0,	// height
                                  SWP_NOSIZE + SWP_NOMOVE	 	// window-positioning flags
                                 ) ;

                               If Directory_Only =0 Then
                               Begin
                                    if opendlg.Execute =True Then
                                    Begin
                                         Chemin_Fic:=OpenDlg.FileName;
                                    End
                                    Else
                                    Begin
                                         SP_FICHIER.Close;
                                         Fin_Appli;
                                         Exit;
                                    End;
                               End
                               Else
                               Begin
                                    Chemin_Fic:=  BrowseforFile(handle,SP_FICHIER.FieldByName( 'Title' ).asString,SP_FICHIER.FieldByName( 'InitialDir' ).asString  )  ;
                                    if (Chemin_Fic ='' ) Then
                                    Begin
                                         SP_FICHIER.Close;
                                         Fin_Appli;
                                         Exit;
                                    End;

                               End;
                            Finally
                                SetWindowPos(
                                    HWND(Form1.handle),	// handle of window
                                    HWND_TOPMOST			,	// placement-order handle
                                    0,	// horizontal position
                                    0,	// vertical position
                                    0,	// width
                                    0,	// height
                                    SWP_NOSIZE + SWP_NOMOVE	 	// window-positioning flags
                                   ) ;

                            End;
                       end;
               end;
       Except
           Application.HandleException( Self );
           SP_FICHIER.Close;
           Fin_Appli;
           Exit;
       End;

      //Lance la copie de fichiers
      SP_COPY_FILE_BEFORE.StoredProcName := nom_procedure+ '_COPY_FILE_BEFORE';
      SP_COPY_FILE_BEFORE.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
      SP_COPY_FILE_BEFORE.Params.CreateParam(ftInteger, '@cle', ptInput);
      SP_COPY_FILE_BEFORE.ParamByName('@Cle').Asinteger := Cle;
      SP_COPY_FILE_BEFORE.Params.CreateParam(ftInteger, '@N_User', ptInput);
      SP_COPY_FILE_BEFORE.ParamByName('@N_User').Asinteger := N_User;
      SP_COPY_FILE_BEFORE.Params.CreateParam(ftstring, '@File_Name', ptInput);
       For j:= 0 TO 8 Do
       Begin
          SP_COPY_FILE_BEFORE.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
          SP_COPY_FILE_BEFORE.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
       End;

      If Chemin_Fic<>'' Then
      Begin
         SP_COPY_FILE_BEFORE.ParamByName('@File_Name').Asstring := ExtractFileName(Chemin_Fic) ;
      End
      Else
      Begin
         SP_COPY_FILE_BEFORE.ParamByName('@File_Name').Asstring :='' ;
      End;
      SP_COPY_FILE_BEFORE.Params.CreateParam(ftstring, '@File_Dir', ptInput);
      If Chemin_Fic<>'' Then
      Begin
         SP_COPY_FILE_BEFORE.ParamByName('@File_Dir').Asstring := ExtractFileDir(Chemin_Fic) ;
      End
      Else
      Begin
         SP_COPY_FILE_BEFORE.ParamByName('@File_Dir').Asstring := '' ;
      End;
      SP_COPY_FILE_BEFORE.Params.CreateParam(ftstring, '@File', ptInput);
      If Chemin_Fic<>'' Then
      Begin
         SP_COPY_FILE_BEFORE.ParamByName('@File').Asstring := Chemin_Fic ;
      End
      Else
      Begin
         SP_COPY_FILE_BEFORE.ParamByName('@File').Asstring := '' ;
      End;

      Try
           Try
               SP_COPY_FILE_BEFORE.Open;
           Except
           End;

           if( SP_COPY_FILE_BEFORE.Active = True ) Then
               begin
                   if( SP_COPY_FILE_BEFORE.FieldByName( 'Msg' ).asString <> '' ) Then
                       begin
                           choix := Application.Messagebox( PChar( SP_COPY_FILE_BEFORE.FieldByName( 'Msg' ).asString ), PChar( SP_COPY_FILE_BEFORE.FieldByName( 'Caption' ).asString ), SP_COPY_FILE_BEFORE.FieldByName( 'Flags' ).asInteger + MB_TOPMOST );
                        end;
                   if( SP_COPY_FILE_BEFORE.FieldByName( 'Result' ).asInteger <> 1 ) Then
                       begin
                           SP_COPY_FILE_BEFORE.Close;
                           Fin_Appli;
                           Exit;
                       end;
                   SP_COPY_FILE_BEFORE.Close;
               end;
       Except
           Application.HandleException( Self );
           SP_COPY_FILE_BEFORE.Close;
           Fin_Appli;
           Exit;
       End;


      SP_CREATE_DIR.StoredProcName := nom_procedure+ '_CREATE_DIR';
      SP_CREATE_DIR.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
      SP_CREATE_DIR.Params.CreateParam(ftInteger, '@cle', ptInput);
      SP_CREATE_DIR.ParamByName('@Cle').Asinteger := Cle;
      SP_CREATE_DIR.Params.CreateParam(ftInteger, '@N_User', ptInput);
      SP_CREATE_DIR.ParamByName('@N_User').Asinteger := N_User;
      SP_CREATE_DIR.Params.CreateParam(ftInteger, '@Choix_Before', ptInput);
      SP_CREATE_DIR.ParamByName('@Choix_Before').Asinteger := Choix;
      SP_CREATE_DIR.Params.CreateParam(ftstring, '@File_Name', ptInput);
       For j:= 0 TO 8 Do
       Begin
          SP_CREATE_DIR.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
          SP_CREATE_DIR.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
       End;


      SP_COPY_FILE.StoredProcName := nom_procedure+ '_COPY_FILE';
      SP_COPY_FILE.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
      SP_COPY_FILE.Params.CreateParam(ftInteger, '@cle', ptInput);
      SP_COPY_FILE.ParamByName('@Cle').Asinteger := Cle;
      SP_COPY_FILE.Params.CreateParam(ftInteger, '@N_User', ptInput);
      SP_COPY_FILE.ParamByName('@N_User').Asinteger := N_User;
      SP_COPY_FILE.Params.CreateParam(ftInteger, '@Choix_Before', ptInput);
      SP_COPY_FILE.ParamByName('@Choix_Before').Asinteger := Choix;
      SP_COPY_FILE.Params.CreateParam(ftstring, '@File_Name', ptInput);
       For j:= 0 TO 8 Do
       Begin
          SP_COPY_FILE.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
          SP_COPY_FILE.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
       End;

      SP_COPY_FILE_AFTER.StoredProcName := nom_procedure+ '_COPY_FILE_AFTER';
      SP_COPY_FILE_AFTER.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftInteger, '@cle', ptInput);
      SP_COPY_FILE_AFTER.ParamByName('@Cle').Asinteger := Cle;
      SP_COPY_FILE_AFTER.Params.CreateParam(ftInteger, '@N_User', ptInput);
      SP_COPY_FILE_AFTER.ParamByName('@N_User').Asinteger := N_User;
      SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@Fonction', ptInput);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@FileS_Name', ptInput);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@FileS_Dir', ptInput);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@FileS', ptInput);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@FileD_Name', ptInput);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@FileD_Dir', ptInput);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@FileD', ptInput);
      SP_COPY_FILE_AFTER.Params.CreateParam(ftInteger, '@Resultat', ptInput);
       For j:= 0 TO 8 Do
       Begin
          SP_COPY_FILE_AFTER.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
          SP_COPY_FILE_AFTER.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
       End;

      If Chemin_Fic<>'' Then
      Begin
         SP_COPY_FILE.ParamByName('@File_Name').Asstring := ExtractFileName(Chemin_Fic) ;
         SP_CREATE_DIR.ParamByName('@File_Name').Asstring := ExtractFileName(Chemin_Fic) ;
      End
      Else
      Begin
         SP_COPY_FILE.ParamByName('@File_Name').Asstring :='' ;
         SP_CREATE_DIR.ParamByName('@File_Name').Asstring :='' ;
      End;

      SP_CREATE_DIR.Params.CreateParam(ftstring, '@File_Dir', ptInput);
      If Chemin_Fic<>'' Then
      Begin
         SP_CREATE_DIR.ParamByName('@File_Dir').Asstring := ExtractFileDir(Chemin_Fic) ;
      End
      Else
      Begin
         SP_CREATE_DIR.ParamByName('@File_Dir').Asstring := '' ;
      End;

      SP_CREATE_DIR.Params.CreateParam(ftstring, '@File', ptInput);
      If Chemin_Fic<>'' Then
      Begin
         SP_CREATE_DIR.ParamByName('@File').Asstring := Chemin_Fic ;
      End
      Else
      Begin
         SP_CREATE_DIR.ParamByName('@File').Asstring := '' ;
      End;

      SP_COPY_FILE.Params.CreateParam(ftstring, '@File_Dir', ptInput);
      If Chemin_Fic<>'' Then
      Begin
         SP_COPY_FILE.ParamByName('@File_Dir').Asstring := ExtractFileDir(Chemin_Fic) ;
      End
      Else
      Begin
         SP_COPY_FILE.ParamByName('@File_Dir').Asstring := '' ;
      End;

      SP_COPY_FILE.Params.CreateParam(ftstring, '@File', ptInput);
      If Chemin_Fic<>'' Then
      Begin
         SP_COPY_FILE.ParamByName('@File').Asstring := Chemin_Fic ;
      End
      Else
      Begin
         SP_COPY_FILE.ParamByName('@File').Asstring := '' ;
      End;

      //Create Dir
      Try
         Try
             SP_CREATE_DIR.Open;
         Except
         End;

         if( SP_CREATE_DIR.Active = True ) Then
             begin
                 While (not SP_CREATE_DIR.Eof) do
                 begin
                      if SP_CREATE_DIR.FieldByName('Directory').asstring <>'' Then
                      Begin
                         if not DirectoryExists(SP_CREATE_DIR.FieldByName('Directory').asstring) then
                         Begin
                            if SP_CREATE_DIR.FieldByName('Force_Dir').asinteger = 1 Then
                            Begin
                                 ForceDirectories(SP_CREATE_DIR.FieldByName('Directory').asstring);
                            End
                            Else
                            Begin
                                 CreateDir(SP_CREATE_DIR.FieldByName('Directory').asstring);
                            End;
                         end;
                      End;
                    SP_CREATE_DIR.Next;
                 end;
             End;
             SP_CREATE_DIR.Close;

      Except
         Application.HandleException( Self );
         SP_CREATE_DIR.Close;
         Fin_Appli;
         exit;

      End;


      //Copy File
      Try
         Try
             SP_COPY_FILE.Open;
         Except
         End;

         if( SP_COPY_FILE.Active = True ) Then
             begin
                  Try
                      SetWindowPos(
                          HWND(Form1.handle),	// handle of window
                          HWND_NOTOPMOST			,	// placement-order handle
                          0,	// horizontal position
                          0,	// vertical position
                          0,	// width
                          0,	// height
                          SWP_NOSIZE + SWP_NOMOVE	 	// window-positioning flags
                         ) ;
                       While (not SP_COPY_FILE.Eof) do begin
                          Chemin_Fic := SP_COPY_FILE.fieldbyname('Source').asstring;
                          Chemin_Dest := SP_COPY_FILE.fieldbyname('Destination').asstring;

                          if  SP_COPY_FILE.fieldbyname('Fonction').asstring<>'' Then
                          Begin
                               Resultat_copie:=Copier( Form1.Handle,Chemin_Fic,Chemin_Dest);

                              SP_COPY_FILE_AFTER.ParamByName('@Cle').Asinteger := Cle;
                              SP_COPY_FILE_AFTER.ParamByName('@N_User').Asinteger := N_User;
                              SP_COPY_FILE_AFTER.ParamByName('@Fonction').asstring := SP_COPY_FILE.fieldbyname('Fonction').asstring;
                              SP_COPY_FILE_AFTER.ParamByName('@FileS_Name').asstring := ExtractFileName(Chemin_Fic) ;
                              SP_COPY_FILE_AFTER.ParamByName('@FileS_Dir').asstring := ExtractFileDir(Chemin_Fic);
                              SP_COPY_FILE_AFTER.ParamByName('@FileS').asstring := Chemin_Fic;
                              SP_COPY_FILE_AFTER.ParamByName('@FileD_Name').asstring := ExtractFileName(Chemin_Dest);
                              SP_COPY_FILE_AFTER.ParamByName('@FileD_Dir').asstring := ExtractFileDir(Chemin_Dest);
                              SP_COPY_FILE_AFTER.ParamByName('@FileD').asstring := Chemin_Dest;
                              SP_COPY_FILE_AFTER.ParamByName('@Resultat').asinteger  := Resultat_copie ;

                               Try
                                   SP_COPY_FILE_AFTER.ExecProc;
                               Except
                               End;
                          End;

                          SP_COPY_FILE.Next;
                       end;
                  Finally
                      SetWindowPos(
                          HWND(Form1.handle),	// handle of window
                          HWND_TOPMOST			,	// placement-order handle
                          0,	// horizontal position
                          0,	// vertical position
                          0,	// width
                          0,	// height
                          SWP_NOSIZE + SWP_NOMOVE	 	// window-positioning flags
                         ) ;

                  End;
                End;
             SP_COPY_FILE.Close;

      Except
         Application.HandleException( Self );
         SP_COPY_FILE.Close;
         Fin_Appli;
         exit;

      End;
      If Chemin_dest<>'' Then
      Begin
          Chemin_Fic:=Chemin_dest;
      End;

      choix:=0;


       //Prépare la sp principal
       sp.StoredProcName := nom_procedure;

       sp.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);

       sp.Params.CreateParam(ftInteger, '@cle', ptInput);
       sp.ParamByName('@Cle').Asinteger := Cle;

       sp.Params.CreateParam(ftInteger, '@N_User', ptInput);
       sp.ParamByName('@N_User').Asinteger := N_User;

       sp.Params.CreateParam(ftString, '@P1', ptInput);
       sp.ParamByName('@P1').Asstring := P1_Procedure;

       sp.Params.CreateParam(ftString, '@P2', ptInput);

       if Chemin_Fic<>'' Then
       Begin
            sp.ParamByName('@P2').Asstring := Chemin_Fic;
       End
       Else
       Begin
            sp.ParamByName('@P2').Asstring := P2_Procedure;
       End;

       sp.Params.CreateParam(ftString, '@msg_err', ptInputOutput);

       sp.Params.CreateParam(ftString, '@msg_OK', ptInputOutput);

       sp.Params.CreateParam(ftInteger, '@Ouverture_Fiche', ptInputOutput);

       sp.Params.CreateParam(ftInteger, '@Type_Fiche', ptInputOutput);

       sp.Params.CreateParam(ftInteger, '@N_fiche', ptInputOutput);

       sp.Params.CreateParam(ftInteger, '@Plusieurs_Fiches', ptInputOutput);

       sp.Params.CreateParam(ftInteger, '@Choix_Before', ptInput);
       sp.ParamByName('@Choix_Before').Asinteger := Choix_Entree;
       For j:= 0 TO 8 Do
       Begin
          sp.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
          sp.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
       End;


       //Prépare la sp principal Memos
       SP_MEMOS.StoredProcName := nom_procedure+'_MEMOS';

       SP_MEMOS.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);

       SP_MEMOS.Params.CreateParam(ftInteger, '@cle', ptInput);
       SP_MEMOS.ParamByName('@Cle').Asinteger := Cle;

       SP_MEMOS.Params.CreateParam(ftInteger, '@N_User', ptInput);
       SP_MEMOS.ParamByName('@N_User').Asinteger := N_User;

       SP_MEMOS.Params.CreateParam(ftString, '@P1', ptInput);
       SP_MEMOS.ParamByName('@P1').Asstring := P1_Procedure;

       SP_MEMOS.Params.CreateParam(ftString, '@P2', ptInput);
       if Chemin_Fic<>'' Then
       Begin
            SP_MEMOS.ParamByName('@P2').Asstring := Chemin_Fic;
       End
       Else
       Begin
            SP_MEMOS.ParamByName('@P2').Asstring := P2_Procedure;
       End;

       SP_MEMOS.Params.CreateParam(ftInteger, '@Choix_Before', ptInput);
       SP_MEMOS.ParamByName('@Choix_Before').Asinteger := Choix_Entree;
       For j:= 0 TO 8 Do
       Begin
          SP_MEMOS.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
          SP_MEMOS.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
       End;


       Try
         AdvPicture1.Repaint;
         application.ProcessMessages;
         Threadsp := TThreadGenesysSP.Create( AdvEdit1, SP,SP_MEMOS,edit1,Edit2,wq_memos);
        Except
           Application.HandleException( Self );
           Fin_Appli;
           Exit;

        End;
Finally


End;

end;

procedure TForm1.Finalise_Traitement;
var    I,j:Integer;
Param:String;
begin
Try
   Try
       Try
          application.ProcessMessages;
          //Récupération du paramètre @msg_Ok
          msgreussite:= sp.ParamByName('@msg_Ok').AsString;

          //Récupération du paramètre @msg_err
          msgerreur:= sp.ParamByName('@msg_err').AsString;

          //Récupération du paramètre @Ouverture_Fiche
          Ouverture_Fiche:= sp.ParamByName('@Ouverture_Fiche').Asinteger;

          //Récupération du paramètre @Type_Fiche
          Type_Fiche:= sp.ParamByName('@Type_Fiche').Asinteger;

          //Récupération du paramètre @N_Fiche
          N_Fiche:= sp.ParamByName('@N_Fiche').Asinteger;

          //Récupération du paramètre @Plusieurs_Fiches
          Plusieurs_Fiches := sp.ParamByName('@Plusieurs_Fiches').Asinteger;

        finally

        End;

        Try
           if( N_Refresh > 0 ) Then
               begin
                   SendMessage( HWND(N_Handle),WM_G_RAFRAICHIR, 0, 0 ); //où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
               end;

           if( Ouverture_Fiche > 0 ) Then
               begin
                   If Plusieurs_Fiches=1 Then
                      Begin
                         SP_LISTE_FICHES.StoredProcName := nom_procedure+ '_LISTE_FICHES';
                         SP_LISTE_FICHES.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
                         SP_LISTE_FICHES.Params.CreateParam(ftInteger, '@cle', ptInput);
                         SP_LISTE_FICHES.ParamByName('@Cle').Asinteger := Cle;
                         SP_LISTE_FICHES.Params.CreateParam(ftInteger, '@N_User', ptInput);
                         SP_LISTE_FICHES.ParamByName('@N_User').Asinteger := N_User;
                         For j:= 0 TO 8 Do
                         Begin
                            SP_LISTE_FICHES.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
                            SP_LISTE_FICHES.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
                         End;
                         Try
                             Try
                                 SP_LISTE_FICHES.Open;
                             Except
                             End;

                             if( SP_LISTE_FICHES.Active = True ) Then
                                 begin
                                     SP_LISTE_FICHES_BEFORE.StoredProcName := nom_procedure+ '_FICHES_BEFORE';
                                     SP_LISTE_FICHES_BEFORE.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
                                     SP_LISTE_FICHES_BEFORE.Params.CreateParam(ftInteger, '@cle', ptInput);
                                     SP_LISTE_FICHES_BEFORE.ParamByName('@Cle').Asinteger := Cle;
                                     SP_LISTE_FICHES_BEFORE.Params.CreateParam(ftInteger, '@N_User', ptInput);
                                     SP_LISTE_FICHES_BEFORE.ParamByName('@N_User').Asinteger := N_User;
                                     For j:= 0 TO 8 Do
                                     Begin
                                        SP_LISTE_FICHES_BEFORE.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
                                        SP_LISTE_FICHES_BEFORE.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
                                     End;
                                     Try
                                         Try
                                             SP_LISTE_FICHES_BEFORE.Open;
                                         Except
                                         End;

                                         if( SP_LISTE_FICHES_BEFORE.Active = True ) Then
                                             begin
                                                 if( SP_LISTE_FICHES_BEFORE.FieldByName( 'Msg' ).asString <> '' ) Then
                                                     begin
                                                         choix := Application.Messagebox( PChar( SP_LISTE_FICHES_BEFORE.FieldByName( 'Msg' ).asString ), PChar( SP_LISTE_FICHES_BEFORE.FieldByName( 'Caption' ).asString ), SP_LISTE_FICHES_BEFORE.FieldByName( 'Flags' ).asInteger + MB_TOPMOST);
                                                         if( choix = IDCANCEL )OR( choix = IDNO )OR( choix = IDABORT ) Then
                                                             begin
                                                                 SP_LISTE_FICHES_BEFORE.Close;
                                                                 Fin_Appli;
                                                                 exit;
                                                             end;
                                                     end;
                                                 if( SP_LISTE_FICHES_BEFORE.FieldByName( 'Result' ).asInteger <> 1 ) Then
                                                     begin
                                                         SP_LISTE_FICHES_BEFORE.Close;
                                                         Fin_Appli;
                                                         exit;
                                                     end;
                                                 SP_LISTE_FICHES_BEFORE.Close;
                                             end;
                                     Except
                                         Application.HandleException( Self );
                                         SP_LISTE_FICHES_BEFORE.Close;
                                         Fin_Appli;
                                         exit;

                                     End;


                                       While (not SP_LISTE_FICHES.Eof) do begin
                                          Type_Fiche := SP_LISTE_FICHES.FieldByName('Type_Fiche').AsInteger ;
                                          N_Fiche:= SP_LISTE_FICHES.FieldByName('N_Fiche').AsInteger ;


                                          if  (N_Fiche>0) then begin

                                             if Type_Fiche<100 Then
                                                Type_Fiche:=Type_Fiche+100;

                                             Voir_fiche(N_Fiche,Type_Fiche);
                                             iCptFic := iCptFic + 1;
                                          end;
                                          SP_LISTE_FICHES.Next;
                                       end;
                                    End;
                                 SP_LISTE_FICHES.Close;

                         Except
                             Application.HandleException( Self );
                             SP_LISTE_FICHES.Close;
                             Fin_Appli;
                             exit;

                         End;
                     End
                     Else
                     Begin
                         //Reconstruit le Type de fiche à ouvrir
                          if  (N_Fiche>0) then
                          begin
                             if Type_Fiche<100 Then
                                Type_Fiche:=Type_Fiche+100;

                             Voir_fiche(N_Fiche,Type_Fiche);
                          end;
                     End;
                end;

		Except
			Application.HandleException( Self );
        end;
Except
   Application.HandleException( Self );
End;

//Lance la liste de refresh
SP_REFRESH.StoredProcName := nom_procedure+ '_REFRESH';
SP_REFRESH.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
SP_REFRESH.Params.CreateParam(ftInteger, '@cle', ptInput);
SP_REFRESH.ParamByName('@Cle').Asinteger := Cle;
SP_REFRESH.Params.CreateParam(ftInteger, '@N_User', ptInput);
SP_REFRESH.ParamByName('@N_User').Asinteger := N_User;
For j:= 0 TO 8 Do
Begin
  SP_REFRESH.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
  SP_REFRESH.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
End;
Try
   Try
       SP_REFRESH.Open;
   Except
   End;

   if( SP_REFRESH.Active = True ) Then
       begin
           SP_REFRESH_BEFORE.StoredProcName := nom_procedure+ '_REFRESH_BEFORE';
           SP_REFRESH_BEFORE.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
           SP_REFRESH_BEFORE.Params.CreateParam(ftInteger, '@cle', ptInput);
           SP_REFRESH_BEFORE.ParamByName('@Cle').Asinteger := Cle;
           SP_REFRESH_BEFORE.Params.CreateParam(ftInteger, '@N_User', ptInput);
           SP_REFRESH_BEFORE.ParamByName('@N_User').Asinteger := N_User;
            For j:= 0 TO 8 Do
            Begin
              SP_REFRESH_BEFORE.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
              SP_REFRESH_BEFORE.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
            End;
           Try
               Try
                   SP_REFRESH_BEFORE.Open;
               Except
               End;

               if( SP_REFRESH_BEFORE.Active = True ) Then
                   begin
                       if( SP_REFRESH_BEFORE.FieldByName( 'Msg' ).asString <> '' ) Then
                           begin
                               choix := Application.Messagebox( PChar( SP_REFRESH_BEFORE.FieldByName( 'Msg' ).asString ), PChar( SP_REFRESH_BEFORE.FieldByName( 'Caption' ).asString ), SP_REFRESH_BEFORE.FieldByName( 'Flags' ).asInteger + MB_TOPMOST);
                               if( choix = IDCANCEL )OR( choix = IDNO )OR( choix = IDABORT ) Then
                                   begin
                                       SP_REFRESH_BEFORE.Close;
                                       Fin_Appli;
                                       exit;
                                   end;
                           end;
                       if( SP_REFRESH_BEFORE.FieldByName( 'Result' ).asInteger <> 1 ) Then
                           begin
                               SP_REFRESH_BEFORE.Close;
                               Fin_Appli;
                               exit;
                           end;
                       SP_REFRESH_BEFORE.Close;
                   end;
           Except
               Application.HandleException( Self );
               SP_REFRESH_BEFORE.Close;
               Fin_Appli;
               exit;

           End;


             While (not SP_REFRESH.Eof) do begin
                Type_Fiche := SP_REFRESH.FieldByName('Type_Fiche').AsInteger ;
                N_Fiche:= SP_REFRESH.FieldByName('N_Fiche').AsInteger ;
                Nom_Fenetre := SP_REFRESH.FieldByName('Nom_Fenetre').Asstring ;
                //Recherche la fenetre demandé
                Handle_fenetre:=0;
                Find_Fenetre:=Nom_Fenetre;
                EnumWindows(@ListeChild,0);  // énumération des fenêtres Top-level

                If (Handle_fenetre >0) Then
                   Begin
                         SendMessage( HWND(Handle_fenetre),WM_G_RAFRAICHIR, 0, 0 ); //où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
                   end;

                SP_REFRESH.Next;
             end;
          End;
       SP_REFRESH.Close;

Except
   Application.HandleException( Self );
   SP_REFRESH.Close;
   Fin_Appli;
   exit;

End;



//Lance la liste des fichiers a ouvrir
SP_OPEN_APPLI.StoredProcName := nom_procedure+ '_OPEN_APPLI';
SP_OPEN_APPLI.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
SP_OPEN_APPLI.Params.CreateParam(ftInteger, '@cle', ptInput);
SP_OPEN_APPLI.ParamByName('@Cle').Asinteger := Cle;
SP_OPEN_APPLI.Params.CreateParam(ftInteger, '@N_User', ptInput);
SP_OPEN_APPLI.ParamByName('@N_User').Asinteger := N_User;
For j:= 0 TO 8 Do
Begin
  SP_OPEN_APPLI.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
  SP_OPEN_APPLI.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
End;
Try
   Try
       SP_OPEN_APPLI.Open;
   Except
   End;

   if( SP_OPEN_APPLI.Active = True ) Then
       begin
           SP_OPEN_APPLI_BEFORE.StoredProcName := nom_procedure+ '_OPEN_APPLI_BEFORE';
           SP_OPEN_APPLI_BEFORE.Params.CreateParam(ftInteger, '@RETURN_VALUE', ptResult);
           SP_OPEN_APPLI_BEFORE.Params.CreateParam(ftInteger, '@cle', ptInput);
           SP_OPEN_APPLI_BEFORE.ParamByName('@Cle').Asinteger := Cle;
           SP_OPEN_APPLI_BEFORE.Params.CreateParam(ftInteger, '@N_User', ptInput);
           SP_OPEN_APPLI_BEFORE.ParamByName('@N_User').Asinteger := N_User;
            For j:= 0 TO 8 Do
            Begin
              SP_OPEN_APPLI_BEFORE.Params.CreateParam(ftstring, '@Param'+inttostr(j), ptInput);
              SP_OPEN_APPLI_BEFORE.ParamByName( '@Param'+inttostr(j)).asstring := Tab_Params[j];
            End;
           Try
               Try
                   SP_OPEN_APPLI_BEFORE.Open;
               Except
               End;

               if( SP_OPEN_APPLI_BEFORE.Active = True ) Then
                   begin
                       if( SP_OPEN_APPLI_BEFORE.FieldByName( 'Msg' ).asString <> '' ) Then
                           begin
                               choix := Application.Messagebox( PChar( SP_OPEN_APPLI_BEFORE.FieldByName( 'Msg' ).asString ), PChar( SP_OPEN_APPLI_BEFORE.FieldByName( 'Caption' ).asString ), SP_OPEN_APPLI_BEFORE.FieldByName( 'Flags' ).asInteger + MB_TOPMOST);
                               if( choix = IDCANCEL )OR( choix = IDNO )OR( choix = IDABORT ) Then
                                   begin
                                       SP_OPEN_APPLI_BEFORE.Close;
                                       Fin_Appli;
                                       exit;
                                   end;
                           end;
                       if( SP_OPEN_APPLI_BEFORE.FieldByName( 'Result' ).asInteger <> 1 ) Then
                           begin
                               SP_OPEN_APPLI_BEFORE.Close;
                               Fin_Appli;
                               exit;
                           end;
                       SP_OPEN_APPLI_BEFORE.Close;
                   end;
           Except
               Application.HandleException( Self );
               SP_OPEN_APPLI_BEFORE.Close;
               Fin_Appli;
               exit;

           End;


             While (not SP_OPEN_APPLI.Eof) do begin
                Param := SP_OPEN_APPLI.fieldbyname('Parametres').asstring;
                param := Stringreplace(Param,'$DB',Form1.Database.AliasName,[]);
                param := Stringreplace(Param,'$USER',inttostr(N_user),[]);
                param := Stringreplace(Param,'$N',inttostr(Cle),[]);
                param := Stringreplace(Param,'$HANDLE',inttostr(Handle),[]);

                ShellExecute(0,'open',PChar(SP_OPEN_APPLI.fieldbyname('Appli').asstring),PChar(Param),Nil,SP_OPEN_APPLI.fieldbyname('Mode').asinteger);

                SP_OPEN_APPLI.Next;
             end;
          End;
       SP_OPEN_APPLI.Close;

Except
   Application.HandleException( Self );
   SP_OPEN_APPLI.Close;
   Fin_Appli;
   exit;

End;



//Fermeture

//Si un message alors affichage du message
If (msgreussite='')  AND  ( msgerreur='') AND ( N_Visible > 0 ) Then
Begin
     Application.MessageBox('Fin du processus','Information',MB_OK+ MB_ICONINFORMATION + MB_TOPMOST );
     Fin_Appli;
     exit;
End;
If msgreussite<>'' then
   Begin
        Application.MessageBox(pchar(msgreussite),'Information',MB_OK+ MB_ICONINFORMATION + MB_TOPMOST);
        Fin_Appli;
        exit;
   End;
//Si aucun message spécifié alors message par défaut
If msgerreur<>'' then
   Begin
        //Form1.Caption:='Erreur' ;
        //Label1.caption:= msgerreur ;
        //BitBtn1.kind:=bkAbort
        //Affiche la boite de dialogue
        Application.MessageBox(pchar(msgerreur),'Erreur',MB_OK+ MB_ICONERROR + MB_TOPMOST );
        //MessageDlg(msgerreur, mtError , [mbOK], 0);
        Fin_Appli;
     exit;
   End;




Finally

       Fin_Appli;

End;

end;
procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  Var i:integer;
begin

   For I := 0 to ComponentCount -1 do
       if( Components[I] is TDataSet )AND( ( Components[i] as TDataSet ).Active = True ) Then
           ( Components[i] as TDataSet ).Close;


   database.Close;

   if Threadsp<>nil then
   begin
     Threadsp.Terminate;
     // attente de la fin du Thread Ferme quand même au bout de 10 secondes
     //WaitForSingleObject(Threadsp.Handle,10000);
     Threadsp:=nil;
   end;


end;

procedure TForm1.AdvEdit1Change(Sender: TObject);
begin
EllipsLabel1.Caption:= Advedit1.Text;
AdvPicture1.Visible:=False;
IF Advedit1.Text='Fin de traitement ...' Then
Begin
     AdvPicture1.Visible:=False;
     Finalise_Traitement;
End;

IF Advedit1.Text='Erreur...' Then
Begin
     AdvPicture1.Visible:=False;
     Fin_Appli;
End;

IF Advedit1.Text='Un problème a été rencontré !' Then
Begin
     AdvPicture1.Visible:=False;
End;


end;
Function TForm1.copier(Handle:HWND;Source,Cible:string):Integer;
 var
  lpFileOp:TSHFileOpStructA;
  TabFrom:array[0..16383] of char;
  i:integer;
  FlagsOptions: FILEOP_FLAGS;
  Resultat_copie:integer;
 begin
     for i:=0 to length(Source)-1 do TabFrom[i]:=Source[i+1];
     // pFrom peut contenir plusieurs noms de fichier.
     //Les noms doivent être séparés par le caractère #0.
     // d'après mes essais, le dernier nom de fichier doit être suivi
     //de deux caractères #0.
     TabFrom[length(Source)]:=#0;
     TabFrom[length(Source)+1]:=#0;
  FlagsOptions:=0;

  if SP_COPY_FILE.fieldbyname('Fonction').asstring='Copier' Then
  Begin
     lpFileOp.wFunc:=FO_COPY;
     lpFileOp.pTo:=PAnsiChar(Cible);
  End;
  if SP_COPY_FILE.fieldbyname('Fonction').asstring='Effacer' Then
  Begin
     lpFileOp.wFunc:=FO_DELETE;
     lpFileOp.pTo:='';
  End;
  if SP_COPY_FILE.fieldbyname('Fonction').asstring='Deplacer' Then
  Begin
     lpFileOp.wFunc:=FO_MOVE;
     lpFileOp.pTo:=PAnsiChar(Cible);
  End;
  if SP_COPY_FILE.fieldbyname('Fonction').asstring='Renommer' Then
  Begin
     lpFileOp.wFunc:=FO_RENAME;
     lpFileOp.pTo:=PAnsiChar(Cible);
  End;

  if SP_COPY_FILE.fieldbyname('PossibleAnnuler').asstring= 'Oui' Then
  Begin
       FlagsOptions:=FlagsOptions + FOF_ALLOWUNDO;
  End;
  if SP_COPY_FILE.fieldbyname('ChangeNomSiCollision').asstring= 'Oui' Then
  Begin
       FlagsOptions:=FlagsOptions + FOF_RENAMEONCOLLISION;
  End;
  if SP_COPY_FILE.fieldbyname('SansConfirmation').asstring= 'Oui' Then
  Begin
       FlagsOptions:=FlagsOptions + FOF_NOCONFIRMATION;
  End;
  if SP_COPY_FILE.fieldbyname('SansProgression').asstring= 'Oui' Then
  Begin
       FlagsOptions:=FlagsOptions + FOF_SILENT;
  End;

  If SP_COPY_FILE.FindField('Fichiers_Seulement')<>Nil Then
  Begin
      if SP_COPY_FILE.fieldbyname('Fichiers_Seulement').asstring= 'Oui' Then
      Begin
           FlagsOptions:=FlagsOptions + FOF_FILESONLY;
      End;
  end;

  If SP_COPY_FILE.FindField('SansConfirmation_Rep')<>Nil Then
  Begin
      if SP_COPY_FILE.fieldbyname('SansConfirmation_Rep').asstring= 'Oui' Then
      Begin
           FlagsOptions:=FlagsOptions + FOF_NOCONFIRMMKDIR;
      End;
  end;

  If SP_COPY_FILE.FindField('PasMessageErreur')<>Nil Then
  Begin
      if SP_COPY_FILE.fieldbyname('PasMessageErreur').asstring= 'Oui' Then
      Begin
           FlagsOptions:=FlagsOptions + FOF_NOERRORUI;
      End;
  end;

  If SP_COPY_FILE.FindField('SimpleProgress')<>Nil Then
  Begin
      if SP_COPY_FILE.fieldbyname('SimpleProgress').asstring= 'Oui' Then
      Begin
           FlagsOptions:=FlagsOptions + FOF_SIMPLEPROGRESS;
      End;
  end;

  {-----préparation du paramètre lpFileOp -----}
  lpFileOp.Wnd:=handle;
  lpFileOp.pFrom:=TabFrom;       // On aurait aussi put ecrire pFrom := @Chaine[1]
  lpFileOp.fFlags:=FlagsOptions;  
  { fin de la préparation du paramètre lpFileOp}
   Resultat_Copie :=SHFileOperation(lpFileOp);// procède à la copie
   If lpFileOp.fAnyOperationsAborted = True Then
   Begin
        Resultat_Copie:=-1;
   End;

   Result:=Resultat_Copie;
 end;
procedure TForm1.FormActivate(Sender: TObject);
begin
     if( HandleGeneMail <> 0 ) Then
         begin

              SetWindowPos(  Handle,  HWND_TOPMOST,  0,   0,   0,   0,   SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
              SetWindowPos(  Handle,  HWND_NOTOPMOST,  0,   0,   0,   0,   SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

              SetWindowPos(  HandleGeneMail,  HWND_TOPMOST,  0,   0,   0,   0,   SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
              SetWindowPos(  HandleGeneMail,  HWND_NOTOPMOST,  0,   0,   0,   0,   SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
         end
     else
         ShowWindow( Form1.Handle, SW_SHOW );

end;

Procedure TForm1.Voir_Fiche(N_fiche :Integer;Fiche :Integer);
Var Param : WPARAM ;
Begin

//Test la fiche qui doit être ouverte
case Fiche of
100:Param:=WM_G_OPEN_CLIENT  ;
101: Param:= WM_G_OPEN_CONTACT;
102: Param:= WM_G_OPEN_PROJET;
103: Param:= WM_G_OPEN_BL;
104: Param:= WM_G_OPEN_CDE_CLI;
105: Param:= WM_G_OPEN_FACT_CLI;
106: Param:= WM_G_OPEN_FOURNISS;
107: Param:= WM_G_OPEN_CONTFN;
108: Param:= WM_G_OPEN_ORDREF;
109: Param:= WM_G_OPEN_RF;
110: Param:= WM_G_OPEN_STOCK;
111: Param:= WM_G_OPEN_BR;
112: Param:= WM_G_OPEN_CDE_FOUR;
113: Param:= WM_G_OPEN_FAC_FOUR;
114: Param:= WM_G_OPEN_TRESO;
115: Param:= WM_G_OPEN_ITC;

117: Param:= WM_G_OPEN_FCT_BASE;
118: Param:= WM_G_OPEN_PRODUIT;
119: Param:= WM_G_OPEN_STAT;
120: Param:= WM_G_OPEN_AFFAIRE;
121: Param:= WM_G_OPEN_COMPTA;
122: Param:= WM_G_OPEN_INVENTAIRE;
123: Param:= WM_G_OPEN_DEVIS;
124: Param:= WM_G_OPEN_ABONNEMENT;
125: Param:= WM_G_OPEN_PLANNING;
126: Param:= WM_G_OPEN_TODO;
127: Param:= WM_G_OPEN_DEMANDE_ACHAT;
128: Param:= WM_G_OPEN_CAMPAGNE;
129: Param:= WM_G_OPEN_GENEMAIL;
end;

//Envoi d'un message à la fiche
if (Form1.Handle_Ouverture>0) then
   begin
        postmessage( HWND(Form1.Handle_Ouverture),Param, N_fiche, 0 ); //où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

   end;
   SetForegroundWindow(Handle);
End;

function TForm1.BrowseforFile(Handle : THandle; Title : String; Filename : String) : String;
var
  BrowseInfo : TBrowseInfo;
  RetBuffer,
  FName,
  ResultBuffer : Array[0..255] of char;
  PIDL : PItemIDList;
begin
  StrPCopy(Fname,FileName);

  //Initialize buffers
  FillChar(BrowseInfo,SizeOf(TBrowseInfo),#0);
  Fillchar(RetBuffer,SizeOf(RetBuffer),#0);
  FillChar(ResultBuffer,SizeOf(ResultBuffer),#0);

  BrowseInfo.hwndOwner := Handle;
  BrowseInfo.pszDisplayName := @Retbuffer;
  BrowseInfo.lpszTitle := @Title[1];

  // we want a status-text
  BrowseInfo.ulFlags := BIF_StatusText;

  // Our call-back function cheching for fileexist
  //BrowseInfo.lpfn := @BrowseCallBack;
  //BrowseInfo.lParam := Integer(@FName);

  // Show BrowseForDlg
  PIDL := SHBrowseForFolder(BrowseInfo);

  // Return fullpath to file
  if SHGetPathFromIDList(PIDL,ResultBuffer) then
    result := StrPas(ResultBuffer)
  else
    Result := '';

  GlobalFreePtr(PIDL);  //Clean up
end;
end.
