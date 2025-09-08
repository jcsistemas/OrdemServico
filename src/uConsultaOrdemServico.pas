unit uConsultaOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids,
  DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, ZAbstractConnection, ZConnection, Menus;

type
  TfrmConsultaOrdemServico = class(TForm)
    Panel1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnAtualizar: TSpeedButton;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Panel7: TPanel;
    btnSair: TSpeedButton;
    lbl3: TLabel;
    DBGrid1: TDBGrid;
    lblValorTotal: TLabel;
    lblQuantidadeListada: TLabel;
    PopUp1: TPopupMenu;
    A1: TMenuItem;
    S1: TMenuItem;
    edtBusca: TEdit;
    lbl4: TLabel;
    cbbStatus: TComboBox;
    lbl5: TLabel;
    edtValorInicial: TEdit;
    edtValorFinal: TEdit;
    lbl6: TLabel;
    DSConsulta: TDataSource;
    QConsultaZeos: TZQuery;
    QConsulta: TSQLQuery;
    DSPConsulta: TDataSetProvider;
    TBConsulta: TClientDataSet;
    rgOrdenar: TRadioGroup;
    TBConsultaID: TIntegerField;
    TBConsultaCLIENTE_ID: TIntegerField;
    TBConsultaDATA_ABERTURA: TDateField;
    TBConsultaDATA_PREVISTA: TDateField;
    TBConsultaDATA_FECHAMENTO: TDateField;
    TBConsultaSTATUS: TStringField;
    TBConsultaDESCRICAO_PROBLEMA: TStringField;
    TBConsultaVALOR_TOTAL: TFMTBCDField;
    TBConsultaNOME: TStringField;
    QConsultaZeosID: TIntegerField;
    QConsultaZeosCLIENTE_ID: TIntegerField;
    QConsultaZeosDATA_ABERTURA: TDateField;
    QConsultaZeosDATA_PREVISTA: TDateField;
    QConsultaZeosDATA_FECHAMENTO: TDateField;
    QConsultaZeosSTATUS: TStringField;
    QConsultaZeosDESCRICAO_PROBLEMA: TStringField;
    QConsultaZeosVALOR_TOTAL: TFloatField;
    QConsultaZeosNOME: TStringField;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkcbbClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataInicialKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbbClientesKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataInicialExit(Sender: TObject);
    procedure edtDataFinalExit(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure edtDataInicialEnter(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure A1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtBuscaEnter(Sender: TObject);
    procedure cbbStatusEnter(Sender: TObject);
    procedure edtValorInicialEnter(Sender: TObject);
    procedure edtValorFinalEnter(Sender: TObject);
    procedure edtBuscaExit(Sender: TObject);
    procedure cbbStatusExit(Sender: TObject);
    procedure edtValorInicialExit(Sender: TObject);
    procedure edtValorFinalExit(Sender: TObject);
    procedure edtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbStatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgOrdenarClick(Sender: TObject);
    procedure cbbStatusChange(Sender: TObject);
  private
    { Private declarations }
    function ObterValorTotal(var pSQL: TStringList): String;
  public
    { Public declarations }
  end;

var
  frmConsultaOrdemServico: TfrmConsultaOrdemServico;

implementation

uses uMenu, uDM, uOrdemServico;

{$R *.dfm}

procedure TfrmConsultaOrdemServico.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaOrdemServico.FormShow(Sender: TObject);
begin
  btnAtualizar.Click;
  edtDataInicial.SetFocus;
end;

procedure TfrmConsultaOrdemServico.edtDataInicialKeyDown(Sender: TObject;
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

procedure TfrmConsultaOrdemServico.dblkcbbClientesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key = vk_return)then
  begin
    if(btnAtualizar.Enabled)then
      btnAtualizar.Click;

    DBGrid1.SetFocus;
  end;
end;

procedure TfrmConsultaOrdemServico.edtDataInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if(key = #13)then
    key := #0;
end;

procedure TfrmConsultaOrdemServico.dblkcbbClientesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if(key = #13)then
    key := #0;
end;

procedure TfrmConsultaOrdemServico.edtDataInicialExit(Sender: TObject);
begin
  edtDataInicial.Color := clWhite;
  btnAtualizar.Click;
end;

procedure TfrmConsultaOrdemServico.edtDataFinalExit(Sender: TObject);
begin
  edtDataFinal.Color := clWhite;
  btnAtualizar.Click;
end;

procedure TfrmConsultaOrdemServico.edtDataFinalEnter(Sender: TObject);
begin
  edtDataFinal.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.edtDataInicialEnter(Sender: TObject);
begin
  edtDataInicial.Color := clInfoBk;
end;  

procedure TfrmConsultaOrdemServico.btnAtualizarClick(Sender: TObject);
var
  lSQL: TStringList;
begin
  lSQL := TStringList.Create;
  try
    lSQL.Add('SELECT O.*, C.NOME FROM ORDEM_SERVICO O');
    lSQL.Add('INNER JOIN CLIENTE C ON(C.ID = O.CLIENTE_ID) ');
    lSQL.Add('WHERE O.DATA_ABERTURA >= :pDataInicial AND O.DATA_ABERTURA <= :pDataFinal ');

    if(edtBusca.Text <> '')then
      lSQL.Add('AND LOWER(C.NOME) LIKE :pCliente ');

    if(cbbStatus.ItemIndex > 0)then
      lSQL.Add('AND O.STATUS = :pStatus ');

    lSQL.Add('AND O.VALOR_TOTAL >= :pValorInicial AND O.VALOR_TOTAL <= :pValorFinal ');

    case rgOrdenar.ItemIndex of
      0: lSQL.Add('ORDER BY O.ID');
      1: lSQL.Add('ORDER BY C.NOME');
      2: lSQL.Add('ORDER BY O.STATUS');
      3: lSQL.Add('ORDER BY O.VALOR_TOTAL');
      4: lSQL.Add('ORDER BY O.VALOR_TOTAL DESC');
    end;

    if(FConexao = 'Zeos')then
    begin
      try
        DSConsulta.DataSet := QConsultaZeos;
        QConsultaZeos.Close;
        QConsultaZeos.SQL.Clear;
        QConsultaZeos.SQL := lSQL;
        QConsultaZeos.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(edtDataInicial.Text);
        QConsultaZeos.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(edtDataFinal.Text);

        if(edtBusca.Text <> '')then
          QConsultaZeos.Params.ParamByName('pCliente').AsString := '%'+AnsiLowerCase(edtBusca.Text)+'%';

        if(cbbStatus.ItemIndex > 0)then
          QConsultaZeos.Params.ParamByName('pStatus').AsString := cbbStatus.Text;

        QConsultaZeos.Params.ParamByName('pValorInicial').AsFloat := StrToFloat('0'+edtValorInicial.Text);
        QConsultaZeos.Params.ParamByName('pValorFinal').AsFloat := StrToFloat('0'+edtValorFinal.Text);  
        QConsultaZeos.Open;
      except
        on E: Exception do
        begin
          ShowMessage('Erro: '+E.Message);
        end;
      end;
      lblQuantidadeListada.Caption := IntToStr(QConsultaZeos.RecordCount);
    end else
    begin
      try
        DSConsulta.DataSet := TBConsulta;
        TBConsulta.Close;
        QConsulta.Close;
        QConsulta.SQL.Clear;
        QConsulta.SQL := lSQL;
        QConsulta.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(edtDataInicial.Text);
        QConsulta.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(edtDataFinal.Text);

        if(edtBusca.Text <> '')then
          QConsulta.Params.ParamByName('pCliente').AsString := '%'+AnsiLowerCase(edtBusca.Text)+'%';

        if(cbbStatus.ItemIndex > 0)then
          QConsulta.Params.ParamByName('pStatus').AsString := cbbStatus.Text;

        QConsulta.Params.ParamByName('pValorInicial').AsFloat := StrToFloat('0'+edtValorInicial.Text);
        QConsulta.Params.ParamByName('pValorFinal').AsFloat := StrToFloat('0'+edtValorFinal.Text);  
        QConsulta.Open;
        TBConsulta.Open;
      except
        on E: Exception do
        begin
          ShowMessage('Erro: '+E.Message);
        end;
      end;
      lblQuantidadeListada.Caption := IntToStr(TBConsulta.RecordCount);
    end;
    lblValorTotal.Caption := 'Valor Total Listado: '+ObterValorTotal(lSQL);
  finally
    lSQL.Free;
  end;
end;

procedure TfrmConsultaOrdemServico.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaOrdemServico.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key = vk_return)then
    Close;
end;

procedure TfrmConsultaOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if(FConexao = 'Zeos')then
  begin
    FOrdemServicoConsultada := QConsultaZeosID.AsInteger
  end else
  begin
    FOrdemServicoConsultada := TBConsultaID.AsInteger;
  end;
end;

function TfrmConsultaOrdemServico.ObterValorTotal(var pSQL: TStringList): String;
var
  lQrySomaDBExpress: TSQLQuery;
  lQrySomaZeos: TZQuery;
begin
  Result := '';
  pSQL[0] := 'SELECT SUM(O.VALOR_TOTAL) AS VALOR_TOTAL FROM ORDEM_SERVICO O ';
  pSQL[pSQL.Count - 1] := '';
  if(FConexao = 'Zeos')then
  begin
    lQrySomaZeos := TZQuery.Create(nil);
    try
      lQrySomaZeos.Connection := DM.ZConnection1;
      lQrySomaZeos.SQL := pSQL;
      lQrySomaZeos.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(edtDataInicial.Text);
      lQrySomaZeos.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(edtDataFinal.Text);

      if(edtBusca.Text <> '')then
        lQrySomaZeos.Params.ParamByName('pCliente').AsString := '%'+AnsiLowerCase(edtBusca.Text)+'%';

      if(cbbStatus.ItemIndex > 0)then
        lQrySomaZeos.Params.ParamByName('pStatus').AsString := cbbStatus.Text;

      lQrySomaZeos.Params.ParamByName('pValorInicial').AsFloat := StrToFloat('0'+edtValorInicial.Text);
      lQrySomaZeos.Params.ParamByName('pValorFinal').AsFloat := StrToFloat('0'+edtValorFinal.Text);

      lQrySomaZeos.Open;
      Result := FormatFloat('R$###,###,##0.00',lQrySomaZeos.Fields.FieldByName('VALOR_TOTAL').AsFloat);
    finally
      lQrySomaZeos.Free;
    end;
  end else
  begin
    lQrySomaDBExpress := TSQLQuery.Create(nil);
    try
      lQrySomaDBExpress.SQLConnection := DM.SQLConnection1;

      lQrySomaDBExpress.SQL := pSQL;
      lQrySomaDBExpress.Params.ParamByName('pDataInicial').AsDate := StrToDateTime(edtDataInicial.Text);
      lQrySomaDBExpress.Params.ParamByName('pDataFinal').AsDate := StrToDateTime(edtDataFinal.Text);

      if(edtBusca.Text <> '')then
        lQrySomaDBExpress.Params.ParamByName('pCliente').AsString := '%'+AnsiLowerCase(edtBusca.Text)+'%';

      if(cbbStatus.ItemIndex > 0)then
        lQrySomaDBExpress.Params.ParamByName('pStatus').AsString := cbbStatus.Text;

      lQrySomaDBExpress.Params.ParamByName('pValorInicial').AsFloat := StrToFloat('0'+edtValorInicial.Text);
      lQrySomaDBExpress.Params.ParamByName('pValorFinal').AsFloat := StrToFloat('0'+edtValorFinal.Text);

      lQrySomaDBExpress.Open;
      Result := FormatFloat('R$###,###,##0.00',lQrySomaDBExpress.Fields.FieldByName('VALOR_TOTAL').AsFloat);
    finally
      lQrySomaDBExpress.Free;
    end;
  end;
end;

procedure TfrmConsultaOrdemServico.A1Click(Sender: TObject);
begin
  if(btnAtualizar.Enabled)then
    btnAtualizar.Click;
end;

procedure TfrmConsultaOrdemServico.S1Click(Sender: TObject);
begin
  if(btnSair.Enabled)then
    btnSair.Click;
end;

procedure TfrmConsultaOrdemServico.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(FConexao = 'Zeos')then
  begin
    if not odd(QConsultaZeos.RecNo) then
    begin
      if not (gdSelected in State) then
      begin
         DBGrid1.Canvas.Brush.Color := TColor($FFEFE0);
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
      end;
    end;
  end else
  begin
    if not odd(TBConsulta.RecNo) then
    begin
      if not (gdSelected in State) then
      begin
         DBGrid1.Canvas.Brush.Color := TColor($FFEFE0);
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
      end;
    end;
  end;
end;

procedure TfrmConsultaOrdemServico.edtBuscaEnter(Sender: TObject);
begin
  edtBusca.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.cbbStatusEnter(Sender: TObject);
begin
  cbbStatus.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.edtValorInicialEnter(Sender: TObject);
begin
  edtValorInicial.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.edtValorFinalEnter(Sender: TObject);
begin
  edtValorFinal.Color := clInfoBk;
end;

procedure TfrmConsultaOrdemServico.edtBuscaExit(Sender: TObject);
begin
  edtBusca.Color := clWhite;
  btnAtualizar.Click;
end;

procedure TfrmConsultaOrdemServico.cbbStatusExit(Sender: TObject);
begin
  cbbStatus.Color := clWhite;
end;

procedure TfrmConsultaOrdemServico.edtValorInicialExit(Sender: TObject);
begin
  edtValorInicial.Color := clWhite;
  btnAtualizar.Click;
end;

procedure TfrmConsultaOrdemServico.edtValorFinalExit(Sender: TObject);
begin
  edtValorFinal.Color := clWhite;
end;

procedure TfrmConsultaOrdemServico.edtBuscaKeyDown(Sender: TObject;
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

procedure TfrmConsultaOrdemServico.cbbStatusKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key = vk_return)then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmConsultaOrdemServico.edtValorInicialKeyDown(Sender: TObject;
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

procedure TfrmConsultaOrdemServico.edtValorFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if((key = vk_return)or(key = 40))then
  begin
    if(btnAtualizar.Enabled)then
      btnAtualizar.Click;

    DBGrid1.SetFocus;  
  end else
  if(key = 38)then
  begin
    Perform(WM_NEXTDLGCTL,1,0);
  end;
end;

procedure TfrmConsultaOrdemServico.rgOrdenarClick(Sender: TObject);
begin
  btnAtualizar.Click;
end;

procedure TfrmConsultaOrdemServico.cbbStatusChange(Sender: TObject);
begin
  btnAtualizar.Click;
end;

end.
