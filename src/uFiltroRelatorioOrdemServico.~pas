unit uFiltroRelatorioOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons;

type
  TfrmFiltroRelatorioOrdemServico = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    txtDataInicial: TMaskEdit;
    txtDataFinal: TMaskEdit;
    dblkcbbClientes: TDBLookupComboBox;
    CheckCliente: TCheckBox;
    rgOrdenamento: TRadioGroup;
    Panel1: TPanel;
    btnRelatorioQuick: TSpeedButton;
    btnRelatorioFast: TSpeedButton;
    btnRelatorioFortes: TSpeedButton;
    btnRelatorioCSV: TSpeedButton;
    btnRelatorioXLS: TSpeedButton;
    Panel7: TPanel;
    btnSair: TSpeedButton;
    btnRelatorioPDF: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure CheckClienteClick(Sender: TObject);
    procedure txtDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkcbbClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure txtDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure txtDataFinalKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbbClientesKeyPress(Sender: TObject; var Key: Char);
    procedure txtDataInicialEnter(Sender: TObject);
    procedure txtDataFinalEnter(Sender: TObject);
    procedure dblkcbbClientesEnter(Sender: TObject);
    procedure txtDataInicialExit(Sender: TObject);
    procedure txtDataFinalExit(Sender: TObject);
    procedure dblkcbbClientesExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRelatorioOrdemServico: TfrmFiltroRelatorioOrdemServico;

implementation

{$R *.dfm}

procedure TfrmFiltroRelatorioOrdemServico.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiltroRelatorioOrdemServico.CheckClienteClick(Sender: TObject);
begin
  if(CheckCliente.Checked)then
    dblkcbbClientes.Enabled := false
  else
    dblkcbbClientes.Enabled := true;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataInicialKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if((key = vk_return)or(key = 40))then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end else
  if(key = 38)then
  begin
    Perform(WM_NEXTDLGCTL,1,0);
  end;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataFinalKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if((key = vk_return)or(key = 40))then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end else
  if(key = 38)then
  begin
    Perform(WM_NEXTDLGCTL,1,0);
  end;
end;

procedure TfrmFiltroRelatorioOrdemServico.dblkcbbClientesKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if(key = vk_return)then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmFiltroRelatorioOrdemServico.FormShow(Sender: TObject);
begin
  txtDataInicial.SetFocus;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataInicialKeyPress(
  Sender: TObject; var Key: Char);
begin
  if(key = #13)then
    key := #0;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataFinalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if(key = #13)then
    key := #0;
end;

procedure TfrmFiltroRelatorioOrdemServico.dblkcbbClientesKeyPress(
  Sender: TObject; var Key: Char);
begin
  if(key = #13)then
    key := #0;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataInicialEnter(
  Sender: TObject);
begin
  txtDataInicial.Color := clInfoBk;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataFinalEnter(
  Sender: TObject);
begin
  txtDataFinal.Color := clInfoBk;
end;

procedure TfrmFiltroRelatorioOrdemServico.dblkcbbClientesEnter(
  Sender: TObject);
begin
  dblkcbbClientes.Color := clInfoBk;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataInicialExit(
  Sender: TObject);
begin
  txtDataInicial.Color := clWhite;
end;

procedure TfrmFiltroRelatorioOrdemServico.txtDataFinalExit(
  Sender: TObject);
begin
  txtDataFinal.Color := clWhite;
end;

procedure TfrmFiltroRelatorioOrdemServico.dblkcbbClientesExit(
  Sender: TObject);
begin
  dblkcbbClientes.Color := clWhite;
end;

end.
