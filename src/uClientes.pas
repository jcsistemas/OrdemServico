unit uClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, Buttons, StdCtrls;

type
  TfrmClientes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnInserir: TSpeedButton;
    btnEditar: TSpeedButton;
    lbl1: TLabel;
    edtBuscar: TEdit;
    Panel3: TPanel;
    btnSair: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnBuscarCNPJ: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure edtBuscarEnter(Sender: TObject);
    procedure edtBuscarExit(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnBuscarCNPJClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;
  FNovoCadastro: Boolean;

implementation

uses uDM, uClienteEditar, uBuscaCNPJ;

{$R *.dfm}

procedure TfrmClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClientes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(DM.TBCliente.RecNo) then
   begin
      if not (gdSelected in State) then
      begin
         DBGrid1.Canvas.Brush.Color := TColor($FFEFE0);
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
      end;
   end;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  DM.TBCliente.Open;
  DM.TBCliente.RecordCount;
end;

procedure TfrmClientes.edtBuscarEnter(Sender: TObject);
begin
  edtBuscar.Color := clInfoBk;
end;

procedure TfrmClientes.edtBuscarExit(Sender: TObject);
begin
  edtBuscar.Color := clWhite;
end;

procedure TfrmClientes.edtBuscarChange(Sender: TObject);
begin
  DM.TBCliente.Filtered := false;
  DM.TBCliente.Filter := 'LOWER(NOME) LIKE '+QuotedStr('%'+AnsiLowerCase(edtBuscar.Text)+'%');
  DM.TBCliente.Filtered := true; 
end;

procedure TfrmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.TBCliente.Filtered := false;
end;

procedure TfrmClientes.edtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return)then
    DBGrid1.SetFocus;
end;

procedure TfrmClientes.DBGrid1DblClick(Sender: TObject);
begin
  if(btnEditar.Enabled)then
    btnEditar.Click;
end;

procedure TfrmClientes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return)then
  begin
    if(btnEditar.Enabled)then
      btnEditar.Click;
  end;
end;

procedure TfrmClientes.btnInserirClick(Sender: TObject);
begin
  DM.TBCliente.Filtered := false;
  DM.TBCliente.Insert;
  frmClienteEditar := TfrmClienteEditar.Create(Self);
  frmClienteEditar.ShowModal;
  DM.TBCliente.Refresh;
end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
var
  lClienteEditado: Integer;
begin
  lClienteEditado := DM.TBClienteID.Value;
  DM.TBCliente.Filtered := false;
  if(DM.TBCliente.Locate('ID',lClienteEditado,[]))then
  begin
    DM.TBCliente.Edit;
    frmClienteEditar := TfrmClienteEditar.Create(Self);
    frmClienteEditar.ShowModal;
  end;
end;

procedure TfrmClientes.btnBuscarCNPJClick(Sender: TObject);
begin
  frmBuscaCNPJ := TfrmBuscaCNPJ.Create(Self);
  frmBuscaCNPJ.ShowModal;
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
begin
  if(Application.MessageBox('Você realmente deseja excluir o cliente?','Atenção',MB_ICONQUESTION + MB_YESNO)=mrYes)then
  begin
    DM.QueryVerificar.Close;
    DM.QueryVerificar.SQL.Clear;
    DM.QueryVerificar.SQL.Add('SELECT COUNT(*) AS QUANTIDADE FROM ORDEM_SERVICO WHERE CLIENTE_ID = :pCliente');
    DM.QueryVerificar.Params.ParamByName('pCliente').AsInteger := DM.TBClienteID.Value;
    DM.QueryVerificar.Open;
    if(DM.QueryVerificar.Fields.FieldByName('QUANTIDADE').AsInteger > 0)then
    begin
      ShowMessage('Este cliente já tem ordens de serviço lançadas em seu nome, não é possível excluí-lo sem antes excluir suas ordens de serviço!');
      Abort;
    end;
    DM.TBCliente.Delete;
    DM.TBCliente.ApplyUpdates(0);
  end;
end;

end.
