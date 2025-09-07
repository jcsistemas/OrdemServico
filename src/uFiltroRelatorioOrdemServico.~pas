unit uFiltroRelatorioOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, FMTBcd, DB,
  DBClient, Provider, SqlExpr, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ShellApi, ComObj, frxClass, frxDBSet, frxExportPDF;

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
    frxReport1: TfrxReport;
    frxDBDatasetListagem: TfrxDBDataset;
    frxDBDatasetTotalizador: TfrxDBDataset;
    QTotalizadorZeos: TZQuery;
    QTotalizadorZeosSOMA: TFloatField;
    QTotalizador: TSQLQuery;
    QTotalizadorSOMA: TFMTBCDField;
    QTotalizadorQUANTIDADE: TIntegerField;
    QTotalizadorZeosQUANTIDADE: TIntegerField;
    TBDescricao: TClientDataSet;
    TBDescricaoDESCRICAO_RELATORIO: TStringField;
    frxDBDatasetCabecalho: TfrxDBDataset;
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
    procedure btnRelatorioXLSClick(Sender: TObject);
    procedure btnRelatorioFastClick(Sender: TObject);
    procedure btnRelatorioPDFClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarDadosRelatorio();
    procedure CarregarDadosTotalizador();
    procedure ExportarParaPDF();
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
  if(FConexao = 'Zeos')then
  begin
    frmRelatorioOrdemServicoQuick.DSRelatorio.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QuickRep1.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRDBText1.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRDBText2.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRDBText3.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRDBText4.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRDBText5.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRDBText6.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRDBText7.DataSet := frmRelatorioOrdemServicoQuick.QRelatorioZeos;
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.Close;
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Clear;
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('SELECT O.ID, O.DATA_ABERTURA, O.DATA_PREVISTA, ');
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('O.DATA_FECHAMENTO, O.STATUS, O.VALOR_TOTAL, C.NOME ');
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('FROM ORDEM_SERVICO O ');
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('INNER JOIN CLIENTE C ON(O.CLIENTE_ID = C.ID) ');
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('WHERE O.DATA_ABERTURA >= :pDataInicial ');
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('AND O.DATA_ABERTURA <= :pDataFinal ');
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);
    if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
    begin
      frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('AND O.CLIENTE_ID = :pCliente ');
      frmRelatorioOrdemServicoQuick.QRelatorioZeos.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;
      frmRelatorioOrdemServicoQuick.txtFiltro.Caption := frmRelatorioOrdemServicoQuick.txtFiltro.Caption + ', do cliente: '+dblkcbbClientes.Text;
    end;
    case rgOrdenamento.ItemIndex of
      0: frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('ORDER BY O.ID ');
      1: frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('ORDER BY O.DATA_ABERTURA ');
      2: frmRelatorioOrdemServicoQuick.QRelatorioZeos.SQL.Add('ORDER BY C.NOME ');
    end;
    frmRelatorioOrdemServicoQuick.QRelatorioZeos.Open;
  end else
  begin
    frmRelatorioOrdemServicoQuick.TBRelatorio.Close;
    frmRelatorioOrdemServicoQuick.QRelatorio.Close;
    frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Clear;
    frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('SELECT O.ID, O.DATA_ABERTURA, O.DATA_PREVISTA, ');
    frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('O.DATA_FECHAMENTO, O.STATUS, O.VALOR_TOTAL, C.NOME ');
    frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('FROM ORDEM_SERVICO O ');
    frmRelatorioOrdemServicoQuick.QRelatorio.SQL.Add('INNER JOIN CLIENTE C ON(O.CLIENTE_ID = C.ID) ');
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
  end;
  frmRelatorioOrdemServicoQuick.QuickRep1.Prepare;
  frmRelatorioOrdemServicoQuick.QuickRep1.Preview;
end;

procedure TfrmFiltroRelatorioOrdemServico.btnRelatorioCSVClick(
  Sender: TObject);
var
  SaveDialogCSV: TSaveDialog;
  lArquivoCSV: TStringList;
  lNomeArquivo: String;
  lSomaTotal: Double;
  lQuantidadeTotal: Integer;
