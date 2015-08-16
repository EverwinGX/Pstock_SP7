object F_Wait: TF_Wait
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'F_Wait'
  ClientHeight = 520
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object fcLabel1: TfcLabel
    Left = 537
    Top = 353
    Width = 258
    Height = 37
    Caption = 'Traitement en cours'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TextOptions.Alignment = taLeftJustify
    TextOptions.VAlignment = vaTop
    Transparent = True
  end
  object AdvCircularProgress1: TAdvCircularProgress
    Left = 645
    Top = 412
    Width = 40
    Height = 40
    Enabled = False
    Max = 13
    Appearance.BackGroundColor = clNone
    Appearance.BorderColor = clNone
    Appearance.ActiveSegmentColor = clWhite
    Appearance.InActiveSegmentColor = clWhite
    Appearance.TransitionSegmentColor = 5591891
    Appearance.ProgressSegmentColor = clWhite
    Interval = 1000
  end
end
