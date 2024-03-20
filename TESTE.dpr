program TESTE;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  udmConexao in 'udmConexao.pas' {dmConexao: TDataModule},
  uCadProdutos in 'uCadProdutos.pas' {fCadProduto},
  uListaProdutos in 'uListaProdutos.Pas' {fListaProdutos},
  uEntradaSaidaEstoque in 'uEntradaSaidaEstoque.pas' {fEntradaSaidaEstoque},
  uLogin in 'uLogin.pas' {fLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfCadProduto, fCadProduto);
  Application.CreateForm(TfListaProdutos, fListaProdutos);
  Application.CreateForm(TfEntradaSaidaEstoque, fEntradaSaidaEstoque);
  Application.CreateForm(TfLogin, fLogin);
  Application.Run;
end.