begin            
  SaveDialogCSV := TSaveDialog.Create(Self);
  lArquivoCSV := TStringList.Create;
  try
    SaveDialogCSV.Filter := '*.csv|*.csv';
    SaveDialogCSV.Execute;
    if(SaveDialogCSV.FileName <> '')then
    begin
      lArquivoCSV.Add('ID;Cliente;Data Abertura;Data Prevista;Data Fechamento;Status;Valor');

      CarregarDadosRelatorio;
      
      if(FConexao = 'Zeos')then
      begin
        lQuantidadeTotal := 0;
        lSomaTotal := 0;
        QRelatorioZeos.First;
        while not(QRelatorioZeos.Eof)do
        begin
          lQuantidadeTotal := lQuantidadeTotal + 1;
          lSomaTotal := lSomaTotal + QRelatorioZeosVALOR_TOTAL.AsFloat;
          
          lArquivoCSV.Add(QRelatorioZeosID.AsString+';'+QRelatorioZeosNOME.AsString+
          ';'+QRelatorioZeosDATA_ABERTURA.AsString+';'+QRelatorioZeosDATA_PREVISTA.AsString+';'+
          QRelatorioZeosDATA_FECHAMENTO.AsString+';'+QRelatorioZeosSTATUS.AsString+';'+
          QRelatorioZeosVALOR_TOTAL.AsString);

          QRelatorioZeos.Next;
        end;
        lArquivoCSV.Add(';;;;;;');
        lArquivoCSV.Add(';;;;;Soma Total;'+FloatToStr(lSomaTotal));
        lArquivoCSV.Add(';;;;;Quantidade Total;'+FloatToStr(lQuantidadeTotal));
      end else
      begin
        lQuantidadeTotal := 0;
        lSomaTotal := 0;
        TBRelatorio.First;
        while not(TBRelatorio.Eof)do
        begin
          lQuantidadeTotal := lQuantidadeTotal + 1;
          lSomaTotal := lSomaTotal + TBRelatorioVALOR_TOTAL.AsFloat;
          
          lArquivoCSV.Add(TBRelatorioID.AsString+';'+TBRelatorioNOME.AsString+
          ';'+TBRelatorioDATA_ABERTURA.AsString+';'+TBRelatorioDATA_PREVISTA.AsString+';'+
          TBRelatorioDATA_FECHAMENTO.AsString+';'+TBRelatorioSTATUS.AsString+';'+
          TBRelatorioVALOR_TOTAL.AsString);

          TBRelatorio.Next;
        end;
        lArquivoCSV.Add(';;;;;;');
        lArquivoCSV.Add(';;;;;Soma Total;'+FloatToStr(lSomaTotal));
        lArquivoCSV.Add(';;;;;Quantidade Total;'+FloatToStr(lQuantidadeTotal));
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

procedure TfrmFiltroRelatorioOrdemServico.btnRelatorioXLSClick(
  Sender: TObject);
const lTitulo = 'Relatório Ordens de Serviço';
var
  objExcel, Sheet: Variant;
  lIDClienteSelecionado, i: Integer;
  x_cor_fundo, y_cor_fundo, z_cor_fundo: Integer;
  x_cor_fonte, y_cor_fonte, z_cor_fonte: Integer;
  lCorBranca: Boolean;
