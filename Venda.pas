unit Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DataModule, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Produtos = record
    UnidadeTributavel: string;
    ValorUnitarioTributavel: string;
  end;

  TFormVenda = class(TForm)
    cbbProdutosSelecionados: TComboBox;
    btnAtualizarXML: TButton;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    edtQuantidadeTributavel: TEdit;
    lblQuantidadeTributavel: TLabel;
    lblValorFrete: TLabel;
    edtValorFrete: TEdit;
    lblValorSeguro: TLabel;
    edtValorSeguro: TEdit;
    lblValorDesconto: TLabel;
    edtValorDesconto: TEdit;
    lblValorOutros: TLabel;
    edtValorOutros: TEdit;
    btnSalvarParamentrosProdutos: TButton;
    statVenda: TStatusBar;
    edtUnidadeTributavel: TEdit;
    lblUnidadeTributavel: TLabel;
    lblValorTributavel: TLabel;
    edtValorUnitarioTributavel: TEdit;
    lblProdutos: TLabel;
    lblTipoFrete: TLabel;
    cbbTipoFrete: TComboBox;
    lblFormaPagamento: TLabel;
    cbbFormaPagamento: TComboBox;
    lblValorTroco: TLabel;
    edtValorTroco: TEdit;
    grpDadosCartao: TGroupBox;
    lblTipoIntegracao: TLabel;
    cbbTipoIntegracao: TComboBox;
    lblCartCNPJ: TLabel;
    edtCartCNPJ: TEdit;
    lblBandeira: TLabel;
    cbbBandeira: TComboBox;
    lblCodAutorizacao: TLabel;
    edtCodAutorizacao: TEdit;
    grpDadosTransport: TGroupBox;
    lblCNPJTransportador: TLabel;
    edtCNPJTransportador: TEdit;
    edtNomeTransportador: TEdit;
    lblNomeTransportador: TLabel;
    edtIETransportador: TEdit;
    lblIETransportador: TLabel;
    lblEnderecoTrasnportador: TLabel;
    mmoEnderecoTransportador: TMemo;
    lblMunicipioTransportador: TLabel;
    edtMunicipioTransportador: TEdit;
    lblUFTransportador: TLabel;
    edtUFTransportador: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbbProdutosSelecionadosChange(Sender: TObject);
    procedure btnAtualizarXMLClick(Sender: TObject);
    procedure btnSalvarParamentrosProdutosClick(Sender: TObject);
    procedure cbbFormaPagamentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVenda: TFormVenda;
  _index: Integer;
  _produtos: array of Produtos;

implementation

{$R *.dfm}

uses Main;

procedure TFormVenda.btnAtualizarXMLClick(Sender: TObject);
begin
  FormMain.fFormaPagamento := Copy(cbbFormaPagamento.Text, 1, 2);
  FormMain.fValorTroco := edtValorTroco.Text;

  FormMain.fDadosCartao.TipoIntegracao := Copy(cbbTipoIntegracao.Text, 1, 1);
  FormMain.fDadosCartao.CNPJ := edtCartCNPJ.Text;
  FormMain.fDadosCartao.Bandeira := Copy(cbbBandeira.Text, 1, 2);
  FormMain.fDadosCartao.NumeroAutorizacao := edtCodAutorizacao.Text;

  FormMain.fTipoFrete := Copy(cbbTipoFrete.Text, 1, 1);

  FormMain.fDadosTransportador.CNPJ := edtCNPJTransportador.Text;
  FormMain.fDadosTransportador.Nome := edtNomeTransportador.Text;
  FormMain.fDadosTransportador.IncricaoEstadual := edtIETransportador.Text;
  FormMain.fDadosTransportador.EnderecoCompleto := mmoEnderecoTransportador.Text;
  FormMain.fDadosTransportador.Municipio := edtMunicipioTransportador.Text;
  FormMain.fDadosTransportador.UF := edtUFTransportador.Text;

  FormVenda.Close;
  FormMain.AtualizarXML;
end;

