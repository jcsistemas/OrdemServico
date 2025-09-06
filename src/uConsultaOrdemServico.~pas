unit uConsultaOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TfrmConsultaOrdemServico = class(TForm)
    Panel1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnAtualizar: TSpeedButton;
    txtDataInicial: TMaskEdit;
    txtDataFinal: TMaskEdit;
    Panel7: TPanel;
    btnSair: TSpeedButton;
    lbl3: TLabel;
    dblkcbbClientes: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Check1: TCheckBox;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkcbbClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbbClientesKeyPress(Sender: TObject; var Key: Char);
    procedure txtDataInicialExit(Sender: TObject);
    procedure txtDataFinalExit(Sender: TObject);
    procedure dblkcbbClientesExit(Sender: TObject);
    procedure dblkcbbClientesEnter(Sender: TObject);
    procedure txtDataFinalEnter(Sender: TObject);
    procedure txtDataInicialEnter(Sender: TObject);
    procedure Check1Click(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaOrdemServico: TfrmConsultaOrdemServico;

implementation

uses uMenu, uDM, uOrdemServico;

{$R *.dfm}

procedure TfrmConsultaOrdemServico.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaOrdemServico.FormShow(Sender: TObject);
begin
  txtDataInicial.SetFocus;
end;

procedure TfrmConsultaOrdemServico.txtDataInicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure TfrmConsultaOrdemServico.dblkcbbClientesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key = vk_return)then
  begin
    if(btnAtualizar.Enabled)then
      btnAtualizar.Click;

    DBGrid1.SetFocus;
  end;
end;

procedure TfrmConsultaOrdemServico.txtDataInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if(key = #13)then
    key := #0;
end;

procedure TfrmConsultaOrdemServico.dblkcbbClientesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if(key = #13)then
    key := #0;
end;

procedure TfrmConsultaOrdemServico.txtDataInicialExit(Sender: TObject);
begin
  txtDataInicial.Color := clWhite;
end;

procedure TfrmConsultaOrdemServico.txtDataFinalExit(Sender: TObject);
begin
  txtDataFinal.Color := clWhite;
end;

procedure TfrmConsultaOrdemServico.dblkcbbClientesExit(Sender: TObject);
begin
  dblkcbbClientes.Color := clWhite;
end;

procedure TfrmConsultaOrdemServico.dblkcbbClientesEnter(Sender: TObject);
begin
  dblkcbbClientes.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.txtDataFinalEnter(Sender: TObject);
begin
  txtDataFinal.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.txtDataInicialEnter(Sender: TObject);
begin
  txtDataInicial.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.Check1Click(Sender: TObject);
begin
  if(Check1.Checked)then
    dblkcbbClientes.Enabled := false
  else
    dblkcbbClientes.Enabled := true;
end;

procedure TfrmConsultaOrdemServico.btnAtualizarClick(Sender: TObject);
var
  lIDClienteSelecionado: Integer;
begin
  lIDClienteSelecionado := 0;
  if(dblkcbbClientes.KeyValue <> null)then
    lIDClienteSelecionado := dblkcbbClientes.KeyValue;
    
  if(FConexao = 'Zeos')then
  begin
    DM.TOrdemServico.Filtered := false;
    DM.TOrdemServico.Filter := 'DATA_ABERTURA >= '+QuotedStr(txtDataInicial.Text)+' AND DATA_ABERTURA <= '+QuotedStr(txtDataFinal.Text);
    if(Check1.Checked = false)and(lIDClienteSelecionado > 0)then
    begin
      DM.TOrdemServico.Filter := DM.TOrdemServico.Filter + ' AND CLIENTE_ID = '+IntToStr(lIDClienteSelecionado);
    end;
    DM.TOrdemServico.Filtered := true;
  end else
  begin
    DM.TBOrdemServico.Filtered := false;
    DM.TBOrdemServico.Filter := 'DATA_ABERTURA >= '+QuotedStr(txtDataInicial.Text)+' AND DATA_ABERTURA <= '+QuotedStr(txtDataFinal.Text);
    if(Check1.Checked = false)and(lIDClienteSelecionado > 0)then
    begin
      DM.TBOrdemServico.Filter := DM.TBOrdemServico.Filter + ' AND CLIENTE_ID = '+IntToStr(lIDClienteSelecionado);
    end;
    DM.TBOrdemServico.Filtered := true;
  end;
end;

procedure TfrmConsultaOrdemServico.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaOrdemServico.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key = vk_return)then
    Close;
end;

procedure TfrmConsultaOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if(FConexao = 'Zeos')then
  begin
    FOrdemServicoConsultada := DM.TOrdemServicoID.AsInteger;
    DM.TOrdemServico.Filtered := false;
  end else
  begin
    FOrdemServicoConsultada := DM.TBOrdemServicoID.AsInteger;
    DM.TBOrdemServico.Filtered := false;
  end;
end;

end.
