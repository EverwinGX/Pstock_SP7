unit U_Params;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, paramlabel, ExtCtrls, ParamListbox, Db, DBTables, wwstorep,
  ComCtrls, fcpanel, ToolWin, ImgList, Wwquery, wwdblook, FPwwDBLookupCombo,
  Math, ShellAPI, FPadvedit, AdvEdit, FPCheckListEdit,
  ADODB;

type
  TF_Params = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    AdvPanelFiltres: TParamListBox;
    Button1: TButton;
    Button2: TButton;
    wq_custom0: TwwQuery;
    wq_custom0Liste1: TStringField;
    wq_custom0Liste1width: TIntegerField;
    wq_custom0Liste2: TStringField;
    wq_custom0Liste2width: TIntegerField;
    wq_custom0Liste3: TStringField;
    wq_custom0Liste3width: TIntegerField;
    wq_custom0SaisieLibre: TIntegerField;
    Timer1: TTimer;
    OpenDlg: TOpenDialog;
    ColorDialog1: TColorDialog;
    wsp_custom: TADOStoredProc;
    wsp_Filtres: TADOStoredProc;
    wsp_Update: TADOStoredProc;
    wsp_File: TADOStoredProc;
    wq_custom: TADOQuery;
    procedure Init;
    procedure Button1Click(Sender: TObject);
    procedure Close;
    procedure FormCreate(Sender: TObject);
    procedure ToolBar4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnl_TitrefenetreMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormActivate(Sender: TObject);
    procedure AdvPanelFiltresParamCustomEdit(Sender: TObject; idx: Integer;
      href, value, props: string; EditRect: TRect);
    procedure CBO_Update(Sender: TObject; Param, Text: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Get_Params(Etat: Integer);
    procedure CBO_Notinlist(Sender: TObject; LookupTable: TDataSet;
      NewValue: string; var Accept: Boolean);
    procedure Voir_Fiche(N_fiche: Integer; Fiche: Integer);
    procedure AdvPanelFiltresParamClick(Sender: TObject; idx: Integer;
      href: string; var value: string);
    procedure AdvPanelFiltresParamHint(Sender: TObject; idx: Integer;
      href: string; var hintvalue: string; var showhint: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure AdvPanelFiltresMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure AdvPanelFiltresParamEditDone(Sender: TObject; idx: Integer;
      href: String; var value: String);

  private
    Param_Actif: string;
  public
    Tab_Filtre: array [0 .. 9] of ansistring;
    Tab_Params: array [0 .. 9] of ansistring;

    Filtre_Plus: ansistring;
    Mem_Filtre_Plus: ansistring;
    Code_Session: ansistring;
    ApplicationHandle: Integer;

    Form_caption: ansistring;
    Info_actif: Boolean;

    Timer: Integer;
  end;

var
  F_Params: TF_Params;

implementation

uses MAIN, WM_GENESYS, U_Info;
{$R *.DFM}

procedure TF_Params.Init;
var
  Param: tparameter;
begin
  // Init
  // Si on a un timer on l'active
  if Timer > 0 then
  begin
    Timer1.Interval := Timer;
    Timer1.Enabled := True;
  end;

  AdvPanelFiltres.Items.Clear;
  AdvPanelFiltres.ItemHeight := wsp_Filtres.FieldByName('Hauteur_Ligne')
    .asinteger;
  HEight := wsp_Filtres.FieldByName('Height').asinteger;
  Width := wsp_Filtres.FieldByName('Width').asinteger;
  Caption := wsp_Filtres.FieldByName('Caption').asstring;
  AdvPanelFiltres.Color := wsp_Filtres.FieldByName('ColorFond').asinteger;

  while not wsp_Filtres.Eof do
  begin
    AdvPanelFiltres.Items.Add(wsp_Filtres.FieldByName('msg').asstring);
    wsp_Filtres.Next;
  end;

  // Prépare la procédure d'update
  wsp_Update.Close;
  wsp_Update.ProcedureName := Form1.Nom_Procedure + '_PARAMS_UPDATE';
  with wsp_Update do
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

    Param := Parameters.AddParameter;
    Param.Name := '@N_User';
    Param.DataType := ftInteger;
    Param.Direction := pdInput;

    Param := Parameters.AddParameter;
    Param.Name := '@P1';
    Param.DataType := ftWideString;
    Param.Direction := pdInput;

    Param := Parameters.AddParameter;
    Param.Name := '@P2';
    Param.DataType := ftWideString;
    Param.Direction := pdInput;

    Param := Parameters.AddParameter;
    Param.Name := '@Nom_Param';
    Param.DataType := ftWideString;
    Param.Direction := pdInput;

    Param := Parameters.AddParameter;
    Param.Name := '@Val_Param';
    Param.DataType := ftWideString;
    Param.Direction := pdInput;

    Param := Parameters.AddParameter;
    Param.Name := '@Etat';
    Param.DataType := ftInteger;
    Param.Direction := pdInput;

  end;

end;

procedure TF_Params.CreateParams(var Params: TCreateParams);
begin
  // permet l'affichage en avant par surcharge de la procedure createparams
  inherited CreateParams(Params);

  if Form1.Param_Top_Most = 1 then
  begin
    with Params do
    begin
      ExStyle := ExStyle or WS_EX_TOPMOST;
      WndParent := GetDesktopwindow;
    end;
  end
  else
  begin
    with Params do
    begin
      // ExStyle := ExStyle or WS_EX_TOPMOST ;
      WndParent := GetDesktopwindow;
    end;
  end;

end;

procedure TF_Params.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  Get_Params(2);

end;

procedure TF_Params.Get_Params(Etat: Integer);
var
  i: Integer;
begin
  for i := 0 to AdvPanelFiltres.ParamRefCount - 1 do
  begin
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param0') then
      Tab_Params[0] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param1') then
      Tab_Params[1] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param2') then
      Tab_Params[2] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param3') then
      Tab_Params[3] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param4') then
      Tab_Params[4] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param5') then
      Tab_Params[5] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param6') then
      Tab_Params[6] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param7') then
      Tab_Params[7] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];
    if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE('@Param8') then
      Tab_Params[8] := AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]];

    // Si le nom du paramètre est de type $ Alors on met a jour la table pour ce user et ce parametre
    if Copy(AdvPanelFiltres.ParamRefs[i], 1, 1) = '$' then
    begin
      try
        wsp_Update.Parameters.ParamByName('@Cle').value := Form1.cle;
        wsp_Update.Parameters.ParamByName('@N_user').value := Form1.N_user;
        wsp_Update.Parameters.ParamByName('@P1').value := Form1.P1_Procedure;
        wsp_Update.Parameters.ParamByName('@P2').value := Form1.P2_Procedure;
        wsp_Update.Parameters.ParamByName('@Nom_Param').value :=
          AdvPanelFiltres.ParamRefs[i];
        wsp_Update.Parameters.ParamByName('@Val_Param').value :=
          AdvPanelFiltres.Parameter
          [AdvPanelFiltres.ParamRefs[i]];
        wsp_Update.Parameters.ParamByName('@Etat').value := Etat;
        wsp_Update.ExecProc;
      except
        application.HandleException(self);
      end;
    end;
  end;
