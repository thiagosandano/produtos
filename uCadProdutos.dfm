object fCadProduto: TfCadProduto
  Left = 0
  Top = 0
  Caption = 'fCadProduto'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object lblNome: TLabel
    Left = 27
    Top = 35
    Width = 46
    Height = 15
    Caption = 'lblNome'
  end
  object lblValor: TLabel
    Left = 27
    Top = 85
    Width = 39
    Height = 15
    Caption = 'lblValor'
  end
  object lblQuantidade: TLabel
    Left = 27
    Top = 141
    Width = 127
    Height = 15
    Caption = 'Quantidade em estoque'
  end
  object lblCategoria: TLabel
    Left = 27
    Top = 197
    Width = 51
    Height = 15
    Caption = 'Categoria'
  end
  object Button1: TButton
    Left = 248
    Top = 352
    Width = 113
    Height = 65
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 464
    Top = 352
    Width = 113
    Height = 65
    Caption = 'Excluir'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 35
    Top = 352
    Width = 113
    Height = 65
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = Button4Click
  end
  object edtNome: TDBEdit
    Left = 27
    Top = 56
    Width = 566
    Height = 23
    DataField = 'DESCRICAO'
    DataSource = dsProduto
    TabOrder = 3
  end
  object edtValor: TDBEdit
    Left = 27
    Top = 106
    Width = 158
    Height = 23
    DataField = 'VALOR'
    DataSource = dsProduto
    TabOrder = 4
  end
  object edtQuantidade: TDBEdit
    Left = 27
    Top = 162
    Width = 158
    Height = 23
    DataField = 'QUANTIDADE'
    DataSource = dsProduto
    TabOrder = 5
  end
  object cbCategoria: TDBLookupComboBox
    Left = 27
    Top = 218
    Width = 566
    Height = 23
    DataField = 'ID_CATEGORIA'
    DataSource = dsProduto
    KeyField = 'ID'
    ListField = 'DESCRICAO'
    ListSource = dsCategorias
    TabOrder = 6
  end
  object qryProduto: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      ' select p.id'
      '      , p.descricao'
      '      , p.valor'
      '      , p.id_categoria'
      
        '      , (select e.quantidade from estoque e where e.id_produto =' +
        ' p.id) as quantidade'
      '   from produtos p'
      '  where p.id = :id')
    Left = 400
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryProdutoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 3
    end
    object qryProdutoID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object qryProdutoQUANTIDADE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 328
    Top = 280
  end
  object qryCategorias: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select * from categorias')
    Left = 104
    Top = 280
    object qryCategoriasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCategoriasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
  end
  object dsCategorias: TDataSource
    DataSet = qryCategorias
    Left = 168
    Top = 280
  end
  object qryAux: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      '')
    Left = 480
    Top = 280
  end
end
