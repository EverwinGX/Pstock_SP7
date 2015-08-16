unit U_Params2;
interface
uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  paramlabel,
  ExtCtrls,
  ParamListbox,
  Db,
  DBTables,
  wwstorep,
  ComCtrls,
  fcpanel,
  ToolWin,
  ImgList,
  Wwquery,
  wwdblook,
  FPwwDBLookupCombo,
  Math,
  ShellAPI,
  FPadvedit,
  AdvEdit,
  FPCheckListEdit,
  variants,
  ADODB,
  uADStanIntf,
  uADStanOption,
  uADStanParam,
  uADStanError,
  uADDatSManager,
  uADPhysIntf,
  uADDAptIntf,
  uADStanAsync,
  uADDAptManager,
  uADCompClient,
  uADCompDataSet,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinOffice2010Black,
  cxContainer,
  cxEdit,
  dxLayoutcxEditAdapters,
  cxEditRepositoryItems,
  cxClasses,
  dxLayoutContainer,
  cxTextEdit,
  cxDBEdit,
  dxLayoutControl,
  AdvMemo,
  Menus,
  dxLayoutControlAdapters,
  cxButtons,
  cxMemo,
  cxRichEdit,
  ShlObj,
  cxShellCommon,
  cxMaskEdit,
  cxDropDownEdit,
  cxShellComboBox,
  dxCore,
  cxDateUtils
  ,
  dxToggleSwitch,
  cxCurrencyEdit,
  cxCalc,
  cxSpinEdit,
  cxCheckBox,
  cxCalendar,
  dxColorEdit,
  cxColorComboBox,
  cxTrackBar,
  cxExtEditRepositoryItems,
  cxShellEditRepositoryItems,
  cxLookupEdit,
  cxDBLookupEdit,
  cxDBLookupComboBox,
  cxDBEditRepository,
  cxFontNameComboBox,
  cxTreeView,
  cxShellTreeView,
  cxShellBrowserDialog,
  dxColorDialog,
  cxPropertiesStore,
  dxScreenTip,
  dxCustomHint,
  cxHint,
  dxSkinsForm,
  dxLayoutLookAndFeels,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  dxSkinscxPCPainter,
  Buttons;
