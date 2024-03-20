object fLogin: TfLogin
  Left = 0
  Top = 0
  Anchors = []
  BorderIcons = []
  Caption = 'Login'
  ClientHeight = 167
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblNome: TLabel
    Left = 88
    Top = 27
    Width = 40
    Height = 15
    Caption = 'Usu'#225'rio'
  end
  object lblSenha: TLabel
    Left = 88
    Top = 83
    Width = 32
    Height = 15
    Caption = 'Senha'
  end
  object edtNome: TEdit
    Left = 88
    Top = 48
    Width = 289
    Height = 23
    TabOrder = 0
  end
  object edtSenha: TMaskEdit
    Left = 88
    Top = 104
    Width = 289
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
  object btnLogin: TButton
    Left = 200
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object qryAux: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      '')
    Left = 418
    Top = 75
  end
end
