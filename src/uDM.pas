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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure VerificarTabelas();
  public
    { Public declarations }
    function VerificarExistenciaDeTabela(pTabela: String): Boolean;
  end;

var
  DM: TDM;

implementation

uses uMenu;

{$R *.dfm}

function TDM.VerificarExistenciaDeTabela(pTabela: String): Boolean;
var
  lQryVerificar: TSQLQuery;
begin
  Result := False;
  lQryVerificar := TSQLQuery.Create(Self);
  try
    lQryVerificar.SQLConnection := DM.SQLConnection1;
    lQryVerificar.Close;
    lQryVerificar.SQL.Clear;
    lQryVerificar.SQL.Add('SELECT COUNT(*) AS CONTAGEM FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ' +
      QuotedStr(pTabela) + '; ');
    lQryVerificar.Open;

    if (lQryVerificar.Fields.FieldByName('CONTAGEM').AsInteger > 0) then
      Result := True;
  finally
    lQryVerificar.Free;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  SQLConnection1.Connected := false;
  SQLConnection1.Params.Clear;
  SQLConnection1.Params.Values['Database'] := FLocalAplicacao + 'BASEDADOS.FDB';
  SQLConnection1.Params.Values['User_name'] := 'SYSDBA';
  SQLConnection1.Params.Values['Password'] := 'masterkey';
  SQLConnection1.Params.Values['SQLDialect'] := '3';
  SQLConnection1.ParamsLoaded := true;
  SQLConnection1.ConnectionName := 'ESTOQUEALL';
  SQLConnection1.Connected := true;

  VerificarTabelas();

  DM.TBCliente.Open;
  DM.TBOrdemServico.Open;
  DM.TBItemOrdem.Open;
end;

procedure TDM.VerificarTabelas();
var
  lQryVerificar: TSQLQuery;
begin
  lQryVerificar := TSQLQuery.Create(Self);
  try
    lQryVerificar.SQLConnection := DM.SQLConnection1;
    if not(DM.VerificarExistenciaDeTabela('CLIENTE'))then
    begin
      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_CLIENTE_ID;');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE TABLE CLIENTE (');
      lQryVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY,');
      lQryVerificar.SQL.Add('NOME VARCHAR(120) NOT NULL,');
      lQryVerificar.SQL.Add('DOCUMENTO VARCHAR(20),');
      lQryVerificar.SQL.Add('EMAIL VARCHAR(120),');
      lQryVerificar.SQL.Add('TELEFONE VARCHAR(30),');
      lQryVerificar.SQL.Add('DATACADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP');
      lQryVerificar.SQL.Add(');');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE TRIGGER CLIENTE_INSERIR FOR CLIENTE ');
      lQryVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      lQryVerificar.SQL.Add('BEGIN ');
      lQryVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      lQryVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_CLIENTE_ID; ');
      lQryVerificar.SQL.Add('END;');
      lQryVerificar.ExecSQL();
    end; 

    if not(DM.VerificarExistenciaDeTabela('ORDEM_SERVICO'))then
    begin
      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_ORDEM_SERVICO_ID;');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE TABLE ORDEM_SERVICO ( ');
      lQryVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY, ');
      lQryVerificar.SQL.Add('CLIENTE_ID INTEGER NOT NULL, ');
      lQryVerificar.SQL.Add('DATA_ABERTURA DATE NOT NULL, ');
      lQryVerificar.SQL.Add('DATA_PREVISTA DATE, ');
      lQryVerificar.SQL.Add('DATA_FECHAMENTO DATE, ');
      lQryVerificar.SQL.Add('STATUS VARCHAR(15) NOT NULL, ');
      lQryVerificar.SQL.Add('DESCRICAO_PROBLEMA VARCHAR(500), ');
      lQryVerificar.SQL.Add('VALOR_TOTAL NUMERIC(15,2) DEFAULT 0, ');
      lQryVerificar.SQL.Add('CONSTRAINT FK_OS_CLIENTE FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE(ID) ');
      lQryVerificar.SQL.Add(');');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE TRIGGER ORDEM_SERVICO_INSERIR FOR ORDEM_SERVICO ');
      lQryVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      lQryVerificar.SQL.Add('BEGIN ');
      lQryVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      lQryVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_ORDEM_SERVICO_ID; ');
      lQryVerificar.SQL.Add('END;');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE INDEX IDX_OS_STATUS ON ORDEM_SERVICO (STATUS);');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE INDEX IDX_OS_CLIENTE ON ORDEM_SERVICO (CLIENTE_ID);');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE INDEX IDX_OS_DATA_ABERTURA ON ORDEM_SERVICO (DATA_ABERTURA);');
      lQryVerificar.ExecSQL();
    end;

    if not(DM.VerificarExistenciaDeTabela('ITEM_ORDEM'))then
    begin
      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_ITEM_ORDEM_ID;');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Add('CREATE TABLE ITEM_ORDEM( ');
      lQryVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY, ');
      lQryVerificar.SQL.Add('ORDEM_ID INTEGER NOT NULL, ');
      lQryVerificar.SQL.Add('DESCRICAO VARCHAR(200) NOT NULL, ');
      lQryVerificar.SQL.Add('QUANTIDADE NUMERIC(12,2) NOT NULL, ');
      lQryVerificar.SQL.Add('VALOR_UNITARIO NUMERIC(15,2) NOT NULL, ');
      lQryVerificar.SQL.Add('CONSTRAINT FK_ITEM_ORDEM FOREIGN KEY (ORDEM_ID) REFERENCES ORDEM_SERVICO(ID) ');
      lQryVerificar.SQL.Add(');');
      lQryVerificar.ExecSQL();

      lQryVerificar.SQL.Clear;
      lQryVerificar.SQL.Add('CREATE TRIGGER ITEM_ORDEM_INSERIR FOR ITEM_ORDEM ');
      lQryVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      lQryVerificar.SQL.Add('BEGIN ');
      lQryVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      lQryVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_ITEM_ORDEM_ID; ');
      lQryVerificar.SQL.Add('END;');
      lQryVerificar.ExecSQL();
    end;
  finally
    lQryVerificar.Free;
  end;
end;

end.
