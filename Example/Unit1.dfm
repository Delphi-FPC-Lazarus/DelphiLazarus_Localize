object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Das ist eine Testanwendung'
  ClientHeight = 243
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 116
    Height = 13
    Caption = 'Das hier ist ein Testlabel'
  end
  object Button1: TButton
    Left = 16
    Top = 35
    Width = 116
    Height = 25
    Caption = 'dr'#252'ck mich'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 424
    Top = 8
    Width = 95
    Height = 25
    Caption = 'Lesen'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 424
    Top = 39
    Width = 95
    Height = 25
    Caption = 'Setze DE'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 424
    Top = 70
    Width = 95
    Height = 25
    Caption = 'Setze EN'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 424
    Top = 101
    Width = 95
    Height = 25
    Caption = 'Zur'#252'cksetzen'
    TabOrder = 4
    OnClick = Button5Click
  end
end
