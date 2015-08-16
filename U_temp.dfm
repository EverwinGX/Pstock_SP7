object Form1: TForm1
  Left = 615
  Top = 201
  Width = 1305
  Height = 750
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fcPanel1: TfcPanel
    Left = 0
    Top = 0
    Width = 1289
    Height = 712
    Align = alClient
    TabOrder = 0
    object CoolBar1: TCoolBar
      Left = 1
      Top = 1
      Width = 1287
      Height = 30
      Bands = <
        item
          Break = False
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 24
          Width = 1283
        end>
      ParentShowHint = False
      ShowHint = True
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 1270
        Height = 24
        ButtonWidth = 88
        EdgeBorders = []
        Flat = True
        Images = MainForm.ImageListToolBar
        List = True
        ShowCaptions = True
        TabOrder = 0
        Transparent = True
        Wrapable = False
        object SaveBtn: TToolButton
          Left = 0
          Top = 0
          Hint = 'Sauvegarder la fiche.'
          AutoSize = True
          Caption = 'Sauvegarder'
          Enabled = False
          ImageIndex = 1
        end
        object CancelBtn: TToolButton
          Left = 92
          Top = 0
          Hint = 'Annuler les modifications non sauvegardées'
          AutoSize = True
          Enabled = False
          ImageIndex = 2
        end
        object ToolButton1: TToolButton
          Left = 126
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 134
          Top = 0
          Caption = 'Actions'
          DropdownMenu = pm_Action
          Enabled = False
          ImageIndex = 6
        end
        object ToolButton5: TToolButton
          Left = 222
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ExportBtn: TToolButton
          Left = 230
          Top = 0
          AutoSize = True
          DropdownMenu = PopupImprimer
          ImageIndex = 7
        end
        object ToolButton3: TToolButton
          Left = 264
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton2: TToolButton
          Left = 272
          Top = 0
          AutoSize = True
          DropdownMenu = PopupFonte
          ImageIndex = 8
        end
      end
    end
    object fcPanel4: TfcPanel
      Left = 1
      Top = 31
      Width = 1287
      Height = 680
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object fcPanel3: TfcPanel
        Left = 0
        Top = 0
        Width = 1287
        Height = 680
        Align = alClient
        TabOrder = 0
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 1285
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object GradientLabel3: TGradientLabel
            Left = 5
            Top = 0
            Width = 1280
            Height = 19
            Align = alClient
            AutoSize = False
            Caption = 'Eléments de la liste'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ColorTo = clWhite
            EllipsType = etNone
            GradientType = gtFullHorizontal
            Indent = 0
            LineWidth = 2
            Orientation = goHorizontal
            TransparentText = False
            VAlignment = vaTop
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 5
            Height = 19
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
        object pnl_liste: TPanel
          Left = 1
          Top = 20
          Width = 1285
          Height = 654
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Gest_Listes_Detail: GTwwDBGrid
            Left = 5
            Top = 0
            Width = 1275
            Height = 654
            Selected.Strings = (
              'N_Ligne'#9'10'#9'N_Ligne'#9#9
              'Type_Fiche'#9'10'#9'Type_Fiche'#9#9
              'N_Fiche'#9'10'#9'N_Fiche'#9#9
              'N_Position'#9'10'#9'N_Position'#9#9
              'N_Position_Max'#9'10'#9'N_Position_Max'#9#9
              'User_Create'#9'10'#9'User_Create'#9#9
              'Date_Create'#9'18'#9'Date_Create'#9#9
              'User_Modif'#9'10'#9'User_Modif'#9#9
              'Date_Modif'#9'18'#9'Date_Modif'#9#9
              'ColorFond'#9'10'#9'ColorFond'#9#9
              'ColorTexte'#9'10'#9'ColorTexte'#9#9
              'StyleFonte'#9'10'#9'StyleFonte'#9#9
              'Genesys_Lock'#9'3'#9'Genesys_Lock'#9#9
              'Libre1'#9'100'#9'Libre1'#9#9
              'Libre2'#9'100'#9'Libre2'#9#9
              'Libre3'#9'100'#9'Libre3'#9#9
              'Libre4'#9'100'#9'Libre4'#9#9
              'Libre5'#9'100'#9'Libre5'#9#9
              'Libre6'#9'100'#9'Libre6'#9#9
              'Libre7'#9'100'#9'Libre7'#9#9
              'Libre8'#9'100'#9'Libre8'#9#9
              'Dialogue1'#9'100'#9'Dialogue1'#9#9
              'Dialogue2'#9'100'#9'Dialogue2'#9#9
              'Dialogue3'#9'100'#9'Dialogue3'#9#9
              'Dialogue4'#9'100'#9'Dialogue4'#9#9
              'Texte1'#9'10'#9'Texte1'#9#9
              'Texte2'#9'10'#9'Texte2'#9#9
              'Texte3'#9'10'#9'Texte3'#9#9
              'Texte4'#9'10'#9'Texte4'#9#9
              'Date1'#9'18'#9'Date1'#9#9
              'Date2'#9'18'#9'Date2'#9#9
              'Date3'#9'18'#9'Date3'#9#9
              'Date4'#9'18'#9'Date4'#9#9
              'Date5'#9'18'#9'Date5'#9#9
              'Date6'#9'18'#9'Date6'#9#9
              'Date7'#9'18'#9'Date7'#9#9
              'Date8'#9'18'#9'Date8'#9#9
              'Numeric1'#9'10'#9'Numeric1'#9#9
              'Numeric2'#9'10'#9'Numeric2'#9#9
              'Numeric3'#9'10'#9'Numeric3'#9#9
              'Numeric4'#9'10'#9'Numeric4'#9#9
              'Numeric5'#9'10'#9'Numeric5'#9#9
              'Numeric6'#9'10'#9'Numeric6'#9#9
              'Numeric7'#9'10'#9'Numeric7'#9#9
              'Numeric8'#9'10'#9'Numeric8'#9#9
              'Numeric9'#9'10'#9'Numeric9'#9#9
              'Numeric10'#9'10'#9'Numeric10'#9#9
              'Numeric11'#9'10'#9'Numeric11'#9#9
              'Numeric12'#9'10'#9'Numeric12'#9#9
              'Numeric13'#9'10'#9'Numeric13'#9#9
              'Numeric14'#9'10'#9'Numeric14'#9#9
              'Check1'#9'3'#9'Check1'#9#9
              'Check2'#9'3'#9'Check2'#9#9
              'Check3'#9'3'#9'Check3'#9#9
              'Check4'#9'3'#9'Check4'#9#9
              'Check5'#9'3'#9'Check5'#9#9
              'Check6'#9'3'#9'Check6'#9#9
              'Check7'#9'3'#9'Check7'#9#9
              'Check8'#9'3'#9'Check8'#9#9
              'Int1'#9'10'#9'Int1'#9#9
              'Int2'#9'10'#9'Int2'#9#9
              'Int3'#9'10'#9'Int3'#9#9
              'Int4'#9'10'#9'Int4'#9#9
              'Int5'#9'10'#9'Int5'#9#9
              'Int6'#9'10'#9'Int6'#9#9
              'Int7'#9'10'#9'Int7'#9#9
              'Int8'#9'10'#9'Int8'#9#9
              'N_Cle_Combo1'#9'10'#9'N_Cle_Combo1'#9#9
              'N_Cle_Combo2'#9'10'#9'N_Cle_Combo2'#9#9
              'N_Cle_Combo3'#9'10'#9'N_Cle_Combo3'#9#9
              'N_Cle_Combo4'#9'10'#9'N_Cle_Combo4'#9#9
              'N_Cle_Combo5'#9'10'#9'N_Cle_Combo5'#9#9
              'N_Cle_Combo6'#9'10'#9'N_Cle_Combo6'#9#9
              'N_Cle_Combo7'#9'10'#9'N_Cle_Combo7'#9#9
              'N_Cle_Combo8'#9'10'#9'N_Cle_Combo8'#9#9
              'Libelle_Combo1'#9'100'#9'Libelle_Combo1'#9#9
              'Libelle_Combo2'#9'100'#9'Libelle_Combo2'#9#9
              'Libelle_Combo3'#9'100'#9'Libelle_Combo3'#9#9
              'Libelle_Combo4'#9'100'#9'Libelle_Combo4'#9#9
              'Libelle_Combo5'#9'100'#9'Libelle_Combo5'#9#9
              'Libelle_Combo6'#9'100'#9'Libelle_Combo6'#9#9
              'Libelle_Combo7'#9'100'#9'Libelle_Combo7'#9#9
              'Libelle_Combo8'#9'100'#9'Libelle_Combo8'#9#9)
            IniAttributes.Delimiter = ';;'
            ExportOptions.ExportType = wwgetSYLK
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DS_Listes_Detail
            ImeName = 'N_ligne'
            KeyOptions = [dgAllowDelete]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFixedResizable, dgFixedEditable]
            PopupMenu = Popup_Detail
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = True
            LineColors.FixedColor = clNone
            ImageList = MainForm.IconesListe_Plus
            TitleImageList = MainForm.ImageUpDown
            SwitchRowCell = True
          end
          object Rtf4: TwwDBRichEdit
            Tag = 4
            Left = 440
            Top = 407
            Width = 172
            Height = 17
            AutoURLDetect = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PrintJobName = 'Delphi 5'
            TabOrder = 17
            EditorOptions = [reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoShowRuler, reoShowInsertObject, reoCloseOnEscape, reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons, reoShowJustifyButton]
            EditorCaption = 'Editeur de texte'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              730000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313033367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C66305C667332305C7061720D0A7D0D0A00}
          end
          object Rtf3: TwwDBRichEdit
            Tag = 3
            Left = 440
            Top = 383
            Width = 172
            Height = 17
            AutoURLDetect = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PrintJobName = 'Delphi 5'
            TabOrder = 16
            EditorOptions = [reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoShowRuler, reoShowInsertObject, reoCloseOnEscape, reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons, reoShowJustifyButton]
            EditorCaption = 'Editeur de texte'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              730000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313033367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C66305C667332305C7061720D0A7D0D0A00}
          end
          object Rtf2: TwwDBRichEdit
            Tag = 2
            Left = 440
            Top = 359
            Width = 172
            Height = 17
            AutoURLDetect = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PrintJobName = 'Delphi 5'
            TabOrder = 15
            EditorOptions = [reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoShowRuler, reoShowInsertObject, reoCloseOnEscape, reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons, reoShowJustifyButton]
            EditorCaption = 'Editeur de texte'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              730000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313033367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C66305C667332305C7061720D0A7D0D0A00}
          end
          object Rtf1: TwwDBRichEdit
            Tag = 1
            Left = 440
            Top = 335
            Width = 172
            Height = 17
            AutoURLDetect = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PrintJobName = 'Delphi 5'
            TabOrder = 14
            EditorOptions = [reoShowSaveExit, reoShowPrint, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoShowRuler, reoShowInsertObject, reoCloseOnEscape, reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons, reoShowJustifyButton]
            EditorCaption = 'Editeur de texte'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muCentimeters
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              730000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313033367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C66305C667332305C7061720D0A7D0D0A00}
          end
          object cboDlg4: TwwDBComboDlg
            Tag = 4
            Left = 608
            Top = 184
            Width = 121
            Height = 21
            ShowButton = True
            Style = csDropDown
            TabOrder = 13
            WordWrap = False
            UnboundDataType = wwDefault
          end
          object cboDlg3: TwwDBComboDlg
            Tag = 3
            Left = 608
            Top = 160
            Width = 121
            Height = 21
            ShowButton = True
            Style = csDropDown
            TabOrder = 12
            WordWrap = False
            UnboundDataType = wwDefault
          end
          object cboDlg2: TwwDBComboDlg
            Tag = 2
            Left = 608
            Top = 136
            Width = 121
            Height = 21
            ShowButton = True
            Style = csDropDown
            TabOrder = 11
            WordWrap = False
            UnboundDataType = wwDefault
          end
          object Combo8: TwwDBLookupCombo
            Tag = 8
            Left = 480
            Top = 280
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo8
            LookupField = 'champ1'
            TabOrder = 10
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Combo7: TwwDBLookupCombo
            Tag = 7
            Left = 480
            Top = 256
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo7
            LookupField = 'champ1'
            TabOrder = 9
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Combo6: TwwDBLookupCombo
            Tag = 6
            Left = 480
            Top = 232
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo6
            LookupField = 'champ1'
            TabOrder = 8
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Combo5: TwwDBLookupCombo
            Tag = 5
            Left = 480
            Top = 208
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo5
            LookupField = 'champ1'
            TabOrder = 7
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Combo4: TwwDBLookupCombo
            Tag = 4
            Left = 480
            Top = 184
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo4
            LookupField = 'champ1'
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Combo3: TwwDBLookupCombo
            Tag = 3
            Left = 480
            Top = 160
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo3
            LookupField = 'champ1'
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Combo2: TwwDBLookupCombo
            Tag = 2
            Left = 480
            Top = 136
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo2
            LookupField = 'champ1'
            TabOrder = 4
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object Combo1: TwwDBLookupCombo
            Tag = 1
            Left = 480
            Top = 112
            Width = 121
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = wsp_Cbo1
            LookupField = 'champ1'
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object pnl_listeGauche: TPanel
            Left = 0
            Top = 0
            Width = 5
            Height = 654
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
          end
          object pnl_listeDroit: TPanel
            Left = 1280
            Top = 0
            Width = 5
            Height = 654
            Align = alRight
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 1
          end
          object cboDlg1: TwwDBComboDlg
            Tag = 1
            Left = 608
            Top = 108
            Width = 121
            Height = 21
            ShowButton = True
            Style = csDropDown
            TabOrder = 18
            WordWrap = False
            UnboundDataType = wwDefault
          end
        end
        object Shader3: TShader
          Left = 1
          Top = 674
          Width = 1285
          Height = 5
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Shader1'
          TabOrder = 2
          FromColor = 15790320
          ToColor = clWhite
          Direction = True
          Version = '1.1.0.0'
        end
      end
    end
  end
  object DS_Listes_Detail: TwwDataSource
    DataSet = wq_Listes_Detail
    Left = 503
    Top = 205
  end
  object TU_listes_Detail: TUpdateSQL
    ModifySQL.Strings = (
      'update EGXS_TB_GSF_WORKFLOW_DELEGATION'
      'set'
      '  Type_Fiche = :Type_Fiche,'
      '  N_Fiche = :N_Fiche,'
      '  Libre1 = :Libre1,'
      '  Libre2 = :Libre2,'
      '  Libre3 = :Libre3,'
      '  Libre4 = :Libre4,'
      '  Libre5 = :Libre5,'
      '  Libre6 = :Libre6,'
      '  Libre7 = :Libre7,'
      '  Libre8 = :Libre8,'
      '  Libre_Dlg1 = :Libre_Dlg1,'
      '  Libre_Dlg2 = :Libre_Dlg2,'
      '  Libre_Dlg3 = :Libre_Dlg3,'
      '  Libre_Dlg4 = :Libre_Dlg4,'
      '  Texte1 = :Texte1,'
      '  Texte2 = :Texte2,'
      '  Texte3 = :Texte3,'
      '  Texte4 = :Texte4,'
      '  Date1 = :Date1,'
      '  Date2 = :Date2,'
      '  Date3 = :Date3,'
      '  Date4 = :Date4,'
      '  Date5 = :Date5,'
      '  Date6 = :Date6,'
      '  Date7 = :Date7,'
      '  Date8 = :Date8,'
      '  Numeric1 = :Numeric1,'
      '  Numeric2 = :Numeric2,'
      '  Numeric3 = :Numeric3,'
      '  Numeric4 = :Numeric4,'
      '  Numeric5 = :Numeric5,'
      '  Numeric6 = :Numeric6,'
      '  Numeric7 = :Numeric7,'
      '  Numeric8 = :Numeric8,'
      '  Check1 = :Check1,'
      '  Check2 = :Check2,'
      '  Check3 = :Check3,'
      '  Check4 = :Check4,'
      '  Check5 = :Check5,'
      '  Check6 = :Check6,'
      '  Check7 = :Check7,'
      '  Check8 = :Check8,'
      '  Int1 = :Int1,'
      '  Int2 = :Int2,'
      '  Int3 = :Int3,'
      '  Int4 = :Int4,'
      '  Int5 = :Int5,'
      '  Int6 = :Int6,'
      '  Int7 = :Int7,'
      '  Int8 = :Int8,'
      '  N_Cle_Combo1 = :N_Cle_Combo1,'
      '  N_Cle_Combo2 = :N_Cle_Combo2,'
      '  N_Cle_Combo3 = :N_Cle_Combo3,'
      '  N_Cle_Combo4 = :N_Cle_Combo4,'
      '  N_Cle_Combo5 = :N_Cle_Combo5,'
      '  N_Cle_Combo6 = :N_Cle_Combo6,'
      '  N_Cle_Combo7 = :N_Cle_Combo7,'
      '  N_Cle_Combo8 = :N_Cle_Combo8'
      'where'
      '  N_Ligne = :OLD_N_Ligne')
    InsertSQL.Strings = (
      'insert into EGXS_TB_GSF_WORKFLOW_DELEGATION'
      
        '  (Type_Fiche, N_Fiche, Libre1, Libre2, Libre3, Libre4, Libre5, ' +
        'Libre6, '
      
        '   Libre7, Libre8, Libre_Dlg1, Libre_Dlg2, Libre_Dlg3, Libre_Dlg' +
        '4, Texte1, '
      
        '   Texte2, Texte3, Texte4, Date1, Date2, Date3, Date4, Date5, Da' +
        'te6, Date7, '
      
        '   Date8, Numeric1, Numeric2, Numeric3, Numeric4, Numeric5, Nume' +
        'ric6, Numeric7, '
      
        '   Numeric8, Check1, Check2, Check3, Check4, Check5, Check6, Che' +
        'ck7, Check8, '
      
        '   Int1, Int2, Int3, Int4, Int5, Int6, Int7, Int8, N_Cle_Combo1,' +
        ' N_Cle_Combo2, '
      
        '   N_Cle_Combo3, N_Cle_Combo4, N_Cle_Combo5, N_Cle_Combo6, N_Cle' +
        '_Combo7, '
      '   N_Cle_Combo8)'
      'values'
      
        '  (:Type_Fiche, :N_Fiche, :Libre1, :Libre2, :Libre3, :Libre4, :L' +
        'ibre5, '
      
        '   :Libre6, :Libre7, :Libre8, :Libre_Dlg1, :Libre_Dlg2, :Libre_D' +
        'lg3, :Libre_Dlg4, '
      
        '   :Texte1, :Texte2, :Texte3, :Texte4, :Date1, :Date2, :Date3, :' +
        'Date4, '
      
        '   :Date5, :Date6, :Date7, :Date8, :Numeric1, :Numeric2, :Numeri' +
        'c3, :Numeric4, '
      
        '   :Numeric5, :Numeric6, :Numeric7, :Numeric8, :Check1, :Check2,' +
        ' :Check3, '
      
        '   :Check4, :Check5, :Check6, :Check7, :Check8, :Int1, :Int2, :I' +
        'nt3, :Int4, '
      
        '   :Int5, :Int6, :Int7, :Int8, :N_Cle_Combo1, :N_Cle_Combo2, :N_' +
        'Cle_Combo3, '
      
        '   :N_Cle_Combo4, :N_Cle_Combo5, :N_Cle_Combo6, :N_Cle_Combo7, :' +
        'N_Cle_Combo8)')
    DeleteSQL.Strings = (
      'delete from EGXS_TB_GSF_WORKFLOW_DELEGATION'
      'where'
      '  N_Ligne = :OLD_N_Ligne')
    Left = 532
    Top = 201
  end
  object PopupImprimer: TPopupMenu
    Images = MainForm.IconesPopup
    Left = 158
    Top = 96
    object ExcelExport: TMenuItem
      Caption = 'Excel'
      ImageIndex = 1
    end
    object HtmlExport: TMenuItem
      Caption = 'Html'
      ImageIndex = 2
      Visible = False
    end
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 78
    Top = 86
  end
  object PopupFonte: TPopupMenu
    Images = MainForm.IconesPopup
    Left = 198
    Top = 94
    object Gras1: TMenuItem
      Caption = 'Gras'
      ImageIndex = 8
    end
    object Italique1: TMenuItem
      Caption = 'Italique'
      ImageIndex = 9
    end
    object Soulign1: TMenuItem
      Caption = 'Souligné'
      ImageIndex = 10
    end
    object Barre1: TMenuItem
      Caption = 'Barré'
      ImageIndex = 11
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object Fond1: TMenuItem
      Caption = 'Fond'
      ImageIndex = 6
    end
    object Fonte1: TMenuItem
      Caption = 'Fonte'
      ImageIndex = 7
    end
  end
  object GCopier_Detail: TGCopierCollerGrid
    Grid = Gest_Listes_Detail
    Progression = True
    Left = 529
    Top = 500
  end
  object Popup_Detail: TAdvPopupMenu
    Images = MainForm.IconesFiches16PNG2
    MenuStyler = Popup_Detail.InternalMenuStyler
    Version = '1.1.0.0'
    Left = 573
    Top = 501
    object NouvelleLigne1: TMenuItem
      Caption = 'Nouvelle Ligne'
      ImageIndex = 80
      ShortCut = 45
    end
    object Supprimerlaselection1: TMenuItem
      Caption = 'Supprimer'
      ImageIndex = 81
      ShortCut = 16430
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Slection1: TMenuItem
      Caption = 'Sélection'
      ImageIndex = 8
      object Tout1: TMenuItem
        Caption = 'Tout'
        ImageIndex = -7
        ShortCut = 16449
      end
      object Ligne1: TMenuItem
        Caption = 'Ligne'
        ImageIndex = -12
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object CollerdepuisPressePapiers1: TMenuItem
        Caption = 'Coller'
        ImageIndex = -20
        ShortCut = 16470
      end
      object CopierdansPressePapiers1: TMenuItem
        Caption = 'Copier'
        ImageIndex = -19
        ShortCut = 16451
      end
      object CouperdansPressePapiers1: TMenuItem
        Caption = 'Couper'
        ImageIndex = -18
        ShortCut = 16472
      end
    end
    object N2: TMenuItem
      Caption = '-'
      Visible = False
    end
    object Actions1: TMenuItem
      Caption = 'Actions'
      ImageIndex = 72
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Grille1: TMenuItem
      Caption = 'Grille'
      ImageIndex = 12
      object SauvegarderGrille1: TMenuItem
        Caption = 'Sauvegarder'
        ImageIndex = 1
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Rinitialiser1: TMenuItem
        Caption = 'Réinitialiser'
        ImageIndex = 24
      end
    end
  end
  object Popup_Niveau: TAdvPopupMenu
    Images = MainForm.IconesListe_Plus
    MenuStyler = Popup_Niveau.InternalMenuStyler
    Version = '1.1.0.0'
    Left = 66
    Top = 480
    object DvelopperTout1: TMenuItem
      Caption = 'Développer Tout'
      ImageIndex = 229
    end
    object RduireTout1: TMenuItem
      Caption = 'Réduire Tout'
      ImageIndex = 227
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Configurationdescombos1: TMenuItem
      Caption = 'Configuration des combos'
      ImageIndex = 348
    end
  end
  object pm_Action: TAdvPopupMenu
    Images = MainForm.IconesFiches16
    MenuStyler = Popup_Detail.InternalMenuStyler
    Version = '1.1.0.0'
    Left = 597
    Top = 269
  end
  object wsp_Cbo1: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 368
    Top = 608
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object wsp_Cbo1N_Cle_Combo: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object wsp_Cbo1champ1: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object wsp_Cbo1champ1width: TIntegerField
      FieldName = 'champ1width'
    end
    object wsp_Cbo1champ2: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object wsp_Cbo1champ2width: TIntegerField
      FieldName = 'champ2width'
    end
    object wsp_Cbo1champ3: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object wsp_Cbo1champ3width: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wsp_Cbo2: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 400
    Top = 608
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object wsp_Cbo2N_Cle_Combo: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object wsp_Cbo2champ1: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object wsp_Cbo2champ1width: TIntegerField
      FieldName = 'champ1width'
    end
    object wsp_Cbo2champ2: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object wsp_Cbo2champ2width: TIntegerField
      FieldName = 'champ2width'
    end
    object wsp_Cbo2champ3: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object wsp_Cbo2champ3width: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wsp_Cbo3: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 432
    Top = 608
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object wsp_Cbo3N_Cle_Combo: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object wsp_Cbo3champ1: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object wsp_Cbo3champ1width: TIntegerField
      FieldName = 'champ1width'
    end
    object wsp_Cbo3champ2: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object wsp_Cbo3champ2width: TIntegerField
      FieldName = 'champ2width'
    end
    object wsp_Cbo3champ3: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object wsp_Cbo3champ3width: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wsp_Cbo4: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 464
    Top = 608
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object wsp_Cbo4N_Cle_Combo: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object wsp_Cbo4champ1: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object wsp_Cbo4champ1width: TIntegerField
      FieldName = 'champ1width'
    end
    object wsp_Cbo4champ2: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object wsp_Cbo4champ2width: TIntegerField
      FieldName = 'champ2width'
    end
    object wsp_Cbo4champ3: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object wsp_Cbo4champ3width: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wQ_Config_gen: TwwQuery
    DatabaseName = 'DBIntegrator'
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM EGX_TB_GSF_CONFIG T'
      'WHERE T.Racine_Nom = :Nom ')
    ControlType.Strings = (
      'Nom_PS_Liste;CustomEdit;cbo_PS;F'
      'Nom_VUE_Liste;CustomEdit;cbo_VUE;F')
    ValidateWithMask = True
    Left = 715
    Top = 203
    ParamData = <
      item
        DataType = ftString
        Name = 'Nom'
        ParamType = ptInput
      end>
  end
  object SP_BEFORE_CLOSE: TwwStoredProc
    DatabaseName = 'DBintegrator'
    StoredProcName = 'EGX_SP_GEST_LST_BEFORE_CLOSE;1'
    ValidateWithMask = True
    Left = 48
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@N_user'
        ParamType = ptInput
      end>
  end
  object SP_BEFORE_OPEN: TwwStoredProc
    DatabaseName = 'DBintegrator'
    StoredProcName = 'EGX_SP_GEST_LST_BEFORE_OPEN;1'
    ValidateWithMask = True
    Left = 46
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = -858993460
      end
      item
        DataType = ftInteger
        Name = '@N_user'
        ParamType = ptInput
      end>
  end
  object wsp_Cbo5: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 376
    Top = 648
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object StringField1: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object IntegerField2: TIntegerField
      FieldName = 'champ1width'
    end
    object StringField2: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object IntegerField3: TIntegerField
      FieldName = 'champ2width'
    end
    object StringField3: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object IntegerField4: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wsp_Cbo6: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 408
    Top = 648
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object IntegerField5: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object StringField4: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object IntegerField6: TIntegerField
      FieldName = 'champ1width'
    end
    object StringField5: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object IntegerField7: TIntegerField
      FieldName = 'champ2width'
    end
    object StringField6: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object IntegerField8: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wsp_Cbo7: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 440
    Top = 648
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object IntegerField9: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object StringField7: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object IntegerField10: TIntegerField
      FieldName = 'champ1width'
    end
    object StringField8: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object IntegerField11: TIntegerField
      FieldName = 'champ2width'
    end
    object StringField9: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object IntegerField12: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wsp_Cbo8: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_COMBO_EXEMPLE;1'
    ValidateWithMask = True
    Left = 472
    Top = 648
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@N_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Code'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Description'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo3'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_Cle_Combo4'
        ParamType = ptInput
      end>
    object IntegerField13: TIntegerField
      FieldName = 'N_Cle_Combo'
    end
    object StringField10: TStringField
      FieldName = 'champ1'
      Size = 50
    end
    object IntegerField14: TIntegerField
      FieldName = 'champ1width'
    end
    object StringField11: TStringField
      FieldName = 'champ2'
      Size = 1
    end
    object IntegerField15: TIntegerField
      FieldName = 'champ2width'
    end
    object StringField12: TStringField
      FieldName = 'champ3'
      Size = 1
    end
    object IntegerField16: TIntegerField
      FieldName = 'champ3width'
    end
  end
  object wq_Exist: TwwQuery
    DatabaseName = 'DBIntegrator'
    SQL.Strings = (
      'SELECT '
      '   Nom=Cast(o.[name] AS varchar(150))'
      'FROM dbo.sysobjects o '
      'WHERE '
      '    xtype in ( '#39'P'#39')'
      '')
    ValidateWithMask = True
    Left = 447
    Top = 336
    object wq_ExistNom: TStringField
      FieldName = 'Nom'
      Size = 150
    end
  end
  object AdvSQLMemoStyler1: TAdvSQLMemoStyler
    AutoCompletion.Strings = (
      'SELECT'
      'WHERE')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintCharWriteDelimiter = ','
    LineComment = '--'
    MultiCommentLeft = '/*'
    MultiCommentRight = '*/'
    CommentStyle.TextColor = clGreen
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = []
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'alter'
          'and'
          'begin'
          'break'
          'by'
          'close'
          'continue'
          'create'
          'deallocate'
          'declare'
          'delete'
          'do'
          'else'
          'end'
          'exec'
          'execute'
          'fetch'
          'for'
          'from'
          'group'
          'having'
          'if'
          'inner'
          'insert'
          'int'
          'integer'
          'join'
          'left'
          'like'
          'not'
          'numeric'
          'on'
          'open'
          'or'
          'order'
          'outer'
          'proc'
          'procedure'
          'repeat'
          'return'
          'right'
          'rollback'
          'select'
          'set'
          'text'
          'to'
          'trans'
          'transaction'
          'until'
          'update'
          'values'
          'varchar'
          'where'
          'while')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'SQL Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Chaine_sql'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' ,;:.(){}[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end
      item
        KeyWords.Strings = (
          #9
          'cast'
          'convert'
          'datename'#9#13
          'datepart'#9#13
          'getdate'
          'isdate'#9
          'isnull'#9
          'isnumeric'#9
          'month'#9#13
          'year'#9#13)
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'Fonction_systemes'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'Operateur_sql'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clRed
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'Mise en evidence'
      end>
    Description = 'SQL'
    Filter = 'SQL Files (*.sql)|*.sql'
    DefaultExtension = '.sql'
    StylerName = 'SQL'
    Extensions = 'sql'
    Left = 244
    Top = 252
  end
  object SP_AFTER_SAVE: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_AFTER_SAVE;1'
    ValidateWithMask = True
    Left = 110
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@N_user'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst_Detail'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end>
  end
  object wQ_Config_gen_mef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'DBIntegrator'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM EGX_TB_GSF_CONFIG_DISPLAY T'
      'WHERE T.Racine_Nom = :Nom'
      'AND ((NOT EXISTS (SELECT T2.N_Gsf_Config_Display'
      
        '                   FROM EGX_TB_GSF_CONFIG_DISPLAY T2 WHERE t2.N_' +
        'user = :N_user AND T2.Racine_Nom = :Nom)'
      'AND t.n_user = 0) OR  t.N_user = :N_user )')
    UpdateObject = TU_Config_gen_mef
    ControlType.Strings = (
      'Nom_PS_Liste;CustomEdit;cbo_PS;F'
      'Nom_VUE_Liste;CustomEdit;cbo_VUE;F')
    ValidateWithMask = True
    Left = 683
    Top = 203
    ParamData = <
      item
        DataType = ftString
        Name = 'Nom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'N_user'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Nom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'N_user'
        ParamType = ptInput
      end>
  end
  object wQ_Config_gen_mef_Def: TwwQuery
    DatabaseName = 'DBIntegrator'
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM EGX_TB_GSF_CONFIG_DISPLAY T'
      'WHERE T.Racine_Nom = :Nom'
      'AND T.N_user=0')
    ControlType.Strings = (
      'Nom_PS_Liste;CustomEdit;cbo_PS;F'
      'Nom_VUE_Liste;CustomEdit;cbo_VUE;F')
    ValidateWithMask = True
    Left = 683
    Top = 251
    ParamData = <
      item
        DataType = ftString
        Name = 'Nom'
        ParamType = ptInput
      end>
  end
  object TU_Config_gen_mef: TUpdateSQL
    ModifySQL.Strings = (
      'update EGX_TB_GSF_CONFIG_DISPLAY'
      'set'
      '  N_user = :N_user,'
      '  Racine_Nom = :Racine_Nom,'
      '  Tri_Defaut = :Tri_Defaut,'
      '  Libre1 = :Libre1,'
      '  Libre2 = :Libre2,'
      '  Libre3 = :Libre3,'
      '  Libre4 = :Libre4,'
      '  Libre5 = :Libre5,'
      '  Libre6 = :Libre6,'
      '  Libre7 = :Libre7,'
      '  Libre8 = :Libre8,'
      '  Dialogue1 = :Dialogue1,'
      '  Dialogue2 = :Dialogue2,'
      '  Dialogue3 = :Dialogue3,'
      '  Dialogue4 = :Dialogue4,'
      '  Texte1 = :Texte1,'
      '  Texte2 = :Texte2,'
      '  Texte3 = :Texte3,'
      '  Texte4 = :Texte4,'
      '  Date1 = :Date1,'
      '  Date2 = :Date2,'
      '  Date3 = :Date3,'
      '  Date4 = :Date4,'
      '  Date5 = :Date5,'
      '  Date6 = :Date6,'
      '  Date7 = :Date7,'
      '  Date8 = :Date8,'
      '  Numeric1 = :Numeric1,'
      '  Numeric2 = :Numeric2,'
      '  Numeric3 = :Numeric3,'
      '  Numeric4 = :Numeric4,'
      '  Numeric5 = :Numeric5,'
      '  Numeric6 = :Numeric6,'
      '  Numeric7 = :Numeric7,'
      '  Numeric8 = :Numeric8,'
      '  Numeric9 = :Numeric9,'
      '  Numeric10 = :Numeric10,'
      '  Numeric11 = :Numeric11,'
      '  Numeric12 = :Numeric12,'
      '  Numeric13 = :Numeric13,'
      '  Numeric14 = :Numeric14,'
      '  Check1 = :Check1,'
      '  Check2 = :Check2,'
      '  Check3 = :Check3,'
      '  Check4 = :Check4,'
      '  Check5 = :Check5,'
      '  Check6 = :Check6,'
      '  Check7 = :Check7,'
      '  Check8 = :Check8,'
      '  Int1 = :Int1,'
      '  Int2 = :Int2,'
      '  Int3 = :Int3,'
      '  Int4 = :Int4,'
      '  Int5 = :Int5,'
      '  Int6 = :Int6,'
      '  Int7 = :Int7,'
      '  Int8 = :Int8,'
      '  Libelle_Combo1 = :Libelle_Combo1,'
      '  Libelle_Combo2 = :Libelle_Combo2,'
      '  Libelle_Combo3 = :Libelle_Combo3,'
      '  Libelle_Combo4 = :Libelle_Combo4,'
      '  Libelle_Combo5 = :Libelle_Combo5,'
      '  Libelle_Combo6 = :Libelle_Combo6,'
      '  Libelle_Combo7 = :Libelle_Combo7,'
      '  Libelle_Combo8 = :Libelle_Combo8'
      'where'
      '  N_Gsf_Config_Display = :OLD_N_Gsf_Config_Display')
    InsertSQL.Strings = (
      'insert into EGX_TB_GSF_CONFIG_DISPLAY'
      
        '  (N_user, Racine_Nom, Tri_Defaut, Libre1, Libre2, Libre3, Libre' +
        '4, Libre5, '
      
        '   Libre6, Libre7, Libre8, Dialogue1, Dialogue2, Dialogue3, Dial' +
        'ogue4, '
      
        '   Texte1, Texte2, Texte3, Texte4, Date1, Date2, Date3, Date4, D' +
        'ate5, Date6, '
      
        '   Date7, Date8, Numeric1, Numeric2, Numeric3, Numeric4, Numeric' +
        '5, Numeric6, '
      
        '   Numeric7, Numeric8, Numeric9, Numeric10, Numeric11, Numeric12' +
        ', Numeric13, '
      
        '   Numeric14, Check1, Check2, Check3, Check4, Check5, Check6, Ch' +
        'eck7, Check8, '
      
        '   Int1, Int2, Int3, Int4, Int5, Int6, Int7, Int8, Libelle_Combo' +
        '1, Libelle_Combo2, '
      
        '   Libelle_Combo3, Libelle_Combo4, Libelle_Combo5, Libelle_Combo' +
        '6, Libelle_Combo7, '
      '   Libelle_Combo8)'
      'values'
      
        '  (:N_user, :Racine_Nom, :Tri_Defaut, :Libre1, :Libre2, :Libre3,' +
        ' :Libre4, '
      
        '   :Libre5, :Libre6, :Libre7, :Libre8, :Dialogue1, :Dialogue2, :' +
        'Dialogue3, '
      
        '   :Dialogue4, :Texte1, :Texte2, :Texte3, :Texte4, :Date1, :Date' +
        '2, :Date3, '
      
        '   :Date4, :Date5, :Date6, :Date7, :Date8, :Numeric1, :Numeric2,' +
        ' :Numeric3, '
      
        '   :Numeric4, :Numeric5, :Numeric6, :Numeric7, :Numeric8, :Numer' +
        'ic9, :Numeric10, '
      
        '   :Numeric11, :Numeric12, :Numeric13, :Numeric14, :Check1, :Che' +
        'ck2, :Check3, '
      
        '   :Check4, :Check5, :Check6, :Check7, :Check8, :Int1, :Int2, :I' +
        'nt3, :Int4, '
      
        '   :Int5, :Int6, :Int7, :Int8, :Libelle_Combo1, :Libelle_Combo2,' +
        ' :Libelle_Combo3, '
      
        '   :Libelle_Combo4, :Libelle_Combo5, :Libelle_Combo6, :Libelle_C' +
        'ombo7, '
      '   :Libelle_Combo8)')
    DeleteSQL.Strings = (
      'delete from EGX_TB_GSF_CONFIG_DISPLAY'
      'where'
      '  N_Gsf_Config_Display = :OLD_N_Gsf_Config_Display')
    Left = 762
    Top = 260
  end
  object SP_INSERT: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_AFTER_SAVE;1'
    ValidateWithMask = True
    Left = 86
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@N_user'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst_Detail'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end>
  end
  object wq_Listes_Detail: TwwQuery
    CachedUpdates = True
    DatabaseName = 'DBIntegrator'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      ' N_Ligne = Cast(NULL as int)'#9
      ', Type_Fiche = Cast(NULL as int)'#9
      ', N_Fiche = Cast(NULL as int)'#9
      ', N_Position = Cast(NULL as Numeric(18,10))'#9
      ', N_Position_Max = Cast(NULL as Numeric(18,10))'#9
      ', User_Create = Cast(NULL as int)'#9
      ', Date_Create = Cast(NULL as Datetime)'#9
      ', User_Modif = Cast(NULL as int)'#9
      ', Date_Modif = Cast(NULL as Datetime)'#9
      ', ColorFond = Cast(NULL as int)'#9
      ', ColorTexte = Cast(NULL as int)'#9
      ', StyleFonte = Cast(NULL as int)'#9
      ', Genesys_Lock = Cast(NULL as Varchar(3))'#9
      ', Libre1 = Cast(NULL as Varchar(100))'#9
      ', Libre2 = Cast(NULL as Varchar(100))'#9
      ', Libre3 = Cast(NULL as Varchar(100))'#9
      ', Libre4 = Cast(NULL as Varchar(100))'#9
      ', Libre5 = Cast(NULL as Varchar(100))'#9
      ', Libre6 = Cast(NULL as Varchar(100))'#9
      ', Libre7 = Cast(NULL as Varchar(100))'#9
      ', Libre8 = Cast(NULL as Varchar(100))'#9
      ', Dialogue1 = Cast(NULL as Varchar(100))'#9
      ', Dialogue2 = Cast(NULL as Varchar(100))'#9
      ', Dialogue3 = Cast(NULL as Varchar(100))'#9
      ', Dialogue4 = Cast(NULL as Varchar(100))'#9
      ', Texte1 = Cast(NULL as text)'#9
      ', Texte2 = Cast(NULL as text)'#9
      ', Texte3 = Cast(NULL as text)'#9
      ', Texte4 = Cast(NULL as text)'#9
      ', Date1 = Cast(NULL as Datetime)'#9
      ', Date2 = Cast(NULL as Datetime)'#9
      ', Date3 = Cast(NULL as Datetime)'#9
      ', Date4 = Cast(NULL as Datetime)'#9
      ', Date5 = Cast(NULL as Datetime)'#9
      ', Date6 = Cast(NULL as Datetime)'#9
      ', Date7 = Cast(NULL as Datetime)'#9
      ', Date8 = Cast(NULL as Datetime)'#9
      ', Numeric1 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric2 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric3 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric4 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric5 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric6 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric7 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric8 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric9 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric10 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric11 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric12 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric13 = Cast(NULL as Numeric(18,10))'#9
      ', Numeric14 = Cast(NULL as Numeric(18,10))'#9
      ', Check1 = Cast(NULL as Varchar(3))'#9
      ', Check2 = Cast(NULL as Varchar(3))'#9
      ', Check3 = Cast(NULL as Varchar(3))'#9
      ', Check4 = Cast(NULL as Varchar(3))'#9
      ', Check5 = Cast(NULL as Varchar(3))'#9
      ', Check6 = Cast(NULL as Varchar(3))'#9
      ', Check7 = Cast(NULL as Varchar(3))'#9
      ', Check8 = Cast(NULL as Varchar(3))'#9
      ', Int1 = Cast(NULL as int)'#9
      ', Int2 = Cast(NULL as int)'#9
      ', Int3 = Cast(NULL as int)'#9
      ', Int4 = Cast(NULL as int)'#9
      ', Int5 = Cast(NULL as int)'#9
      ', Int6 = Cast(NULL as int)'#9
      ', Int7 = Cast(NULL as int)'#9
      ', Int8 = Cast(NULL as int)'#9
      ', N_Cle_Combo1 = Cast(NULL as int)'#9
      ', N_Cle_Combo2 = Cast(NULL as int)'#9
      ', N_Cle_Combo3 = Cast(NULL as int)'#9
      ', N_Cle_Combo4 = Cast(NULL as int)'#9
      ', N_Cle_Combo5 = Cast(NULL as int)'#9
      ', N_Cle_Combo6 = Cast(NULL as int)'#9
      ', N_Cle_Combo7 = Cast(NULL as int)'#9
      ', N_Cle_Combo8 = Cast(NULL as int)'#9
      ', Libelle_Combo1 = Cast(NULL as Varchar(100))'#9
      ', Libelle_Combo2 = Cast(NULL as Varchar(100))'#9
      ', Libelle_Combo3 = Cast(NULL as Varchar(100))'#9
      ', Libelle_Combo4 = Cast(NULL as Varchar(100))'#9
      ', Libelle_Combo5 = Cast(NULL as Varchar(100))'#9
      ', Libelle_Combo6 = Cast(NULL as Varchar(100))'#9
      ', Libelle_Combo7 = Cast(NULL as Varchar(100))'#9
      ', Libelle_Combo8 = Cast(NULL as Varchar(100))'#9)
    UpdateObject = TU_listes_Detail
    ControlType.Strings = (
      'Dialogue4;CustomEdit;cboDlg4;F'
      'Dialogue1;CustomEdit;cboDlg1;F'
      'Dialogue2;CustomEdit;cboDlg2;F'
      'Dialogue3;CustomEdit;cboDlg3;F'
      'Texte1;RichEdit;Rtf1;F'
      'Texte2;RichEdit;Rtf2;F'
      'Texte3;RichEdit;Rtf3;F'
      'Texte4;RichEdit;Rtf4;F'
      'Check1;CheckBox;Oui;Non'
      'Check8;CheckBox;Oui;Non'
      'Check2;CheckBox;Oui;Non'
      'Check3;CheckBox;Oui;Non'
      'Check4;CheckBox;Oui;Non'
      'Check5;CheckBox;Oui;Non'
      'Check6;CheckBox;Oui;Non'
      'Check7;CheckBox;Oui;Non'
      'Libelle_Combo1;CustomEdit;Combo1;F'
      'Libelle_Combo2;CustomEdit;Combo2;F'
      'Libelle_Combo3;CustomEdit;Combo3;F'
      'Libelle_Combo4;CustomEdit;Combo4;F'
      'Libelle_Combo5;CustomEdit;Combo5;F'
      'Libelle_Combo6;CustomEdit;Combo6;F'
      'Libelle_Combo7;CustomEdit;Combo7;F'
      'Libelle_Combo8;CustomEdit;Combo8;F')
    ValidateWithMask = True
    Left = 466
    Top = 209
    object wq_Listes_DetailN_Ligne: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Ligne'
    end
    object wq_Listes_DetailType_Fiche: TIntegerField
      DisplayWidth = 10
      FieldName = 'Type_Fiche'
    end
    object wq_Listes_DetailN_Fiche: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Fiche'
    end
    object wq_Listes_DetailN_Position: TFloatField
      DisplayWidth = 10
      FieldName = 'N_Position'
    end
    object wq_Listes_DetailN_Position_Max: TFloatField
      DisplayWidth = 10
      FieldName = 'N_Position_Max'
    end
    object wq_Listes_DetailUser_Create: TIntegerField
      DisplayWidth = 10
      FieldName = 'User_Create'
    end
    object wq_Listes_DetailDate_Create: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date_Create'
    end
    object wq_Listes_DetailUser_Modif: TIntegerField
      DisplayWidth = 10
      FieldName = 'User_Modif'
    end
    object wq_Listes_DetailDate_Modif: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date_Modif'
    end
    object wq_Listes_DetailColorFond: TIntegerField
      DisplayWidth = 10
      FieldName = 'ColorFond'
    end
    object wq_Listes_DetailColorTexte: TIntegerField
      DisplayWidth = 10
      FieldName = 'ColorTexte'
    end
    object wq_Listes_DetailStyleFonte: TIntegerField
      DisplayWidth = 10
      FieldName = 'StyleFonte'
    end
    object wq_Listes_DetailGenesys_Lock: TStringField
      DisplayWidth = 3
      FieldName = 'Genesys_Lock'
      Size = 3
    end
    object wq_Listes_DetailLibre1: TStringField
      DisplayWidth = 100
      FieldName = 'Libre1'
      Size = 100
    end
    object wq_Listes_DetailLibre2: TStringField
      DisplayWidth = 100
      FieldName = 'Libre2'
      Size = 100
    end
    object wq_Listes_DetailLibre3: TStringField
      DisplayWidth = 100
      FieldName = 'Libre3'
      Size = 100
    end
    object wq_Listes_DetailLibre4: TStringField
      DisplayWidth = 100
      FieldName = 'Libre4'
      Size = 100
    end
    object wq_Listes_DetailLibre5: TStringField
      DisplayWidth = 100
      FieldName = 'Libre5'
      Size = 100
    end
    object wq_Listes_DetailLibre6: TStringField
      DisplayWidth = 100
      FieldName = 'Libre6'
      Size = 100
    end
    object wq_Listes_DetailLibre7: TStringField
      DisplayWidth = 100
      FieldName = 'Libre7'
      Size = 100
    end
    object wq_Listes_DetailLibre8: TStringField
      DisplayWidth = 100
      FieldName = 'Libre8'
      Size = 100
    end
    object wq_Listes_DetailDialogue1: TStringField
      DisplayWidth = 100
      FieldName = 'Dialogue1'
      Size = 100
    end
    object wq_Listes_DetailDialogue2: TStringField
      DisplayWidth = 100
      FieldName = 'Dialogue2'
      Size = 100
    end
    object wq_Listes_DetailDialogue3: TStringField
      DisplayWidth = 100
      FieldName = 'Dialogue3'
      Size = 100
    end
    object wq_Listes_DetailDialogue4: TStringField
      DisplayWidth = 100
      FieldName = 'Dialogue4'
      Size = 100
    end
    object wq_Listes_DetailTexte1: TMemoField
      DisplayWidth = 10
      FieldName = 'Texte1'
      BlobType = ftMemo
      Size = 1
    end
    object wq_Listes_DetailTexte2: TMemoField
      DisplayWidth = 10
      FieldName = 'Texte2'
      BlobType = ftMemo
      Size = 1
    end
    object wq_Listes_DetailTexte3: TMemoField
      DisplayWidth = 10
      FieldName = 'Texte3'
      BlobType = ftMemo
      Size = 1
    end
    object wq_Listes_DetailTexte4: TMemoField
      DisplayWidth = 10
      FieldName = 'Texte4'
      BlobType = ftMemo
      Size = 1
    end
    object wq_Listes_DetailDate1: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date1'
    end
    object wq_Listes_DetailDate2: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date2'
    end
    object wq_Listes_DetailDate3: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date3'
    end
    object wq_Listes_DetailDate4: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date4'
    end
    object wq_Listes_DetailDate5: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date5'
    end
    object wq_Listes_DetailDate6: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date6'
    end
    object wq_Listes_DetailDate7: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date7'
    end
    object wq_Listes_DetailDate8: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Date8'
    end
    object wq_Listes_DetailNumeric1: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric1'
    end
    object wq_Listes_DetailNumeric2: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric2'
    end
    object wq_Listes_DetailNumeric3: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric3'
    end
    object wq_Listes_DetailNumeric4: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric4'
    end
    object wq_Listes_DetailNumeric5: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric5'
    end
    object wq_Listes_DetailNumeric6: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric6'
    end
    object wq_Listes_DetailNumeric7: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric7'
    end
    object wq_Listes_DetailNumeric8: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric8'
    end
    object wq_Listes_DetailNumeric9: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric9'
    end
    object wq_Listes_DetailNumeric10: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric10'
    end
    object wq_Listes_DetailNumeric11: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric11'
    end
    object wq_Listes_DetailNumeric12: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric12'
    end
    object wq_Listes_DetailNumeric13: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric13'
    end
    object wq_Listes_DetailNumeric14: TFloatField
      DisplayWidth = 10
      FieldName = 'Numeric14'
    end
    object wq_Listes_DetailCheck1: TStringField
      DisplayWidth = 3
      FieldName = 'Check1'
      Size = 3
    end
    object wq_Listes_DetailCheck2: TStringField
      DisplayWidth = 3
      FieldName = 'Check2'
      Size = 3
    end
    object wq_Listes_DetailCheck3: TStringField
      DisplayWidth = 3
      FieldName = 'Check3'
      Size = 3
    end
    object wq_Listes_DetailCheck4: TStringField
      DisplayWidth = 3
      FieldName = 'Check4'
      Size = 3
    end
    object wq_Listes_DetailCheck5: TStringField
      DisplayWidth = 3
      FieldName = 'Check5'
      Size = 3
    end
    object wq_Listes_DetailCheck6: TStringField
      DisplayWidth = 3
      FieldName = 'Check6'
      Size = 3
    end
    object wq_Listes_DetailCheck7: TStringField
      DisplayWidth = 3
      FieldName = 'Check7'
      Size = 3
    end
    object wq_Listes_DetailCheck8: TStringField
      DisplayWidth = 3
      FieldName = 'Check8'
      Size = 3
    end
    object wq_Listes_DetailInt1: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int1'
    end
    object wq_Listes_DetailInt2: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int2'
    end
    object wq_Listes_DetailInt3: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int3'
    end
    object wq_Listes_DetailInt4: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int4'
    end
    object wq_Listes_DetailInt5: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int5'
    end
    object wq_Listes_DetailInt6: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int6'
    end
    object wq_Listes_DetailInt7: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int7'
    end
    object wq_Listes_DetailInt8: TIntegerField
      DisplayWidth = 10
      FieldName = 'Int8'
    end
    object wq_Listes_DetailN_Cle_Combo1: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo1'
    end
    object wq_Listes_DetailN_Cle_Combo2: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo2'
    end
    object wq_Listes_DetailN_Cle_Combo3: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo3'
    end
    object wq_Listes_DetailN_Cle_Combo4: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo4'
    end
    object wq_Listes_DetailN_Cle_Combo5: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo5'
    end
    object wq_Listes_DetailN_Cle_Combo6: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo6'
    end
    object wq_Listes_DetailN_Cle_Combo7: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo7'
    end
    object wq_Listes_DetailN_Cle_Combo8: TIntegerField
      DisplayWidth = 10
      FieldName = 'N_Cle_Combo8'
    end
    object wq_Listes_DetailLibelle_Combo1: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo1'
      Size = 100
    end
    object wq_Listes_DetailLibelle_Combo2: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo2'
      Size = 100
    end
    object wq_Listes_DetailLibelle_Combo3: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo3'
      Size = 100
    end
    object wq_Listes_DetailLibelle_Combo4: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo4'
      Size = 100
    end
    object wq_Listes_DetailLibelle_Combo5: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo5'
      Size = 100
    end
    object wq_Listes_DetailLibelle_Combo6: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo6'
      Size = 100
    end
    object wq_Listes_DetailLibelle_Combo7: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo7'
      Size = 100
    end
    object wq_Listes_DetailLibelle_Combo8: TStringField
      DisplayWidth = 100
      FieldName = 'Libelle_Combo8'
      Size = 100
    end
  end
  object SP_ACTION: TwwStoredProc
    AutoCalcFields = False
    DatabaseName = 'DBIntegrator'
    ValidateWithMask = True
    OnFilterOptions = []
    Left = 190
    Top = 321
  end
  object SP_TOTAUX: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_AFTER_SAVE;1'
    ValidateWithMask = True
    Left = 86
    Top = 321
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@N_user'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst_Detail'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end>
  end
  object SP_CONFIG: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    ValidateWithMask = True
    Left = 186
    Top = 211
  end
  object SP_ACTION_MENU_EXEC: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_AFTER_SAVE;1'
    ValidateWithMask = True
    Left = 142
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@N_user'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst_Detail'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end>
  end
  object SP_ACTION_LIGNE_EXEC: TwwStoredProc
    DatabaseName = 'DBIntegrator'
    StoredProcName = 'EGX_SP_GEST_LST_AFTER_SAVE;1'
    ValidateWithMask = True
    Left = 102
    Top = 377
    ParamData = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@N_user'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@N_lst_Detail'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Niveau'
        ParamType = ptInput
      end>
  end
end