begin
  lIDClienteSelecionado := 0;
  if(dblkcbbClientes.KeyValue <> null)then
    lIDClienteSelecionado := dblkcbbClientes.KeyValue;
    
  CarregarDadosRelatorio;

  x_cor_fundo := 255;
  y_cor_fundo := 255;
  z_cor_fundo := 225;
  x_cor_fonte := 105;
  y_cor_fonte := 105;
  z_cor_fonte := 105;

  objExcel := CreateOleObject('Excel.Application');
  objExcel.Visible := True;
  objExcel.Caption := lTitulo;

  objExcel.Workbooks.Add;
  objExcel.Workbooks[1].Sheets.Add;
  objExcel.Workbooks[1].WorkSheets[1].Name := lTitulo;
  Sheet := objExcel.Workbooks[1].WorkSheets[lTitulo];

  Sheet.Range['B1'] := 'Ordens de Serviço';
  Sheet.Range['D1'] := 'Período de ';
  Sheet.Range['E1'] := txtDataInicial.Text;
  Sheet.Range['F1'] := ' à ';
  Sheet.Range['G1'] := txtDataFinal.Text;
  if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
  begin
    Sheet.Range['H1'] := 'Cliente: '+dblkcbbClientes.Text;
  end else
  begin
    Sheet.Range['H1'] := 'Referente à Todos os clientes';
  end;

  Sheet.Range['A1'].font.name := 'Calibri';
  Sheet.Range['A1'].font.size := 12;
  Sheet.Range['A1'].font.bold := true;
  Sheet.Range['A1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['A1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['A1'].ColumnWidth := 10;
  Sheet.Range['A1'].RowHeight := 10;

  Sheet.Range['B1'].font.name := 'Calibri';
  Sheet.Range['B1'].font.size := 12;
  Sheet.Range['B1'].font.bold := true;
  Sheet.Range['B1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['B1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['B1'].ColumnWidth := 50;
  Sheet.Range['B1'].RowHeight := 10;

  Sheet.Range['C1'].font.name := 'Calibri';
  Sheet.Range['C1'].font.size := 12;
  Sheet.Range['C1'].font.bold := true;
  Sheet.Range['C1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['C1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['C1'].ColumnWidth := 20;
  Sheet.Range['C1'].RowHeight := 10;

  Sheet.Range['D1'].font.name := 'Calibri';
  Sheet.Range['D1'].font.size := 12;
  Sheet.Range['D1'].font.bold := true;
  Sheet.Range['D1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['D1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['D1'].ColumnWidth := 20;
  Sheet.Range['D1'].RowHeight := 10;

  Sheet.Range['E1'].font.name := 'Calibri';
  Sheet.Range['E1'].font.size := 12;
  Sheet.Range['E1'].font.bold := true;
  Sheet.Range['E1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['E1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['E1'].ColumnWidth := 20;
  Sheet.Range['E1'].RowHeight := 10;

  Sheet.Range['F1'].font.name := 'Calibri';
  Sheet.Range['F1'].font.size := 12;
  Sheet.Range['F1'].font.bold := true;
  Sheet.Range['F1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['F1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['F1'].ColumnWidth := 20;
  Sheet.Range['F1'].RowHeight := 10;

  Sheet.Range['G1'].font.name := 'Calibri';
  Sheet.Range['G1'].font.size := 12;
  Sheet.Range['G1'].font.bold := true;
  Sheet.Range['G1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['G1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['G1'].ColumnWidth := 30;
  Sheet.Range['G1'].RowHeight := 10;

  Sheet.Range['H1'].font.name := 'Calibri';
  Sheet.Range['H1'].font.size := 12;
  Sheet.Range['H1'].font.bold := true;
  Sheet.Range['H1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['H1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['H1'].ColumnWidth := 50;
  Sheet.Range['H1'].RowHeight := 10;

  Sheet.Range['I1'].font.name := 'Calibri';
  Sheet.Range['I1'].font.size := 12;
  Sheet.Range['I1'].font.bold := true;
  Sheet.Range['I1'].font.color := RGB(x_cor_fonte,y_cor_fonte,z_cor_fonte);
  Sheet.Range['I1'].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);
  Sheet.Range['I1'].ColumnWidth := 50;
  Sheet.Range['I1'].RowHeight := 10;

  Sheet.Range['A1'].VerticalAlignment := 2;
  Sheet.Range['B1'].VerticalAlignment := 2;
  Sheet.Range['C1'].VerticalAlignment := 2;
  Sheet.Range['D1'].VerticalAlignment := 2;
  Sheet.Range['E1'].VerticalAlignment := 2;
  Sheet.Range['F1'].VerticalAlignment := 2;
  Sheet.Range['G1'].VerticalAlignment := 2;
  Sheet.Range['H1'].VerticalAlignment := 2;
  Sheet.Range['I1'].VerticalAlignment := 2;

  Sheet.Range['A1'].HorizontalAlignment := 3;
  Sheet.Range['B1'].HorizontalAlignment := 3;
  Sheet.Range['C1'].HorizontalAlignment := 3;
  Sheet.Range['D1'].HorizontalAlignment := 3;
  Sheet.Range['E1'].HorizontalAlignment := 3;
  Sheet.Range['F1'].HorizontalAlignment := 3;
  Sheet.Range['G1'].HorizontalAlignment := 3;
  Sheet.Range['H1'].HorizontalAlignment := 3;
  Sheet.Range['I1'].HorizontalAlignment := 3;

  Sheet.Range['A3'] := 'ID';
  Sheet.Range['B3'] := 'Cliente';
  Sheet.Range['C3'] := 'Data Abertura';
  Sheet.Range['D3'] := 'Data Prevista';
  Sheet.Range['E3'] := 'Data Fechamento';
  Sheet.Range['F3'] := 'Status';
  Sheet.Range['G3'] := 'Valor Total';

  Sheet.Range['A3','I3'].font.name := 'Calibri';
  Sheet.Range['A3','I3'].font.size := 10;
  Sheet.Range['A3','I3'].font.bold := true;
  Sheet.Range['A3','I3'].font.color := RGB(0,0,0);
  Sheet.Range['A3','I3'].Interior.Color := RGB(255,255,255);

  i := 4;
  lCorBranca := true;
  if(FConexao = 'Zeos')then
  begin
    QRelatorioZeos.First;
    while not(QRelatorioZeos.Eof)do
    begin
      Sheet.Cells[i,1] := QRelatorioZeosID.AsString;
      Sheet.Cells[i,2] := QRelatorioZeosNOME.AsString;
      Sheet.Cells[i,3] := QRelatorioZeosDATA_ABERTURA.AsString;
      Sheet.Cells[i,4] := QRelatorioZeosDATA_PREVISTA.AsString;
      Sheet.Cells[i,5] := QRelatorioZeosDATA_FECHAMENTO.AsString;
      Sheet.Cells[i,6] := QRelatorioZeosSTATUS.AsString;
      Sheet.Cells[i,7].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
      Sheet.Cells[i,7] := QRelatorioZeosVALOR_TOTAL.AsFloat;
      if(lCorBranca = true)then
      begin
         lCorBranca := false;

         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.name := 'Calibri';
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.size := 10;
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.color := RGB(0,0,0);
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].Interior.Color := RGB(255,255,255);
      end else
      begin
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.name := 'Calibri';
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.size := 10;
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.color := RGB(0,0,0);
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);

         lCorBranca := true;
      end;

      i := i + 1;
      QRelatorioZeos.Next;
    end;
  end else
  begin
    TBRelatorio.First;
    while not(TBRelatorio.Eof)do
    begin
      Sheet.Cells[i,1] := TBRelatorioID.AsString;
      Sheet.Cells[i,2] := TBRelatorioNOME.AsString;
      Sheet.Cells[i,3] := TBRelatorioDATA_ABERTURA.AsString;
      Sheet.Cells[i,4] := TBRelatorioDATA_PREVISTA.AsString;
      Sheet.Cells[i,5] := TBRelatorioDATA_FECHAMENTO.AsString;
      Sheet.Cells[i,6] := TBRelatorioSTATUS.AsString;
      Sheet.Cells[i,7].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
      Sheet.Cells[i,7] := TBRelatorioVALOR_TOTAL.AsFloat;
      if(lCorBranca = true)then
      begin
         lCorBranca := false;

         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.name := 'Calibri';
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.size := 10;
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.color := RGB(0,0,0);
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].Interior.Color := RGB(255,255,255);
      end else
      begin
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.name := 'Calibri';
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.size := 10;
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].font.color := RGB(0,0,0);
         Sheet.Range['A'+IntToStr(i),'I'+IntToStr(i)].Interior.Color := RGB(x_cor_fundo,y_cor_fundo,z_cor_fundo);

         lCorBranca := true;
      end;

      i := i + 1;
      TBRelatorio.Next;
    end;
  end;

  i := i + 1;

  Sheet.Cells[i,4] := 'Quantidade Total: ';
  Sheet.Range['D'+IntToStr(i)].RowHeight := 20;
  Sheet.Range['D'+IntToStr(i)].font.name := 'Calibri';
  Sheet.Range['D'+IntToStr(i)].font.size := 12;
  Sheet.Range['D'+IntToStr(i)].font.bold := true;
  Sheet.Range['D'+IntToStr(i)].font.color := RGB(0,0,0);
  Sheet.Range['D'+IntToStr(i)].Interior.Color := RGB(255,255,255);

  Sheet.Range['E'+IntToStr(i)].font.name := 'Calibri';
  Sheet.Range['E'+IntToStr(i)].font.size := 12;
  Sheet.Range['E'+IntToStr(i)].font.bold := true;
  Sheet.Range['E'+IntToStr(i)].font.color := RGB(0,0,0);
  Sheet.Range['E'+IntToStr(i)].Interior.Color := RGB(255,255,255);
  Sheet.Cells[i,5] := i-5;

  Sheet.Cells[i,6] := 'Soma Total: ';
  Sheet.Range['F'+IntToStr(i)].RowHeight := 20;
  Sheet.Range['F'+IntToStr(i)].font.name := 'Calibri';
  Sheet.Range['F'+IntToStr(i)].font.size := 12;
  Sheet.Range['F'+IntToStr(i)].font.bold := true;
  Sheet.Range['F'+IntToStr(i)].font.color := RGB(0,0,0);
  Sheet.Range['F'+IntToStr(i)].Interior.Color := RGB(255,255,255);

  Sheet.Range['G'+IntToStr(i)].font.name := 'Calibri';
  Sheet.Range['G'+IntToStr(i)].font.size := 12;
  Sheet.Range['G'+IntToStr(i)].font.bold := true;
  Sheet.Range['G'+IntToStr(i)].font.color := RGB(0,0,0);
  Sheet.Range['G'+IntToStr(i)].Interior.Color := RGB(255,255,255);

  Sheet.Cells[i,7].formula := '=SUM(G4:G'+IntToStr(i-1)+')';

  Sheet.Range['A2','A'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['B2','B'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['C2','C'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['D2','D'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['E2','E'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['F2','F'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['G2','G'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['H2','H'+IntToStr(i)].HorizontalAlignment := 3;
  Sheet.Range['I2','I'+IntToStr(i)].HorizontalAlignment := 3;
end;

procedure TfrmFiltroRelatorioOrdemServico.CarregarDadosRelatorio();
var
  lIDClienteSelecionado: Integer;
  lCabecalhoRelatorio: String;
begin
  lCabecalhoRelatorio := '';
  lIDClienteSelecionado := 0;
  if(dblkcbbClientes.KeyValue <> null)then
    lIDClienteSelecionado := dblkcbbClientes.KeyValue;

  lCabecalhoRelatorio := 'Relatório de ordens de serviço com data de abertura no período de '+
    txtDataInicial.Text + ' à ' + txtDataFinal.Text;
    
  if(FConexao = 'Zeos')then
  begin
    QRelatorioZeos.Close;
    QRelatorioZeos.SQL.Clear;
    QRelatorioZeos.SQL.Add('SELECT O.*, C.NOME ');
    QRelatorioZeos.SQL.Add('FROM ORDEM_SERVICO O ');
    QRelatorioZeos.SQL.Add('INNER JOIN CLIENTE C ON(O.CLIENTE_ID = C.ID) ');
    QRelatorioZeos.SQL.Add('WHERE O.DATA_ABERTURA >= :pDataInicial ');
    QRelatorioZeos.SQL.Add('AND O.DATA_ABERTURA <= :pDataFinal ');
    QRelatorioZeos.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
    QRelatorioZeos.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);
    if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
    begin
      QRelatorioZeos.SQL.Add('AND O.CLIENTE_ID = :pCliente ');
      QRelatorioZeos.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;
      lCabecalhoRelatorio := lCabecalhoRelatorio + ', referentes ao cliente: '+dblkcbbClientes.Text+'.';
    end else
    begin
      lCabecalhoRelatorio := lCabecalhoRelatorio + ', de todos os clientes.';
    end;
    case rgOrdenamento.ItemIndex of
      0: QRelatorioZeos.SQL.Add('ORDER BY O.ID ');
      1: QRelatorioZeos.SQL.Add('ORDER BY O.DATA_ABERTURA ');
      2: QRelatorioZeos.SQL.Add('ORDER BY C.NOME ');
    end;
    QRelatorioZeos.Open;
  end else
  begin
    TBRelatorio.Close;
    QRelatorio.Close;
    QRelatorio.SQL.Clear;
    QRelatorio.SQL.Add('SELECT O.*, C.NOME ');
    QRelatorio.SQL.Add('FROM ORDEM_SERVICO O ');
    QRelatorio.SQL.Add('INNER JOIN CLIENTE C ON(O.CLIENTE_ID = C.ID) ');
    QRelatorio.SQL.Add('WHERE O.DATA_ABERTURA >= :pDataInicial ');
    QRelatorio.SQL.Add('AND O.DATA_ABERTURA <= :pDataFinal ');
    QRelatorio.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
    QRelatorio.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);
    if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
    begin
      QRelatorio.SQL.Add('AND O.CLIENTE_ID = :pCliente ');
      QRelatorio.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;
      lCabecalhoRelatorio := lCabecalhoRelatorio + ', referentes ao cliente: '+dblkcbbClientes.Text+'.';
    end else
    begin
      lCabecalhoRelatorio := lCabecalhoRelatorio + ', de todos os clientes.';
    end;
    case rgOrdenamento.ItemIndex of
      0: QRelatorio.SQL.Add('ORDER BY O.ID ');
      1: QRelatorio.SQL.Add('ORDER BY O.DATA_ABERTURA ');
      2: QRelatorio.SQL.Add('ORDER BY C.NOME ');
    end;
    QRelatorio.Open;
    TBRelatorio.Open;
  end;

  TBDescricao.Open;
  while not(TBDescricao.Eof)do
    TBDescricao.Delete;

  TBDescricao.Append;
  TBDescricaoDESCRICAO_RELATORIO.Value := lCabecalhoRelatorio;
  TBDescricao.Post;
end;

procedure TfrmFiltroRelatorioOrdemServico.btnRelatorioFastClick(
  Sender: TObject);
begin
  if not (FileExists(FLocalAplicacao+'frRelatorioOrdemServico.fr3'))then
  begin
    ShowMessage('Arquivo do relatório(frRelatorioOrdemServico.fr3) não encontrado!');
    Abort;
  end;

  CarregarDadosTotalizador();
  CarregarDadosRelatorio();
  if(FConexao = 'Zeos')then
  begin
    frxDBDatasetListagem.DataSet := QRelatorioZeos;
    frxDBDatasetTotalizador.DataSet := QTotalizadorZeos;
  end else
  begin
    frxDBDatasetListagem.DataSet := TBRelatorio;
    frxDBDatasetTotalizador.DataSet := QTotalizador;
  end;

  frxReport1.LoadFromFile(FLocalAplicacao+'frRelatorioOrdemServico.fr3');

  frxReport1.PrepareReport;
  frxReport1.ShowReport;
end;

procedure TfrmFiltroRelatorioOrdemServico.CarregarDadosTotalizador();
var
  lIDClienteSelecionado: Integer;
begin
  lIDClienteSelecionado := 0;
  if(dblkcbbClientes.KeyValue <> null)then
    lIDClienteSelecionado := dblkcbbClientes.KeyValue;

  if(FConexao = 'Zeos')then
  begin
    QTotalizadorZeos.Close;
    QTotalizadorZeos.SQL.Clear;
    QTotalizadorZeos.SQL.Add('SELECT SUM(VALOR_TOTAL) AS SOMA, COUNT(*) AS QUANTIDADE FROM ORDEM_SERVICO ');
    QTotalizadorZeos.SQL.Add('WHERE ORDEM_SERVICO.DATA_ABERTURA >= :pDataInicial ');
    QTotalizadorZeos.SQL.Add('AND ORDEM_SERVICO.DATA_ABERTURA <= :pDataFinal ');

    if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
      QTotalizadorZeos.SQL.Add('AND ORDEM_SERVICO.CLIENTE_ID = :pCliente ');

    QTotalizadorZeos.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
    QTotalizadorZeos.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);

    if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
      QTotalizadorZeos.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;

    QTotalizadorZeos.Open;
  end else
  begin
    QTotalizador.Close;
    QTotalizador.SQL.Clear;
    QTotalizador.SQL.Add('SELECT SUM(VALOR_TOTAL) AS SOMA, COUNT(*) AS QUANTIDADE FROM ORDEM_SERVICO ');
    QTotalizador.SQL.Add('WHERE ORDEM_SERVICO.DATA_ABERTURA >= :pDataInicial ');
    QTotalizador.SQL.Add('AND ORDEM_SERVICO.DATA_ABERTURA <= :pDataFinal ');

    if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
      QTotalizador.SQL.Add('AND ORDEM_SERVICO.CLIENTE_ID = :pCliente ');

    QTotalizador.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(txtDataInicial.Text);
    QTotalizador.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(txtDataFinal.Text);

    if(CheckCliente.Checked = false)and(lIDClienteSelecionado > 0)then
      QTotalizador.Params.ParamByName('pCliente').AsInteger := lIDClienteSelecionado;

    QTotalizador.Open;
  end;
end;

procedure TfrmFiltroRelatorioOrdemServico.ExportarParaPDF();
var
  ExportPDF: TfrxPDFExport;
  SaveDialogPDF: TSaveDialog;
  lNomeArquivo: String;
begin
  frxReport1.PrepareReport;
  
  ExportPDF := TfrxPDFExport.Create(nil);
  SaveDialogPDF := TSaveDialog.Create(Self);
  try
    SaveDialogPDF.Filter := '*.pdf|*.pdf';
    SaveDialogPDF.Execute;
    if(SaveDialogPDF.FileName <> '')then
    begin
      if(LowerCase(Copy(SaveDialogPDF.FileName,Length(SaveDialogPDF.FileName)-4,4))='.pdf')then
        lNomeArquivo := SaveDialogPDF.FileName
      else
        lNomeArquivo := SaveDialogPDF.FileName + '.pdf';

      ExportPDF.FileName := lNomeArquivo;
      ExportPDF.ShowDialog := false;
      ExportPDF.ShowProgress := true;
      ExportPDF.OverwritePrompt := true;
      frxReport1.Export(ExportPDF);

      ShellExecute(handle, 'open', PChar(lNomeArquivo), NiL, NiL, SW_SHOWNORMAL);
    end;
  finally
    ExportPDF.Free;
    SaveDialogPDF.Free;
  end;
end;

procedure TfrmFiltroRelatorioOrdemServico.btnRelatorioPDFClick(
  Sender: TObject);
begin
  if not (FileExists(FLocalAplicacao+'frRelatorioOrdemServico.fr3'))then
  begin
    ShowMessage('Arquivo do relatório(frRelatorioOrdemServico.fr3) não encontrado!');
    Abort;
  end;

  CarregarDadosTotalizador();
  CarregarDadosRelatorio();
  if(FConexao = 'Zeos')then
  begin
    frxDBDatasetListagem.DataSet := QRelatorioZeos;
    frxDBDatasetTotalizador.DataSet := QTotalizadorZeos;
  end else
  begin
    frxDBDatasetListagem.DataSet := TBRelatorio;
    frxDBDatasetTotalizador.DataSet := QTotalizador;
  end;

  frxReport1.LoadFromFile(FLocalAplicacao+'frRelatorioOrdemServico.fr3');
  ExportarParaPDF();
end;

end.
