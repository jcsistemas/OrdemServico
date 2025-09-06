unit uOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons;

type
  TfrmOrdemServico = class(TForm)
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnPDF: TSpeedButton;
    btn1: TSpeedButton;
    Panel2: TPanel;
    btnSair: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemServico: TfrmOrdemServico;

implementation

{$R *.dfm}

end.
