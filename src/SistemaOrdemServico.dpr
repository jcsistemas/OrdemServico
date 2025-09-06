program SistemaOrdemServico;

uses
  Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  uSobre in 'uSobre.pas' {frmSobre},
  uDM in 'uDM.pas' {DM: TDataModule},
  uClientes in 'uClientes.pas' {frmClientes},
  uUtilidades in 'uUtilidades.pas',
  uClienteEditar in 'uClienteEditar.pas' {frmClienteEditar},
  uBuscaCNPJ in 'uBuscaCNPJ.pas' {frmBuscaCNPJ};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmClienteEditar, frmClienteEditar);
  Application.CreateForm(TfrmBuscaCNPJ, frmBuscaCNPJ);
  Application.Run;
end.
