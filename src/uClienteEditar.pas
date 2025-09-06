unit uClienteEditar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, DB, Menus;

type
  TfrmClienteEditar = class(TForm)
    Panel2: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    lbl1: TLabel;
    DBedtID: TDBEdit;
    lbl2: TLabel;
    DBedtNOME: TDBEdit;
    lbl3: TLabel;
    DBedtDOCUMENTO: TDBEdit;
    lbl4: TLabel;
    DBedtEMAIL: TDBEdit;
    lbl5: TLabel;
    DBedtTELEFONE: TDBEdit;
    lbl6: TLabel;
    DBedtDATACADASTRO: TDBEdit;
    PopUp1: TPopupMenu;
    S1: TMenuItem;
    C1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DBedtDOCUMENTOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBedtDATACADASTROKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBedtNOMEEnter(Sender: TObject);
    procedure DBedtDOCUMENTOEnter(Sender: TObject);
    procedure DBedtEMAILEnter(Sender: TObject);
    procedure DBedtTELEFONEEnter(Sender: TObject);
    procedure DBedtDATACADASTROEnter(Sender: TObject);
    procedure DBedtDATACADASTROExit(Sender: TObject);
    procedure DBedtTELEFONEExit(Sender: TObject);
    procedure DBedtEMAILExit(Sender: TObject);
    procedure DBedtDOCUMENTOExit(Sender: TObject);
    procedure DBedtNOMEExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteEditar: TfrmClienteEditar;

implementation

uses uDM, uClientes, uMenu;

{$R *.dfm}

procedure TfrmClienteEditar.FormShow(Sender: TObject);
begin
  if(FNovoCadastro)then
    Caption := 'Inserção de Novo Cliente'
  else
    Caption := 'Edição de Cliente';
end;

procedure TfrmClienteEditar.DBedtDOCUMENTOKeyDown(Sender: TObject;
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

procedure TfrmClienteEditar.DBedtDATACADASTROKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if((key = vk_return)or(key = 40))then
  begin
    if(btnSalvar.Enabled)then
      btnSalvar.Click;
  end else
  if(key = 38)then
  begin
    Perform(WM_NEXTDLGCTL,1,0);
  end;
end;

procedure TfrmClienteEditar.DBedtNOMEEnter(Sender: TObject);
begin
  DBedtNOME.Color := clInfoBk;
end;

procedure TfrmClienteEditar.DBedtDOCUMENTOEnter(Sender: TObject);
begin
  DBedtDOCUMENTO.Color := clInfoBk;
end;

procedure TfrmClienteEditar.DBedtEMAILEnter(Sender: TObject);
begin
  DBedtEMAIL.Color := clInfoBk;
end;

procedure TfrmClienteEditar.DBedtTELEFONEEnter(Sender: TObject);
begin
  DBedtTELEFONE.Color := clInfoBk;
end;

procedure TfrmClienteEditar.DBedtDATACADASTROEnter(Sender: TObject);
begin
  DBedtDATACADASTRO.Color := clInfoBk;
end;

procedure TfrmClienteEditar.DBedtDATACADASTROExit(Sender: TObject);
begin
  DBedtDATACADASTRO.Color := clWhite;
end;

procedure TfrmClienteEditar.DBedtTELEFONEExit(Sender: TObject);
begin
  DBedtTELEFONE.Color := clWhite;
end;

procedure TfrmClienteEditar.DBedtEMAILExit(Sender: TObject);
begin
  DBedtEMAIL.Color := clWhite;
end;

procedure TfrmClienteEditar.DBedtDOCUMENTOExit(Sender: TObject);
begin
  DBedtDOCUMENTO.Color := clWhite;
end;

procedure TfrmClienteEditar.DBedtNOMEExit(Sender: TObject);
begin
  DBedtNOME.Color := clWhite;
end;

procedure TfrmClienteEditar.btnCancelarClick(Sender: TObject);
begin
  if(FConexao = 'Zeos')then
  begin
    if(DM.TCliente.State = dsBrowse)then
      DM.TCliente.Edit;

    DM.TCliente.Cancel;
  end else
  begin
    if(DM.TBCliente.State = dsBrowse)then
      DM.TBCliente.Edit;

    DM.TBCliente.Cancel;
  end;
  btnCancelar.Enabled := false;
  Close;
end;

procedure TfrmClienteEditar.btnSalvarClick(Sender: TObject);
begin
  DBedtEMAIL.SetFocus;
  if(FConexao = 'Zeos')then
  begin
    if(DM.TCliente.State = dsBrowse)then
      DM.TCliente.Edit;

    if(DM.TClienteNOME.Value = '')then
    begin
      ShowMessage('Informe o nome!');
      Abort;
    end;

    DM.TCliente.Post;
    DM.TCliente.ApplyUpdates;
  end else
  begin
    if(DM.TBCliente.State = dsBrowse)then
      DM.TBCliente.Edit;

    if(DM.TBClienteNOME.Value = '')then
    begin
      ShowMessage('Informe o nome!');
      Abort;
    end;

    DM.TBCliente.Post;
    DM.TBCliente.ApplyUpdates(0);
  end;
  btnCancelar.Enabled := false;
  Close;
end;

procedure TfrmClienteEditar.S1Click(Sender: TObject);
begin
  if(btnSalvar.Enabled)then
    btnSalvar.Click;
end;

procedure TfrmClienteEditar.C1Click(Sender: TObject);
begin
  if(btnCancelar.Enabled)then
    btnCancelar.Click;
end;

procedure TfrmClienteEditar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if(btnCancelar.Enabled)then
    btnCancelar.Click;
end;

end.
