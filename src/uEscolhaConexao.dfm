object frmEscolhaConexao: TfrmEscolhaConexao
  Left = 214
  Top = 116
  Width = 378
  Height = 127
  Caption = 'Escolha a Conex'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnZeos: TSpeedButton
    Left = 24
    Top = 16
    Width = 150
    Height = 50
    Cursor = crHandPoint
    Caption = 'Conex'#227'o Zeos'
    OnClick = btnZeosClick
  end
  object btnDBExpress: TSpeedButton
    Left = 192
    Top = 16
    Width = 150
    Height = 50
    Cursor = crHandPoint
    Caption = 'Conex'#227'o DBExpress'
    OnClick = btnDBExpressClick
  end
end