type
  TF_Params2 = class(TForm)
    Timer1: TTimer;
    OpenDlg: TOpenDialog;
    ColorDialog1: TColorDialog;
    wsp_custom: TADStoredProc;
    wsp_Filtres: TADStoredProc;
    wsp_Update: TADStoredProc;
    wq_update: TADQuery;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1TextItem1: TcxEditRepositoryTextItem;
    wq_Resizer: TADQuery;
    lcMain: TdxLayoutControl;
    lcMainGroup_Root1: TdxLayoutGroup;
    lcMainGroup1: TdxLayoutGroup;
    cxButton1: TcxButton;
    OK: TdxLayoutItem;
    cxButton2: TcxButton;
    CANCEL: TdxLayoutItem;
    lcMainSpaceItem1: TdxLayoutEmptySpaceItem;
    gx_Button
      : TdxLayoutGroup;
    lcMainSeparatorItem1: TdxLayoutSeparatorItem;
    grp_General: TdxLayoutGroup;
    cxEditRepository1CalcItem1: TcxEditRepositoryCalcItem;
    cxEditRepository1CheckBoxItem1: TcxEditRepositoryCheckBoxItem;
    cxEditRepository1ColorEdit1: TcxEditRepositoryColorEdit;
    cxEditRepository1ComboBoxItem1: TcxEditRepositoryComboBoxItem;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    cxEditRepository1DateItem1: TcxEditRepositoryDateItem;
    cxEditRepository1RichItem1: TcxEditRepositoryRichItem;
    cxEditRepository1ShellComboBoxItem1: TcxEditRepositoryShellComboBoxItem;
    cxEditRepository1SpinItem1: TcxEditRepositorySpinItem;
    cxEditRepository1TrackBar1: TcxEditRepositoryTrackBar;
    cxEditRepository1LookupComboBoxItem1: TcxEditRepositoryLookupComboBoxItem;
    gx_Save: TdxLayoutGroup;
    Btn_Rzr_Save: TcxButton;
    RZR_Save
      : TdxLayoutItem;
    Btn_Rzr_Init: TcxButton;
    RZR_Init
      : TdxLayoutItem;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    dxColorDialog1: TdxColorDialog;
    SP_CONTROL: TADStoredProc;
    SP_AFTER
      : TADStoredProc;
    wq_Soft_ini: TADQuery;
    cxPropertiesStore1: TcxPropertiesStore;
    cxLookAndFeelController1: TcxLookAndFeelController;
    dxSkinController1: TdxSkinController;
    cxEditStyleController1: TcxEditStyleController;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    cxImageList1: TcxImageList;
    SP_VALIDATE: TADStoredProc;
    procedure Init;
    procedure Chargement;
    procedure Transfert_Ico;
    Procedure Reload(Origine: string);
    procedure Close;
    procedure FormCreate(Sender: TObject);
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Voir_Fiche(N_fiche: Integer; Fiche: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure AdvPanelFiltresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AutosizeExecute(Sender: TObject);
    procedure FieldValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FieldButtonClick(Sender: TObject);
    procedure Btn_Rzr_SaveClick(Sender: TObject);
    procedure Btn_Rzr_InitClick(Sender: TObject);
    procedure Update(Sender: TObject; N_Params: Integer; DisplayValue: Variant; Temp: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure Valide_Saisie(Fermeture, Refesh: Boolean; Origine: string);
    procedure cxRichEditExit(Sender: TObject);
    procedure cxRichEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    Function Caption_Replace(Msg: string): String;
    Function Validate(Sender: TObject; DisplayValue: Variant; Field_Name: string; N_Params: Integer): Integer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Param_Actif: string;
    Index_Lang: string;
    aAutosize: string;
    N_Resizer: Integer;
    Captions_List: Tstringlist;
    Mem_Choix_Before: Integer;
    Origine_Close: String;
  public
    Tab_Filtre: array [0 .. 9] of ansistring;
    Tab_Params: array [0 .. 9] of ansistring;
    ID_Session_Temp: String;
    Filtre_Plus: ansistring;
    Mem_Filtre_Plus: ansistring;
    Code_Session: ansistring;
    ApplicationHandle: Integer;
    Admin: string;
    Form_caption: ansistring;
    Info_actif: Boolean;
    fin_init: Boolean;
    Fields_Update: Tstringlist;
    Timer: Integer;
  end;
var
    F_Params2: TF_Params2;
implementation
uses
  MAIN,
  WM_GENESYS,
  U_Info;
{$R *.DFM}
procedure TF_Params2.Transfert_Ico;
var
    i: Integer;
  Ico: Ticon;
begin
    Ico := Ticon.Create;
  for i := 0 to 128
    do
    begin
      form1.IconeListePNG.GetIcon(0, Ico);
    cxImageList1.AddIcon(Ico);
  end;
  for i := 0 to form1.IconeListePNG.Count - 1
    do
    begin
      form1.IconeListePNG.GetIcon(i, Ico);
    cxImageList1.AddIcon(Ico);
  end;
  if Ico <> nil then
    Ico := nil;
end;
procedure TF_Params2.Init;
var
    Param: TADParam;
  j: Integer;
  AStream: TMemoryStream;
begin
    wq_Soft_ini.Open();
  ID_Session_Temp := form1.ID_Session;
  Mem_Choix_Before := wsp_Filtres.ParamByName('@Choix_Before').AsInteger;
  SP_CONTROL.StoredProcName := wsp_Filtres.StoredProcName + '_CONTROL';
  With SP_CONTROL
    do
    begin
      Param := Params.Add;
    Param.Name := '@RETURN_VALUE';
    Param.DataType := ftInteger;
    Param.ParamType := ptResult;
    Param := Params.Add;
    Param.Name := '@cle';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@cle').AsInteger;
    Param := Params.Add;
    Param.Name := '@N_User';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@cle').AsInteger; ;
    Param := Params.Add;
    Param.Name := '@P1';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@P1').asstring;
    Param := Params.Add;
    Param.Name := '@P2';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@P1').asstring;
    Param := Params.Add;
    Param.Name := '@Choix_Before';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.
      Value := wsp_Filtres.ParamByName('@Choix_Before').AsInteger;
    Param := Params.Add;
    Param.Name := '@ID_Session';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@ID_Session').asstring;
    Param := Params.Add;
    Param.Name := '@ID_Session_Temp';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.
      Value := ID_Session_Temp;
    Param := Params.Add;
    Param.Name := '@Field_Name_Refresh';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
  end;
  SP_AFTER
    .StoredProcName := wsp_Filtres.StoredProcName + '_AFTER';
  With SP_AFTER
    do
    begin
      Param := Params.Add;
    Param.Name := '@RETURN_VALUE';
    Param.DataType := ftInteger;
    Param.ParamType := ptResult;
    Param := Params.Add;
    Param.Name := '@cle';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@cle').AsInteger;
    Param := Params.Add;
    Param.Name := '@N_User';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@cle').AsInteger; ;
    Param := Params.Add;
    Param.Name := '@P1';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@P1').asstring;
    Param := Params.Add;
    Param.Name := '@P2';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@P1').asstring;
    Param := Params.Add;
    Param.Name := '@Choix_Before';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.
      Value := wsp_Filtres.ParamByName('@Choix_Before').AsInteger;
    for j := 0 to 8
      do
      begin
        Param := Params.Add;
      Param.Name := '@Param' + inttostr(j);
      Param.DataType := ftString;
      Param.ParamType := ptInputOutput;
    end;
    Param := Params.Add;
    Param.Name := '@ID_Session';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@ID_Session').asstring;
    Param := Params.Add;
    Param.Name := '@ID_Session_Temp';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.
      Value := ID_Session_Temp;
  end;
  SP_VALIDATE
    .StoredProcName := wsp_Filtres.StoredProcName + '_VALIDATE';
  With SP_VALIDATE
    do
    begin
      Param := Params.Add;
    Param.Name := '@RETURN_VALUE';
    Param.DataType := ftInteger;
    Param.ParamType := ptResult;
    Param := Params.Add;
    Param.Name := '@cle';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@cle').AsInteger;
    Param := Params.Add;
    Param.Name := '@N_User';
    Param.DataType := ftInteger;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@cle').AsInteger; ;
    Param := Params.Add;
    Param.Name := '@P1';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@P1').asstring;
    Param := Params.Add;
    Param.Name := '@P2';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@P1').asstring;
    Param := Params.Add;
    Param.Name := '@ID_Session';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := wsp_Filtres.ParamByName('@ID_Session').asstring;
    Param := Params.Add;
    Param.Name := '@ID_Session_Temp';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.
      Value := ID_Session_Temp;
    Param := Params.Add;
    Param.Name := '@Field_Name_Refresh';
    Param.DataType := ftString;
    Param.ParamType := ptInput;
    Param.Value := '';
    Param := Params.Add;
    Param.Name := '@Value';
    Param.DataType := ftMemo;
    Param.ParamType := ptInput;
  end;
  Caption
    := wsp_Filtres.FieldByName('Caption').AsAnsiString;
  Captions_List := Tstringlist.Create;
  Transfert_Ico;
  Chargement;
end;
procedure TF_Params2.Chargement;
var
    Param: TADParam;
  FLibre: TcxTextEdit;
  FCheck: TcxCheckBox;
  FRich: TcxRichEdit;
  FShell: TcxShellComboBox;
  Fdate: TcxDateEdit;
  FSpin: TcxSpinEdit;
  Fcalc: TcxCalcEdit;
  Fnum
    : TcxCurrencyEdit;
  Ftoggle: TdxToggleSwitch;
  Fcolor
    : TdxColorEdit;
  FComboBox: TcxComboBox;
  FTrackBar: tcxTrackBar;
  Fbutton: TcxButton;
  AStream: TMemoryStream;
  Item: TdxLayoutItem;
  Field_Name: string;
  Creation: Boolean;
  Controle: Tcontrol;
  List: Tstringlist;
  Read_only: Boolean;
  Format: String;
  TxtFonte: String;
  TxtFonteTaille: Integer;
  TxtColorFond: Integer;
  TxtColorTexte: Integer;
  TxtStyleTexte: Integer;
  Caption_Text: string;
  Caption_index: Integer;
  j: Integer;
  i
    : Integer;
  Year: Word;
  Month: Word;
  Day: Word;
begin
    fin_init := False;
  if Fields_Update = nil then
    begin
      Fields_Update := Tstringlist.Create;
  end;
  // Init
  // Si on a un timer on l'active
  if Timer > 0 then
    begin
      Timer1.Interval := Timer;
    Timer1.Enabled := True;
  end;
  // Efface
  wq_update.sql.clear;
  wsp_Filtres.First;
  Admin := wsp_Filtres.FieldByName('Administrateur').asstring;
  N_Resizer := wsp_Filtres.FieldByName('N_Resizer').AsInteger;
  while
    not wsp_Filtres.Eof
    do
    begin
    if wsp_Filtres.FieldByName('Field_Name').asstring <> '' then
      begin
        Field_Name := wsp_Filtres.FieldByName('Field_Name').asstring;
      Creation := False;
      // Info Read Only
      Read_only := False;
      if wsp_Filtres.FindField('Rzr_ReadOnly') <> nil then
        begin
        if wsp_Filtres.FieldByName('Rzr_ReadOnly').asstring = 'Oui' then
          begin
            Read_only := True;
        end
      end;
      // Format
      Format := '';
      if wsp_Filtres.FindField('Rzr_Format') <> nil then
        begin
          Format := wsp_Filtres.FieldByName('Rzr_Format').asstring;
      end;
      // Mise en forme
      TxtFonte := '';
      TxtFonteTaille := 0;
      TxtColorFond := 0;
      TxtColorTexte := 0;
      TxtStyleTexte := 0;
      if wsp_Filtres.FindField('Rzr_TxtFonte') <> nil then
        begin
          TxtFonte := wsp_Filtres.FieldByName('Rzr_TxtFonte').asstring;
      end;
      if
        wsp_Filtres.FindField('Rzr_TxtFonteTaille') <> nil then
        begin
          TxtFonteTaille := wsp_Filtres.FieldByName('Rzr_TxtFonteTaille').AsInteger;
      end;
      if wsp_Filtres.FindField('Rzr_TxtColorFond') <> nil then
        begin
          TxtColorFond := wsp_Filtres.FieldByName('Rzr_TxtColorFond').AsInteger;
      end;
      if wsp_Filtres.FindField('Rzr_TxtColorTexte') <> nil then
        begin
          TxtColorTexte := wsp_Filtres.FieldByName('Rzr_TxtColorTexte').AsInteger;
      end;
      if wsp_Filtres.FindField('Rzr_TxtStyleTexte') <> nil then
        begin
          TxtStyleTexte := wsp_Filtres.FieldByName('Rzr_TxtStyleTexte').AsInteger;
      end;
      Item
        := (lcMain.FindItem('Item' + Field_Name) as TdxLayoutItem);
      if Item = nil then
        begin
          Creation := True;
      end;
      lcMain.BeginUpdate;
      //
      // LIBRE
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 1 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxTextEdit.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxTextEdit.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        FLibre := (Controle as TcxTextEdit);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        FLibre.RepositoryItem := cxEditRepository1TextItem1;
        FLibre.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        FLibre.RepositoryItem := nil;
        FLibre.Text := wsp_Filtres.FieldByName('Field_Value_Txt').asstring;
        // Format
        if Format <> '' then
          begin
            FLibre.Properties.EditFormat := Format;
          FLibre.Properties.DisplayFormat := Format;
        end;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            FLibre.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            FLibre.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            FLibre.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            FLibre.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        FLibre.Enabled := not(Read_only);
        FLibre.Properties.ErrorIcon.Assign(cxEditWarningIcon);
        // Evenements
        FLibre.Properties.OnValidate := FieldValidate;
        FLibre.ValidateEdit(False)
      end;
      //
      // CHECK
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 2 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxCheckBox.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxCheckBox.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        FCheck := (Controle as TcxCheckBox);
        Item.CaptionOptions.Layout := clright;
        Item.Caption := Field_Name;
        FCheck.RepositoryItem := cxEditRepository1CheckBoxItem1;
        FCheck.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        FCheck.RepositoryItem := nil;
        if wsp_Filtres.FieldByName('Field_Value_Txt').asstring = 'Oui' then
          begin
            FCheck.Checked := True;
        end
        else
          begin
            FCheck.Checked := False;
        end;
        FCheck.Caption := Field_Name;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            FCheck.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            FCheck.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            FCheck.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            FCheck.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        FCheck.Enabled := not(Read_only);
        // Evenements
        FCheck.Properties.OnValidate := FieldValidate;
      end;
      //
      // MEM0
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 3 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxRichEdit.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxRichEdit.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        FRich := (Controle as TcxRichEdit);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        FRich
          .
          RepositoryItem := cxEditRepository1RichItem1;
        FRich.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        FRich
          .RepositoryItem := nil;
        try
          AStream := TMemoryStream.Create;
          TMemoField(wsp_Filtres.FieldByName('Field_Value_Txt')).SaveToStream(AStream);
          AStream.Position := 0;
          FRich.Lines.LoadFromStream(AStream);
        finally
          if AStream <> nil then
            FreeAndNil(AStream);
        end;
        // Police et taille
        if TxtFonte <> '' then
          begin
            FRich.Style.Font.name := TxtFonte;
        end
        else
          begin
            FRich.Style.Font.name := wq_Soft_ini.FieldByName('FonteMemo').asstring;
        end;
        if TxtFonteTaille <> 0 then
          begin
            FRich.Style.Font.Size := TxtFonteTaille;
        end
        else
          begin
            FRich.Style.Font.Size := wq_Soft_ini.FieldByName('FonteMemoTaille').AsInteger;
        end;
        // Read Only
        FRich.Properties.ReadOnly := Read_only;
        // Evenements
        FRich.Properties.OnEditValueChanged := cxRichEdit1PropertiesEditValueChanged;
        FRich
          .OnExit := cxRichEditExit;
      end;
      //
      // SHELL COMBO
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 4 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxShellComboBox.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxShellComboBox.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        FShell := (Controle as TcxShellComboBox);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        FShell.RepositoryItem := cxEditRepository1ShellComboBoxItem1;
        FShell.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        FShell.RepositoryItem := nil;
        FShell.Text := wsp_Filtres.FieldByName('Field_Value_Txt').asstring;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            FShell.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            FShell.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            FShell.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            FShell.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        FShell.Enabled := not(Read_only);
        // Evenements
        FShell.Properties.OnValidate := FieldValidate;
      end;
      //
      // DATE
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 5 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxDateEdit.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxDateEdit.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        Fdate := (Controle as TcxDateEdit);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        Fdate
          .
          RepositoryItem := cxEditRepository1DateItem1;
        Fdate.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        Fdate
          .RepositoryItem := nil;
        decodedate(wsp_Filtres.FieldByName('Field_Value_Date').asdatetime, Year, Month, Day);
        if Year > 1901 then
          begin
            Fdate
            .Date := wsp_Filtres.FieldByName('Field_Value_Date').asdatetime;
        end
        else
          begin
            Fdate.clear;
        end;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            Fdate.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            Fdate.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            Fdate.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            Fdate.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        Fdate.Enabled := not(Read_only);
        // Evenements
        Fdate.Properties.OnValidate := FieldValidate;
      end;
      //
      // ENTIER
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 6 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxSpinEdit.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxSpinEdit.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        FSpin := (Controle as TcxSpinEdit);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        FSpin
          .
          RepositoryItem := cxEditRepository1SpinItem1;
        FSpin.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        FSpin
          .RepositoryItem := nil;
        FSpin.Value := round(wsp_Filtres.FieldByName('Field_Value_Num').AsFloat);
        // Mise en forme
        if TxtFonte <> '' then
          begin
            FSpin.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            FSpin.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            FSpin.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            FSpin.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        FSpin.Enabled := not(Read_only);
        // Evenements
        FSpin.Properties.OnValidate := FieldValidate;
      end;
      //
      // NUM AVEC CALC
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 7 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxCalcEdit.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxCalcEdit.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        Fcalc := (Controle as TcxCalcEdit);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        Fcalc
          .
          RepositoryItem := cxEditRepository1CalcItem1;
        Fcalc.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        Fcalc
          .RepositoryItem := nil;
        Fcalc.Value := wsp_Filtres.FieldByName('Field_Value_Num').AsCurrency;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            Fcalc.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            Fcalc.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            Fcalc.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            Fcalc.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        Fcalc.Enabled := not(Read_only);
        // Format
        if Format <> '' then
          begin
            Fcalc.Properties.EditFormat := Format;
          Fcalc.Properties.DisplayFormat := Format;
        end;
        // Evenements
        Fcalc.Properties.OnValidate := FieldValidate;
      end;
      //
      // NUM
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 8 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxCurrencyEdit.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxCurrencyEdit.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        Fnum
          := (Controle as TcxCurrencyEdit);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        Fnum.RepositoryItem
          := cxEditRepository1CurrencyItem1;
        Fnum.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        Fnum.RepositoryItem := nil;
        Fnum.Value := wsp_Filtres.FieldByName('Field_Value_Num').AsCurrency;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            Fnum.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            Fnum.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            Fnum.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            Fnum.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        Fnum.Enabled := not(Read_only);
        // Format
        if Format <> '' then
          begin
            Fnum.Properties.EditFormat := Format;
          Fnum.Properties.DisplayFormat := Format;
        end;
        // Evenements
        Fnum
          .Properties.OnValidate := FieldValidate;
      end;
      //
      // SWITCH
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 9 then
        begin
        if (Item = nil) Then
          begin
            Controle := TdxToggleSwitch.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TdxToggleSwitch.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        Ftoggle := (Controle as TdxToggleSwitch);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        Ftoggle.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        Ftoggle.RepositoryItem := nil;
        if wsp_Filtres.FieldByName('Field_Value_Txt').asstring = 'Oui' then
          begin
            Ftoggle.Checked := True;
        end
        else
          begin
            Ftoggle.Checked := False;
        end;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            Ftoggle.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            Ftoggle.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            Ftoggle.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            Ftoggle.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        Ftoggle.Enabled := not(Read_only);
        // Evenements
        Ftoggle.Properties.OnValidate := FieldValidate;
      end;
      //
      // Liste couleur
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 10 then
        begin
        if (Item = nil) Then
          begin
            Controle := TdxColorEdit.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TdxColorEdit.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        Fcolor := (Controle as TdxColorEdit);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        Fcolor.RepositoryItem := cxEditRepository1ColorEdit1;
        Fcolor.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        Fcolor.RepositoryItem := nil;
        Fcolor.ColorValue := round(wsp_Filtres.FieldByName('Field_Value_Num').AsCurrency);
        // Read Only
        Fcolor.Enabled := not(Read_only);
        // Evenements
        Fcolor.Properties.OnValidate := FieldValidate;
      end;
      //
      // COMBO SEP ;
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 11 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxComboBox.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxComboBox.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        FComboBox := (Controle as TcxComboBox);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        FComboBox.RepositoryItem := cxEditRepository1ComboBoxItem1;
        FComboBox.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        FComboBox.RepositoryItem := nil;
        FComboBox.Properties.Items.Delimiter := ';';
        FComboBox.Properties.Items.StrictDelimiter := True;
        FComboBox.Properties.Items.DelimitedText := wsp_Filtres.FieldByName('Rzr_List').asstring;
        FComboBox.Text := wsp_Filtres.FieldByName('Field_Value_Txt').asstring;
        // Mise en forme
        if TxtFonte <> '' then
          begin
            FComboBox.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            FComboBox.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            FComboBox.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            FComboBox.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        FComboBox.Enabled := not(Read_only);
        // Evenements
        FComboBox.Properties.OnValidate := FieldValidate;
      end;
      //
      // TRACKBAR
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 12 then
        begin
        if (Item = nil) Then
          begin
            Controle := tcxTrackBar.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := tcxTrackBar.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        FTrackBar := (Controle as tcxTrackBar);
        Item.CaptionOptions.Layout := clTop;
        Item.Caption := Field_Name;
        FTrackBar.RepositoryItem := cxEditRepository1TrackBar1;
        FTrackBar.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        FTrackBar.RepositoryItem := nil;
        FTrackBar.Position := round(wsp_Filtres.FieldByName('Field_Value_Num').AsCurrency);
        // Mise en forme
        if TxtFonte <> '' then
          begin
            FTrackBar.Style.Font.Name := TxtFonte;
        end;
        if TxtFonteTaille <> 0 then
          begin
            FTrackBar.Style.Font.Size := TxtFonteTaille;
        end;
        if TxtColorFond <> 0 then
          begin
            FTrackBar.Style.Color := TxtColorFond;
        end;
        if TxtColorTexte <> 0 then
          begin
            FTrackBar.Style.Font.Color := TxtColorTexte;
        end;
        // Read Only
        FTrackBar.Enabled := not(Read_only);
        // Evenements
        FTrackBar.Properties.OnValidate := FieldValidate;
      end;
      //
      // BUTTON
      //
      if wsp_Filtres.FieldByName('Field_Form').AsInteger = 13 then
        begin
        if (Item = nil) Then
          begin
            Controle := TcxButton.Create(self);
          Controle.name := Field_Name;
          Item := lcMain.CreateItemForControl(Controle, grp_General);
        end
        else
          begin
          if Item.Control = nil then
            begin
              Controle := TcxButton.Create(self);
            Controle.name := Field_Name;
            Item.Control := Controle;
          end
          else
            begin
              Controle := Item.Control;
          end;
        end;
        Fbutton := (Controle as TcxButton);
        Item.CaptionOptions.Visible := False;
        Item.Caption := Field_Name;
        Fbutton.Tag := wsp_Filtres.FieldByName('N_Params').AsInteger;
        Fbutton.OptionsImage.Images := cxImageList1;
        Fbutton.OptionsImage.ImageIndex := wsp_Filtres.FieldByName('Rzr_ImgIdx').AsInteger;
        if wsp_Filtres.FindField('Rzr_Alignement') <> nil then
          begin
          if uppercase(wsp_Filtres.FindField('Rzr_Alignement').asstring) = 'TOP' then
            Fbutton.OptionsImage.Layout := blGlyphtop;
          if uppercase(wsp_Filtres.FindField('Rzr_Alignement').asstring) = 'LEFT' then
            Fbutton.OptionsImage.Layout := blGlyphleft;
          if uppercase(wsp_Filtres.FindField('Rzr_Alignement').asstring) = 'RIGHT' then
            Fbutton.OptionsImage.Layout := blGlyphright;
          if uppercase(wsp_Filtres.FindField('Rzr_Alignement').asstring) = 'BOTTOM' then
            Fbutton.OptionsImage.Layout := blGlyphbottom;
        end;
        // Read Only
        Fbutton.Enabled := not(Read_only);
        Fbutton
          .OnClick := FieldButtonClick;
      end;
      Item.Name := 'Item' + Field_Name;
      Item.CaptionOptions.Visible := True;
      Item
        .CaptionOptions.ImageIndex := wsp_Filtres.FieldByName('Rzr_ImgIdx').AsInteger;
      if (Item.Control is TcxCheckBox) then
        begin
          Item.CaptionOptions.Visible := False; (Item.Control as TcxCheckBox)
        .Caption := Item.Caption;
      end;
      if (Item
          .Control is TdxToggleSwitch) then
        begin
          Item
          .CaptionOptions.Visible := False; (Item.Control as TdxToggleSwitch)
        .Caption := Item.Caption;
      end;
      if (Item.Control is TcxButton) then
        begin
          Item.CaptionOptions.Visible := False; (Item.Control as TcxButton)
        .Caption := Item.Caption;
      end;
      if wsp_Filtres.FindField('Rzr_Item_Visible') <> nil then
        begin
        if wsp_Filtres.FieldByName('Rzr_Item_Visible').asstring = 'Oui' then
          begin
            Item.Visible := True;
        end
        else
          begin
            Item.Visible := False;
        end;
      end;
      lcMain.EndUpdate;
      Captions_List.Sort;
      if Captions_List.IndexOf(Field_Name) < 0 then
        begin
          Captions_List.AddObject(Field_Name, Item);
      end;
    end;
    wsp_Filtres.Next;
  end;
  // Ouverture de la table des resizer
  wq_Resizer.Close;
  wq_Resizer.sql.Add('SELECT * FROM EGXS_TB_CFG_PARAMS2_RESIZER WHERE N_Resizer=' + inttostr(N_Resizer));
  Try
    wq_Resizer.Open;
  except
    Application.HandleException(self);
    Origine_Close := 'ERR';
    Close;
  End;
  if wq_Resizer.active = True then
    begin
    if wq_Resizer.FieldByName('Resizer' + Index_Lang).asstring <> '' then
      begin
      try
        AStream := TMemoryStream.Create;
        TMemoField(wq_Resizer.FieldByName('Resizer' + Index_Lang)).SaveToStream(AStream);
        AStream.Position := 0;
        lcMain.BeginUpdate;
        lcMain.LoadFromStream(AStream);
        aAutosize := 'Oui';
        AutosizeExecute(self);
        lcMain.EndUpdate;
      finally
        if AStream <> nil then
          FreeAndNil(AStream);
      end;
    end
    else
      begin
        aAutosize := 'Oui';
      AutosizeExecute(self);
    end;
  end
  else
    begin
      aAutosize := 'Oui';
    AutosizeExecute(self);
  end;
  lcMain.BeginUpdate;
  for i := 0 to Captions_List.Count - 1
    do
    begin
      Item
      := (Captions_List.Objects[i] as TdxLayoutItem);
    if Item.Visible = False then
      begin
        Item.CaptionOptions.Visible := False;
    end;
    if (Item.Control is TcxCheckBox) then
      begin (Item.Control as TcxCheckBox)
      .Caption := Item.Caption;
    end;
    if (Item.Control is TdxToggleSwitch) then
      begin (Item.Control as TdxToggleSwitch)
      .Caption := Item.Caption;
    end;
    if (Item.Control is TcxButton) then
      begin (Item.Control as TcxButton)
      .Caption := Item.Caption;
      Item.CaptionOptions.Visible := False;
    end;
  end;
  lcMain
    .EndUpdate();
  fin_init := True;
end;
procedure TF_Params2.CreateParams(var Params: TCreateParams);
begin
  // permet l'affichage en avant par surcharge de la procedure createparams
  inherited CreateParams(Params);
  with Params
    do
    begin
      ExStyle := ExStyle or WS_EX_APPWINDOW;
    WndParent
      := GetDesktopWindow;
  end;
end;
procedure TF_Params2.WMSysCommand(var Msg: TWMSysCommand);
begin
  if Msg.CmdType = SC_MINIMIZE then
    ShowWindow(Handle, SW_MINIMIZE)
  else
    inherited;
end;
procedure TF_Params2.cxButton1Click(Sender: TObject);
begin
    Valide_Saisie(True, False, 'OK');
end;
procedure TF_Params2.cxButton2Click(Sender: TObject);
begin
    F_Params2.ModalResult := mrcancel;
  Origine_Close := 'CANCEL';
  Close;
end;
Function TF_Params2.Caption_Replace(Msg: string): String;
var
    Field_Name: string;
  Item: tdxcustomlayoutitem;
  Caption_index: Integer;
begin
  if pos('{', Msg) > 0 then
    begin
      Field_Name := copy(Msg, pos('{', Msg) + 1, pos('}', Msg) - pos('{', Msg) - 1);
    Captions_List.Sort;
    Caption_index := Captions_List.IndexOf(Field_Name);
    if Caption_index >= 0 then
      begin
        Item := (Captions_List.Objects[Caption_index] as tdxcustomlayoutitem);
      Caption_Replace := stringreplace(Msg, '{' + Field_Name + '}', Item.Caption, [rfReplaceAll, rfIgnoreCase]);
    end;
  end
  else
    begin
      Caption_Replace := Msg;
  end;
end;
procedure TF_Params2.Valide_Saisie(Fermeture, Refesh: Boolean; Origine: string);
var
    i: Integer;
  N_Params: Integer;
  Param
    : TADParam;
  Choix_Msg: Integer;
  j: Integer;
  Msg
    : string;
begin
    Choix_Msg := -999;
  if
    form1.Procedure_Exist(SP_CONTROL.StoredProcName) then
    begin
      SP_CONTROL.ParamByName('@Field_Name_Refresh').asstring := Origine;
    SP_CONTROL
      .ParamByName('@ID_Session_Temp').asstring := ID_Session_Temp;
    SP_CONTROL.Open;
    if
      (SP_CONTROL.FieldByName('Msg').asstring <> '') then
      begin
        Msg := Caption_Replace(SP_CONTROL.FieldByName('Msg').asstring);
      Choix_Msg := Application.MessageBox(PChar(Msg), PChar(SP_CONTROL.FieldByName('Caption').asstring), SP_CONTROL.FieldByName('Flags').AsInteger + MB_TOPMOST);
    end;
    if
      (SP_CONTROL.FieldByName('Result').AsInteger = 0) then
      begin
        SP_CONTROL.Close;
      Exit;
    end;
    if
      (SP_CONTROL.FieldByName('Result').AsInteger = 2) then
      begin
        SP_CONTROL.Close;
      Reload('SP_CONTROL');
      Exit;
    end;
    SP_CONTROL.Close;
  end;
  for i := 0 to Fields_Update.Count - 1
    do
    begin
      wq_update.sql.clear;
    wq_update.sql.Add('UPDATE T');
    wq_update.sql.Add('SET Field_Value = tp.Field_Value');
    wq_update.sql.Add(',Field_Value_Txt = tp.Field_Value_Txt');
    wq_update.sql.Add(',Field_Value_Num = tp.Field_Value_Num');
    wq_update.sql.Add(',Field_Value_Date = tp.Field_Value_Date');
    wq_update.sql
      .Add(',N_User_Modif = ' + inttostr(form1.N_user));
    wq_update.sql.Add(',Date_Modif = Getdate()');
    wq_update.sql.Add(',ID_Session = ' + quotedstr(form1.ID_Session));
    wq_update
      .sql
      .Add('FROM ' + stringreplace(wsp_Filtres.StoredProcName, '_SP_', '_TB_', [rfIgnoreCase]) + ' T');
    wq_update
      .sql
      .Add('INNER JOIN ' + stringreplace(wsp_Filtres.StoredProcName, '_SP_', '_TB_', [rfIgnoreCase]) + '_TEMP Tp on T.N_params=tp.n_params and TP.ID_Session_Temp = ' + quotedstr(ID_Session_Temp));
    wq_update.sql.
      Add('WHERE t.N_Params = ' + Fields_Update.Strings[i]);
    wq_update.ExecSQL;
  end;
  Fields_Update.clear;
  if form1.Procedure_Exist(SP_AFTER.StoredProcName) then
    begin
    if Choix_Msg <> -999 then
      begin
        SP_AFTER.ParamByName('@Choix_Before').AsInteger := Choix_Msg;
    end;
    SP_AFTER.ParamByName('@ID_Session_Temp').asstring := ID_Session_Temp;
    SP_AFTER.ExecProc;
    Tab_Params[0] := SP_AFTER.ParamByName('@Param0').asstring;
    Tab_Params[1] := SP_AFTER.ParamByName('@Param1').asstring;
    Tab_Params[2] := SP_AFTER.ParamByName('@Param2').asstring;
    Tab_Params[3] := SP_AFTER.ParamByName('@Param3').asstring;
    Tab_Params[4] := SP_AFTER.ParamByName('@Param4').asstring;
    Tab_Params[5] := SP_AFTER.ParamByName('@Param5').asstring;
    Tab_Params[6] := SP_AFTER.ParamByName('@Param6').asstring;
    Tab_Params[7] := SP_AFTER.ParamByName('@Param7').asstring;
    Tab_Params[8] := SP_AFTER.ParamByName('@Param8').asstring;
  end;
  if Fermeture = True then
    begin
      F_Params2.ModalResult := mrok;
    Origine_Close := 'OK';
    Close;
  end
  else
    begin
    if Refesh = True then
      begin
        ID_Session_Temp := form1.GetID_Session;
      Reload(Origine);
    end;
  end;
end;
{
  ---------------------------------------------------------------------
  GESTION DU RESIZER
  ---------------------------------------------------------------------
  }
procedure TF_Params2.Btn_Rzr_SaveClick(Sender: TObject);
Var
    AStream: TMemoryStream;
begin
  // Init
  if wq_Resizer.active = True then
    begin
    try
      AStream := TMemoryStream.Create;
      AStream.Position := 0;
      lcMain.SaveToStream(AStream);
      // Récupère le filtre en cours
      wq_Resizer.Edit;
      TMemoField(wq_Resizer.FieldByName('Resizer' + Index_Lang)).LoadFromStream(AStream);
      wq_Resizer.Post;
      wq_Resizer.ApplyUpdates;
    finally
      if AStream <> nil then
        FreeAndNil(AStream);
    end;
  end;
  gx_Save.Visible := False;
  Reload('F5');
end;
procedure TF_Params2.Btn_Rzr_InitClick(Sender: TObject);
Var
    AStream: TMemoryStream;
begin
  // Init
  if wq_Resizer.active = True then
    begin
      wq_Resizer.Edit;
    wq_Resizer.FieldByName('Resizer' + Index_Lang).asstring := '';
    wq_Resizer.Post;
    wq_Resizer.ApplyUpdates;
  end;
end;
Function TF_Params2.Validate(Sender: TObject; DisplayValue: Variant; Field_Name: string; N_Params: Integer): Integer;
var
    Choix_Msg: Integer;
  j: Integer;
  Msg
    : string;
begin
    Choix_Msg := -999;
  Validate := 1;
  if form1
    .Procedure_Exist(SP_VALIDATE.StoredProcName) then
    begin
      Mem_Choix_Before := -1;
    SP_VALIDATE.ParamByName('@ID_Session_Temp').asstring := ID_Session_Temp;
    SP_VALIDATE.ParamByName('@Field_Name_Refresh').asstring := Field_Name;
    SP_VALIDATE.ParamByName('@Value').AsMemo := DisplayValue;
    SP_VALIDATE.Open;
    if
      (SP_VALIDATE.FieldByName('Msg').asstring <> '') then
      begin
        Msg := Caption_Replace(SP_VALIDATE.FieldByName('Msg').asstring);
      Choix_Msg := Application.MessageBox(PChar(Msg), PChar(SP_VALIDATE.FieldByName('Caption').asstring), SP_VALIDATE.FieldByName('Flags').AsInteger + MB_TOPMOST);
    end;
    if Choix_Msg <> -999 then
      begin
        Mem_Choix_Before := Choix_Msg;
    end;
    Validate := SP_VALIDATE.FieldByName('Result').AsInteger;
    SP_VALIDATE.Close;
  end;
end;
{
  ---------------------------------------------------------------------
  VALIDATION D UN MEMO
  ---------------------------------------------------------------------
  }
procedure TF_Params2.cxRichEdit1PropertiesEditValueChanged(Sender: TObject);
Var
    N_Params: Integer;
  Nom_champ: string;
begin
  if fin_init = False then
    Exit;
  N_Params := (Sender as Tcontrol).Tag;
  Fields_Update.Sort;
  if Fields_Update.IndexOf(inttostr(N_Params)) < 0 then
    begin
      Fields_Update.Add(inttostr(N_Params));
  end;
end;
procedure TF_Params2.cxRichEditExit(Sender: TObject);
Var
    N_Params: Integer;
  Nom_champ: string;
  Validate_Result: Integer;
  DisplayValue: string;
begin
  if fin_init = False then
    Exit;
  N_Params := (Sender as Tcontrol).Tag;
  if wsp_Filtres.Locate('N_Params', N_Params, []) = True Then
    begin
      Nom_champ := wsp_Filtres.FieldByName('Field_Name').AsAnsiString;
    Fields_Update.Sort;
    if Fields_Update.IndexOf(inttostr(N_Params)) >= 0 then
      begin
      if wsp_Filtres.FindField('Rzr_Validate') <> nil then
        begin
        if wsp_Filtres.FieldByName('Rzr_Validate').asstring = 'Oui' then
          begin
            DisplayValue := (Sender as TcxRichEdit).Lines.Text;
          Validate_Result := Validate(Sender, DisplayValue, Nom_champ, N_Params);
          if Validate_Result = 0 then
            begin
              Exit;
          end;
          if Validate_Result = 2 then
            begin
              Reload(Nom_champ + '-Validate');
            Exit;
          end;
        end;
      end;
      Update(Sender, N_Params, (Sender as TcxRichEdit).Lines.Text, True);
      // Reload si Demande
      if wsp_Filtres
        .FieldByName('Rzr_RefreshOnChange').asstring = 'Oui' then
        begin
          Reload(Nom_champ);
      end;
    end;
  end;
end;
{
  ---------------------------------------------------------------------
  VALIDATION D UN CHAMP
  ---------------------------------------------------------------------
}
procedure TF_Params2.FieldValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
Var
    N_Params: Integer;
  Nom_champ: string;
  Validate_Result: Integer;
begin
  if fin_init = False then
    Exit;
  N_Params := (Sender as Tcontrol).Tag;
  if wsp_Filtres.Locate('N_Params', N_Params, []) = True Then
    begin
      Nom_champ := wsp_Filtres.FieldByName('Field_Name').AsAnsiString;
    if wsp_Filtres.FindField('Rzr_Validate') <> nil then
      begin
      if wsp_Filtres.FieldByName('Rzr_Validate').asstring = 'Oui' then
        begin
          Validate_Result := Validate(Sender, DisplayValue, Nom_champ, N_Params);
        if Validate_Result = 0 then
          begin
            Error := True;
          Exit;
        end;
        if Validate_Result = 2 then
          begin
            Reload(Nom_champ + '-Validate');
          Exit;
        end;
      end;
    end;
    Update(Sender, N_Params, DisplayValue, True);
    Fields_Update.Sort;
    if Fields_Update.IndexOf(inttostr(N_Params)) < 0 then
      begin
        Fields_Update.Add(inttostr(N_Params));
    end;
    // Reload si Demande
    if wsp_Filtres.FieldByName('Rzr_RefreshOnChange').asstring = 'Oui' then
      begin
        Reload(Nom_champ);
    end;
  end;
end;
procedure TF_Params2.FieldButtonClick(Sender: TObject);
Var
    N_Params: Integer;
  Nom_champ: String;
  Fermeture: Boolean;
  Refresh: Boolean;
  Validate_Result: Integer;
begin
    N_Params := (Sender as Tcontrol).Tag;
  if wsp_Filtres.Locate('N_Params', N_Params, []) = True Then
    begin
      Nom_champ := wsp_Filtres.FieldByName('Field_Name').AsAnsiString;
    if wsp_Filtres.FindField('Rzr_Validate') <> nil then
      begin
      if wsp_Filtres.FieldByName('Rzr_Validate').asstring = 'Oui' then
        begin
          Validate_Result := Validate(Sender, '', Nom_champ, N_Params);
        if Validate_Result = 0 then
          begin
            Exit;
        end;
        if Validate_Result = 2 then
          begin
            Reload(Nom_champ + '-Validate');
          Exit;
        end;
      end;
    end;
    if wsp_Filtres.FindField('Rzr_Result') <> nil then
      begin
      if
        pos('[OK]', wsp_Filtres.FieldByName('Rzr_Result').asstring) > 0 then
        begin
        if pos('[REFRESH]', wsp_Filtres.FieldByName('Rzr_Result').asstring) > 0 then
          begin
            Fermeture := False;
          Refresh := True;
        end
        else
          begin
            Fermeture := True;
        end;
        Valide_Saisie(Fermeture, Refresh, Nom_champ);
        Exit;
      end;
      if
        pos('[CANCEL]', wsp_Filtres.FieldByName('Rzr_Result').asstring) > 0 then
        begin
        if pos('[REFRESH]', wsp_Filtres.FieldByName('Rzr_Result').asstring) > 0 then
          begin
            ID_Session_Temp := form1.GetID_Session;
          Reload(Nom_champ);
          Exit;
        end
        else
          begin
            F_Params2.ModalResult := mrcancel;
          Origine_Close := 'CANCEL';
          Close;
          Exit;
        end;
      end;
    end;
    // Reload si Demande
    if wsp_Filtres.FindField('Rzr_RefreshOnChange') <> nil then
      begin
      if wsp_Filtres
        .FieldByName('Rzr_RefreshOnChange').asstring = 'Oui' then
        begin
          Reload(Nom_champ);
      end;
    end;
  end;
end;
Procedure TF_Params2.Reload(Origine: string);
var
    Msg: string;
  Choix_Msg: Integer;
  Fermeture: Boolean;
  Refresh: Boolean;
  Nom_champ: string;
begin
  if fin_init = False then
    Exit;
  wsp_Filtres.Close;
  wsp_Filtres.Unprepare;
  wsp_Filtres.ParamByName('@Choix_Before').AsInteger := Mem_Choix_Before;
  wsp_Filtres.ParamByName('@Field_Name_Refresh').AsAnsiString := Origine;
  wsp_Filtres.ParamByName('@ID_Session_Temp').asstring := ID_Session_Temp;
  wsp_Filtres.Open();
  if wsp_Filtres.FindField('Result') <> nil then
    begin
    if
      (wsp_Filtres.FieldByName('Msg').asstring <> '') then
      begin
        Msg := Caption_Replace(wsp_Filtres.FieldByName('Msg').asstring);
      Choix_Msg := Application.MessageBox(PChar(Msg), PChar(wsp_Filtres.FieldByName('Caption').asstring), wsp_Filtres.FieldByName('Flags').AsInteger + MB_TOPMOST);
    end;
    Exit;
  end;
  if wsp_Filtres.FindField('Btn_Action') <> nil then
    begin
      Nom_champ := wsp_Filtres.FieldByName('Field_Name_Refresh').asstring;
    if pos
      ('[OK]', wsp_Filtres.FieldByName('Btn_Action').asstring) > 0 then
      begin
      if
        pos('[REFRESH]', wsp_Filtres.FieldByName('Btn_Action').asstring) > 0 then
        begin
          Fermeture := False;
        Refresh := True;
      end
      else
        begin
          Fermeture := True;
      end;
      Valide_Saisie(Fermeture, Refresh, Nom_champ);
      Exit;
    end;
    if
      pos
      ('[CANCEL]', wsp_Filtres.FieldByName('Btn_Action').asstring) > 0 then
      begin
      if
        pos('[REFRESH]', wsp_Filtres.FieldByName('Btn_Action').asstring) > 0 then
        begin
          ID_Session_Temp := form1.GetID_Session;
        Reload(Nom_champ);
        Exit;
      end
      else
        begin
          F_Params2.ModalResult := mrcancel;
        Origine_Close := 'CANCEL';
        Close;
        Exit;
      end;
    end;
  end;
  Chargement;
end;
{
  ---------------------------------------------------------------------
  MISE A JOUR DE LA TABLE TEMP
  ---------------------------------------------------------------------
  }
procedure TF_Params2.Update(Sender: TObject; N_Params: Integer; DisplayValue: Variant; Temp: Boolean);
Var
    FLibre
    : TcxTextEdit;
  FCheck: TcxCheckBox;
  FRich: TcxRichEdit;
  FShell: TcxShellComboBox;
  Fdate: TcxDateEdit;
  FSpin: TcxSpinEdit;
  Fcalc: TcxCalcEdit;
  Fnum
    : TcxCurrencyEdit;
  Ftoggle: TdxToggleSwitch;
  Fcolor
    : TdxColorEdit;
  FComboBox: TcxComboBox;
  FTrackBar: tcxTrackBar;
  AStream: TMemoryStream;
  Item: TdxLayoutItem;
  Form
    : Integer;
  Script_Ok: Boolean;
begin
    Script_Ok := False;
  if wsp_Filtres.Locate('N_Params', N_Params, []) = True Then
    begin
      Form := wsp_Filtres.FieldByName('Field_Form').AsInteger;
    wq_update.sql.clear;
    wq_update.sql.Add('UPDATE T');
    case Form of
      1:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Txt = ' + quotedstr(DisplayValue));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      2:
          begin
          if (Sender as TcxCheckBox).Checked = True then
            begin
              wq_update.sql.Add('SET  Field_Value_Txt = ' + quotedstr('Oui'));
            wq_update.sql.Add(',Field_Value = ' + quotedstr('Oui'));
            Script_Ok := True;
          end
          else
            begin
              wq_update.sql.Add('SET  Field_Value_Txt = ' + quotedstr('Non'));
            wq_update.sql.Add(',Field_Value = ' + quotedstr('Non'));
            Script_Ok := True;
          end;
        end;
      3:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Txt = ' + quotedstr(DisplayValue));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      4:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Txt = ' + quotedstr(DisplayValue));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      5:
          Begin
            wq_update.sql
            .Add('SET  Field_Value_Date = ' + quotedstr(DisplayValue));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      6:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Num = ' + (DisplayValue));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      7:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Num = ' + (stringreplace(DisplayValue, ',', '.', [])));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      8:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Num = ' + (stringreplace(DisplayValue, ',', '.', [])));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      9:
          Begin
          if (Sender as TdxToggleSwitch).Checked = True then
            begin
              wq_update.sql.Add('SET  Field_Value_Txt = ' + quotedstr('Oui'));
            wq_update.sql.Add(',Field_Value = ' + quotedstr('Oui'));
            Script_Ok := True;
          end
          else
            begin
              wq_update.sql.Add('SET  Field_Value_Txt = ' + quotedstr('Non'));
            wq_update.sql.Add(',Field_Value = ' + quotedstr('Non'));
            Script_Ok := True;
          end;
        End;
      10:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Num = ' + (DisplayValue));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      11:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Txt = ' + quotedstr(DisplayValue));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(DisplayValue));
          Script_Ok := True;
        End;
      12:
          Begin
            wq_update.
            sql.Add('SET  Field_Value_Num = ' + inttostr((Sender as tcxTrackBar).Position));
          wq_update.sql.Add(',Field_Value = ' + quotedstr(inttostr((Sender as tcxTrackBar).Position)));
          Script_Ok := True;
        end;
    end;
    if Script_Ok = True then
      begin
        wq_update
        .sql.Add(',Field_Update = ' + quotedstr('Oui'));
      wq_update.sql.Add('FROM ' + stringreplace(wsp_Filtres.StoredProcName, '_SP_', '_TB_', [rfIgnoreCase]) + '_TEMP T');
      wq_update.
        sql.Add('WHERE N_Params = ' + inttostr(N_Params) + ' AND ID_Session_Temp = ' + quotedstr(ID_Session_Temp));
      wq_update.ExecSQL;
    end;
  end;
