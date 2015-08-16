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
  object wq_Outlook: TADOQuery
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
  object wq_Outlook_dest: TADOQuery
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
  object wq_Outlook_Fic: TADOQuery
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
end
