object FActionSelect: TFActionSelect
  Left = 305
  Top = 353
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Action'
  ClientHeight = 111
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 308
    Height = 111
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        300
        83)
      object Complement1Label: TLabel
        Tag = 1
        Left = 46
        Top = 9
        Width = 36
        Height = 13
        Caption = 'Libelle1'
      end
      object Complement2Label: TLabel
        Tag = 1
        Left = 46
        Top = 89
        Width = 36
        Height = 13
        Caption = 'Libelle2'
        Visible = False
      end
      object Complement3Label: TLabel
        Tag = 1
        Left = 46
        Top = 128
        Width = 36
        Height = 13
        Caption = 'Libelle3'
        Visible = False
      end
      object Complement4Label: TLabel
        Tag = 1
        Left = 46
        Top = 171
        Width = 36
        Height = 13
        Caption = 'Libelle4'
        Visible = False
      end
      object BtnOK: TButton
        Left = 56
        Top = 53
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
      end
      object BtnCancel: TButton
        Left = 168
        Top = 53
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Annuler'
        ModalResult = 2
        TabOrder = 1
      end
      object ImageAvancement: TfcImageBtn
        Tag = 1
        Left = 8
        Top = 12
        Width = 32
        Height = 32
        Color = clNone
        DitherColor = clWhite
        DitherStyle = dsDither
        Image.Data = {
          424D360C00000000000036000000280000002000000020000000010018000000
          0000000C00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000EFA6F2ED51E9FFB4F8FFFCFE0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000F7E2FBE276EDD413DDE92AE5FF56F0FF8BF6FFE0
          FD00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000F7F9FE000000000000000000000000000000
          000000000000F4F4F4E7C0F7DF8EF4D751E9D41CDFE935E5FF66F2FF8EF7FFB0
          FBFFC2FC00000000000000000000000000000000000000000000000000000000
          0000000000000000DBE0FB4758EA1768F99BC6FF000000000000000000000000
          000000BFBFBF5E5E5ED396EADA80F1D346E8D41CDFE937E6FF78F4FF8EF7FFB0
          FBFFA5FA00000000000000000000000000000000000000000000000000000000
          0000F3F8FE7FAFF7134DEB001AE3025DF9007DFF2FAAFFBFE9FF000000E8E8E8
          A6A6A66D6D6D525252D37FE5D258E8D339E2D313DCE937E6FF82F4FF78F4FF88
          F6FF83F6000000000000000000000000000000000000000000000000000000CB
          E7FD34A2F81F86F40044EB001FE40F6BF90089FF00A9FF00BCFF6ABAE2ACACAD
          9292926B6B6B545454CE50DCD235E1D31FDCDC35E0F77FF3FF82F5FF74F3FF5D
          F1FF5AF1000000000000000000000000000000000000000000000000000000A2
          D0FB289EF70668F00041EA001EE41975F9078DFF00A4FF00B4FF3EA0D9A2A5A9
          7C7F81686868535353CB1DD3D522DCEC84EEFEBBFCFFA0FBFF85FAFF8CF8FF65
          F2FF4EF0000000000000000000000000000000000000000000000000000000A2
          C7F91879F2004DEC0031E70018E31974F91E94FF008CFF0094FF388BD284888D
          6B7176595F62515354DC64E0FBD4FBFFDBFEFFC6FDFFA9FCFF88FAFF88FAFFB9
          FCFF87F6000000000000000000000000000000000000000000000000000000A2
          BAF70847EA002FE70726E52578F227ABFE2A99FF1283FF0075FF2E71C863686C
          585E625652735427B39969F0E0C1FAFFDAFEFFC5FDFFA8FCFF88FAFF86FAF3B8
          FBDFDDFD0000000000000000000000000000000000000000000000000000009F
          AAF4001CE31B5CEC33BFFC20C4FF10B6FF06ACFF1FA9FF097AFF2060BB565964
          7567AD693BD54F11C98552EE936CF3C0A2F8F3B6FBFF9EFBFF9CFBABA7F71C36
          E70463FA73BBFFEFF9FF000000000000000000000000000000000000000000B1
          BFF231AAF73DDBFF34D4FF26C8FF14BAFF02ABFF0CB6FF14C5FE5C7BC0A095E8
          927AEA663AD85115CB9265EF9C7DF5B2A5FABDB8FCD7BDFB56AEF8136CF00026
          E5096FFA009AFF13BDFFD7F2FF000000000000000000000000000000000000E3
          E3E3A4C1C854CAE632D2FF24C7FF13B9FF02AAFF32A0D7A5485CBB4B78A896ED
          7B5DE26437D75014CA9E74F19D7DF5AE9EF9B5ACFBB5BCFA1E8EF50052ED0023
          E5197DFA0295FF00AAFFBFE7FF000000000000000000000000000000000000DF
          DFDFAAAAAA9494946A9CAC2AB6EC1AB1F17F9581D36928CD2D2CB540748A6CE0
          6E44D45C26CB4E10C79E73F0A480F49C7CF5A084F6ADA6F70B54ED0030E72F1E
          BD7073A0198BFC007DFFBFDDFF000000000000000000000000000000000000DA
          DADA929292888888818181A2A6A7CAA444DB9620CE592BCD332CAC316F6837CF
          5D24C96227C89C76E7B18DF8AA83F49569F28B5CF1A48FF41226D5844F71CC28
          2DF86505D48B304581BEBFDAFF000000000000000000000000000000000000D0
          D0D07F7F7F979797CCCCCCD0D0D0DB9A35D67525D04F2BCD2D2B9D1A685616C3
          9069DDC3B9FABCAAFCB190FBAC82FAB794F88E5DF1B596E3CD952DD26928CD2E
          2CF87605FF9C00FEBA00F8E9C5000000000000000000000000000000000000D6
          D6D6C0C0C0E5E5E5DFDFDFD4D4D4D97E38D35029D33A29D2222AA1486AC1B7F4
          CFD6FEC9C7FDC0B1FCB496FBAA7FFAC3A4FBCBAFFBD9BBE0DB7C1DD24925CE24
          2AF87F05FF9000FF9B00FFE4BF000000000000000000000000000000000000FE
          FEFEF3F3F3E6E6E6DEDEDED4D4D4D4503CD32F29C4342D5B793007AD2039C958
          ABD2D7C7C4FDBEAFFCB394FBA97EFAC9AEFCF1EAFEF9E6E3D53D22CB2E266A69
          2C4BAE1CD4960BFF7400FFDBBF00000000000000000000000000000000000000
          0000000000FCFCFCE7E7E7D0D0D0D0383E8D72523BBB6C0AA6320BAE2500C72A
          02D95551D6A8ABAAEDB796FBE0D0FD000000000000F8E3E49D604D43B7710AA5
          310AC12B03DA586ABE53F0E2C600000000000000000000000000000000000000
          0000000000000000000000F4F4F460CBA24CD9A511BF660AAA3A16B02E0FCF43
          00E16A00F4980BEB91FAF7FE000000000000000000DFF9F241DBAD0FC26C0AA7
          3328C84800DE6300F08EBFF9DD00000000000000000000000000000000000000
          000000000000000000000000000053DEB520CD8D07BA5D0AA83516B02E32D35A
          00DC5D00EA8000E778000000000000000000000000DFF7ED1EC57C00B14F0AA2
          2F3ECD591DD24F00D54CBFF3D000000000000000000000000000000000000000
          000000000000000000000000000049D19901BB6500AE4A03A02A1BB2344AD161
          14D14B00D64E00D44A000000000000000000000000DFF3E504A5381AB96015E9
          9E0CED843CDC700EC52BBFEFC600000000000000000000000000000000000000
          00000000000000000000000000002CBB6800A93F08A33423C97318EE912EE071
          40D05A07C52800C421000000000000000000000000ECF7EE2FDDAB02FCD600F7
          B700F08B1AED7D70EDA6DAF7E100000000000000000000000000000000000000
          00000000000000000000000000001FA94220B8621AEDBB00F7B500F29900EC78
          29EB824BD97207C324000000000000000000000000000000EBFEFC67FCE103F6
          B000EF8465F2A7E8FDF200000000000000000000000000000000000000000000
          00000000000000000000000000005FE5BF03FEDD00FCD300F8BD00F39F00ED7C
          08EB7278F4B27FEDAD000000000000000000000000000000000000000000D7FC
          EEC3FBE100000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000009BFEF017FBD100F7B700F29A00ED79
          2CEE87BBF9D80000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000EFFEFA77F9D00FF19383F5BC
          F7FEFA0000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000}
        NumGlyphs = 0
        Offsets.TextDownX = 0
        Offsets.TextDownY = 0
        Offsets.ImageDownX = 0
        Offsets.ImageDownY = 0
        ParentClipping = True
        ShadeStyle = fbsNormal
        TabOrder = 2
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        TransparentColor = clNone
        RegionData = {
          900100002000000001000000170000007001000003000000030000001D000000
          1D0000000A000000030000000F00000004000000090000000400000010000000
          050000000800000005000000110000000600000018000000050000001A000000
          060000000800000006000000110000000700000016000000060000001C000000
          070000000800000007000000110000000A00000015000000070000001D000000
          0A000000070000000A000000120000000B000000150000000A0000001D000000
          0B000000050000000B000000130000000C000000150000000B0000001D000000
          0C000000030000000C0000001D0000001300000003000000130000001C000000
          1400000003000000140000001A0000001800000004000000180000000C000000
          190000000D000000180000001A0000001900000006000000190000000A000000
          1A0000000F000000190000001A0000001A000000080000001A00000009000000
          1B000000100000001A0000001A0000001B000000120000001B00000019000000
          1C000000140000001C000000180000001D000000}
        DownRegionData = {00000000}
      end
      object Complement1: TMagicComplement
        Tag = 1
        Left = 46
        Top = 23
        Width = 211
        Height = 21
        BevelOuter = bvNone
        Caption = ' '
        Color = clWhite
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TypeMagic = 0
        Items.Strings = (
          '')
        ListeChaine = ';'
        DataSource = wwDataSource
        DataField = 'Complement1'
        ReadOnly = False
        TailleChampVisible = '20'
        TailleChampVisible2 = '20'
        StyleCombo = csDropDown
      end
      object Complement2: TMagicComplement
        Tag = 1
        Left = 46
        Top = 103
        Width = 211
        Height = 21
        BevelOuter = bvNone
        Caption = ' '
        Color = clWhite
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Visible = False
        TypeMagic = 0
        Items.Strings = (
          '')
        ListeChaine = ';'
        DataSource = wwDataSource
        DataField = 'Complement2'
        ReadOnly = False
        TailleChampVisible = '20'
        TailleChampVisible2 = '20'
        StyleCombo = csDropDown
      end
      object Complement4: TMagicComplement
        Tag = 1
        Left = 46
        Top = 188
        Width = 211
        Height = 21
        BevelOuter = bvNone
        Caption = ' '
        Color = clWhite
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Visible = False
        TypeMagic = 0
        Items.Strings = (
          '')
        ListeChaine = ';'
        DataSource = wwDataSource
        DataField = 'Complement4'
        ReadOnly = False
        TailleChampVisible = '20'
        TailleChampVisible2 = '20'
        StyleCombo = csDropDown
      end
      object Complement3: TMagicComplement
        Tag = 1
        Left = 46
        Top = 143
        Width = 211
        Height = 21
        BevelOuter = bvNone
        Caption = ' '
        Color = clWhite
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Visible = False
        TypeMagic = 0
        Items.Strings = (
          '')
        ListeChaine = ';'
        DataSource = wwDataSource
        DataField = 'Complement3'
        ReadOnly = False
        TailleChampVisible = '20'
        TailleChampVisible2 = '20'
        StyleCombo = csDropDown
      end
      object MagicButton1: TDBButton
        Left = 46
        Top = 232
        Width = 75
        Height = 25
        Caption = 'MagicButton1'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 7
        Visible = False
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        DataField = 'Select'
        DataSource = wwDataSource
      end
      object MagicButton2: TDBButton
        Left = 46
        Top = 263
        Width = 75
        Height = 25
        Caption = 'MagicButton2'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 8
        Visible = False
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        DataField = 'Select'
        DataSource = wwDataSource
      end
      object MagicButton3: TDBButton
        Left = 46
        Top = 294
        Width = 75
        Height = 25
        Caption = 'MagicButton3'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 9
        Visible = False
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        DataField = 'Select'
        DataSource = wwDataSource
      end
      object MagicButton4: TDBButton
        Left = 46
        Top = 325
        Width = 75
        Height = 25
        Caption = 'MagicButton4'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 10
        Visible = False
        Appearance.ColorChecked = 16111818
        Appearance.ColorCheckedTo = 16367008
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 16111818
        Appearance.ColorDownTo = 16367008
        Appearance.ColorHot = 16117985
        Appearance.ColorHotTo = 16372402
        Appearance.ColorMirrorHot = 16107693
        Appearance.ColorMirrorHotTo = 16775412
        Appearance.ColorMirrorDown = 16102556
        Appearance.ColorMirrorDownTo = 16768988
        Appearance.ColorMirrorChecked = 16102556
        Appearance.ColorMirrorCheckedTo = 16768988
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        DataField = 'Select'
        DataSource = wwDataSource
      end
    end
  end
  object SP: TwwStoredProc
    AfterOpen = SPAfterOpen
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'GRILLE_EXEMPLE;1'
    ControlType.Strings = (
      'check2;CheckBox;Oui;Non'
      'check1;CheckBox;Oui;Non')
    ValidateWithMask = True
    Left = 8
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 327680
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle'
        ParamType = ptInput
      end>
  end
  object SP_BEFORE: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    ValidateWithMask = True
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
  end
  object wwQuery: TwwQuery
    CachedUpdates = True
    OnCalcFields = wwQueryCalcFields
    DatabaseName = 'DBIntegrator'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      'N_Softini,'
      'Complement1 = CAST( NULL as varchar(100) ),'
      'Complement2 = CAST( NULL as varchar(100) ),'
      'Complement3 = CAST( NULL as varchar(100) ),'
      'Complement4 = CAST( NULL as varchar(100) )'
      'FROM SOFT_INI')
    UpdateObject = UpdateSQL1
    ValidateWithMask = True
    Left = 272
    Top = 47
    object wwQueryN_Softini: TIntegerField
      FieldName = 'N_Softini'
      Origin = 'DBINTEGRATOR.SOFT_INI.N_Softini'
    end
    object wwQueryComplement1: TStringField
      FieldName = 'Complement1'
      Size = 100
    end
    object wwQueryComplement2: TStringField
      FieldName = 'Complement2'
      Size = 100
    end
    object wwQueryComplement3: TStringField
      FieldName = 'Complement3'
      Size = 100
    end
    object wwQueryComplement4: TStringField
      FieldName = 'Complement4'
      Size = 100
    end
    object wwQuerySelect: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Select'
      Size = 8000
      Calculated = True
    end
  end
  object wwDataSource: TwwDataSource
    DataSet = wwQuery
    Left = 268
    Top = 72
  end
  object UpdateSQL1: TUpdateSQL
    Left = 268
    Top = 15
  end
  object SP_ACTION: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    ValidateWithMask = True
    Left = 184
    Top = 8
  end
  object SP_AFTER: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    ValidateWithMask = True
    Left = 80
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
  end
end