end;
{
  ---------------------------------------------------------------------
  FENETRE
  ---------------------------------------------------------------------
  }
procedure TF_Params2.Close;
var
    i: Integer;
begin
  // On vide la liste
  // AdvPanelFiltres.Free;
  wsp_Filtres.Close;
  if Fields_Update <> nil then
    begin
      Fields_Update.clear;
    Fields_Update.Free;
  end;
end;
procedure TF_Params2.FormCreate(Sender: TObject);
var
    i: Integer;
  s: string;
var
    Style: LongInt;
begin
end;
procedure TF_Params2.FormActivate(Sender: TObject);
var
    Hauteur: Integer;
  Largeur: Integer;
  Top: Integer;
  Left
    : Integer;
  R: TRect;
begin
    ShowWindow(Application.Handle, SW_HIDE);
  form1.Fenetre_Position(F_Params2);
end;
procedure TF_Params2.FormClose(Sender: TObject; var Action: TCloseAction);
begin ;
end;
procedure TF_Params2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
    Validate_Result: Integer;
begin
  if Origine_Close = '' then
    begin
      Origine_Close := 'CLOSE';
  end;
  Validate_Result := Validate(Sender, '', Origine_Close, 0);
  Origine_Close:='';
  if Validate_Result = 0 then
    begin
      CanClose := False;
    Exit;
  end;
  if Validate_Result = 2 then
    begin
      CanClose := False;
    Reload
      (Origine_Close + '-Validate');
    Exit;
  end;
