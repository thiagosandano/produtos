unit uEntradaSaidaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Samples.Spin;

type
  TfEntradaSaidaEstoque = class(TForm)
    btnConfirmar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    qryAux: TFDQuery;
    qryEstoque: TFDQuery;
    qryEstoqueQUANTIDADE: TFMTBCDField;
    edtQuantidade: TSpinEdit;
    FDTransaction1: TFDTransaction;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sIdProduto: String;
    bEntrada: Boolean;

    procedure AtualizarSaidaEstoque;
  public
    { Public declarations }
    function SomarEstoque(const ANumero1, ANumero2: Double): Double;
    function SubtrairEstoque(const ANumero1, ANumero2: Double): Double;

    class procedure AbrirTela(iIdProduto: Integer; bEntrada: Boolean);
  end;

var
  fEntradaSaidaEstoque: TfEntradaSaidaEstoque;

implementation

{$R *.dfm}

{ TfEntradaSaidaEstoque }

class procedure TfEntradaSaidaEstoque.AbrirTela(iIdProduto: Integer; bEntrada: Boolean);
var
   bCriarDestruir: boolean;
begin
   bCriarDestruir := not Assigned(fEntradaSaidaEstoque) ;

   try
      fEntradaSaidaEstoque.sIdProduto := IntToStr(iIdProduto);
      fEntradaSaidaEstoque.bEntrada   := bEntrada;

      if bCriarDestruir then
         fEntradaSaidaEstoque.Create(nil);

      fEntradaSaidaEstoque.ShowModal;
   finally
      if bCriarDestruir then
         FreeAndNil(fEntradaSaidaEstoque);
   end;

end;

procedure TfEntradaSaidaEstoque.AtualizarSaidaEstoque;
var
   fQuantidade: Double;
begin
   qryEstoque.Close;

   qryEstoque.ParamByName('id').AsString := sIdProduto;

   qryEstoque.Open;

   if bEntrada then
      fQuantidade := SomarEstoque(qryEstoqueQUANTIDADE.AsFloat, StrToFloatDef(edtQuantidade.Text, 0))
   else
      fQuantidade := SubtrairEstoque(qryEstoqueQUANTIDADE.AsFloat, StrToFloatDef(edtQuantidade.Text, 0));

   qryAux.Close;
   qryAux.SQL.Clear;

   FDTransaction1.StartTransaction;

   try
      qryAux.SQL.Add('update or insert into estoque' +#13#10+
                     '(id_produto, quantidade)' +#13#10+
                     'values (' + sIdProduto + ', ' + FloatToStr(fQuantidade) + ')' +#13#10+
                     'matching(id_produto)');
      qryAux.ExecSQL;

      FDTransaction1.Commit;
   except
      FDTransaction1.Rollback;
      raise;
   end;

   Close;
end;

procedure TfEntradaSaidaEstoque.btnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TfEntradaSaidaEstoque.btnConfirmarClick(Sender: TObject);
begin
   AtualizarSaidaEstoque;
end;

function TfEntradaSaidaEstoque.SomarEstoque(const ANumero1, ANumero2: Double): Double;
begin
   Result := ANumero1 + ANumero2;
end;

function TfEntradaSaidaEstoque.SubtrairEstoque(const ANumero1, ANumero2: Double): Double;
begin
   Result := ANumero1 - ANumero2;
end;

end.
