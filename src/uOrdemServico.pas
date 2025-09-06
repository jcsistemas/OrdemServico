unit uOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Menus;

type
  TfrmOrdemServico = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnPDF: TSpeedButton;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    PopUp1: TPopupMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    S1: TMenuItem;
    C1: TMenuItem;
    E2: TMenuItem;
    I1: TMenuItem;
    P1: TMenuItem;
    S2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure S2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemServico: TfrmOrdemServico;

implementation

{$R *.dfm}

procedure TfrmOrdemServico.N1Click(Sender: TObject);
begin
  if(btnNovo.Enabled)then
    btnNovo.Click;
end;

procedure TfrmOrdemServico.E1Click(Sender: TObject);
begin
  if(btnEditar.Enabled)then
    btnEditar.Click;
end;

procedure TfrmOrdemServico.S1Click(Sender: TObject);
begin
  if(btnSalvar.Enabled)then
    btnSalvar.Click;
end;

procedure TfrmOrdemServico.C1Click(Sender: TObject);
begin
  if(btnCancelar.Enabled)then
    btnCancelar.Click;
end;

procedure TfrmOrdemServico.E2Click(Sender: TObject);
begin
  if(btnExcluir.Enabled)then
    btnExcluir.Click;
end;

procedure TfrmOrdemServico.I1Click(Sender: TObject);
begin
  if(btnImprimir.Enabled)then
    btnImprimir.Click;
end;

procedure TfrmOrdemServico.btnPDFClick(Sender: TObject);
begin
  if(btnPDF.Enabled)then
    btnPDF.Click;
end;

procedure TfrmOrdemServico.S2Click(Sender: TObject);
begin
  if(btnSair.Enabled)then
    btnSair.Click;
end;

end.
