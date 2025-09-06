unit uOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Menus, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids;

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
    Panel3: TPanel;
    Panel4: TPanel;
    lbl9: TLabel;
    DBedtID1: TDBEdit;
    lbl10: TLabel;
    DBedtCLIENTE_ID1: TDBEdit;
    lbl11: TLabel;
    DBedtDATA_ABERTURA1: TDBEdit;
    lbl12: TLabel;
    DBedtDATA_PREVISTA1: TDBEdit;
    lbl13: TLabel;
    DBedtDATA_FECHAMENTO1: TDBEdit;
    lbl14: TLabel;
    dblkcbbCLIENTE_ID: TDBLookupComboBox;
    DBcbbSTATUS1: TDBComboBox;
    lbl15: TLabel;
    lbl16: TLabel;
    DBedtVALOR_TOTAL1: TDBEdit;
    dbgrd1: TDBGrid;
    Panel5: TPanel;
    lbl1: TLabel;
    btnInserirItem: TSpeedButton;
    btnEditarItem: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    DBMemoDESCRICAO_PROBLEMA: TDBMemo;
    btnConsultar: TSpeedButton;
    DBNavigator1: TDBNavigator;
    procedure N1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirItemClick(Sender: TObject);
    procedure btnEditarItemClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure modo_navegacao();
    procedure modo_edicao();
    procedure AtualizarTotal();
  public
    { Public declarations }
  end;

var
  frmOrdemServico: TfrmOrdemServico;
  FNovaOrdemServico: Boolean;
  FNovoItemOrdem: Boolean;

implementation

uses uDM, uUtilidades, uMenu, uItemOrdemEditar, DB;

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

procedure TfrmOrdemServico.modo_navegacao;
begin
  DBedtID1.Enabled := false;
  DBedtCLIENTE_ID1.Enabled := false;
  DBedtDATA_ABERTURA1.Enabled := false;
  DBedtDATA_PREVISTA1.Enabled := false;
  DBedtDATA_FECHAMENTO1.Enabled := false;
  DBedtVALOR_TOTAL1.Enabled := false;
  dblkcbbCLIENTE_ID.Enabled := false;
  DBcbbSTATUS1.Enabled := false;
  DBMemoDESCRICAO_PROBLEMA.Enabled := false;
  btnNovo.Enabled := true;
  btnEditar.Enabled := true;
  btnSalvar.Enabled := false;
  btnCancelar.Enabled := false;
  btnExcluir.Enabled := true;
  btnImprimir.Enabled := true;
  btnPDF.Enabled := true;
  btnSair.Enabled := true;
  btnInserirItem.Enabled := true;
  btnEditarItem.Enabled := true;
  btnExcluirItem.Enabled := true;
end;

procedure TfrmOrdemServico.modo_edicao;
begin
  DBedtID1.Enabled := true;
  DBedtCLIENTE_ID1.Enabled := true;
  DBedtDATA_ABERTURA1.Enabled := true;
  DBedtDATA_PREVISTA1.Enabled := true;
  DBedtDATA_FECHAMENTO1.Enabled := true;
  DBedtVALOR_TOTAL1.Enabled := true;
  dblkcbbCLIENTE_ID.Enabled := true;
  DBcbbSTATUS1.Enabled := true;
  DBMemoDESCRICAO_PROBLEMA.Enabled := true;
  btnNovo.Enabled := false;
  btnEditar.Enabled := false;
  btnSalvar.Enabled := true;
  btnCancelar.Enabled := true;
  btnExcluir.Enabled := false;
  btnImprimir.Enabled := false;
  btnPDF.Enabled := false;
  btnSair.Enabled := false;
  btnInserirItem.Enabled := true;
  btnEditarItem.Enabled := true;
  btnExcluirItem.Enabled := true;
end;

procedure TfrmOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if(btnCancelar.Enabled)then
    btnCancelar.Click;
end;

procedure TfrmOrdemServico.FormShow(Sender: TObject);
begin
  modo_navegacao();
end;

procedure TfrmOrdemServico.btnNovoClick(Sender: TObject);
var
  lIDOrdemServico: Integer;
begin
  FNovaOrdemServico := true;
  lIDOrdemServico := TUtilidades.GerarChavePrimaria('ORDEM_SERVICO');
  DM.TBOrdemServico.Insert;
  DM.TBOrdemServicoID.Value := lIDOrdemServico;
  DM.TBOrdemServicoDATA_ABERTURA.Value := date;
  DM.TBOrdemServicoSTATUS.Value := 'Aberta';
  DM.TBOrdemServico.Post;
  DM.TBOrdemServico.ApplyUpdates(0);
  DM.TBOrdemServico.Locate('ID',lIDOrdemServico,[]);
  DM.TBOrdemServico.Edit;
  modo_edicao();
  DBedtCLIENTE_ID1.SetFocus;
end;

procedure TfrmOrdemServico.btnEditarClick(Sender: TObject);
begin
  if(DM.TBOrdemServico.RecordCount = 0)then
    Abort;
    
  FNovaOrdemServico := false;
  DM.TBOrdemServico.Edit;
  modo_edicao;
  DBedtCLIENTE_ID1.SetFocus;
end;

