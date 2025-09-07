unit uFiltroRelatorioOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, FMTBcd, DB,
  DBClient, Provider, SqlExpr, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ShellApi;

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
    QRelatorio: TSQLQuery;
    DSPRelatorio: TDataSetProvider;
    TBRelatorio: TClientDataSet;
    TBRelatorioID: TIntegerField;
    TBRelatorioDATA_ABERTURA: TDateField;
    TBRelatorioDATA_PREVISTA: TDateField;
    TBRelatorioDATA_FECHAMENTO: TDateField;
    TBRelatorioSTATUS: TStringField;
    TBRelatorioVALOR_TOTAL: TFMTBCDField;
    TBRelatorioNOME: TStringField;
    DSRelatorio: TDataSource;
    TBRelatorioCLIENTE_ID: TIntegerField;
    TBRelatorioDESCRICAO_PROBLEMA: TStringField;
    QRelatorioZeos: TZQuery;
    QRelatorioZeosID: TIntegerField;
    QRelatorioZeosCLIENTE_ID: TIntegerField;
    QRelatorioZeosDATA_ABERTURA: TDateField;
    QRelatorioZeosDATA_PREVISTA: TDateField;
    QRelatorioZeosDATA_FECHAMENTO: TDateField;
    QRelatorioZeosSTATUS: TStringField;
    QRelatorioZeosDESCRICAO_PROBLEMA: TStringField;
    QRelatorioZeosVALOR_TOTAL: TFloatField;
    QRelatorioZeosNOME: TStringField;
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
    procedure btnRelatorioQuickClick(Sender: TObject);
    procedure btnRelatorioCSVClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRelatorioOrdemServico: TfrmFiltroRelatorioOrdemServico;

implementation

uses uRelatorioOrdemServicoQuick, uDM, uMenu;

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

procedure TfrmFiltroRelatorioOrdemServico.btnRelatorioQuickClick(
  Sender: TObject);
var
  lIDClienteSelecionado: Integer;
begin
  lIDClienteSelecionado := 0;
  if(dblkcbbClientes.KeyValue <> null)then
    lIDClienteSelecionado := dblkcbbClientes.KeyValue;

  frmRelatorioOrdemServicoQuick := TfrmRelatorioOrdemServicoQuick.Create(Self);
  frmRelatorioOrdemServicoQuick.txtFiltro.Caption := 'Relatório de ordens de serviço com data de abertura de '+txtDataInicial.Text+' à '+txtDataFinal.Text;
  frmRelatorioOrdemServicoQuick.TBRelatorio.Close;
  frmRelatorioOrdemServicoQuick.QRelatorio.Close;
  frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Clear;
  frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('SELECT O.ID, O.DATA_ABERTURA, O.DATA_PREVISTA, ');
  frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('O.DATA_FECHAMENTO, O.STATUS, O.VALOR_TOTAL, C.NOME ');
  frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('FROM ORDEM_SERVICO O ');
  frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('LEFT JOIN CLIENTE C ON(O.CLIENTE_ID = C.ID) ');
  frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('WHERE O.DATA_ABERTURA >= :pDataInicial ');
  frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('AND O.DATA_ABERTURA <= :pDataFinal ');
  frmRelatorioOrdemServicoQuick.QRelatorio.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
  frmRelatorioOrdemServicoQuick.QRelatorio.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);
  if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
  begin
    frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('AND O.CLIENTE_ID = :pCliente ');
    frmRelatorioOrdemServicoQuick.QRelatorio.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;
    frmRelatorioOrdemServicoQuick.txtFiltro.Caption := frmRelatorioOrdemServicoQuick.txtFiltro.Caption + ', do cliente: '+dblkcbbClientes.Text;
  end;
  case rgOrdenamento.ItemIndex of
    0: frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('ORDER BY O.ID ');
    1: frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('ORDER BY O.DATA_ABERTURA ');
    2: frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('ORDER BY C.NOME ');
  end;
  frmRelatorioOrdemServicoQuick.QRelatorio.Open;
  frmRelatorioOrdemServicoQuick.TBRelatorio.Open;
  frmRelatorioOrdemServicoQuick.QuickRep1.Prepare;
  frmRelatorioOrdemServicoQuick.QuickRep1.Preview;
end;

procedure TfrmFiltroRelatorioOrdemServico.btnRelatorioCSVClick(
  Sender: TObject);
var
  SaveDialogCSV: TSaveDialog;
  lArquivoCSV: TStringList;
  lIDClienteSelecionado: Integer;
  lNomeArquivo: String;
