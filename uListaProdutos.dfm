object fListaProdutos: TfListaProdutos
  Left = 0
  Top = 0
  Caption = 'Lista de Produtos'
  ClientHeight = 480
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  DesignSize = (
    836
    480)
  TextHeight = 15
  object pnDados: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 97
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 830
    object lblProduto: TLabel
      Left = 24
      Top = 17
      Width = 96
      Height = 15
      Caption = 'Nome do Produto'
    end
    object edtProduto: TEdit
      Left = 24
      Top = 38
      Width = 713
      Height = 23
      TabOrder = 0
    end
    object btnLocalizar: TButton
      Left = 752
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Localizar'
      TabOrder = 1
      OnClick = btnLocalizarClick
    end
  end
  object grdProdutos: TDBGrid
    Left = 0
    Top = 97
    Width = 830
    Height = 374
    Anchors = []
    DataSource = dsLocalizar
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = grdProdutosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORIA'
        Width = 301
        Visible = True
      end>
  end
  object qryLocalizar: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select p.id'
      '     , p.descricao'
      '     , p.valor'
      
        '     , (select e.quantidade from estoque e where e.id_produto = ' +
        'p.id) as quantidade'
      
        '     , (select c.descricao from categorias c where c.id = p.id_c' +
        'ategoria) as categoria'
      '  from produtos p'
      ' where 1=1')
    Left = 464
    Top = 296
    object qryLocalizarID: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLocalizarDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryLocalizarVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 3
    end
    object qryLocalizarQUANTIDADE: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
    object qryLocalizarCATEGORIA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsLocalizar: TDataSource
    DataSet = qryLocalizar
    Left = 384
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 296
    object VizualizarProduto1: TMenuItem
      Caption = 'Visualizar Produto'
      OnClick = VizualizarProduto1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 184
    Top = 288
    object MenuItem1: TMenuItem
      Caption = 'Realizar Entrada'
      OnClick = MenuItem1Click
    end
    object RealizarSada1: TMenuItem
      Caption = 'Realizar Sa'#237'da'
      OnClick = RealizarSada1Click
    end
  end
end
