object dmConexao: TdmConexao
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConexao: TFDConnection
    ConnectionName = 'conTeste'
    Params.Strings = (
      'Database=C:\git\produtos\TESTE'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'DriverID=FB')
    Connected = True
    Left = 48
    Top = 56
  end
end