begin
  lIDClienteSelecionado := 0;
  if(dblkcbbClientes.KeyValue <> null)then
    lIDClienteSelecionado := dblkcbbClientes.KeyValue;
    
  SaveDialogCSV := TSaveDialog.Create(Self);
  lArquivoCSV := TStringList.Create;
  try
    SaveDialogCSV.Filter := '*.csv|*.csv';
    SaveDialogCSV.Execute;
    if(SaveDialogCSV.FileName <> '')then
    begin
      lArquivoCSV.Add('ID;Cliente;Data Abertura;Data Prevista;Data Fechamento;Status;Valor');
      if(FConexao = 'Zeos')then
      begin
        DSRelatorio.DataSet := QRelatorioZeos;
        
        TBRelatorio.Close;
        QRelatorioZeos.Close;
        QRelatorioZeos.SQL.Clear;
        QRelatorioZeos.SQL.Add('SELECT O.*, C.NOME ');
        QRelatorioZeos.SQL.Add('FROM ORDEM_SERVICO O ');
        QRelatorioZeos.SQL.Add('LEFT JOIN CLIENTE C ON(O.CLIENTE_ID = C.ID) ');
        QRelatorioZeos.SQL.Add('WHERE O.DATA_ABERTURA >= :pDataInicial ');
        QRelatorioZeos.SQL.Add('AND O.DATA_ABERTURA <= :pDataFinal ');
        QRelatorioZeos.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
        QRelatorioZeos.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);
        if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
        begin
          QRelatorioZeos.SQL.Add('AND O.CLIENTE_ID = :pCliente ');
          QRelatorioZeos.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;
        end;
        case rgOrdenamento.ItemIndex of
          0: QRelatorioZeos.SQL.Add('ORDER BY O.ID ');
          1: QRelatorioZeos.SQL.Add('ORDER BY O.DATA_ABERTURA ');
          2: QRelatorioZeos.SQL.Add('ORDER BY C.NOME ');
        end;
        QRelatorioZeos.Open;
        TBRelatorio.Open; 
        TBRelatorio.First;
        while not(TBRelatorio.Eof)do
        begin
          lArquivoCSV.Add(TBRelatorioID.AsString+';'+TBRelatorioNOME.AsString+
          ';'+TBRelatorioDATA_ABERTURA.AsString+';'+TBRelatorioDATA_PREVISTA.AsString+';'+
          TBRelatorioDATA_FECHAMENTO.AsString+';'+TBRelatorioSTATUS.AsString+';'+
          TBRelatorioVALOR_TOTAL.AsString);

          TBRelatorio.Next;
        end;
      end else
      begin
        TBRelatorio.Close;
        QRelatorio.Close;
        QRelatorio.SQL.Clear;
        QRelatorio.SQL.Add('SELECT O.*, C.NOME ');
        QRelatorio.SQL.Add('FROM ORDEM_SERVICO O ');
        QRelatorio.SQL.Add('LEFT JOIN CLIENTE C ON(O.CLIENTE_ID = C.ID) ');
        QRelatorio.SQL.Add('WHERE O.DATA_ABERTURA >= :pDataInicial ');
        QRelatorio.SQL.Add('AND O.DATA_ABERTURA <= :pDataFinal ');
        QRelatorio.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
        QRelatorio.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);
        if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
        begin
          QRelatorio.SQL.Add('AND O.CLIENTE_ID = :pCliente ');
          QRelatorio.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;
        end;
        case rgOrdenamento.ItemIndex of
          0: QRelatorio.SQL.Add('ORDER BY O.ID ');
          1: QRelatorio.SQL.Add('ORDER BY O.DATA_ABERTURA ');
          2: QRelatorio.SQL.Add('ORDER BY C.NOME ');
        end;
        QRelatorio.Open;
        TBRelatorio.Open; 
        TBRelatorio.First;
        while not(TBRelatorio.Eof)do
        begin
          lArquivoCSV.Add(TBRelatorioID.AsString+';'+TBRelatorioNOME.AsString+
          ';'+TBRelatorioDATA_ABERTURA.AsString+';'+TBRelatorioDATA_PREVISTA.AsString+';'+
          TBRelatorioDATA_FECHAMENTO.AsString+';'+TBRelatorioSTATUS.AsString+';'+
          TBRelatorioVALOR_TOTAL.AsString);

          TBRelatorio.Next;
        end;
      end;
      lNomeArquivo := SaveDialogCSV.FileName;
      if(LowerCase(Copy(lNomeArquivo,length(lNomeArquivo)-4,4)) <> '.csv')then
      begin
        lNomeArquivo := lNomeArquivo + '.csv';
      end;
      lArquivoCSV.SaveToFile(lNomeArquivo);
      ShellExecute(handle, 'open', PChar(lNomeArquivo), NiL, NiL, SW_SHOWNORMAL);
    end;
  finally
    SaveDialogCSV.Free;
    lArquivoCSV.Free;
  end;
end;

end.
