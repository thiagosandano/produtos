object fEntradaSaidaEstoque: TfEntradaSaidaEstoque
  Left = 0
  Top = 0
  Caption = 'fEntradaSaidaEstoque'
  ClientHeight = 190
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 235
    Top = 29
    Width = 157
    Height = 15
    Caption = 'Quantidade de Entrada /Sa'#237'da'
  end
  object btnConfirmar: TButton
    Left = 147
    Top = 109
    Width = 113
    Height = 65
    Caption = 'Confirmar'
    TabOrder = 0
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton
    Left = 360
    Top = 109
    Width = 113
    Height = 65
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object edtQuantidade: TSpinEdit
    Left = 224
    Top = 50
    Width = 185
    Height = 24
    MaxValue = 99999999
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object qryAux: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      '')
    Left = 504
    Top = 50
  end
  object qryEstoque: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      ' select e.quantidade'
      '   from estoque e'
      '  where e.id_produto = :id')
    Left = 64
    Top = 50
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryEstoqueQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
  end
  object FDTransaction1: TFDTransaction
    Connection = dmConexao.FDConexao
    Left = 536
    Top = 120
  end
end
