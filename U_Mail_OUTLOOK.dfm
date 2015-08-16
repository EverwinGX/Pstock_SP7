object F_Mail_OUTLOOK: TF_Mail_OUTLOOK
  Left = 1012
  Top = 373
  Caption = 'F_Mail_OUTLOOK'
  ClientHeight = 273
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object wq_Outlook2: TADOQuery
    Connection = Form1.Database
    Parameters = <
      item
        Name = 'N_user'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EGXS_TB_MAIL_OUTLOOK T '
      'WHERE T.N_User = :N_User AND ISNULL(Envoye,'#39'Non'#39')='#39'Non'#39
      'ORDER BY T.Ordre')
    Left = 48
    Top = 120
  end
  object wq_Outlook_dest2: TADOQuery
    Connection = Form1.Database
    Parameters = <
      item
        Name = 'N_mail'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EGXS_TB_MAIL_OUTLOOK_DESTINATAIRES T '
      'WHERE T.N_Mail = :N_mail'
      'ORDER BY T.Ordre')
    Left = 104
    Top = 120
  end
  object wq_Outlook_Fic2: TADOQuery
    Connection = Form1.Database
    Parameters = <
      item
        Name = 'N_mail'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EGXS_TB_MAIL_OUTLOOK_FICHIER_ATTACHE T '
      'WHERE T.N_Mail = :N_mail'
      'ORDER BY T.Ordre')
    Left = 152
    Top = 120
  end
  object OutlookApplication1: TOutlookApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 328
    Top = 184
  end
  object wq_Outlook: TADQuery
    CachedUpdates = True
    Connection = Form1.Database
    UpdateOptions.AssignedValues = [uvRefreshMode, uvCountUpdatedRecords]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.CountUpdatedRecords = False
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EGXS_TB_MAIL_OUTLOOK T '
      'WHERE T.N_User = :N_User AND ISNULL(Envoye,'#39'Non'#39')='#39'Non'#39
      'ORDER BY T.Ordre')
    Left = 48
    Top = 68
    ParamData = <
      item
        Name = 'N_USER'
        ParamType = ptInput
      end>
  end
  object wq_Outlook_dest: TADQuery
    CachedUpdates = True
    Connection = Form1.Database
    UpdateOptions.AssignedValues = [uvRefreshMode, uvCountUpdatedRecords]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.CountUpdatedRecords = False
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EGXS_TB_MAIL_OUTLOOK_DESTINATAIRES T '
      'WHERE T.N_Mail = :N_mail'
      'ORDER BY T.Ordre')
    Left = 104
    Top = 68
    ParamData = <
      item
        Name = 'N_MAIL'
        ParamType = ptInput
      end>
  end
  object wq_Outlook_Fic: TADQuery
    CachedUpdates = True
    Connection = Form1.Database
    UpdateOptions.AssignedValues = [uvRefreshMode, uvCountUpdatedRecords]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.CountUpdatedRecords = False
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EGXS_TB_MAIL_OUTLOOK_FICHIER_ATTACHE T '
      'WHERE T.N_Mail = :N_mail'
      'ORDER BY T.Ordre')
    Left = 152
    Top = 68
    ParamData = <
      item
        Name = 'N_MAIL'
        ParamType = ptInput
      end>
  end
end
