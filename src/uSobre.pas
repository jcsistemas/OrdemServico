unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ShellAPi;

type
  TfrmSobre = class(TForm)
    lbl1: TLabel;
    lblLinkFatCow: TLabel;
    btnSair: TSpeedButton;
    procedure lblLinkFatCowClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.lblLinkFatCowClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', PChar(lblLinkFatCow.Caption), NiL, NiL, SW_SHOWNORMAL);
end;

procedure TfrmSobre.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