procedure TFormVenda.btnSalvarParamentrosProdutosClick(Sender: TObject);
begin
  FormMain.fParametrosProdutosSelecionados[_index].Quantidade := edtQuantidade.Text;
  FormMain.fParametrosProdutosSelecionados[_index].UnidadeTributavel := edtUnidadeTributavel.Text;
  FormMain.fParametrosProdutosSelecionados[_index].QuantidadeTributavel := edtQuantidadeTributavel.Text;
  FormMain.fParametrosProdutosSelecionados[_index].ValorUnitarioTributavel := edtValorUnitarioTributavel.Text;
  FormMain.fParametrosProdutosSelecionados[_index].Frete := edtValorFrete.Text;
  FormMain.fParametrosProdutosSelecionados[_index].Seguro := edtValorSeguro.Text;
  FormMain.fParametrosProdutosSelecionados[_index].Desconto := edtValorDesconto.Text;
  FormMain.fParametrosProdutosSelecionados[_index].Outros := edtValorOutros.Text;

  statVenda.SetTextBuf('Produto salvo');
end;

procedure TFormVenda.cbbFormaPagamentoChange(Sender: TObject);
var
  _formaPagamento: string;
begin
  _formaPagamento := Copy(cbbFormaPagamento.Text, 1, 2);

  if (_formaPagamento = '03') or (_formaPagamento = '04') then
    grpDadosCartao.Show
  else
    grpDadosCartao.Hide;
end;

procedure TFormVenda.cbbProdutosSelecionadosChange(Sender: TObject);
begin
  _index := cbbProdutosSelecionados.ItemIndex;

  edtQuantidade.Text := FormMain.fParametrosProdutosSelecionados[_index].Quantidade;
  edtUnidadeTributavel.Text := FormMain.fParametrosProdutosSelecionados[_index].UnidadeTributavel;
  edtQuantidadeTributavel.Text := FormMain.fParametrosProdutosSelecionados[_index].QuantidadeTributavel;
  edtValorUnitarioTributavel.Text := FormMain.fParametrosProdutosSelecionados[_index].ValorUnitarioTributavel;
  edtValorFrete.Text := FormMain.fParametrosProdutosSelecionados[_index].Frete;
  edtValorSeguro.Text := FormMain.fParametrosProdutosSelecionados[_index].Seguro;
  edtValorDesconto.Text := FormMain.fParametrosProdutosSelecionados[_index].Desconto;
  edtValorOutros.Text := FormMain.fParametrosProdutosSelecionados[_index].Outros;

  if edtUnidadeTributavel.Text = EmptyStr then
    edtUnidadeTributavel.Text := _produtos[_index].UnidadeTributavel;

  if edtValorUnitarioTributavel.Text = EmptyStr then
    edtValorUnitarioTributavel.Text := _produtos[_index].ValorUnitarioTributavel;
end;

procedure TFormVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormMain.Enabled := True;
end;

procedure TFormVenda.FormShow(Sender: TObject);
var
  _item: string;
begin
  statVenda.SimpleText := '';

  FormMain.pgcMain.ActivePageIndex := 0;
  edtQuantidade.Text := '';
  edtUnidadeTributavel.Text := '';
  edtQuantidadeTributavel.Text := '';
  edtValorUnitarioTributavel.Text := '';
  edtValorFrete.Text := '';
  edtValorSeguro.Text := '';
  edtValorDesconto.Text := '';
  edtValorOutros.Text := '';

  with DataModuleMain.query do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM produtos WHERE cProd IN ' + FormMain.fProdutosSelecionados);
    Open;
    First;

    SetLength(FormMain.fParametrosProdutosSelecionados, RecordCount);
    SetLength(_produtos, RecordCount);

    cbbProdutosSelecionados.Items.Clear;

    _index := 0;

    while not Eof do
    begin
      _item := FieldByName('cProd').AsString + ' - ' + FieldByName('xProd').AsString;
      cbbProdutosSelecionados.Items.Add(_item);
      _produtos[RecNo - 1].UnidadeTributavel := FieldByName('uTrib').AsString;
      _produtos[RecNo - 1].ValorUnitarioTributavel := FieldByName('vUnTrib').AsString;
      Next;
    end;
  end;
end;

end.
