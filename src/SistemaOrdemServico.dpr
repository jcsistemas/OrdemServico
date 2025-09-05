program SistemaOrdemServico;

uses
  Forms,
  uMenu in 'uMenu.pas' {frmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
