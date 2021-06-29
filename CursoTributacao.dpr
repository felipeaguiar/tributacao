program CursoTributacao;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  DataModule in 'DataModule.pas' {DataModuleMain: TDataModule},
  Venda in 'Venda.pas' {FormVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormVenda, FormVenda);
  Application.Run;
end.
