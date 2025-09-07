program SistemaOrdemServico;

uses
  Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  uSobre in 'uSobre.pas' {frmSobre},
  uDM in 'uDM.pas' {DM: TDataModule},
  uClientes in 'uClientes.pas' {frmClientes},
  uUtilidades in 'uUtilidades.pas',
  uClienteEditar in 'uClienteEditar.pas' {frmClienteEditar},
  uBuscaCNPJ in 'uBuscaCNPJ.pas' {frmBuscaCNPJ},
  uOrdemServico in 'uOrdemServico.pas' {frmOrdemServico},
  uEscolhaConexao in 'uEscolhaConexao.pas' {frmEscolhaConexao},
  uItemOrdemEditar in 'uItemOrdemEditar.pas' {frmItemOrdemEditar},
  uConsultaOrdemServico in 'uConsultaOrdemServico.pas' {frmConsultaOrdemServico},
  uFiltroRelatorioOrdemServico in 'uFiltroRelatorioOrdemServico.pas' {frmFiltroRelatorioOrdemServico},
  uRelatorioOrdemServicoQuick in 'uRelatorioOrdemServicoQuick.pas' {frmRelatorioOrdemServicoQuick};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sistema de Ordens de Serviço';
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmRelatorioOrdemServicoQuick, frmRelatorioOrdemServicoQuick);
  Application.Run;
end.
