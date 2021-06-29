unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, Data.DB,
  ZAbstractRODataset, ZDataset, ZAbstractConnection, ZConnection, Vcl.ComCtrls,
  spdNFeValidadorClientAdapter, System.UITypes, SynEdit, SynMemo, SynEditHighlighter,
  SynHighlighterXML, ZAbstractDataset, Vcl.Grids, Vcl.DBGrids, DataModule,
  DateUtils, Venda;

type
  ParametrosProduto = record
    Quantidade: string;
    UnidadeTributavel: string;
    QuantidadeTributavel: string;
    ValorUnitarioTributavel: string;
    Frete: string;
    Seguro: string;
    Desconto: string;
    Outros: string;
  end;

  DadosCartao = record
    TipoIntegracao: string;
    CNPJ: string;
    Bandeira: string;
    NumeroAutorizacao: string;
  end;

  DadosTransportador = record
    CNPJ: string;
    Nome: string;
    IncricaoEstadual: string;
    EnderecoCompleto: string;
    Municipio: string;
    UF: string;
  end;

  TFormMain = class(TForm)
    btnFinalizar: TButton;
    btnEnviarXML: TButton;
    statMain: TStatusBar;
    btnAuditarXML: TButton;
    mmoXML1: TSynMemo;
    pgcMain: TPageControl;
    tsEmpresa: TTabSheet;
    lblCNPJEmit: TLabel;
    lblNomeEmit: TLabel;
    lblIEEmit: TLabel;
    lblCRTEmit: TLabel;
    edtCNPJEmit: TEdit;
    edtNomeEmit: TEdit;
    edtIEEmit: TEdit;
    cbbCRTEmit: TComboBox;
    btnSalvarEmit: TButton;
    tsClientes: TTabSheet;
    lblCNPJDest: TLabel;
    lblNomeDest: TLabel;
    edtCNPJDest: TEdit;
    edtNomeDest: TEdit;
    edtIEDest: TEdit;
    btnSalvarDest: TButton;
    dbgrdClientes: TDBGrid;
    btnNovoClienteDest: TButton;
    btnExcluirClienteDest: TButton;
    grp3: TGroupBox;
    lblLogradouroEmit: TLabel;
    lblNumeroEmit: TLabel;
    lblCodCidadeEmit: TLabel;
    lblCidadeEmit: TLabel;
    lblUFEmit: TLabel;
    lblComplementoEmit: TLabel;
    lblCodPaisEmit: TLabel;
    lblPaisEmit: TLabel;
    lblBairroEmit: TLabel;
    lblCEPEmit: TLabel;
    edtLogradouroEmit: TEdit;
    edtNumeroEmit: TEdit;
    edtCodCidadeEmit: TEdit;
    edtCidadeEmit: TEdit;
    cbbUFEmit: TComboBox;
    edtComplementoEmit: TEdit;
    edtPaisEmit: TEdit;
    edtCodPaisEmit: TEdit;
    edtBairroEmit: TEdit;
    edtCEPEmit: TEdit;
    grp2: TGroupBox;
    lblLogradouroDest: TLabel;
    lblNumeroDest: TLabel;
    lblCodCidadeDest: TLabel;
    lblCidadeDest: TLabel;
    lblUFDest: TLabel;
    lblComplementoDest: TLabel;
    lblCodPaisDest: TLabel;
    lblPaisDest: TLabel;
    lblBairroDest: TLabel;
    lblCEPDest: TLabel;
    edtLogradouroDest: TEdit;
    edtNumeroDest: TEdit;
    edtCodCidadeDest: TEdit;
    edtCidadeDest: TEdit;
    cbbUFDest: TComboBox;
    edtComplementoDest: TEdit;
    edtPaisDest: TEdit;
    edtCodPaisDest: TEdit;
    edtBairroDest: TEdit;
    edtCEPDest: TEdit;
    lblindIEDest: TLabel;
    lblIEDest: TLabel;
    cbbindIEDest: TComboBox;
    tsProdutos: TTabSheet;
    lblValorProd: TLabel;
    edtNomeProd: TEdit;
    lblNomeProd: TLabel;
    lblCodigoProd: TLabel;
    edtCodigoProd: TEdit;
    edtValorProd: TEdit;
    dbgrd1: TDBGrid;
    btnSalvarProduto: TButton;
    btnNovoProduto: TButton;
    btnExcluirProduto: TButton;
    pgcCamposProd: TPageControl;
    tsGeral: TTabSheet;
    lblNCMProd: TLabel;
    lblCFOPProd: TLabel;
    lblUnidadeProd: TLabel;
    lblUnidadeTribProd: TLabel;
    lblValorTribProd: TLabel;
    lblIndTotProd: TLabel;
    edtNCMProd: TEdit;
    edtCFOPProd: TEdit;
    edtUnidadeProd: TEdit;
    edtUnidadeTribProd: TEdit;
    edtValorTribProd: TEdit;
    cbbIndTotProd: TComboBox;
    tsICMS: TTabSheet;
    lblAliquotaProd: TLabel;
    lblModBCProd: TLabel;
    lblOrigemProd: TLabel;
    lblGrupoTributacaoProd: TLabel;
    edtAliquotaProd: TEdit;
    cbbModBCProd: TComboBox;
    cbbOrigemProd: TComboBox;
    cbbGrupoTributacaoProd: TComboBox;
    tsIPI: TTabSheet;
    lblIPITributado: TLabel;
    lblcEnq: TLabel;
    lblIPICST: TLabel;
    lblpIPI: TLabel;
    cbbIPITributado: TComboBox;
    edtcEnq: TEdit;
    cbbIPICST: TComboBox;
    edtpIPI: TEdit;
    tsPIS: TTabSheet;
    lblPISCST1: TLabel;
    lblpPIS1: TLabel;
    cbbPISCST: TComboBox;
    edtpPIS: TEdit;
    tsCOFINS: TTabSheet;
    lblCOFINSCST: TLabel;
    cbbCOFINSCST: TComboBox;
    edtpCOFINS: TEdit;
    lblpCOFINS: TLabel;
    tsICMS_CRT1: TTabSheet;
    lblOrigemSNProd: TLabel;
    cbbOrigemSNProd: TComboBox;
    lblCSOCNProd: TLabel;
    cbbCSOSNProd: TComboBox;
    btnAssinarXML: TButton;
    btnConsultarRecibo: TButton;
    procedure mmoXML1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AtualizarXML;
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure CarregarConfiguracoesAuditor();
    function cUF(aUF: string): String;
    function DVModulo11(str: String): Char;
    function chInt(ch: Char): ShortInt;
    function intCh(int: ShortInt): Char;
    procedure CarregarEmpresa;
    procedure btnSalvarEmitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Emitente;
    procedure btnSalvarDestClick(Sender: TObject);
    procedure CarregarClientes;
    procedure PreencheCamposCliente;
    procedure btnNovoClienteDestClick(Sender: TObject);
    procedure dbgrdClientesCellClick(Column: TColumn);
    procedure btnExcluirClienteDestClick(Sender: TObject);
    procedure Destinatario;
    procedure Identificacao;
    procedure Cabecalho;
    function getTimeZone: string;
    procedure CarregarProdutos;
    procedure PreencheCamposProduto;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnSalvarProdutoClick(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure Produtos;
    procedure tsProdutosShow(Sender: TObject);
    procedure tsClientesShow(Sender: TObject);
    procedure tsEmpresaShow(Sender: TObject);
    function calculaValorProduto(aQuantidade, aValorUnitario: string): string;
    function calculaValorBaseCalculo(aValorUnitario, aFrete, aSeguro, aDesconto, aOutros: string): string;
    function calculaValorAliquota(aBaseCalculo, aAliquota: string): string;
    procedure cbbIPITributadoChange(Sender: TObject);
    procedure Totais;
    procedure Transporte;
    procedure Pagamento;
    procedure btnEnviarXMLClick(Sender: TObject);
    procedure btnAssinarXMLClick(Sender: TObject);
    procedure btnAuditarXMLClick(Sender: TObject);
    procedure btnConsultarReciboClick(Sender: TObject);
    function getXMLNode(xmlString: string; xpath: string) : string;
    function calculaValorPago(_vPag, _vTroco: string): string;
  private
    { Private declarations }
  public
    fProdutosSelecionados, fTipoFrete, fFormaPagamento, fValorTroco: String;
    fParametrosProdutosSelecionados: Array of ParametrosProduto;
    fDadosCartao: DadosCartao;
    fDadosTransportador: DadosTransportador;
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  _xml: IXMLDocument;
  _NFe, _infNFe: IXMLNode;
  _vProdTotal, _vFreteTotal, _vSegTotal, _vDescTotal, _vOutroTotal,
  _vICMSTotal, _vIPITotal, _vPISTotal, _vCOFINSTotal, _vBCTotal: Extended;
  _vNF: string;

implementation

uses
  System.StrUtils;

{$R *.dfm}

procedure TFormMain.AtualizarXML;
begin
  _xml := NewXMLDocument('1.0');
  // _xml.Options := [doNodeAutoIndent];

  Cabecalho;
  Identificacao;
  Emitente;
  Destinatario;
  Produtos;
  Totais;
  Transporte;
  Pagamento;

  mmoXML1.Text := StringReplace(_xml.XML.Text, ' xmlns=""', '', [rfReplaceAll]);
  mmoXML1.SetFocus;
  statMain.SetTextBuf('XML atualizado.');
end;

procedure TFormMain.btnFinalizarClick(Sender: TObject);
begin
  FormVenda.Show;
  FormMain.Enabled := False;

  _vProdTotal := 0;
  _vFreteTotal := 0;
  _vSegTotal := 0;
  _vDescTotal := 0;
  _vOutroTotal := 0;
  _vICMSTotal := 0;
  _vIPITotal := 0;
  _vPISTotal := 0;
  _vCOFINSTotal := 0;
  _vBCTotal := 0;
end;

procedure TFormMain.btnAssinarXMLClick(Sender: TObject);
begin
  mmoXML1.Text := DataModuleMain.spdNFe.AssinarNota(mmoXML1.Text);
  mmoXML1.SetFocus;
end;

procedure TFormMain.btnAuditarXMLClick(Sender: TObject);
var
  input, retorno: string;
begin
  input := StringReplace(mmoXML1.Text, '<?xml version="1.0"?>', '', []);
  retorno := DataModuleMain.spdValidadorClientX.ValidarXml(mmoXML1.Text, '|');
  retorno := Trim(StringReplace(retorno, '|', #13#10, [rfReplaceAll]));
  mmoXML1.Text := retorno;
  mmoXML1.SetFocus;
end;

procedure TFormMain.btnConsultarReciboClick(Sender: TObject);
var
  _nRec: string;
begin
  _nRec := getXMLNode(mmoXML1.Text, '//*[local-name()="nRec"]/text()');
  mmoXML1.Text := DataModuleMain.spdNFe.ConsultarRecibo(_nRec);
  mmoXML1.SetFocus;
end;

procedure TFormMain.btnEnviarXMLClick(Sender: TObject);
begin
  mmoXML1.Text := DataModuleMain.spdNFe.EnviarNF('00001', mmoXML1.Text);
  mmoXML1.SetFocus;
end;

procedure TFormMain.btnExcluirClienteDestClick(Sender: TObject);
begin
  DataModuleMain.connection.ExecuteDirect(Format('DELETE FROM clientes WHERE cnpj=''%s'' ', [DataModuleMain.query.FieldByName('CNPJ').AsString]));
  CarregarClientes;
  statMain.SetTextBuf('Cliente excluido com sucesso!');
end;

procedure TFormMain.btnExcluirProdutoClick(Sender: TObject);
begin
  DataModuleMain.connection.ExecuteDirect(Format('DELETE FROM produtos WHERE cProd=''%s'' ', [DataModuleMain.query.FieldByName('cProd').AsString]));
  CarregarProdutos;
  statMain.SetTextBuf('Produto excluido com sucesso!');
end;

procedure TFormMain.btnNovoClienteDestClick(Sender: TObject);
begin
  edtCNPJDest.Enabled := True;
  edtCNPJDest.SetFocus;
  edtCNPJDest.Clear;
  edtNomeDest.Clear;
  edtIEDest.Clear;
  edtLogradouroDest.Clear;
  edtNumeroDest.Clear;
  edtComplementoDest.Clear;
  edtBairroDest.Clear;
  edtCodCidadeDest.Clear;
  edtCidadeDest.Clear;
  cbbUFDest.Text := 'AC';
  edtCodPaisDest.Clear;
  edtPaisDest.Clear;
  edtCEPDest.Clear;
  cbbindIEDest.Text := '1 - Contribuinte ICMS (informar a IE do destinatário)';
end;

procedure TFormMain.btnNovoProdutoClick(Sender: TObject);
begin
  edtCodigoProd.Enabled := True;
  edtCodigoProd.Clear;
  edtNomeProd.Clear;
  edtNCMProd.Clear;
  edtCFOPProd.Clear;
  edtUnidadeProd.Clear;
  edtValorProd.Clear;
  edtUnidadeTribProd.Clear;
  edtValorTribProd.Clear;
  cbbIndTotProd.Text := '1 - Valor do item (vProd) compõe o valor total da NF-e';

  edtAliquotaProd.Clear;
  cbbModBCProd.Text := '0 - Margem Valor Agregado (%)';
  cbbOrigemProd.Text := '0 - Nacional, exceto as indicadas nos códigos 3, 4, 5 e 8';
  cbbGrupoTributacaoProd.Text := '00 - Tributada integralmente';

  cbbOrigemSNProd.Text := '0 - Nacional, exceto as indicadas nos códigos 3, 4, 5 e 8';
  cbbCSOSNProd.Text := '102 - Tributada pelo Simples Nacional sem permissão de crédito.';

  cbbIPITributado.Text := 'Não Tributado';
  edtcEnq.Text := '999';
  cbbIPICST.Text := '01 - Entrada tributada com alíquota zero';
  edtpIPI.Clear;

  cbbPISCST.Text := '';
  edtpPIS.Clear;

  cbbCOFINSCST.Text := '';
  edtpCOFINS.Clear;
end;

procedure TFormMain.btnSalvarDestClick(Sender: TObject);
var
  _sql : string;
begin
  if edtCNPJDest.Text <> DataModuleMain.query.FieldByName('CNPJ').AsString then
  begin
    _sql := Format('INSERT INTO clientes (CNPJ, xNome, IE, xLgr, nro, xCPL, xBairro, cMun, xMun, UF, cPais, xPais, CEP, IndIEDest) VALUES (%s, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')', [
      edtCNPJDest.Text,
      edtNomeDest.Text,
      edtIEDest.Text,
      edtLogradouroDest.Text,
      edtNumeroDest.Text,
      edtComplementoDest.Text,
      edtBairroDest.Text,
      edtCodCidadeDest.Text,
      edtCidadeDest.Text,
      cbbUFDest.Text,
      edtCodPaisDest.Text,
      edtPaisDest.Text,
      edtCEPDest.Text,
      cbbindIEDest.Text
    ]);
  end
  else
  begin
    _sql := Format('UPDATE clientes SET xNome=''%s'', IE=''%s'', xLgr=''%s'', nro=''%s'', xCPL=''%s'', xBairro=''%s'', cMun=''%s'', xMun=''%s'', UF=''%s'', cPais=''%s'', xPais=''%s'', CEP=''%s'', IndIEDest=''%s'' WHERE CNPJ=''%s'' ', [
      edtNomeDest.Text,
      edtIEDest.Text,
      edtLogradouroDest.Text,
      edtNumeroDest.Text,
      edtComplementoDest.Text,
      edtBairroDest.Text,
      edtCodCidadeDest.Text,
      edtCidadeDest.Text,
      cbbUFDest.Text,
      edtCodPaisDest.Text,
      edtPaisDest.Text,
      edtCEPDest.Text,
      cbbindIEDest.Text,
      DataModuleMain.query.FieldByName('CNPJ').AsString
    ]);
  end;

  DataModuleMain.connection.ExecuteDirect(_sql);

  CarregarClientes;

  statMain.SetTextBuf('Cliente salvo com sucesso!');
end;

procedure TFormMain.btnSalvarEmitClick(Sender: TObject);
var
  _sql : string;
begin
  _sql := Format('UPDATE empresas SET CNPJ=''%s'', xNome=''%s'', IE=''%s'', CRT=''%s'', xLgr=''%s'', nro=''%s'', xBairro=''%s'', cMun=''%s'', xMun=''%s'', UF=''%s'', CEP=''%s'', cPais=''%s'', xPais=''%s'', xCpl=''%s'' WHERE rowid=1', [
    edtCNPJEmit.Text,
    edtNomeEmit.Text,
    edtIEEmit.Text,
    cbbCRTEmit.Text,
    edtLogradouroEmit.Text,
    edtNumeroEmit.Text,
    edtBairroEmit.Text,
    edtCodCidadeEmit.Text,
    edtCidadeEmit.Text,
    cbbUFEmit.Text,
    edtCepEmit.Text,
    edtCodPaisEmit.Text,
    edtPaisEmit.Text,
    edtComplementoEmit.Text
  ]);

  DataModuleMain.connection.ExecuteDirect(_sql);

  statMain.SetTextBuf('Empresa salva com sucesso!');
end;

procedure TFormMain.btnSalvarProdutoClick(Sender: TObject);
var
  _sql, _sqlICMS, _sqlIPI, _sqlPIS, _sqlCOFINS : string;
begin
  if edtCodigoProd.Text <> DataModuleMain.query.FieldByName('cProd').AsString then
  begin
    _sql := Format('INSERT INTO produtos (cProd, xProd, NCM, CFOP, uCom, vUnCom, uTrib, vUnTrib, indTot) VALUES (''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')', [
      edtCodigoProd.Text,
      edtNomeProd.Text,
      edtNCMProd.Text,
      edtCFOPProd.Text,
      edtUnidadeProd.Text,
      edtValorProd.Text,
      edtUnidadeTribProd.Text,
      edtValorTribProd.Text,
      cbbIndTotProd.Text
    ]);

    _sqlICMS := Format('INSERT INTO ICMS (pICMS, modBC, CST, orig, grupoTributacao, cProd, OrigSN, CSOSN) VALUES (''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')', [
      edtAliquotaProd.Text,
      cbbModBCProd.Text,
      Copy(cbbGrupoTributacaoProd.Text, 1, 2),
      cbbOrigemProd.Text,
      cbbGrupoTributacaoProd.Text,
      edtCodigoProd.Text,
      cbbOrigemSNProd.Text,
      cbbCSOSNProd.Text
    ]);

    _sqlIPI := Format('INSERT INTO IPI (IPITrib, cEnq, CST, pIPI, cProd) VALUES (''%s'', ''%s'', ''%s'', ''%s'', ''%s'')', [
      cbbIPITributado.Text,
      edtcEnq.Text,
      cbbIPICST.Text,
      edtpIPI.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);

    _sqlPIS := Format('INSERT INTO PIS (CST, pPIS, cProd) VALUES (''%s'', ''%s'', ''%s'')', [
      cbbPISCST.Text,
      edtpPIS.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);

    _sqlCOFINS := Format('INSERT INTO COFINS (CST, pCOFINS, cProd) VALUES (''%s'', ''%s'', ''%s'')', [
      cbbCOFINSCST.Text,
      edtpCOFINS.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);
  end
  else
  begin
    _sql := Format('UPDATE produtos SET xProd=''%s'', NCM=''%s'', CFOP=''%s'', uCom=''%s'', vUnCom=''%s'', uTrib=''%s'', vUnTrib=''%s'', indTot=''%s'' WHERE cProd=''%s'' ', [
      edtNomeProd.Text,
      edtNCMProd.Text,
      edtCFOPProd.Text,
      edtUnidadeProd.Text,
      edtValorProd.Text,
      edtUnidadeTribProd.Text,
      edtValorTribProd.Text,
      cbbIndTotProd.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);

    _sqlICMS := Format('UPDATE ICMS SET pICMS=''%s'', modBC=''%s'', CST=''%s'', orig=''%s'', grupoTributacao=''%s'', OrigSN=''%s'', CSOSN=''%s'' WHERE cProd=''%s'' ', [
      edtAliquotaProd.Text,
      cbbModBCProd.Text,
      Copy(cbbGrupoTributacaoProd.Text, 1, 2),
      cbbOrigemProd.Text,
      cbbGrupoTributacaoProd.Text,
      cbbOrigemSNProd.Text,
      cbbCSOSNProd.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);

    _sqlIPI := Format('UPDATE IPI SET IPITrib=''%s'', cEnq=''%s'', CST=''%s'', pIPI=''%s'' WHERE cProd=''%s'' ', [
      cbbIPITributado.Text,
      edtcEnq.Text,
      cbbIPICST.Text,
      edtpIPI.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);

    _sqlPIS := Format('UPDATE PIS SET CST=''%s'', pPIS=''%s'' WHERE cProd=''%s'' ', [
      cbbPISCST.Text,
      edtpPIS.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);

    _sqlCOFINS := Format('UPDATE COFINS SET CST=''%s'', pCOFINS=''%s'' WHERE cProd=''%s'' ', [
      cbbCOFINSCST.Text,
      edtpCOFINS.Text,
      DataModuleMain.query.FieldByName('cProd').AsString
    ]);
  end;

  DataModuleMain.connection.ExecuteDirect(_sql);
  DataModuleMain.connection.ExecuteDirect(_sqlICMS);
  DataModuleMain.connection.ExecuteDirect(_sqlIPI);
  DataModuleMain.connection.ExecuteDirect(_sqlPIS);
  DataModuleMain.connection.ExecuteDirect(_sqlCOFINS);

  CarregarProdutos;

  statMain.SetTextBuf('Produto salvo com sucesso!');
end;

procedure TFormMain.Cabecalho;
var
  _nfeProc: IXMLNode;
  _xmlns: string;
begin
  _xmlns := 'http://www.portalfiscal.inf.br/nfe';

  _nfeProc := _xml.AddChild('nfeProc');
  _nfeProc.Attributes['versao'] := '4.00';
  _nfeProc.Attributes['xmlns'] := _xmlns;

  _NFe := _nfeProc.AddChild('NFe');
  _NFe.Attributes['xmlns'] := _xmlns;
end;

procedure TFormMain.CarregarClientes;
begin
  with DataModuleMain.query do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM clientes');
    Open;
    First;

    PreencheCamposCliente;
  end;
end;


procedure TFormMain.CarregarConfiguracoesAuditor;
var
  pathTempAuditor, pathEsquemasAuditor, pathRegrasAuditor: string;
begin
  DataModuleMain.spdValidadorClientX.ModoOperacao := moCliente;

  pathTempAuditor := 'C:\Program Files\TecnoSpeed\NFe\arquivos\Templates\Auditor\Templates';
  pathEsquemasAuditor := 'C:\Program Files\TecnoSpeed\NFe\arquivos\Esquemas\Auditor';
  pathRegrasAuditor := 'C:\Program Files\TecnoSpeed\NFe\arquivos\Templates\Auditor\Regras';

  DataModuleMain.spdValidadorClientX.DiretorioEsquemas := pathEsquemasAuditor;
  DataModuleMain.spdValidadorClientX.DiretorioTemplates := pathTempAuditor;
  DataModuleMain.spdValidadorClientX.DiretorioRegras := pathRegrasAuditor;

  DataModuleMain.spdValidadorClientX.AtualizarRegrasAutomaticamente := True;
  DataModuleMain.spdValidadorClientX.ExibirRegrasValidacao := True;
  DataModuleMain.spdValidadorClientX.CodigoProduto := 1;
  DataModuleMain.spdValidadorClientX.Estagio := esProducao;
  DataModuleMain.spdValidadorClientX.TipoResposta := trTexto;
end;

function TFormMain.intCh(int: ShortInt): Char;
begin
  Result := Chr(int + Ord('0'));
end;

procedure TFormMain.CarregarEmpresa;
begin
   with DataModuleMain.query do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM empresas WHERE rowid=1');
    Open;
    First;

    edtCNPJEmit.Text := FieldByName('CNPJ').AsString;
    edtNomeEmit.Text := FieldByName('xNome').AsString;
    edtIEEmit.Text := FieldByName('IE').AsString;
    cbbCRTEmit.Text := FieldByName('CRT').AsString;
    edtLogradouroEmit.Text := FieldByName('xLgr').AsString;
    edtNumeroEmit.Text := FieldByName('nro').AsString;
    edtComplementoEmit.Text := FieldByName('xCpl').AsString;
    edtBairroEmit.Text := FieldByName('xBairro').AsString;
    edtCodCidadeEmit.Text := FieldByName('cMun').AsString;
    edtCidadeEmit.Text := FieldByName('xMun').AsString;
    cbbUFEmit.Text := FieldByName('UF').AsString;
    edtCepEmit.Text := FieldByName('CEP').AsString;
    edtCodPaisEmit.Text := FieldByName('cPais').AsString;
    edtPaisEmit.Text := FieldByName('xPais').AsString;
  end;
end;

procedure TFormMain.CarregarProdutos;
begin
  with DataModuleMain.query do begin
    Close;
    SQL.Clear;
    DataModuleMain.query.SQL.Add('SELECT * FROM produtos ');
    DataModuleMain.query.SQL.Add('JOIN ICMS ON ICMS.cProd = produtos.cProd ');
    DataModuleMain.query.SQL.Add('JOIN IPI ON IPI.cProd = produtos.cProd');
    DataModuleMain.query.SQL.Add('JOIN PIS ON PIS.cProd = produtos.cProd');
    DataModuleMain.query.SQL.Add('JOIN COFINS ON COFINS.cProd = produtos.cProd');
    Open;
    First;

    PreencheCamposProduto;
  end;
end;

procedure TFormMain.cbbIPITributadoChange(Sender: TObject);
begin
begin
  if cbbIPITributado.Text = 'Tributado' then
  begin
    cbbIPICST.Items.Clear;
    cbbIPICST.Text := '00 - Entrada com recuperação de crédito';
    cbbIPICST.Items.Add('00 - Entrada com recuperação de crédito');
    cbbIPICST.Items.Add('49 - Outras entradas');
    cbbIPICST.Items.Add('50 - Saída tributada');
    cbbIPICST.Items.Add('99 - Outras saídas');
    lblpIPI.Visible := True;
    edtpIPI.Visible := True;
  end
  else if cbbIPITributado.Text = 'Não Tributado' then
  begin
    cbbIPICST.Items.Clear;
    cbbIPICST.Text := '01 - Entrada tributada com alíquota zero';
    cbbIPICST.Items.Add('01 - Entrada tributada com alíquota zero');
    cbbIPICST.Items.Add('02 - Entrada isenta');
    cbbIPICST.Items.Add('03 - Entrada não-tributada');
    cbbIPICST.Items.Add('04 - Entrada imune');
    cbbIPICST.Items.Add('05 - Entrada com suspensão');
    cbbIPICST.Items.Add('51 - Saída tributada com alíquota zero');
    cbbIPICST.Items.Add('52 - Saída isenta');
    cbbIPICST.Items.Add('53 - Saída não-tributada');
    cbbIPICST.Items.Add('54 - Saída imune');
    cbbIPICST.Items.Add('55 - Saída com suspensão');
    lblpIPI.Visible := False;
    edtpIPI.Visible := False;
    edtpIPI.Text := '';
  end;
end;
end;

function TFormMain.chInt(ch: Char): ShortInt;
begin
  Result := Ord (ch) - Ord ('0');
end;    

function TFormMain.cUF(aUF: string): String;
var
  estados: Array [11..53] of String;
  i: Integer;
begin
  estados[11] := 'RO';
  estados[12] := 'AC';  
  estados[13] := 'AM';  
  estados[14] := 'RR';  
  estados[15] := 'PA';  
  estados[16] := 'AP';  
  estados[17] := 'TO';  
  estados[21] := 'MA';  
  estados[22] := 'PI';  
  estados[23] := 'CE';  
  estados[24] := 'RN';  
  estados[25] := 'PB';  
  estados[26] := 'PE';  
  estados[27] := 'AL';  
  estados[28] := 'SE';  
  estados[29] := 'BA';  
  estados[31] := 'MG';  
  estados[32] := 'ES';  
  estados[33] := 'RJ';  
  estados[35] := 'SP';  
  estados[41] := 'PR';  
  estados[42] := 'SC';  
  estados[43] := 'RS';  
  estados[50] := 'MS';  
  estados[51] := 'MT';  
  estados[52] := 'GO';  
  estados[53] := 'DF';

  for i := Low(estados) to High(estados) do
    if estados[i] = aUF then
      Result := IntToStr(i)
end;

procedure TFormMain.dbgrd1CellClick(Column: TColumn);
var
  _produtosSelecionados: String;
  i: Integer;
begin
  _produtosSelecionados := '(';

  for i:=0 to dbgrd1.SelectedRows.Count-1 do
  begin
    DataModuleMain.query.GotoBookmark(Pointer(dbgrd1.SelectedRows.Items[i]));
    _produtosSelecionados := _produtosSelecionados + '''' + DataModuleMain.query.FieldByName('cProd').AsString + ''',';
  end;
  Delete(_produtosSelecionados, length(_produtosSelecionados), 1);
  _produtosSelecionados := _produtosSelecionados + ')';

  FormMain.fProdutosSelecionados := _produtosSelecionados;
  PreencheCamposProduto;
end;

procedure TFormMain.dbgrdClientesCellClick(Column: TColumn);
begin
  PreencheCamposCliente;
end;

procedure TFormMain.Destinatario;
var
  _dest, _dest_enderDest: IXMLNode;
begin
  _dest := _infNFe.AddChild('dest');
    _dest.AddChild('CNPJ').Text := edtCNPJDest.Text;
    _dest.AddChild('xNome').Text := edtNomeDest.Text;
    _dest_enderDest := _dest.AddChild('enderDest');
      _dest_enderDest.AddChild('xLgr').Text := edtLogradouroDest.Text;
      _dest_enderDest.AddChild('nro').Text := edtNumeroDest.Text;
      _dest_enderDest.AddChild('xCpl').Text := edtComplementoDest.Text;
      _dest_enderDest.AddChild('xBairro').Text := edtBairroDest.Text;
      _dest_enderDest.AddChild('cMun').Text := edtCodCidadeDest.Text;
      _dest_enderDest.AddChild('xMun').Text := edtCidadeDest.Text;
      _dest_enderDest.AddChild('UF').Text := cbbUFDest.Text;
      _dest_enderDest.AddChild('CEP').Text := edtCepDest.Text;
      _dest_enderDest.AddChild('cPais').Text := edtCodPaisDest.Text;
      _dest_enderDest.AddChild('xPais').Text := edtPaisDest.Text;
    _dest.AddChild('indIEDest').Text := Copy(cbbIndIEDest.Text, 1, 1);
    _dest.AddChild('IE').Text := edtIEDest.Text;
end;

function TFormMain.DVModulo11(str: String): Char;
var soma, fator, i: Integer;
begin
  soma := 0;
  fator := 2;

  for i := Length (str) downto 1 do
  begin
    soma := soma + chInt(str[i]) * fator;
    Inc ( fator );
    if fator = 10 then
      fator := 2;
  end;

  soma := 11 - (soma mod 11);

  if soma >= 10 then
    Result := '1'
  else
  begin
    Result := intCh(soma);
  end;
end;

procedure TFormMain.Emitente;
var
  _emit, _emit_enderEmit: IXMLNode;
begin
  _emit := _infNFe.AddChild('emit');
    _emit.AddChild('CNPJ').Text := edtCNPJEmit.Text;
    _emit.AddChild('xNome').Text := edtNomeEmit.Text;
    _emit_enderEmit := _emit.AddChild('enderEmit');
      _emit_enderEmit.AddChild('xLgr').Text := edtLogradouroEmit.Text;
      _emit_enderEmit.AddChild('nro').Text := edtNumeroEmit.Text;
      _emit_enderEmit.AddChild('xCpl').Text := edtComplementoEmit.Text;
      _emit_enderEmit.AddChild('xBairro').Text := edtBairroEmit.Text;
      _emit_enderEmit.AddChild('cMun').Text := edtCodCidadeEmit.Text;
      _emit_enderEmit.AddChild('xMun').Text := edtCidadeEmit.Text;
      _emit_enderEmit.AddChild('UF').Text := cbbUFEmit.Text;
      _emit_enderEmit.AddChild('CEP').Text := edtCepEmit.Text;
      _emit_enderEmit.AddChild('cPais').Text := edtCodPaisEmit.Text;
      _emit_enderEmit.AddChild('xPais').Text := edtPaisEmit.Text;
    _emit.AddChild('IE').Text := edtIEEmit.Text;
    _emit.AddChild('CRT').Text := Copy(cbbCRTEmit.Text, 1, 1);
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  certs: TStringList;
begin
  CarregarConfiguracoesAuditor;
  pgcMain.ActivePageIndex := 0;
  fProdutosSelecionados := '()';

  certs := TStringList.Create;
  DataModuleMain.spdNFe.ListarCertificados(certs);
  DataModuleMain.spdNFe.NomeCertificado.Add(certs[6]);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  DataModule.DataModuleMain.connection.Free;
  DataModuleMain.query.Free;
  DataModuleMain.Free;
end;

function TFormMain.getTimeZone: string;
var
  TimeZoneInfo: TTimezoneinformation;
  R: Word;
  Minutes: Integer;
  Sign: string;
begin
  R := GetTimezoneInformation(TimeZoneInfo);

  if R in [TIME_ZONE_ID_UNKNOWN, TIME_ZONE_ID_STANDARD, TIME_ZONE_ID_DAYLIGHT] then
  begin
    Minutes := (TimeZoneInfo.Bias + TimeZoneInfo.DaylightBias) * -1;
    if Minutes < 0 then
      Sign := '-'
    else
      Sign := '+';

    Result := Sign + FormatFloat('00', Minutes div -60) + ':00';
  end
  else Result := '';
end;

function TFormMain.getXMLNode(xmlString, xpath: string): string;
var
  _xml: IXMLDocument;
  _sel: IDomNodeSelect;
begin
  _xml := TXMLDocument.Create(nil);
  _xml.LoadFromXML(xmlString);
  _sel := _xml.DOMDocument as IDomNodeSelect;
  Result := _sel.selectNode(xpath).nodeValue;
end;

procedure TFormMain.Identificacao;
var
  _serie, _nnf, _cnf, _cUF, _cnpj, _mod, _tpEmis, _chave, _cdv: string;
  _ide: IXMLNode;
begin
  _serie := '51';
  _nnf := '8650';
  _cnf := '41640314';
  _cUF := cUF(cbbUFEmit.Text);
  _cnpj := edtCNPJEmit.Text;
  _mod := '55';
  _tpEmis := '1';

  _chave := _cUF +
            FormatDateTime('yymm', Now) +
            _cnpj +
            _mod +
            _serie.PadLeft(3, '0') +
            _nnf.PadLeft(9, '0') +
            _tpEmis +
            _cnf;
  _cdv := DVModulo11(_chave);
  _chave := _chave + _cdv;

  _infNFe := _NFe.AddChild('infNFe');
  _infNFe.Attributes['Id'] := 'NFe' + _chave;
  _infNFe.Attributes['versao'] := '4.00';

  _ide := _infNFe.AddChild('ide');
    _ide.AddChild('cUF').Text := _cUF;
    _ide.AddChild('cNF').Text := _cnf;
    _ide.AddChild('natOp').Text := 'VENDA DE MERCADORIA ADQ. DE TERCEIRO - PF E PJ NAO CONTRIBUI';
    _ide.AddChild('mod').Text := '55';
    _ide.AddChild('serie').Text := _serie;
    _ide.AddChild('nNF').Text := _nnf;
    _ide.AddChild('dhEmi').Text := FormatDateTime('YYYY-MM-DD"T"hh:nn:ss' + getTimeZone, Now);
    _ide.AddChild('dhSaiEnt').Text := FormatDateTime('YYYY-MM-DD"T"hh:nn:ss' + getTimeZone, Now);
    _ide.AddChild('tpNF').Text := '1';
    _ide.AddChild('idDest').Text := '1';
    _ide.AddChild('cMunFG').Text := edtCodCidadeEmit.Text;
    _ide.AddChild('tpImp').Text := '1';
    _ide.AddChild('tpEmis').Text := _tpEmis;
    _ide.AddChild('cDV').Text := _cdv;
    _ide.AddChild('tpAmb').Text := '2';
    _ide.AddChild('finNFe').Text := '1';
    _ide.AddChild('indFinal').Text := '0';
    _ide.AddChild('indPres').Text := '1';
    _ide.AddChild('procEmi').Text := '0';
    _ide.AddChild('verProc').Text := '1.0';
end;

procedure TFormMain.mmoXML1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Ord('A')) and (ssCtrl in Shift) then
  begin
    TMemo(Sender).SelectAll;
    Key := 0;
  end;
end;

procedure TFormMain.Pagamento;
var
  _pag, _detPag, _card: IXMLNode;
begin
  _pag := _infNFe.AddChild('pag');
    _detPag := _pag.AddChild('detPag');
      _detPag.AddChild('tPag').Text := fFormaPagamento;
      _detPag.AddChild('vPag').Text := calculaValorPago(_vNF, fValorTroco);

  if (fFormaPagamento = '03') or (fFormaPagamento = '04') then
  begin
    _card := _detPag.AddChild('card');
      _card.AddChild('tpIntegra').Text := fDadosCartao.TipoIntegracao;
      _card.AddChild('CNPJ').Text := fDadosCartao.CNPJ;
      _card.AddChild('tBand').Text := fDadosCartao.Bandeira;
      _card.AddChild('cAut').Text := fDadosCartao.NumeroAutorizacao;
  end;

  _pag.AddChild('vTroco').Text := fValorTroco;
end;

procedure TFormMain.PreencheCamposCliente;
begin
  if DataModuleMain.query.FieldByName('CNPJ').AsString <> EmptyStr then
  begin
    edtCNPJDest.Enabled := False;
    edtCNPJDest.Text := DataModuleMain.query.FieldByName('CNPJ').AsString;
    edtNomeDest.Text := DataModuleMain.query.FieldByName('xNome').AsString;
    edtIEDest.Text := DataModuleMain.query.FieldByName('IE').AsString;
    edtLogradouroDest.Text := DataModuleMain.query.FieldByName('xLgr').AsString;
    edtNumeroDest.Text := DataModuleMain.query.FieldByName('nro').AsString;
    edtBairroDest.Text := DataModuleMain.query.FieldByName('xBairro').AsString;
    edtCodCidadeDest.Text := DataModuleMain.query.FieldByName('cMun').AsString;
    edtCidadeDest.Text := DataModuleMain.query.FieldByName('xMun').AsString;
    cbbUFDest.Text := DataModuleMain.query.FieldByName('UF').AsString;
    edtComplementoDest.Text := DataModuleMain.query.FieldByName('xCPL').AsString;
    edtCodPaisDest.Text := DataModuleMain.query.FieldByName('cPais').AsString;
    edtPaisDest.Text := DataModuleMain.query.FieldByName('xPais').AsString;
    edtCEPDest.Text := DataModuleMain.query.FieldByName('CEP').AsString;
    cbbindIEDest.Text := DataModuleMain.query.FieldByName('IndIEDest').AsString;
  end;
end;

procedure TFormMain.PreencheCamposProduto;
var
  CRT: string;
begin
  if DataModuleMain.query.FieldByName('cProd').AsString <> EmptyStr then
  begin
    edtCodigoProd.Enabled := False;
    edtCodigoProd.Text := DataModuleMain.query.FieldByName('cProd').AsString;
    edtNomeProd.Text := DataModuleMain.query.FieldByName('xProd').AsString;
    edtValorProd.Text := DataModuleMain.query.FieldByName('vUnCom').AsString;
    edtNCMProd.Text := DataModuleMain.query.FieldByName('NCM').AsString;
    edtCFOPProd.Text := DataModuleMain.query.FieldByName('CFOP').AsString;
    edtUnidadeProd.Text := DataModuleMain.query.FieldByName('uCom').AsString;
    edtUnidadeTribProd.Text := DataModuleMain.query.FieldByName('uTrib').AsString;
    edtValorTribProd.Text := DataModuleMain.query.FieldByName('vUnTrib').AsString;
    cbbIndTotProd.Text := DataModuleMain.query.FieldByName('indTot').AsString;

    CRT := Copy(cbbCRTEmit.Text, 1, 1);

    if CRT = '1' then
    begin
      cbbOrigemSNProd.Text := DataModuleMain.query.FieldByName('OrigSN').AsString;
      cbbCSOSNProd.Text := DataModuleMain.query.FieldByName('CSOSN').AsString;
    end
    else
    begin
      edtAliquotaProd.Text := DataModuleMain.query.FieldByName('pICMS').AsString;
      cbbModBCProd.Text := DataModuleMain.query.FieldByName('modBC').AsString;
      cbbOrigemProd.Text := DataModuleMain.query.FieldByName('Orig').AsString;
      cbbGrupoTributacaoProd.Text := DataModuleMain.query.FieldByName('grupoTributacao').AsString;
    end;

    cbbIPITributado.Text := DataModuleMain.query.FieldByName('IPITrib').AsString;
    edtcEnq.Text := DataModuleMain.query.FieldByName('cEnq').AsString;
    cbbIPICST.Text := DataModuleMain.query.FieldByName('CST_1').AsString;
    edtpIPI.Text := DataModuleMain.query.FieldByName('pIPI').AsString;

    if cbbIPITributado.Text = 'Tributado' then
    begin
      lblpIPI.Visible := True;
      edtpIPI.Visible := True;
    end;

    cbbPISCST.Text := DataModuleMain.query.FieldByName('CST_2').AsString;
    edtpPIS.Text := DataModuleMain.query.FieldByName('pPIS').AsString;

    cbbCOFINSCST.Text := DataModuleMain.query.FieldByName('CST_3').AsString;
    edtpCOFINS.Text := DataModuleMain.query.FieldByName('pCOFINS').AsString;
  end
end;

procedure TFormMain.Produtos;
var
  _det, _prod, _qCom, _vUnCom, _imposto, _ICMS, _ICMSGrupo, _vFrete, _vSeg,
  _vDesc, _vOutro, _ICMSvBC, _pICMS, _IPI, _IPITrib, _IPIvBC, _pIPI, _PIS,
  _PISAliq, _PISvBC, _pPIS, _PISNT, _COFINS, _COFINSAliq, _COFINSvBC, _pCOFINS,
  _COFINSNT, _vICMS, _vIPI, _vPIS, _vCOFINS: IXMLNode;
  _lengthParametros: Boolean;
  _recno: Integer;
  _grupoTributacao: String;
  _PIS_CST, _COFINS_CST: Integer;

  procedure ICMS;
  begin
    _ICMS := _imposto.AddChild('ICMS');
    _grupoTributacao := Copy(DataModuleMain.query.FieldByName('grupoTributacao').AsString, 1, 2);
    if _grupoTributacao <> EmptyStr then
    begin
      if Copy(cbbCRTEmit.Text, 1, 1) = '1' then
      begin
        _ICMSGrupo := _ICMS.AddChild('ICMSSN' + Copy(DataModuleMain.query.FieldByName('CSOSN').AsString, 1, 3));
          _ICMSGrupo.AddChild('orig').Text := Copy(DataModuleMain.query.FieldByName('OrigSN').AsString, 1, 1);
          _ICMSGrupo.AddChild('CSOSN').Text := Copy(DataModuleMain.query.FieldByName('CSOSN').AsString, 1, 3);
      end
      else
      begin
        _ICMSGrupo := _ICMS.AddChild('ICMS' + _grupoTributacao);
          _ICMSGrupo.AddChild('orig').Text := Copy(DataModuleMain.query.FieldByName('orig').AsString, 1, 1);
          _ICMSGrupo.AddChild('CST').Text := DataModuleMain.query.FieldByName('CST').AsString;
          _ICMSGrupo.AddChild('modBC').Text := Copy(DataModuleMain.query.FieldByName('modBC').AsString, 1, 1);

          _ICMSvBC := _ICMSGrupo.AddChild('vBC');
          _ICMSvBC.Text := calculaValorBaseCalculo(_vUnCom.Text, _vFrete.Text, _vSeg.Text, _vDesc.Text, _vOutro.Text);
          _vBCTotal := _vBCTotal + StrToFloat(
            StringReplace(_ICMSvBC.Text, '.', ',', [rfReplaceAll])
          );

          _pICMS := _ICMSGrupo.AddChild('pICMS');
          _pICMS.Text := DataModuleMain.query.FieldByName('pICMS').AsString;

          _vICMS := _ICMSGrupo.AddChild('vICMS');
          _vICMS.Text := calculaValorAliquota(_ICMSvBC.Text, _pICMS.Text);
          _vICMSTotal := _vICMSTotal + StrToFloat(
            StringReplace(_vICMS.Text, '.', ',', [rfReplaceAll])
          );
      end;
    end;
  end;

  procedure IPI;
  begin
    _IPI := _imposto.AddChild('IPI');
      _IPI.AddChild('cEnq').Text := DataModuleMain.query.FieldByName('cEnq').AsString;

      if DataModuleMain.query.FieldByName('IPITrib').AsString = 'Tributado' then
      begin
        _IPITrib := _IPI.AddChild('IPITrib');
          _IPITrib.AddChild('CST').Text := Copy(DataModuleMain.query.FieldByName('CST_1').AsString, 1, 2);

          _IPIvBC := _IPITrib.AddChild('vBC');
          _IPIvBC.Text := calculaValorBaseCalculo(_vUnCom.Text, _vFrete.Text, _vSeg.Text, _vDesc.Text, _vOutro.Text);

          _pIPI := _IPITrib.AddChild('pIPI');
          _pIPI.Text := DataModuleMain.query.FieldByName('pIPI').AsString;

          _vIPI := _IPITrib.AddChild('vIPI');
          _vIPI.Text := calculaValorAliquota(_IPIvBC.Text, _pIPI.Text);
          _vIPITotal := _vIPITotal + StrToFloat(
            StringReplace(_vIPI.Text, '.', ',', [rfReplaceAll])
          );
      end
      else
        _IPI.AddChild('IPINT').AddChild('CST').Text := Copy(DataModuleMain.query.FieldByName('CST_1').AsString, 1, 2);
  end;

  procedure PIS;
  begin
    _PIS := _imposto.AddChild('PIS');

      if DataModuleMain.query.FieldByName('CST_2').AsString <> EmptyStr then
        _PIS_CST := StrToInt(Copy(DataModuleMain.query.FieldByName('CST_2').AsString, 1, 2))
      else
        _PIS_CST := 0;

      if (_PIS_CST = 1) or (_PIS_CST = 2) then
      begin
        _PISAliq := _PIS.AddChild('PISAliq');
          _PISAliq.AddChild('CST').Text := Copy(DataModuleMain.query.FieldByName('CST_2').AsString, 1, 2);

          _PISvBC := _PISAliq.AddChild('vBC');
          _PISvBC.Text := calculaValorBaseCalculo(_vUnCom.Text, _vFrete.Text, _vSeg.Text, _vDesc.Text, _vOutro.Text);

          _pPIS := _PISAliq.AddChild('pPIS');
          _pPIS.Text := DataModuleMain.query.FieldByName('pPIS').AsString;

          _vPIS := _PISAliq.AddChild('vPIS');
          _vPIS.Text := calculaValorAliquota(_PISvBC.Text, _pPIS.Text);
          _vPISTotal := _vPISTotal + StrToFloat(
            StringReplace(_vPIS.Text, '.', ',', [rfReplaceAll])
          );
      end;

      if (_PIS_CST > 3) and (_PIS_CST < 10) then
      begin
        _PISNT := _PIS.AddChild('PISNT');
          _PISNT.AddChild('CST').Text := Copy(DataModuleMain.query.FieldByName('CST_2').AsString, 1, 2);
      end;
  end;

  procedure COFINS;
  begin
    _COFINS := _imposto.AddChild('COFINS');

      if DataModuleMain.query.FieldByName('CST_2').AsString <> EmptyStr then
        _COFINS_CST := StrToInt(Copy(DataModuleMain.query.FieldByName('CST_3').AsString, 1, 2))
      else
        _COFINS_CST := 0;

      if (_COFINS_CST = 1) or (_COFINS_CST = 2) then
      begin
        _COFINSAliq := _COFINS.AddChild('COFINSAliq');
          _COFINSAliq.AddChild('CST').Text := Copy(DataModuleMain.query.FieldByName('CST_3').AsString, 1, 2);

          _COFINSvBC := _COFINSAliq.AddChild('vBC');
          _COFINSvBC.Text := calculaValorBaseCalculo(_vUnCom.Text, _vFrete.Text, _vSeg.Text, _vDesc.Text, _vOutro.Text);

          _pCOFINS := _COFINSAliq.AddChild('pCOFINS');
          _pCOFINS.Text := DataModuleMain.query.FieldByName('pCOFINS').AsString;

          _vCOFINS := _COFINSAliq.AddChild('vCOFINS');
          _vCOFINS.Text := calculaValorAliquota(_COFINSvBC.Text, _pCOFINS.Text);
          _vCOFINSTotal := _vCOFINSTotal + StrToFloat(
            StringReplace(_vCOFINS.Text, '.', ',', [rfReplaceAll])
          );
      end;

      if (_COFINS_CST > 3) and (_COFINS_CST < 10) then
      begin
        _COFINSNT := _COFINS.AddChild('COFINSNT');
          _COFINSNT.AddChild('CST').Text := Copy(DataModuleMain.query.FieldByName('CST_3').AsString, 1, 2);
      end;
  end;
begin
  DataModuleMain.query.SQL.Clear;

  if fProdutosSelecionados <> EmptyStr then
  begin
    DataModuleMain.query.SQL.Add('SELECT * FROM produtos ');
    DataModuleMain.query.SQL.Add('JOIN ICMS ON ICMS.cProd = produtos.cProd ');
    DataModuleMain.query.SQL.Add('JOIN IPI ON IPI.cProd = produtos.cProd ');
    DataModuleMain.query.SQL.Add('JOIN PIS ON PIS.cProd = produtos.cProd ');
    DataModuleMain.query.SQL.Add('JOIN COFINS ON COFINS.cProd = produtos.cProd ');
    DataModuleMain.query.SQL.Add('WHERE produtos.cProd IN ' + fProdutosSelecionados)
  end
  else
    DataModuleMain.query.SQL.Add('SELECT * FROM produtos');

  DataModuleMain.query.Open;
  DataModuleMain.query.First;

  _lengthParametros := Length(fParametrosProdutosSelecionados) = 0;
  if _lengthParametros then
    SetLength(fParametrosProdutosSelecionados, DataModuleMain.query.RecordCount);

  while not DataModuleMain.query.Eof do
  begin
    _recno := DataModuleMain.query.RecNo;

    _det := _infNFe.AddChild('det');
    _det.Attributes['nItem'] := IntToStr(_recno);
      _prod := _det.AddChild('prod');
        _prod.AddChild('cProd').Text := DataModuleMain.query.FieldByName('cProd').AsString;
        _prod.AddChild('cEAN');
        _prod.AddChild('xProd').Text := DataModuleMain.query.FieldByName('xProd').AsString;
        _prod.AddChild('NCM').Text := DataModuleMain.query.FieldByName('NCM').AsString;
        _prod.AddChild('CFOP').Text := DataModuleMain.query.FieldByName('CFOP').AsString;
        _prod.AddChild('uCom').Text := DataModuleMain.query.FieldByName('uCom').AsString;

        _qCom := _prod.AddChild('qCom');
        _qCom.Text := IfThen(_lengthParametros, '1', fParametrosProdutosSelecionados[_recno - 1].Quantidade);

        _vUnCom := _prod.AddChild('vUnCom');
        _vUnCom.Text := DataModuleMain.query.FieldByName('vUnCom').AsString;

        _prod.AddChild('vProd').Text := IfThen(_lengthParametros, '', calculaValorProduto(_qCom.Text, _vUnCom.Text));

        _prod.AddChild('cEANTrib');
        _prod.AddChild('uTrib').Text := IfThen(_lengthParametros, DataModuleMain.query.FieldByName('uTrib').AsString, fParametrosProdutosSelecionados[_recno - 1].UnidadeTributavel);
        _prod.AddChild('qTrib').Text := IfThen(_lengthParametros, '1', fParametrosProdutosSelecionados[_recno - 1].QuantidadeTributavel);
        _prod.AddChild('vUnTrib').Text := IfThen(_lengthParametros, DataModuleMain.query.FieldByName('vUnTrib').AsString, fParametrosProdutosSelecionados[_recno - 1].ValorUnitarioTributavel);

        _vFrete := _prod.AddChild('vFrete');
        _vFrete.Text := IfThen(_lengthParametros, '0.00', fParametrosProdutosSelecionados[_recno - 1].Frete);
        _vFreteTotal := _vFreteTotal + StrToFloat(
          StringReplace(_vFrete.Text, '.', ',', [rfReplaceAll])
        );

        _vSeg := _prod.AddChild('vSeg');
        _vSeg.Text := IfThen(_lengthParametros, '0.00', fParametrosProdutosSelecionados[_recno - 1].Seguro);
        _vSegTotal := _vSegTotal + StrToFloat(
          StringReplace(_vSeg.Text, '.', ',', [rfReplaceAll])
        );

        _vDesc := _prod.AddChild('vDesc');
        _vDesc.Text := IfThen(_lengthParametros, '0.00', fParametrosProdutosSelecionados[_recno - 1].Desconto);
        _vDescTotal := _vDescTotal + StrToFloat(
          StringReplace(_vDesc.Text, '.', ',', [rfReplaceAll])
        );

        _vOutro := _prod.AddChild('vOutro');
        _vOutro.Text := IfThen(_lengthParametros, '0.00', fParametrosProdutosSelecionados[_recno - 1].Outros);
        _vOutroTotal := _vOutroTotal + StrToFloat(
          StringReplace(_vOutro.Text, '.', ',', [rfReplaceAll])
        );

        _prod.AddChild('indTot').Text := Copy(DataModuleMain.query.FieldByName('indTot').AsString, 1, 1);

      _imposto := _det.AddChild('imposto');
        ICMS;
        IPI;
        PIS;
        COFINS;

    DataModuleMain.query.Next;
  end;

  CarregarProdutos;
end;

procedure TFormMain.Totais;
var
  _total, _ICMSTot: IXMLNode;

  function extendedToString(aValor: Extended): string;
  begin
    Result := StringReplace(FormatFloat('0.00', aValor), ',', '.', []);
  end;

begin
  _total := _infNFe.AddChild('total');
    _ICMSTot := _total.AddChild('ICMSTot');
      _ICMSTot.AddChild('vBC').Text := extendedToString(_vBCTotal);
      _ICMSTot.AddChild('vICMS').Text := extendedToString(_vICMSTotal);
      _ICMSTot.AddChild('vICMSDeson').Text := '0.00';
      _ICMSTot.AddChild('vFCP').Text := '0.00';
      _ICMSTot.AddChild('vBCST').Text := '0.00';
      _ICMSTot.AddChild('vST').Text := '0.00';
      _ICMSTot.AddChild('vFCPST').Text := '0.00';
      _ICMSTot.AddChild('vFCPSTRet').Text := '0.00';
      _ICMSTot.AddChild('vProd').Text := extendedToString(_vProdTotal);
      _ICMSTot.AddChild('vFrete').Text := extendedToString(_vFreteTotal);
      _ICMSTot.AddChild('vSeg').Text := extendedToString(_vSegTotal);
      _ICMSTot.AddChild('vDesc').Text := extendedToString(_vDescTotal);
      _ICMSTot.AddChild('vII').Text := '0.00';
      _ICMSTot.AddChild('vIPI').Text := extendedToString(_vIPITotal);
      _ICMSTot.AddChild('vIPIDevol').Text := '0.00';
      _ICMSTot.AddChild('vPIS').Text := extendedToString(_vPISTotal);
      _ICMSTot.AddChild('vCOFINS').Text := extendedToString(_vCOFINSTotal);
      _ICMSTot.AddChild('vOutro').Text := extendedToString(_vOutroTotal);

      _vNF := StringReplace(FormatFloat('0.00', _vProdTotal - _vDescTotal + _vFreteTotal + _vSegTotal + _vOutroTotal + _vIPITotal), ',', '.', []);
      _ICMSTot.AddChild('vNF').Text := _vNF;

      _ICMSTot.AddChild('vTotTrib').Text := '0.00';
end;

procedure TFormMain.Transporte;
var
  _transp, _transporta: IXMLNode;
begin
  _transp := _infNFe.AddChild('transp');
    _transp.AddChild('modFrete').Text := fTipoFrete;

  if fTipoFrete <> '9' then
  begin
    _transporta := _transp.AddChild('transporta');
      _transporta.AddChild('CNPJ').Text := fDadosTransportador.CNPJ;
      _transporta.AddChild('xNome').Text := fDadosTransportador.Nome;
      _transporta.AddChild('IE').Text := fDadosTransportador.IncricaoEstadual;
      _transporta.AddChild('xEnder').Text := fDadosTransportador.EnderecoCompleto;
      _transporta.AddChild('xMun').Text := fDadosTransportador.Municipio;
      _transporta.AddChild('UF').Text := fDadosTransportador.UF;
  end;
end;

function TFormMain.calculaValorBaseCalculo(aValorUnitario, aFrete, aSeguro,
  aDesconto, aOutros: string): string;
var
  _valorProduto, _valorFrete, _valorSeguro, _valorDesconto, _valorOutros: Extended;
begin
  _valorProduto := StrToFloat(
    StringReplace(aValorUnitario, '.', ',', [])
  );

  _valorFrete := StrToFloat(
    StringReplace(aFrete, '.', ',', [])
  );

  _valorSeguro := StrToFloat(
    StringReplace(aSeguro, '.', ',', [])
  );

  _valorDesconto := StrToFloat(
    StringReplace(aDesconto, '.', ',', [])
  );

  _valorOutros := StrToFloat(
    StringReplace(aOutros, '.', ',', [])
  );

  Result := StringReplace(FormatFloat('0.00', ((_valorProduto + _valorFrete + _valorSeguro + _valorOutros) - _valorDesconto)), ',', '.', []);
end;

function TFormMain.calculaValorAliquota(aBaseCalculo, aAliquota: string): string;
var
  _valorBaseCalculo, _aliquota : Extended;
begin
  if (aBaseCalculo = EmptyStr) OR (aAliquota = EmptyStr) then
  begin
    Result := '0.00';
    Exit;
  end;

  _valorBaseCalculo := StrToFloat(
    StringReplace(aBaseCalculo, '.', ',', [])
  );

  _aliquota := StrToFloat(
    StringReplace(aAliquota, '.', ',', [])
  );

  Result := StringReplace(FormatFloat('0.00', (_valorBaseCalculo * (_aliquota / 100))), ',', '.', []);
end;

function TFormMain.calculaValorPago(_vPag, _vTroco: string): string;
var
  _vPagExtended, _vTrocoExtended: Extended;
begin
  _vPagExtended := StrToFloat(
    StringReplace(_vPag, '.', ',', [])
  );

  _vTrocoExtended := StrToFloat(
    StringReplace(_vTroco, '.', ',', [])
  );

  Result := StringReplace(FormatFloat('0.00', (_vPagExtended + _vTrocoExtended)), ',', '.', []);
end;

function TFormMain.calculaValorProduto(aQuantidade,
  aValorUnitario: string): String;
var
  _valor, _valorUnitario: Extended;
  _fomatado: string;
  _quantidade: Integer;
begin
  if aQuantidade = EmptyStr then
    aQuantidade := '1';

  _quantidade := StrToInt(aQuantidade);
  _valorUnitario := StrToFloat(
    StringReplace(aValorUnitario, '.', ',', [rfReplaceAll])
  );

  _valor := (_quantidade * _valorUnitario);
  _fomatado := FormatFloat('0.00', _valor);

  _vProdTotal := _vProdTotal + _valor;

  Result := StringReplace(_fomatado, ',', '.', [rfReplaceAll]);
end;

procedure TFormMain.tsClientesShow(Sender: TObject);
begin
  CarregarClientes;
end;

procedure TFormMain.tsEmpresaShow(Sender: TObject);
begin
  CarregarEmpresa;
end;

procedure TFormMain.tsProdutosShow(Sender: TObject);
var
  CRT: string;
begin
  CarregarProdutos;
  pgcCamposProd.ActivePageIndex := 0;

  CRT := Copy(cbbCRTEmit.Text, 1, 1);

  if CRT = '1' then
  begin
    tsICMS_CRT1.TabVisible := True;
    tsICMS.TabVisible := False
  end
  else
  begin
    tsICMS.TabVisible := True;
    tsICMS_CRT1.TabVisible := False
  end
end;

end.