procedure TfrmOrdemServico.btnSalvarClick(Sender: TObject);
begin
  DBMemoDESCRICAO_PROBLEMA.SetFocus;
  if not(DM.TBCliente.Locate('ID',DM.TBOrdemServicoCLIENTE_ID.AsInteger,[]))then
  begin
    ShowMessage('Cliente não localizado! Informe o cliente');
    DBedtCLIENTE_ID1.SetFocus;
    Abort;
  end;
  DM.TBOrdemServico.Post;
  DM.TBOrdemServico.ApplyUpdates(0);
  modo_navegacao;
end;

procedure TfrmOrdemServico.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrdemServico.btnCancelarClick(Sender: TObject);
var
  lOrdemServicoCancelada: Integer;
begin
  DBMemoDESCRICAO_PROBLEMA.SetFocus;
  lOrdemServicoCancelada := DM.TBOrdemServicoID.AsInteger;

  if(FNovaOrdemServico)then
  begin
    DM.TBItemOrdem.First;
    while not(DM.TBItemOrdem.Eof)do
    begin
      DM.TBItemOrdem.Delete;
      DM.TBItemOrdem.ApplyUpdates(0);
    end;
  end;

  DM.TBOrdemServico.Cancel;

  if(FNovaOrdemServico)then
  begin
    if(DM.TBOrdemServico.Locate('ID',lOrdemServicoCancelada,[]))then
    begin
      DM.TBOrdemServico.Delete;
      DM.TBOrdemServico.ApplyUpdates(0);
    end;
  end;

  modo_navegacao;
end;

procedure TfrmOrdemServico.btnExcluirClick(Sender: TObject);
begin
  if(DM.TBOrdemServico.RecordCount = 0)then
    Abort;
    
  if(Application.MessageBox('Você realmente deseja excluir esta ordem de serviço?','Atenção',MB_ICONQUESTION + MB_YESNO)=mrYes)then
  begin
    if(FConexao = 'Zeos')then
    begin

    end else
    begin
      DM.TBItemOrdem.First;
      while not(DM.TBItemOrdem.Eof)do
      begin
        DM.TBItemOrdem.Delete;
        DM.TBItemOrdem.ApplyUpdates(0);
      end;
      DM.TBOrdemServico.Delete;
      DM.TBOrdemServico.ApplyUpdates(0);
    end;
  end;
end;

procedure TfrmOrdemServico.btnInserirItemClick(Sender: TObject);
begin
  FNovoItemOrdem := true;
  DM.TBItemOrdem.Insert;
  DM.TBItemOrdemORDEM_ID.AsInteger := DM.TBOrdemServicoID.AsInteger;
  frmItemOrdemEditar := TfrmItemOrdemEditar.Create(Self);
  frmItemOrdemEditar.ShowModal;
  AtualizarTotal();
end;

procedure TfrmOrdemServico.btnEditarItemClick(Sender: TObject);
begin
  FNovoItemOrdem := false;
  DM.TBItemOrdem.Edit;
  frmItemOrdemEditar := TfrmItemOrdemEditar.Create(Self);
  frmItemOrdemEditar.ShowModal;
  AtualizarTotal();
end;

procedure TfrmOrdemServico.btnExcluirItemClick(Sender: TObject);
begin
  if(Application.MessageBox('Você realmente deseja excluir este item da ordem de serviço?','Atenção',MB_ICONQUESTION + MB_YESNO)=mrYes)then
  begin
    if(FConexao = 'Zeos')then
    begin
      DM.TItemOrdem.Delete;
      DM.TItemOrdem.ApplyUpdates;
    end else
    begin
      DM.TBItemOrdem.Delete;
      DM.TBItemOrdem.ApplyUpdates(0);
    end;
    AtualizarTotal();
  end;
end;

procedure TfrmOrdemServico.AtualizarTotal();
begin
  if(btnEditar.Enabled)then
    btnEditar.Click;

  if(btnSalvar.Enabled)then
  begin
    if(FConexao = 'Zeos')then
    begin
      DM.QVerificar.Close;
      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('SELECT SUM(VALOR_UNITARIO * QUANTIDADE) AS SOMA ');
      DM.QVerificar.SQL.Add('FROM ITEM_ORDEM WHERE ORDEM_ID = :pOrdemServico ');
      DM.QVerificar.Params.ParamByName('pOrdemServico').AsInteger := DM.TBOrdemServicoID.AsInteger;
      DM.QVerificar.Open;
      DM.TOrdemServicoVALOR_TOTAL.AsFloat := DM.QVerificar.Fields.FieldByName('SOMA').AsFloat;
    end else
    begin
      DM.QueryVerificar.Close;
      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('SELECT SUM(VALOR_UNITARIO * QUANTIDADE) AS SOMA ');
      DM.QueryVerificar.SQL.Add('FROM ITEM_ORDEM WHERE ORDEM_ID = :pOrdemServico ');
      DM.QueryVerificar.Params.ParamByName('pOrdemServico').AsInteger := DM.TBOrdemServicoID.AsInteger;
      DM.QueryVerificar.Open;
      DM.TBOrdemServicoVALOR_TOTAL.AsFloat := DM.QueryVerificar.Fields.FieldByName('SOMA').AsFloat;
    end;
  end;
end;

end.
