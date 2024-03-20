unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, udmConexao;

type
  TfCadProduto = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    edtNome: TDBEdit;
    edtValor: TDBEdit;
    edtQuantidade: TDBEdit;
    lblNome: TLabel;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    cbCategoria: TDBLookupComboBox;
    lblCategoria: TLabel;
    qryProduto: TFDQuery;
    qryProdutoID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoVALOR: TFMTBCDField;
    qryProdutoID_CATEGORIA: TIntegerField;
    dsProduto: TDataSource;
    qryProdutoQUANTIDADE: TFMTBCDField;
    qryCategorias: TFDQuery;
    dsCategorias: TDataSource;
    qryCategoriasID: TIntegerField;
    qryCategoriasDESCRICAO: TStringField;
    qryAux: TFDQuery;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    idProduto: Integer;

    procedure CarregarDados;
    procedure AtualizarEstoque;
  public
    { Public declarations }
    class procedure AbrirTela(iIdProduto: Integer = 0);
  end;

var
  fCadProduto: TfCadProduto;

implementation

{$R *.dfm}

{ TfCadProduto }

class procedure TfCadProduto.AbrirTela(iIdProduto: Integer = 0);
var
   bCriarDestruir: boolean;
begin
   bCriarDestruir := not Assigned(fCadProduto) ;

   try
      fCadProduto.idProduto := iIdProduto;

      if bCriarDestruir then
         fCadProduto.Create(nil);

      fCadProduto.CarregarDados;

      fCadProduto.qryCategorias.Open;

      fCadProduto.ShowModal;
   finally
      if bCriarDestruir then
         FreeAndNil(fCadProduto);
   end;
end;

procedure TfCadProduto.AtualizarEstoque;
begin
   qryAux.Close;
   qryAux.SQL.Clear;

   qryAux.SQL.Add('update or insert into estoque' +#13#10+
                  '(id_produto, quantidade)' +#13#10+
                  'values (' + qryProdutoID.AsString + ', ' + qryProdutoQUANTIDADE.AsString + ')' +#13#10+
                  'matching(id_produto)');
   qryAux.ExecSQL;
end;

procedure TfCadProduto.Button1Click(Sender: TObject);
begin
   qryProduto.Cancel;

   Close;
end;

procedure TfCadProduto.Button2Click(Sender: TObject);
begin
   qryProduto.Delete;
end;

procedure TfCadProduto.Button4Click(Sender: TObject);
   function RetornaProximoID: Integer;
   begin
      qryAux.Close;
      qryAux.SQL.Clear;

      qryAux.SQL.Add('select max(p.id) as id from produtos p');
      qryAux.Open;

      Result := qryAux.FieldByName('id').AsInteger + 1;
   end;
begin
   if idProduto = 0 then
      qryProdutoID.AsInteger := RetornaProximoID;

   qryProduto.Post;

   if qryProdutoQUANTIDADE.AsFloat > 0 then
      AtualizarEstoque;

   if dsProduto.State = dsEdit then
      Close
   else
   begin
      ShowMessage('Produto Cadastrado com Sucesso');

      qryProduto.Close;
      CarregarDados;
   end;
end;

procedure TfCadProduto.CarregarDados;
begin
   qryProduto.Close;

   if idProduto = 0 then
   begin
      qryProduto.Open;
      qryProduto.Append;
   end
   else
   begin
      qryProduto.ParamByName('id').AsString := IntToStr(idProduto);
      qryProduto.Open;
   end;
end;

end.
