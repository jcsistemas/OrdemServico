unit uEscolhaConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons;

type
  TfrmEscolhaConexao = class(TForm)
    btnZeos: TSpeedButton;
    btnDBExpress: TSpeedButton;
    procedure btnZeosClick(Sender: TObject);
    procedure btnDBExpressClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolhaConexao: TfrmEscolhaConexao;

implementation

uses uMenu;

{$R *.dfm}

procedure TfrmEscolhaConexao.btnZeosClick(Sender: TObject);
begin
  FConexao := 'Zeos';
  Close;
end;

procedure TfrmEscolhaConexao.btnDBExpressClick(Sender: TObject);
begin
  FConexao := 'DBExpress';
  Close;
end;

procedure TfrmEscolhaConexao.FormShow(Sender: TObject);
begin
  FConexao := 'Zeos';
end;

end.
