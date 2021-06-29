object DataModuleMain: TDataModuleMain
  OldCreateOrder = True
  Height = 277
  Width = 384
  object connection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = 'localhost'
    Port = 0
    Database = 'C:\sqlite\db.sqlite'
    User = ''
    Password = ''
    Protocol = 'sqlite-3'
    LibraryLocation = 'C:\sqlite\sqlite3.dll'
    Left = 24
    Top = 8
  end
  object query: TZQuery
    Connection = connection
    Params = <>
    Left = 80
    Top = 8
  end
  object spdValidadorClientX: TspdValidadorClientX
    Servidor = 'http://validadornfe.tecnospeed.com.br:8181/validadorgui/validar'
    ExibirRegrasValidacao = False
    CodigoProduto = 0
    Estagio = esProducao
    HeigthHtml = 0
    WidthHtml = 0
    TipoResposta = trTexto
    LinguagemResposta = tlHtml
    ModoOperacao = moLocal
    PortaProxy = 0
    AtualizarRegrasAutomaticamente = True
    Timeout = 30000
    Left = 152
    Top = 8
  end
  object dsQuery: TDataSource
    DataSet = query
    Left = 240
    Top = 8
  end
  object synxmlsynXML2: TSynXMLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    WantBracesParsed = False
    Left = 304
    Top = 8
  end
  object spdNFe: TspdNFe
    VersaoManual = vm60
    AnexarDanfePDF = True
    DanfeSettings.FraseContingencia = 
      'Danfe em conting'#234'ncia - Impresso em decorr'#234'ncia de problemas t'#233'c' +
      'nicos'
    DanfeSettings.FraseHomologacao = 'SEM VALOR FISCAL'
    DanfeSettings.QtdeCopias = 1
    DanfeSettings.LineDelimiter = '|'
    DanfeSettings.InfCplMaxCol = 68
    DanfeSettings.InfCplMaxRow = 7
    DanfeSettings.ImprimirVolume = False
    DanfeSettings.ImprimirDuplicata = True
    DanfeSettings.MensagemPartilhaAutomatica = False
    DanfeSettings.ImprimirUnidadeTributada = False
    DanfeSettings.ImprimirObsCont = False
    UF = 'PR'
    Versao = '9.7.44.59120'
    CaracteresRemoverAcentos = #225#233#237#243#250#224#232#236#242#249#226#234#238#244#251#228#235#239#246#252#227#245#241#231#193#201#205#211#218#192#200#204#210#217#194#202#206#212#219#196#203#207#214#220#195#213#209#199#186#170
    TipoCertificado = ckFile
    DiretorioTemplates = 'C:\Program Files\TecnoSpeed\NFe\arquivos\templates\vm60\'
    IgnoreInvalidCertificates = False
    CNPJ = '08187168000160'
    ArquivoServidoresHom = 'C:\Program Files\TecnoSpeed\NFe\arquivos\nfeServidoresHom.ini'
    ArquivoServidoresProd = 'C:\Program Files\TecnoSpeed\NFe\arquivos\nfeServidoresProd.ini'
    DiretorioLog = 'C:\Desenvolvimento\Dotenorio\EAD\Win32\Debug\Log'
    Ambiente = akHomologacao
    EmailSettings.Autenticacao = False
    EmailSettings.TimeOut = 0
    EmailSettings.ConteudoHtml = False
    DiretorioEsquemas = 'C:\Program Files\TecnoSpeed\NFe\arquivos\Esquemas\vm60\'
    ConexaoSegura = True
    TimeOut = 0
    DiretorioLogErro = 'C:\Desenvolvimento\Dotenorio\EAD\Win32\Debug\LogErro\'
    DiretorioTemporario = 'C:\ProgramData\'
    ModoOperacao = moNormal
    EntregaXML = exEmail
    ComponenteAuditor = spdValidadorClientX
    DiretorioXmlDestinatario = 'C:\Desenvolvimento\Dotenorio\EAD\Win32\Debug\XmlDestinatario\'
    DiretorioDownloads = 
      'C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\bin\Downloads' +
      '\'
    MaxSizeLoteEnvio = 500
    DanfeSimplificado = False
    Left = 24
    Top = 64
  end
end
