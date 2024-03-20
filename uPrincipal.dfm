object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Cadastro de Produtos'
  ClientHeight = 424
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 8
    Top = 32
    object mniProdutos: TMenuItem
      Caption = 'Produtos'
      object mniCadastroProdutos: TMenuItem
        Caption = 'Cadastro de Produtos'
        OnClick = mniCadastroProdutosClick
      end
      object mniListaProdutos: TMenuItem
        Caption = 'Lista de Produtos'
        OnClick = mniListaProdutosClick
      end
    end
    object mniEntradaSadadeProdutos: TMenuItem
      Caption = 'Entrada/Sa'#237'da de Produtos'
      object mniEntrada: TMenuItem
        Caption = 'Entrada'
        OnClick = mniEntradaClick
      end
      object mniSaida: TMenuItem
        Caption = 'Sa'#237'da'
        OnClick = mniSaidaClick
      end
    end
    object mniSair: TMenuItem
      Caption = 'Sair'
      OnClick = mniSairClick
    end
  end
end
