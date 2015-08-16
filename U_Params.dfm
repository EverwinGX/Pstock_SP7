object F_Params: TF_Params
  Left = 979
  Top = 285
  BorderIcons = [biSystemMenu]
  Caption = 'F_Params'
  ClientHeight = 362
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanelFiltres: TParamListBox
    Left = 0
    Top = 0
    Width = 465
    Height = 321
    Align = alClient
    Color = clBtnFace
    Items.Strings = (
      
        '<p bgcolor="clYellow" bgcolorto="clred"><IMG src="idx:1" align="' +
        'top"> Parameter settings group 1</p>'#13#10
      'A normal edit parameter : <a href="edit" class="EDIT">10</A>'#13#10
      'A spinedit parameter : <a href="spin" class="SPIN">10</A>'
      'A timepicker parameter : <a href="time" class="TIME">12:00</A>'
      
        '<IMG src="idx:3"> A datepicker parameter from : <a href="datefro' +
        'm" class="DATE">1/4/2002</A> to : <a href="dateto" class="DATE">' +
        '1/5/2002</A>'
      
        '<p bgcolor="clYellow" bgcolorto="clred"><IMG src="idx:1" align="' +
        'top"> Parameter settings group 2</p>'#13#10
      
        'A mask parameter : <a href="mask" class="MASK" props="9999">1234' +
        '</A>'
      
        '<IMG src="idx:2"> A list parameter : <a href="list" class="LIST"' +
        ' props="List item 1|List item 2|List item 3|List item 4">?</A>'#13#10
      
        'A menu parameter : <a href="menu" class="MENU" props="Menu item ' +
        '1|Menu item 2|Menu item 3|Menu item 4">?</A>'#13#10
      'A query parameter : <a href="query" class="QUERY">?</A>'#13#10
      
        '<IMG src="idx:0"> A directory parameter : <a href="dir" class="D' +
        'IR">?</A>')
    ItemHeight = 24
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    AdvanceOnReturn = False
    EditAutoSize = True
    EmptyParam = '?'
    EnableBlink = True
    HoverColor = clHighlight
    Images = Form1.IconesListe
    Multiline = False
    ParamHint = True
    ParamColor = clBlue
    SelectionColor = 16774636
    SelectionFontColor = 8404992
    ShadowColor = clGray
    ShadowOffset = 1
    ShowSelection = True
    Version = '1.3.3.4'
    OnMouseDown = AdvPanelFiltresMouseDown
    OnParamClick = AdvPanelFiltresParamClick
    OnParamEditDone = AdvPanelFiltresParamEditDone
    OnParamHint = AdvPanelFiltresParamHint
    OnParamCustomEdit = AdvPanelFiltresParamCustomEdit
  end
  object Panel2: TPanel
    Left = 0
    Top = 321
    Width = 465
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel4: TPanel
      Left = 287
      Top = 0
      Width = 178
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Button1: TButton
        Left = 5
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Ok'
        ModalResult = 1
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 93
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Annuler'
        ModalResult = 2
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
  object wq_custom0: TwwQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT '
      '*'
      'from'
      'MFPS_VUE_LST_DEPOT')
    ValidateWithMask = True
    Left = 296
    Top = 256
    object wq_custom0Liste1: TStringField
      DisplayWidth = 50
      FieldName = 'Liste1'
      Origin = 'DB.MFPS_VUE_LST_DEPOT.Liste1'
      Size = 50
    end
    object wq_custom0Liste2: TStringField
      DisplayWidth = 5
      FieldName = 'Liste2'
      Origin = 'DB.MFPS_VUE_LST_DEPOT.Liste2'
      Size = 5
    end
    object wq_custom0Liste1width: TIntegerField
      FieldName = 'Liste1width'
      Origin = 'DB.MFPS_VUE_LST_DEPOT.Liste1width'
      Visible = False
    end
    object wq_custom0Liste2width: TIntegerField
      FieldName = 'Liste2width'
      Origin = 'DB.MFPS_VUE_LST_DEPOT.Liste2width'
      Visible = False
    end
    object wq_custom0Liste3: TStringField
      FieldName = 'Liste3'
      Origin = 'DB.MFPS_VUE_LST_DEPOT.Liste3'
      Visible = False
      Size = 1
    end
    object wq_custom0Liste3width: TIntegerField
      FieldName = 'Liste3width'
      Origin = 'DB.MFPS_VUE_LST_DEPOT.Liste3width'
      Visible = False
    end
    object wq_custom0SaisieLibre: TIntegerField
      FieldName = 'SaisieLibre'
      Origin = 'DB.MFPS_VUE_LST_DEPOT.SaisieLibre'
      Visible = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 216
    Top = 184
  end
  object OpenDlg: TOpenDialog
    Options = [ofEnableSizing]
    Left = 80
    Top = 136
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 350
    Top = 62
  end
  object wsp_custom: TADOStoredProc
    Connection = Form1.Database
    Parameters = <>
    Left = 320
    Top = 200
  end
  object wsp_Filtres: TADOStoredProc
    Connection = Form1.Database
    Parameters = <>
    Left = 384
    Top = 200
  end
  object wsp_Update: TADOStoredProc
    Connection = Form1.Database
    Parameters = <>
    Left = 320
    Top = 152
  end
  object wsp_File: TADOStoredProc
    Connection = Form1.Database
    Parameters = <>
    Left = 384
    Top = 152
  end
  object wq_custom: TADOQuery
    Connection = Form1.Database
    Parameters = <>
    Left = 208
    Top = 248
  end
end