end;

procedure TF_Params.Close;
var
  i: Integer;
begin
  // On vide la liste
  if AdvPanelFiltres <> nil then
    AdvPanelFiltres.Items.Clear;
  // AdvPanelFiltres.Free;
  wsp_Filtres.Close;

end;

procedure TF_Params.FormCreate(Sender: TObject);
var
  i: Integer;
  s: string;
var
  Style: LongInt;
begin

end;

procedure TF_Params.ToolBar4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  F_Params.Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TF_Params.pnl_TitrefenetreMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  F_Params.Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TF_Params.FormActivate(Sender: TObject);
var
  Hauteur: Integer;
  Largeur: Integer;
  Top: Integer;
  Left: Integer;
  R: TRect;
begin
  if (ApplicationHandle > 0) then
  begin
    ShowWindow(ApplicationHandle, SW_HIDE);
    // ShowWindow( Handle, SW_SHOW );
  end;

  Form1.Fenetre_Position(F_Params);
end;

procedure TF_Params.AdvPanelFiltresParamCustomEdit(Sender: TObject;
  idx: Integer; href, value, props: string; EditRect: TRect);
var
  Typ: string;
  Tmp_int: Integer;
  Tmp_String: string;
  Tmp_Val: string;
  Tmp_index_d: Integer;
  Tmp_index_F: Integer;
  SQL: string;
  Nom_Procedure: string;
  cbo: FPTwwDBLookupCombo;
  Money: FPTadvedit;
  Chklist: FPTCheckListEdit;
  Precision: string;
  i: Integer;
  Param: tparameter;
