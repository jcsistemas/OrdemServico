unit uDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider,
  Dialogs, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, ZAbstractConnection, ZConnection;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    SQLCliente: TSQLDataSet;
    DSPCliente: TDataSetProvider;
    TBCliente: TClientDataSet;
    DSCliente: TDataSource;
    SQLClienteID: TIntegerField;
    SQLClienteNOME: TStringField;
    SQLClienteDOCUMENTO: TStringField;
    SQLClienteEMAIL: TStringField;
    SQLClienteTELEFONE: TStringField;
    SQLClienteDATACADASTRO: TSQLTimeStampField;
    TBClienteID: TIntegerField;
    TBClienteNOME: TStringField;
    TBClienteDOCUMENTO: TStringField;
    TBClienteEMAIL: TStringField;
    TBClienteTELEFONE: TStringField;
    SQLOrdemServico: TSQLDataSet;
    DSPOrdemServico: TDataSetProvider;
    TBOrdemServico: TClientDataSet;
    DSOrdemServico: TDataSource;
    SQLOrdemServicoID: TIntegerField;
    SQLOrdemServicoCLIENTE_ID: TIntegerField;
    SQLOrdemServicoDATA_ABERTURA: TDateField;
    SQLOrdemServicoDATA_PREVISTA: TDateField;
    SQLOrdemServicoDATA_FECHAMENTO: TDateField;
    SQLOrdemServicoSTATUS: TStringField;
    SQLOrdemServicoDESCRICAO_PROBLEMA: TStringField;
    SQLOrdemServicoVALOR_TOTAL: TFMTBCDField;
    TBOrdemServicoID: TIntegerField;
    TBOrdemServicoCLIENTE_ID: TIntegerField;
    TBOrdemServicoDATA_ABERTURA: TDateField;
    TBOrdemServicoDATA_PREVISTA: TDateField;
    TBOrdemServicoDATA_FECHAMENTO: TDateField;
    TBOrdemServicoSTATUS: TStringField;
    TBOrdemServicoDESCRICAO_PROBLEMA: TStringField;
    TBOrdemServicoVALOR_TOTAL: TFMTBCDField;
    SQLItemOrdem: TSQLDataSet;
    DSPItemOrdem: TDataSetProvider;
    TBItemOrdem: TClientDataSet;
    DSItemOrdem: TDataSource;
    SQLItemOrdemID: TIntegerField;
    SQLItemOrdemORDEM_ID: TIntegerField;
    SQLItemOrdemDESCRICAO: TStringField;
    SQLItemOrdemQUANTIDADE: TFMTBCDField;
    SQLItemOrdemVALOR_UNITARIO: TFMTBCDField;
    TBItemOrdemID: TIntegerField;
    TBItemOrdemORDEM_ID: TIntegerField;
    TBItemOrdemDESCRICAO: TStringField;
    TBItemOrdemQUANTIDADE: TFMTBCDField;
    TBItemOrdemVALOR_UNITARIO: TFMTBCDField;
    QueryVerificar: TSQLQuery;
    TBItemOrdemSUBTOTAL: TFloatField;
    ZConnection1: TZConnection;
    TCliente: TZTable;
    TClienteID: TIntegerField;
    TClienteNOME: TStringField;
    TClienteDOCUMENTO: TStringField;
    TClienteEMAIL: TStringField;
    TClienteTELEFONE: TStringField;
    TClienteDATACADASTRO: TDateTimeField;
    TOrdemServico: TZTable;
    TItemOrdem: TZTable;
    TOrdemServicoID: TIntegerField;
    TOrdemServicoCLIENTE_ID: TIntegerField;
    TOrdemServicoDATA_ABERTURA: TDateField;
    TOrdemServicoDATA_PREVISTA: TDateField;
    TOrdemServicoDATA_FECHAMENTO: TDateField;
    TOrdemServicoSTATUS: TStringField;
    TOrdemServicoDESCRICAO_PROBLEMA: TStringField;
    TOrdemServicoVALOR_TOTAL: TFloatField;
    TItemOrdemID: TIntegerField;
    TItemOrdemORDEM_ID: TIntegerField;
    TItemOrdemDESCRICAO: TStringField;
    TItemOrdemQUANTIDADE: TFloatField;
    TItemOrdemVALOR_UNITARIO: TFloatField;
    QVerificar: TZQuery;
    TBClienteDATACADASTRO: TSQLTimeStampField;
    TItemOrdemSUBTOTAL: TFloatField;
    TBOrdemServicoNOME_CLIENTE: TStringField;
    TOrdemServicoNOME_CLIENTE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure TBItemOrdemCalcFields(DataSet: TDataSet);
    procedure TItemOrdemCalcFields(DataSet: TDataSet);
    procedure TBOrdemServicoCalcFields(DataSet: TDataSet);
    procedure TOrdemServicoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses uMenu;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if(FConexao = 'Zeos')then
  begin
    ZConnection1.Database := FLocalAplicacao + 'BASEDADOS.FDB';
    ZConnection1.Connected := true;

    DSCliente.DataSet := TCliente;
    DSOrdemServico.DataSet := TOrdemServico;
    DSItemOrdem.DataSet := TItemOrdem;       
  end else
  begin
    SQLConnection1.Connected := false;
    SQLConnection1.Params.Clear;
    SQLConnection1.Params.Values['Database'] := FLocalAplicacao + 'BASEDADOS.FDB';
    SQLConnection1.Params.Values['User_name'] := 'SYSDBA';
    SQLConnection1.Params.Values['Password'] := 'masterkey';
    SQLConnection1.Params.Values['SQLDialect'] := '3';
    SQLConnection1.ParamsLoaded := true;
    SQLConnection1.ConnectionName := 'ORDEMSERVICO';
    SQLConnection1.Connected := true;
  end;
end;

procedure TDM.TBItemOrdemCalcFields(DataSet: TDataSet);
begin
  DM.TBItemOrdemSUBTOTAL.AsFloat := DM.TBItemOrdemVALOR_UNITARIO.AsFloat * DM.TBItemOrdemQUANTIDADE.AsFloat;
end;

procedure TDM.TItemOrdemCalcFields(DataSet: TDataSet);
begin
  DM.TItemOrdemSUBTOTAL.AsFloat := DM.TItemOrdemVALOR_UNITARIO.AsFloat * DM.TItemOrdemQUANTIDADE.AsFloat;
end;

procedure TDM.TBOrdemServicoCalcFields(DataSet: TDataSet);
begin
  if(FConexao <> 'Zeos')and(DM.TBCliente.Active)then
  begin
    if(DM.TBCliente.Locate('ID',DM.TBOrdemServicoCLIENTE_ID.AsString,[]))then
      DM.TBOrdemServicoNOME_CLIENTE.AsString := DM.TBClienteNOME.AsString
    else
      DM.TBOrdemServicoNOME_CLIENTE.AsString := '';
  end;
end;

procedure TDM.TOrdemServicoCalcFields(DataSet: TDataSet);
begin
  if(FConexao = 'Zeos')and(DM.TOrdemServico.Active)then
  begin
    if(DM.TCliente.Locate('ID',DM.TOrdemServicoCLIENTE_ID.AsInteger,[]))then
      DM.TOrdemServicoNOME_CLIENTE.AsString := DM.TClienteNOME.AsString
    else
      DM.TOrdemServicoNOME_CLIENTE.AsString := '';
  end;
end;

end.
