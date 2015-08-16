object F_Filtres: TF_Filtres
  Left = 772
  Top = 167
  Width = 401
  Height = 473
  Caption = 'F_Filtres'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 394
    Width = 385
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 105
      Height = 41
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Button3: TButton
        Left = 15
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Effacer tout'
        TabOrder = 0
        OnClick = Button3Click
      end
    end
    object Button1: TButton
      Left = 303
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Activer'
      ModalResult = 1
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 103
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Désactiver'
      ModalResult = 7
      TabOrder = 2
    end
    object Button2: TButton
      Left = 223
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Annuler'
      ModalResult = 2
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object AdvPanelFiltres: TParamListBox
    Left = 0
    Top = 0
    Width = 385
    Height = 394
    Align = alClient
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
    Multiline = False
    ParamHint = True
    ParamColor = clBlue
    SelectionColor = 16774636
    SelectionFontColor = 8404992
    ShadowColor = clGray
    ShadowOffset = 1
    ShowSelection = True
    Version = '1.3.0.0'
  end
  object wsp_Filtres: TwwStoredProc
    AfterClose = wsp_FiltresAfterClose
    ValidateWithMask = True
    Left = 264
    Top = 256
  end
end
