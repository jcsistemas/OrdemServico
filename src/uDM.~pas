unit uDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider;

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
    TBClienteDATACADASTRO: TSQLTimeStampField;
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
    procedure DataModuleCreate(Sender: TObject);
    procedure TBItemOrdemCalcFields(DataSet: TDataSet);
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

procedure TDM.TBItemOrdemCalcFields(DataSet: TDataSet);
begin
  DM.TBItemOrdemSUBTOTAL.AsFloat := DM.TBItemOrdemVALOR_UNITARIO.AsFloat * DM.TBItemOrdemVALOR_UNITARIO.AsFloat;
end;

end.
