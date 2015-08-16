object F_Nav: TF_Nav
  Left = 1027
  Top = 184
  Caption = 'F_Nav'
  ClientHeight = 481
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object GradientLabel3: TGradientLabel
    Left = 0
    Top = 0
    Width = 358
    Height = 5
    Align = alTop
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ColorTo = clBtnFace
    EllipsType = etNone
    GradientType = gtFullHorizontal
    GradientDirection = gdLeftToRight
    Indent = 0
    Orientation = goHorizontal
    TransparentText = False
    VAlignment = vaTop
    Version = '1.2.0.0'
  end
  object Panel2: TPanel
    Left = 0
    Top = 435
    Width = 358
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel4: TPanel
      Left = 264
      Top = 0
      Width = 94
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Button1: TButton
        Left = 13
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Quitter'
        ModalResult = 1
        TabOrder = 0
      end
    end
  end
  object Shader3: TShader
    Left = 0
    Top = 476
    Width = 358
    Height = 5
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    FromColor = 15790320
    ToColor = 15790320
    Direction = True
    Version = '1.4.0.0'
  end
  object tv_niveau: TfcTreeView
    Left = 5
    Top = 5
    Width = 348
    Height = 430
    Align = alClient
    InactiveFocusColor = 16773345
    Constraints.MinWidth = 50
    Images = Form1.IconeListePNG
    Indent = 19
    Options = [tvoExpandOnDblClk, tvoShowButtons, tvoShowLines, tvoShowRoot, tvoHotTrack, tvoToolTips]
    Items.StreamVersion = 1
    Items.Data = {00000000}
    UsePaintBuffering = True
    PopupMenu = Popup_Niveau
    RightClickSelects = True
    SortType = fcstData
    StreamExpandedNode = True
    TabOrder = 2
    OnDblClick = tv_niveauDblClick
    OnMouseDown = tv_niveauMouseDown
  end
  object pln_niveauGauche: TPanel
    Left = 0
    Top = 5
    Width = 5
    Height = 430
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
  end
  object pln_niveauDroit: TPanel
    Left = 353
    Top = 5
    Width = 5
    Height = 430
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 216
    Top = 184
  end
  object Popup_Niveau: TAdvPopupMenu
    Images = Form1.IconesListe_Plus
    Version = '2.5.4.0'
    Left = 80
    Top = 152
    object DvelopperTout1: TMenuItem
      Caption = 'D'#233'velopper Tout'
      ImageIndex = 229
      OnClick = DvelopperTout1Click
    end
    object RduireTout1: TMenuItem
      Caption = 'R'#233'duire Tout'
      ImageIndex = 227
      OnClick = RduireTout1Click
    end
  end
  object sp_Niveau: TADStoredProc
    ConnectionName = 'db'
    StoredProcName = 'EGX_SP_FCT_XML_LOG'
    Left = 136
    Top = 60
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@ID_Session'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 3
        Name = '@Num_Action'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = '@Message'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Position = 5
        Name = '@Err_Traitement'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end>
  end
end