begin
  try
    Get_Params(1);

    // Gestion de la liste SQL
    if pos('LISTSQL', props) > 0 then
    begin
      Tmp_String := props;
      Tmp_index_d := pos('[', Tmp_String);
      Tmp_index_F := pos(']', Tmp_String);
      SQL := Copy(Tmp_String, Tmp_index_d + 1, Tmp_index_F - Tmp_index_d - 1);
      wq_custom.Close;
      wq_custom.SQL.Clear;
      wq_custom.SQL.Add(SQL);
      try
        wq_custom.open;
      except
      end;

      if wq_custom.Active = True then
      begin
        cbo := FPTwwDBLookupCombo.Create(AdvPanelFiltres);
        cbo.LookupTable := wq_custom;
        cbo.lookupfield := 'Liste1';
        cbo.Parent := (Sender as Twincontrol);
        cbo.Left := EditRect.Left;
        cbo.Top := EditRect.Top;
        cbo.Text := value;
        cbo.Param := href;
        cbo.OnUpdate := CBO_Update;
        cbo.OnNotInList := CBO_Notinlist;

        SetWindowLong(cbo.Handle, GWL_EXSTYLE,
          GetWindowLong(cbo.Handle,
            GWL_EXSTYLE) or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);

        SETwindowPos(self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
          SWP_NOSIZE or SWP_NOMOVE);

        if wq_custom.FieldByName('saisieLibre').asinteger = 0 then
        begin
          cbo.AutoSelect := True;
          cbo.Style := csDropDownList;
        end;
        cbo.AutoDropDown := True;
        cbo.Selected.Add
          ('Liste1	' + inttostr(strtointdef(wq_custom.FieldByName
                ('Liste1Width').asstring, 20)) + '	Liste1	F');
        cbo.Selected.Add
          ('Liste2	' + inttostr(strtointdef(wq_custom.FieldByName
                ('Liste2Width').asstring, 0)) + '	Liste1	F');
        cbo.Selected.Add
          ('Liste3	' + inttostr(strtointdef(wq_custom.FieldByName
                ('Liste3Width').asstring, 0)) + '	Liste3	F');
        cbo.Width := Max(121, EditRect.Right - EditRect.Left) + 24;
        cbo.Visible := True;
        cbo.SetFocus;
        cbo.DropDown;
        if pos('?', value) = 0 then
        begin
          cbo.Text := value;
        end;
      end;

    end;

    // Gestion de la procedure
    if pos('PROCEDURE', props) > 0 then
    begin
      Tmp_String := props;
      Tmp_index_d := pos('[', Tmp_String);
      Tmp_index_F := pos(']', Tmp_String);
      Nom_Procedure := Copy(Tmp_String, Tmp_index_d + 1,
        Tmp_index_F - Tmp_index_d - 1);
      wsp_custom.Close;
      wsp_custom.ProcedureName := Nom_Procedure;
      With wsp_custom do
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
        Param.value := Form1.cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.value := Form1.N_user;

        Param := Parameters.AddParameter;
        Param.Name := '@P1';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := Form1.P1_Procedure;

        Param := Parameters.AddParameter;
        Param.Name := '@P2';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := Form1.P2_Procedure;

        for i := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(i);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.value := Tab_Params[i];
        end;

        Param := Parameters.AddParameter;
        Param.Name := '@Nom_Param';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := href;

        Param := Parameters.AddParameter;
        Param.Name := '@Val_Param';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := AdvPanelFiltres.Parameter[href];
      end;

      try
        wsp_custom.open;
      except
      end;

      if wsp_custom.Active = True then
      begin
        cbo := FPTwwDBLookupCombo.Create(AdvPanelFiltres);
        cbo.LookupTable := wsp_custom;
        cbo.lookupfield := 'Liste1';
        cbo.Parent := (Sender as Twincontrol);
        cbo.Left := EditRect.Left;
        cbo.Top := EditRect.Top;
        cbo.Text := value;
        cbo.Param := href;
        cbo.OnUpdate := CBO_Update;
        cbo.OnNotInList := CBO_Notinlist;

        SetWindowLong(cbo.Handle, GWL_EXSTYLE,
          GetWindowLong(cbo.Handle,
            GWL_EXSTYLE) or WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);

        SETwindowPos(self.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
          SWP_NOSIZE or SWP_NOMOVE);

        if wsp_custom.FieldByName('saisieLibre').asinteger = 0 then
        begin
          cbo.AutoSelect := True;
          cbo.Style := csDropDownList;
        end;
        cbo.AutoDropDown := True;
        cbo.Selected.Add('Liste1	' + inttostr
            (strtointdef(wsp_custom.FieldByName('Liste1Width').asstring, 20))
            + '	Liste1	F');
        cbo.Selected.Add('Liste2	' + inttostr
            (strtointdef(wsp_custom.FieldByName('Liste2Width').asstring, 0))
            + '	Liste1	F');
        cbo.Selected.Add('Liste3	' + inttostr
            (strtointdef(wsp_custom.FieldByName('Liste3Width').asstring, 0))
            + '	Liste3	F');
        cbo.Width := Max(121, EditRect.Right - EditRect.Left) + 24;
        cbo.Visible := True;
        cbo.SetFocus;
        cbo.DropDown;
        if pos('?', value) = 0 then
        begin
          cbo.Text := value;
        end;
      end;

    end;

    // Gestion de la procedure
    if pos('FILE', props) > 0 then
    begin
      Tmp_String := props;
      Tmp_index_d := pos('[', Tmp_String);
      Tmp_index_F := pos(']', Tmp_String);
      Nom_Procedure := Copy(Tmp_String, Tmp_index_d + 1,
        Tmp_index_F - Tmp_index_d - 1);
      wsp_File.Close;
      wsp_File.ProcedureName := Nom_Procedure;
      With wsp_File do
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
        Param.value := Form1.cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.value := Form1.N_user;

        Param := Parameters.AddParameter;
        Param.Name := '@P1';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := Form1.P1_Procedure;

        Param := Parameters.AddParameter;
        Param.Name := '@P2';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := Form1.P2_Procedure;

        for i := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(i);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.value := Tab_Params[i];
        end;

        Param := Parameters.AddParameter;
        Param.Name := '@Nom_Param';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := href;

        Param := Parameters.AddParameter;
        Param.Name := '@Val_Param';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := AdvPanelFiltres.Parameter[href];
      end;

      try
        wsp_File.open;
      except
      end;

      if wsp_File.Active = True then
      begin
        OpenDlg.DefaultExt := wsp_File.FieldByName('DefaultExt').asstring;
        OpenDlg.Filter := wsp_File.FieldByName('Filter').asstring;
        OpenDlg.InitialDir := wsp_File.FieldByName('InitialDir').asstring;
        OpenDlg.Title := wsp_File.FieldByName('Title').asstring;
        OpenDlg.FileName := wsp_File.FieldByName('FileName').asstring;

        if wsp_File.FieldByName('HideReadOnly').asinteger = 0 then
          OpenDlg.Options := OpenDlg.Options - [ofHideReadOnly]
        else
          OpenDlg.Options := OpenDlg.Options + [ofHideReadOnly];

        if wsp_File.FieldByName('AllowMultiSelect').asinteger = 0 then
          OpenDlg.Options := OpenDlg.Options - [ofAllowMultiSelect]
        else
          OpenDlg.Options := OpenDlg.Options + [ofAllowMultiSelect];

        if wsp_File.FieldByName('NoChangeDir').asinteger = 0 then
          OpenDlg.Options := OpenDlg.Options - [ofNoChangeDir]
        else
          OpenDlg.Options := OpenDlg.Options + [ofNoChangeDir];

        if wsp_File.FieldByName('PathMustExist').asinteger = 0 then
          OpenDlg.Options := OpenDlg.Options - [ofPathMustExist]
        else
          OpenDlg.Options := OpenDlg.Options + [ofPathMustExist];

        if wsp_File.FieldByName('FileMustExist').asinteger = 0 then
          OpenDlg.Options := OpenDlg.Options - [ofFileMustExist]
        else
          OpenDlg.Options := OpenDlg.Options + [ofFileMustExist];

        try
          if Form1.Param_Top_Most = 1 then
            // Enleve le topmost
            SETwindowPos(HWND(Handle), // handle of window
              HWND_NOTOPMOST, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
              );

          if OpenDlg.Execute = True then
          begin
            AdvPanelFiltres.Parameter[href] := OpenDlg.FileName;
          end
          else
          begin
            if wsp_File.FieldByName('Value_On_Cancel').asstring <> '' then
            begin
              AdvPanelFiltres.Parameter[href] := wsp_File.FieldByName
                ('Value_On_Cancel').asstring;
            end
            else
            begin
              AdvPanelFiltres.Parameter[href] := ' ? ';
            end;
          end;
        finally
          if Form1.Param_Top_Most = 1 then
            SETwindowPos(HWND(Handle), // handle of window
              HWND_TOPMOST, // placement-order handle
              0, // horizontal position
              0, // vertical position
              0, // width
              0, // height
              SWP_NOSIZE + SWP_NOMOVE // window-positioning flags
              );
          wsp_File.Close;
        end;

      end;

    end;
    // Gestion de la couleur
    if pos('COLOR', props) > 0 then
    begin
      Tmp_String := props;
      Tmp_index_d := pos('[', Tmp_String);
      Tmp_index_F := pos(']', Tmp_String);

      if pos('?', value) = 0 then
      begin
        ColorDialog1.Color := strtointdef(value, 0);
      end;
      if ColorDialog1.Execute = True then
      begin
        AdvPanelFiltres.Parameter[href] := inttostr(ColorDialog1.Color);
      end;
    end;

    // Gestion de la procedure
    if pos('MONEY', props) > 0 then
    begin
      Tmp_String := props;
      Tmp_index_d := pos('[', Tmp_String);
      Tmp_index_F := pos(']', Tmp_String);
      Precision := Copy(Tmp_String, Tmp_index_d + 1,
        Tmp_index_F - Tmp_index_d - 1);

      Money := FPTadvedit.Create(AdvPanelFiltres);
      Money.EditType := etmoney;
      Money.Precision := strtointdef(Precision, 0);
      // Money.ExcelStyleDecimalSeparator:=True;
      Money.EditAlign := eaRight;

      Money.Parent := (Sender as Twincontrol);
      Money.Left := EditRect.Left;
      Money.Top := EditRect.Top;
      Money.Param := href;
      Money.OnUpdate := CBO_Update;
      Money.Width := Max(16, EditRect.Right - EditRect.Left) + 16;
      Money.Visible := True;
      Money.SetFocus;
      if pos('?', value) = 0 then
      begin
        Money.Text := floattostr
          (strtofloat((stringreplace(stringreplace(stringreplace(value, #160,
                    '', [rfReplaceAll, rfIgnoreCase]), ' ', '', [rfReplaceAll,
                  rfIgnoreCase]), '.', ',', [rfReplaceAll, rfIgnoreCase]))));
      end;
      Money.SelectAll;
    end;

    // Gestion de la cheklist
    if pos('CHKLIST', props) > 0 then
    begin
      Tmp_String := props;
      Tmp_index_d := pos('[', Tmp_String);
      Tmp_index_F := pos(']', Tmp_String);
      Nom_Procedure := Copy(Tmp_String, Tmp_index_d + 1,
        Tmp_index_F - Tmp_index_d - 1);
      wsp_custom.Close;
      wsp_custom.ProcedureName := Nom_Procedure;
      With wsp_custom do
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
        Param.value := Form1.cle;

        Param := Parameters.AddParameter;
        Param.Name := '@N_User';
        Param.DataType := ftInteger;
        Param.Direction := pdInput;
        Param.value := Form1.N_user;

        Param := Parameters.AddParameter;
        Param.Name := '@P1';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := Form1.P1_Procedure;

        Param := Parameters.AddParameter;
        Param.Name := '@P2';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := Form1.P2_Procedure;

        for i := 0 to 8 do
        begin
          Param := Parameters.AddParameter;
          Param.Name := '@Param' + inttostr(i);
          Param.DataType := ftWideString;
          Param.Direction := pdInput;
          Param.value := Tab_Params[i];
        end;

        Param := Parameters.AddParameter;
        Param.Name := '@Nom_Param';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := href;

        Param := Parameters.AddParameter;
        Param.Name := '@Val_Param';
        Param.DataType := ftWideString;
        Param.Direction := pdInput;
        Param.value := AdvPanelFiltres.Parameter[href];
      end;

      try
        wsp_custom.open;
      except
      end;

      if wsp_custom.Active = True then
      begin
        Chklist := FPTCheckListEdit.Create(AdvPanelFiltres);
        Chklist.Parent := (Sender as Twincontrol);
        Chklist.Left := EditRect.Left;
        Chklist.Top := EditRect.Top;
        Chklist.Text := value;
        Chklist.Param := href;
        Chklist.OnUpdate := CBO_Update;
        Chklist.Width := Max(121, EditRect.Right - EditRect.Left) + 24;
        Chklist.Items.Clear;
        Chklist.TextDelimiter := wsp_custom.FieldByName('TextDelimiter')
          .asstring;
        Chklist.TextEndChar := wsp_custom.FieldByName('TextEndChar').asstring;
        Chklist.TextStartChar := wsp_custom.FieldByName('TextStarChar')
          .asstring;

        wsp_custom.First;
        while not wsp_custom.Eof do
        begin
          Chklist.Items.Add(wsp_custom.FieldByName('Liste1').asstring);
          wsp_custom.Next;
        end;

        Chklist.AutoDropWidthSize := True;
        Chklist.Visible := True;
        Chklist.SetFocus;
        if pos('?', value) = 0 then
        begin
          Chklist.Text := value;
        end;

      end;

    end;
  finally
  end;
