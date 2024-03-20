unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Menus, uCadProdutos, uListaProdutos, uLogin;

type
  TfPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mniProdutos: TMenuItem;
    mniEntradaSadadeProdutos: TMenuItem;
    mniSair: TMenuItem;
    mniCadastroProdutos: TMenuItem;
    mniListaProdutos: TMenuItem;
    mniEntrada: TMenuItem;
    mniSaida: TMenuItem;
    procedure mniCadastroProdutosClick(Sender: TObject);
    procedure mniListaProdutosClick(Sender: TObject);
    procedure mniEntradaClick(Sender: TObject);
    procedure mniSaidaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.mniCadastroProdutosClick(Sender: TObject);
begin
   TfCadProduto.AbrirTela;
end;

procedure TfPrincipal.mniEntradaClick(Sender: TObject);
begin
   TfListaProdutos.AbrirTela(True, False);
end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
   if not tfLogin.VerificarLogin then
      Close;
end;

procedure TfPrincipal.mniListaProdutosClick(Sender: TObject);
begin
   TfListaProdutos.AbrirTela(False, False);
end;

procedure TfPrincipal.mniSaidaClick(Sender: TObject);
begin
   TfListaProdutos.AbrirTela(False, True);
end;

procedure TfPrincipal.mniSairClick(Sender: TObject);
begin
   Close;
end;

end.
