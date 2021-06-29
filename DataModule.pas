unit DataModule;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, spdNFeValidadorClientAdapter,
  ZSequence, Datasnap.DBClient, SynEditHighlighter, SynHighlighterXML,
  ZAbstractTable, System.IniFiles, spdNFe;

type
  TDataModuleMain = class(TDataModule)
    connection: TZConnection;
    query: TZQuery;
    spdValidadorClientX: TspdValidadorClientX;
    dsQuery: TDataSource;
    synxmlsynXML2: TSynXMLSyn;
    spdNFe: TspdNFe;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleMain: TDataModuleMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
