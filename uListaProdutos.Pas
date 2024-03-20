unit uListaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, udmConexao, Vcl.Menus, uCadProdutos, uEntradaSaidaEstoque;

type
  TfListaProdutos = class(TForm)
    pnDados: TPanel;
    edtProduto: TEdit;
    btnLocalizar: TButton;
    lblProduto: TLabel;
    grdProdutos: TDBGrid;
    qryLocalizar: TFDQuery;
    qryLocalizarID: TIntegerField;
    qryLocalizarDESCRICAO: TStringField;
    qryLocalizarVALOR: TFMTBCDField;
    qryLocalizarQUANTIDADE: TFMTBCDField;
    dsLocalizar: TDataSource;
    PopupMenu1: TPopupMenu;
    VizualizarProduto1: TMenuItem;
    qryLocalizarCATEGORIA: TStringField;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    RealizarSada1: TMenuItem;
    procedure VizualizarProduto1Click(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure RealizarSada1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure grdProdutosDblClick(Sender: TObject);
  private
    { Private declarations }

    bEntrada: Boolean;
    bSaida:   Boolean;
  public
    { Public declarations }
    class procedure AbrirTela(bEntrada, bSaida: Boolean);
  end;

var
  fListaProdutos: TfListaProdutos;

implementation

{$R *.dfm}

class procedure TfListaProdutos.AbrirTela(bEntrada, bSaida: Boolean);
var
   bCriarDestruir: boolean;
begin
   bCriarDestruir := not Assigned(fListaProdutos) ;

   try
      if bCriarDestruir then
         fListaProdutos.Create(nil);

      fListaProdutos.bEntrada := bEntrada;
      fListaProdutos.bSaida   := bSaida;

      fListaProdutos.ShowModal;
   finally
      if bCriarDestruir then
         FreeAndNil(fListaProdutos);
   end;
end;

procedure TfListaProdutos.btnLocalizarClick(Sender: TObject);
begin
   qryLocalizar.Close;

   if Trim(edtProduto.Text) <> '' then
      qryLocalizar.SQL.Add('   and descricao LIKE %' + edtProduto.Text + '%');

   qryLocalizar.Open;
end;

procedure TfListaProdutos.grdProdutosDblClick(Sender: TObject);
begin
    if bEntrada then
       TfEntradaSaidaEstoque.AbrirTela(qryLocalizarID.AsInteger, True)
    else
    if bSaida then
       TfEntradaSaidaEstoque.AbrirTela(qryLocalizarID.AsInteger, False)
    else
       Exit;

   qryLocalizar.Close;
   qryLocalizar.Open;
end;

procedure TfListaProdutos.MenuItem1Click(Sender: TObject);
begin
   TfEntradaSaidaEstoque.AbrirTela(qryLocalizarID.AsInteger, True);

   qryLocalizar.Close;
   qryLocalizar.Open;
end;

procedure TfListaProdutos.RealizarSada1Click(Sender: TObject);
begin
   TfEntradaSaidaEstoque.AbrirTela(qryLocalizarID.AsInteger, False);

   qryLocalizar.Close;
   qryLocalizar.Open;
end;

procedure TfListaProdutos.VizualizarProduto1Click(Sender: TObject);
begin
   TfCadProduto.AbrirTela(qryLocalizarID.AsInteger);

   qryLocalizar.Close;
   qryLocalizar.Open;
end;

end.