end;

procedure TF_Params.CBO_Update(Sender: TObject; Param, Text: string);
begin
  if text ='' then
  begin
     text:='?'
  end;
  AdvPanelFiltres.Parameter[Param] := Text;
  wq_custom.Close;

end;

procedure TF_Params.CBO_Notinlist(Sender: TObject; LookupTable: TDataSet;
  NewValue: string; var Accept: Boolean);
begin
  if wq_custom.FieldByName('SaisieLibre').asinteger = 0 then
    Accept := false;

end;

procedure TF_Params.FormClose(Sender: TObject; var Action: TCloseAction);
begin ;

  wsp_Filtres.Close;

  if F_Info <> nil then
  begin
    F_Info.Free;
  end;
end;

procedure TF_Params.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
    if Components[i] is FPTwwDBLookupCombo then
    begin
      Components[i].Free;
    end;
    if Components[i] is FPTadvedit then
    begin
      Components[i].Free;
    end;
    if Components[i] is FPTCheckListEdit then
    begin
      Components[i].Free;
    end;

  end;

end;

procedure TF_Params.AdvPanelFiltresParamClick(Sender: TObject; idx: Integer;
  href: string; var value: string);
var
  Recup_handle: THandle;
  FExe, FParametres: string;
  Raccourci, P, P_Act, PF, TypeFiche, NFiche: Integer;
  WM_OPEN: Integer;
  Action: string;
  Nom_param: string;
  i: Integer;