end;
procedure TF_Params2.FormDestroy(Sender: TObject);
var
    i: Integer;
begin
    wsp_Filtres.Close;
  for i := ComponentCount - 1 downto 0
    do
    begin
    if Components[i] is TADQuery then
      begin (Components[i] as TADQuery)
      .Close;
    end;
    if Components[i] is TADStoredProc then
      begin
  (Components[i] as TADStoredProc)
      .Close;
    end;
  end;
  if Captions_List <> nil then
    begin
      Captions_List.clear;
    Captions_List.Free;
  end;
end;
procedure TF_Params2.Voir_Fiche(N_fiche: Integer; Fiche: Integer);
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
      Param
        := WM_G_OPEN_STAT;
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
      Param
        := WM_G_OPEN_TODO;
    127:
      Param := WM_G_OPEN_DEMANDE_ACHAT;
    128:
      Param := WM_G_OPEN_CAMPAGNE;
    129:
      Param := WM_G_OPEN_GENEMAIL;
  end;
  // Envoi d'un message à la fiche
  if (form1.Handle_Ouverture > 0) then
    begin
      postmessage(HWND(form1.Handle_Ouverture), Param, N_fiche, 0);
    // où Handle est le handle de la fenetre passé au MagicBtn par $HANDLE
  end;
