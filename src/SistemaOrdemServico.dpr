program SistemaOrdemServico;

uses
  Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  uSobre in 'uSobre.pas' {frmSobre},
  uDM in 'uDM.pas' {DM: TDataModule},
  uClientes in 'uClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