begin
  if Timer1.Enabled = True then
  begin
    Timer1.Enabled := false;
    Timer1.Interval := Timer;
    Timer1.Enabled := True;

  end;

  FExe := href;
  FParametres := '';
  Raccourci := strtointdef(href, 0);

  P := pos('ouvrir_fiche_genesys_', href);
  if (P > 0) then
  begin
    P_Act := pos('[', href);
    TypeFiche := strtointdef(Copy(href, P + length('ouvrir_fiche_genesys_'),
        3), 0);
    // Si l'action est après la commande ouverture
    if (P_Act > 0) and (P_Act > P) then
    begin
      NFiche := strtointdef(Copy(href, P + length('ouvrir_fiche_genesys_') + 3,
          (P_Act) - (P + length('ouvrir_fiche_genesys_') + 3)), 0);
    end
    else
    begin
      NFiche := strtointdef(Copy(href, P + length('ouvrir_fiche_genesys_') + 3,
          10), 0);
    end;

    if (TypeFiche = 0) or (NFiche = 0) then
    begin
    end
    else
    begin
      try
        Form1.Voir_Fiche(NFiche, TypeFiche);
      finally
      end;
    end;

    // Recherche d'une action potentiel
    P := pos('[', href);
    PF := pos(']', href);
    if (P > 0) and (PF > 0) then
    begin
      Action := Copy(href, P + 1, PF - (P + 1));
    end;
  end
  else
  begin
    P := pos('<', href);
    if (P > 0) then
    begin
      FExe := Copy(href, 1, P - 1);
      FParametres := Copy(href, P + 1, length(href) - (P));
    end
    else
    begin
      FExe := href;
      FParametres := '';
    end;

    FParametres := stringreplace(FParametres, '<', '', []);
    FParametres := stringreplace(FParametres, '$USER', inttostr(Form1.N_user),
      []);
    FParametres := stringreplace(FParametres, '$DB', Form1.Db, []);
    FParametres := stringreplace(FParametres, '$N', inttostr(Form1.cle), []);
    FParametres := stringreplace(FParametres, '$HANDLE',
      inttostr(Form1.n_handle), []);
    FParametres := stringreplace(FParametres, '''', '"', [rfReplaceAll]);

    // Recherche d'une action potentiel
    P := pos('[', href);
    PF := pos(']', href);
    if (P > 0) and (PF > 0) then
    begin
      Action := Copy(href, P + 1, PF - (P + 1));
      FParametres := Copy(FParametres, 1, P - 1);
    end;

    FExe := Trim(FExe);
    FParametres := Trim(FParametres);

    // Recup_handle := ShellExecute( 0, nil, @nomExe[1], '', '', SW_SHOWNORMAL );
    // recherche une notion de repertoire
    if pos('\', FExe) <= 0 Then
    begin
      FExe := ExtractFileDir(ParamStr(0)) + '\' + FExe;
    end;

    Recup_handle := ShellExecute(Handle, 'open', PChar(FExe),
      PChar(FParametres), nil, SW_SHOWNORMAL);

  end;

  if pos('OK', UPPERCASE(Action)) > 0 then
  begin
    Button1Click(Button1);
    modalresult := Mrok;
    Close;
  end;
  if pos('CANCEL', UPPERCASE(Action)) > 0 then
  begin
    Button2Click(Button2);
    modalresult := Mrcancel;
    Close;
  end;
  if pos('CLOSE', UPPERCASE(Action)) > 0 then
  begin
    SendMessage(HWND(Form1.n_handle), WM_CLOSE, 0, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
  end;
  if pos('CLEAR_', UPPERCASE(Action)) > 0 then
  begin
    Nom_param := Copy(Action, 7, length(Action));
    for i := 0 to AdvPanelFiltres.ParamRefCount - 1 do
    begin
      if UPPERCASE(AdvPanelFiltres.ParamRefs[i]) = UPPERCASE(Nom_param) then
        AdvPanelFiltres.Parameter[AdvPanelFiltres.ParamRefs[i]] := '?';
    end;
  end;
end;

procedure TF_Params.Voir_Fiche(N_fiche: Integer; Fiche: Integer);
var
  Param: WPARAM;
begin

  // Test la fiche qui doit être ouverte
  case Fiche of
    100:
      Param := WM_G_OPEN_CLIENT;
    101:
      Param := WM_G_OPEN_CONTACT;
    102:
      Param := WM_G_OPEN_PROJET;
    103:
      Param := WM_G_OPEN_BL;
    104:
      Param := WM_G_OPEN_CDE_CLI;
    105:
      Param := WM_G_OPEN_FACT_CLI;
    106:
      Param := WM_G_OPEN_FOURNISS;
    107:
      Param := WM_G_OPEN_CONTFN;
    108:
      Param := WM_G_OPEN_ORDREF;
    109:
      Param := WM_G_OPEN_RF;
    110:
      Param := WM_G_OPEN_STOCK;
    111:
      Param := WM_G_OPEN_BR;
    112:
      Param := WM_G_OPEN_CDE_FOUR;
    113:
      Param := WM_G_OPEN_FAC_FOUR;
    114:
      Param := WM_G_OPEN_TRESO;
    115:
      Param := WM_G_OPEN_ITC;

    117:
      Param := WM_G_OPEN_FCT_BASE;
    118:
      Param := WM_G_OPEN_PRODUIT;
    119:
      Param := WM_G_OPEN_STAT;
    120:
      Param := WM_G_OPEN_AFFAIRE;
    121:
      Param := WM_G_OPEN_COMPTA;
    122:
      Param := WM_G_OPEN_INVENTAIRE;
    123:
      Param := WM_G_OPEN_DEVIS;
    124:
      Param := WM_G_OPEN_ABONNEMENT;
    125:
      Param := WM_G_OPEN_PLANNING;
    126:
      Param := WM_G_OPEN_TODO;
    127:
      Param := WM_G_OPEN_DEMANDE_ACHAT;
    128:
      Param := WM_G_OPEN_CAMPAGNE;
    129:
      Param := WM_G_OPEN_GENEMAIL;
  end;

  // Envoi d'un message à la fiche
  if (Form1.Handle_Ouverture > 0) then
  begin
    postmessage(HWND(Form1.Handle_Ouverture), Param, N_fiche, 0); // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE

  end;

end;

procedure TF_Params.AdvPanelFiltresParamHint(Sender: TObject; idx: Integer;
  href: string; var hintvalue: string; var showhint: Boolean);
begin
  if (Copy(hintvalue, 1, 1) = '$') or (Copy(hintvalue, 1, 1) = '@') then
    showhint := false;
end;

procedure TF_Params.Timer1Timer(Sender: TObject);
begin
  modalresult := Mrcancel;
end;

procedure TF_Params.AdvPanelFiltresMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Timer1.Enabled = True then
  begin
    Timer1.Enabled := false;
    Timer1.Interval := Timer;
    Timer1.Enabled := True;

  end;
end;

procedure TF_Params.Button2Click(Sender: TObject);
var
  i: Integer;
begin
  Get_Params(2);
end;

procedure TF_Params.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift) and (Info_actif = false) then
  begin
    Info_actif := True;
    F_Info := Tf_info.Create(F_Params);
    F_Info.lbl_hauteur.Caption := inttostr(F_Params.HEight);
    F_Info.lbl_largeur.Caption := inttostr(F_Params.Width);
    F_Info.Show;
  end;
end;

procedure TF_Params.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift) then
  begin
    Info_actif := false;
    if F_Info <> nil then
    begin
      F_Info.Free;
    end;
  end;
end;

procedure TF_Params.FormResize(Sender: TObject);
begin
  if (Info_actif = True) and (F_Info <> nil) then
  begin
    F_Info.lbl_hauteur.Caption := inttostr(F_Params.HEight);
    F_Info.lbl_largeur.Caption := inttostr(F_Params.Width);

  end;

end;

procedure TF_Params.AdvPanelFiltresParamEditDone(Sender: TObject; idx: Integer;
  href: String; var value: String);
begin
  if value ='' then
  begin
    value:='?';
  end;

  AdvPanelFiltres.Parameter[href] := value;

end;

end.
