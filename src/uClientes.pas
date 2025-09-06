unit uClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, Buttons, StdCtrls;

type
  TfrmClientes = class(TForm)
    Panel1: TPanel;
    dbgrd1: TDBGrid;
    Panel2: TPanel;
    btnInserir: TSpeedButton;
    btnEditar: TSpeedButton;
    lbl1: TLabel;
    edtBuscar: TEdit;
    Panel3: TPanel;
    btnSair: TSpeedButton;
    btnExcluir: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
