unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, udmConexao;

type
  TfLogin = class(TForm)
    edtNome: TEdit;
    edtSenha: TMaskEdit;
    lblNome: TLabel;
    lblSenha: TLabel;
    qryAux: TFDQuery;
    btnLogin: TButton;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function VerificarLogin: Boolean;
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

{ TfLogin }

procedure TfLogin.btnLoginClick(Sender: TObject);
begin
   qryAux.Close;
   qryAux.SQL.Clear;

   qryAux.SQL.Add('select 1 from usuarios u where u.nome = :nome and u.senha = :senha');

   qryAux.ParamByName('nome').AsString  := edtNome.Text;
   qryAux.ParamByName('senha').AsString := edtSenha.Text;

   qryAux.Open;

   if qryAux.IsEmpty then
   begin
      ModalResult := mrNone;

      ShowMessage('Usuário ou Senha estão errados!');
   end
   else
      ModalResult := mrOk;

end;

class function TfLogin.VerificarLogin: Boolean;
var
   bCriarDestruir: boolean;
begin
    bCriarDestruir := not Assigned(fLogin) ;
    Result := False;

    if bCriarDestruir then
       fLogin.Create(nil);

    fLogin.ShowModal;

    Result := fLogin.ModalResult = mrOk;
end;

end.