end;
procedure TF_Params2.Timer1Timer(Sender: TObject);
begin
    ModalResult := mrcancel;
end;
procedure TF_Params2.AdvPanelFiltresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Timer1.Enabled = True then
    begin
      Timer1.Enabled := False;
    Timer1.Interval := Timer;
    Timer1.Enabled := True;
  end;
end;
procedure TF_Params2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssAlt in Shift) and (Info_actif = False) then
    begin
      Info_actif := True;
  end;
  if Key = VK_F2 then
    begin
    if Admin = 'Oui' then
      begin
        lcMain.Customization := True;
      gx_Save.Visible := True;
    end;
  end;
  if Key = VK_F5 then
    begin
      Reload('F5');
  end;
end;
procedure TF_Params2.AutosizeExecute(Sender: TObject);
begin
  if aAutosize = 'Oui' then
    begin
      lcMain.Align := alNone;
    lcMainGroup_Root1.AlignHorz := ahLeft;
    lcMainGroup_Root1.AlignVert := avTop;
    lcMain.AutoSize := True;
    AutoSize := True;
  end
  else
    begin
      AutoSize := False;
    lcMain.AutoSize := False;
    lcMainGroup_Root1.AlignHorz := ahClient;
    lcMainGroup_Root1.AlignVert := avClient;
    lcMain.Align := alClient;
  end;
end;
end.
