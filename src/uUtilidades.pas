unit uUtilidades;

interface

uses SysUtils, IdHTTP, IdSSLOpenSSL, ShellApi, Classes, DateUtils, Graphics,
  Windows, Forms, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, ZAbstractConnection;

type
  TUtilidades = class
  private
    { Private declarations }
  public
    { Public declarations }
    class function VerificarExistenciaDeTabela(pTabela: String): Boolean;
    class procedure VerificarTabelas();
    class function ConsumirAPISemAutenticacao(pURL: String; pBody: String = ''; pMetodo: String = 'POST'): String;
    class function ExtrairValorNoDoJSON(pJSON, pNo: String): String;
    class function ExtrairApenasNumeros(leitura: String): String;
    class function GerarChavePrimaria(pTabela: String): Integer;
    class function ValidarValorReal(pCampo: String): Boolean;
  end;

implementation

uses uDM, uMenu;

class function TUtilidades.VerificarExistenciaDeTabela(pTabela: String): Boolean;
begin
  Result := False;

  if(FConexao = 'Zeos')then
  begin
    DM.QVerificar.Close;
    DM.QVerificar.SQL.Clear;
    DM.QVerificar.SQL.Add('SELECT COUNT(*) AS CONTAGEM FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ' +
      QuotedStr(pTabela) + '; ');
    DM.QVerificar.Open;

    if (DM.QVerificar.Fields.FieldByName('CONTAGEM').AsInteger > 0) then
      Result := True;
  end else
  begin
    DM.QueryVerificar.Close;
    DM.QueryVerificar.SQL.Clear;
    DM.QueryVerificar.SQL.Add('SELECT COUNT(*) AS CONTAGEM FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ' +
      QuotedStr(pTabela) + '; ');
    DM.QueryVerificar.Open;

    if (DM.QueryVerificar.Fields.FieldByName('CONTAGEM').AsInteger > 0) then
      Result := True;
  end;
end;

class procedure TUtilidades.VerificarTabelas();
begin
  if(FConexao = 'Zeos')then
  begin
    if not(VerificarExistenciaDeTabela('CLIENTE'))then
    begin
      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_CLIENTE_ID;');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TABLE CLIENTE (');
      DM.QVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY,');
      DM.QVerificar.SQL.Add('NOME VARCHAR(120) NOT NULL,');
      DM.QVerificar.SQL.Add('DOCUMENTO VARCHAR(20),');
      DM.QVerificar.SQL.Add('EMAIL VARCHAR(120),');
      DM.QVerificar.SQL.Add('TELEFONE VARCHAR(30),');
      DM.QVerificar.SQL.Add('DATACADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP');
      DM.QVerificar.SQL.Add(');');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TRIGGER CLIENTE_INSERIR FOR CLIENTE ');
      DM.QVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      DM.QVerificar.SQL.Add('BEGIN ');
      DM.QVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      DM.QVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_CLIENTE_ID; ');
      DM.QVerificar.SQL.Add('END;');
      DM.QVerificar.ExecSQL();
    end;

    if not(VerificarExistenciaDeTabela('ORDEM_SERVICO'))then
    begin
      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_ORDEM_SERVICO_ID;');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TABLE ORDEM_SERVICO ( ');
      DM.QVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY, ');
      DM.QVerificar.SQL.Add('CLIENTE_ID INTEGER, ');
      DM.QVerificar.SQL.Add('DATA_ABERTURA DATE NOT NULL, ');
      DM.QVerificar.SQL.Add('DATA_PREVISTA DATE, ');
      DM.QVerificar.SQL.Add('DATA_FECHAMENTO DATE, ');
      DM.QVerificar.SQL.Add('STATUS VARCHAR(15) NOT NULL, ');
      DM.QVerificar.SQL.Add('DESCRICAO_PROBLEMA VARCHAR(500), ');
      DM.QVerificar.SQL.Add('VALOR_TOTAL NUMERIC(15,2) DEFAULT 0, ');
      DM.QVerificar.SQL.Add('CONSTRAINT FK_OS_CLIENTE FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE(ID) ');
      DM.QVerificar.SQL.Add(');');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TRIGGER ORDEM_SERVICO_INSERIR FOR ORDEM_SERVICO ');
      DM.QVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      DM.QVerificar.SQL.Add('BEGIN ');
      DM.QVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      DM.QVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_ORDEM_SERVICO_ID; ');
      DM.QVerificar.SQL.Add('END;');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE INDEX IDX_OS_STATUS ON ORDEM_SERVICO (STATUS);');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE INDEX IDX_OS_CLIENTE ON ORDEM_SERVICO (CLIENTE_ID);');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE INDEX IDX_OS_DATA_ABERTURA ON ORDEM_SERVICO (DATA_ABERTURA);');
      DM.QVerificar.ExecSQL();
    end;

    if not(VerificarExistenciaDeTabela('ITEM_ORDEM'))then
    begin
      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_ITEM_ORDEM_ID;');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TABLE ITEM_ORDEM( ');
      DM.QVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY, ');
      DM.QVerificar.SQL.Add('ORDEM_ID INTEGER NOT NULL, ');
      DM.QVerificar.SQL.Add('DESCRICAO VARCHAR(200) NOT NULL, ');
      DM.QVerificar.SQL.Add('QUANTIDADE NUMERIC(12,2) NOT NULL, ');
      DM.QVerificar.SQL.Add('VALOR_UNITARIO NUMERIC(15,2) NOT NULL, ');
      DM.QVerificar.SQL.Add('CONSTRAINT FK_ITEM_ORDEM FOREIGN KEY (ORDEM_ID) REFERENCES ORDEM_SERVICO(ID) ');
      DM.QVerificar.SQL.Add(');');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TRIGGER ITEM_ORDEM_INSERIR FOR ITEM_ORDEM ');
      DM.QVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      DM.QVerificar.SQL.Add('BEGIN ');
      DM.QVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      DM.QVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_ITEM_ORDEM_ID; ');
      DM.QVerificar.SQL.Add('END;');
      DM.QVerificar.ExecSQL();
    end;
  end else
  begin
    if not(VerificarExistenciaDeTabela('CLIENTE'))then
    begin
      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_CLIENTE_ID;');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TABLE CLIENTE (');
      DM.QVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY,');
      DM.QVerificar.SQL.Add('NOME VARCHAR(120) NOT NULL,');
      DM.QVerificar.SQL.Add('DOCUMENTO VARCHAR(20),');
      DM.QVerificar.SQL.Add('EMAIL VARCHAR(120),');
      DM.QVerificar.SQL.Add('TELEFONE VARCHAR(30),');
      DM.QVerificar.SQL.Add('DATACADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP');
      DM.QVerificar.SQL.Add(');');
      DM.QVerificar.ExecSQL();

      DM.QVerificar.SQL.Clear;
      DM.QVerificar.SQL.Add('CREATE TRIGGER CLIENTE_INSERIR FOR CLIENTE ');
      DM.QVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      DM.QVerificar.SQL.Add('BEGIN ');
      DM.QVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      DM.QVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_CLIENTE_ID; ');
      DM.QVerificar.SQL.Add('END;');
      DM.QVerificar.ExecSQL();
    end;

    if not(VerificarExistenciaDeTabela('ORDEM_SERVICO'))then
    begin
      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_ORDEM_SERVICO_ID;');
      DM.QueryVerificar.ExecSQL();

      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE TABLE ORDEM_SERVICO ( ');
      DM.QueryVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY, ');
      DM.QueryVerificar.SQL.Add('CLIENTE_ID INTEGER, ');
      DM.QueryVerificar.SQL.Add('DATA_ABERTURA DATE NOT NULL, ');
      DM.QueryVerificar.SQL.Add('DATA_PREVISTA DATE, ');
      DM.QueryVerificar.SQL.Add('DATA_FECHAMENTO DATE, ');
      DM.QueryVerificar.SQL.Add('STATUS VARCHAR(15) NOT NULL, ');
      DM.QueryVerificar.SQL.Add('DESCRICAO_PROBLEMA VARCHAR(500), ');
      DM.QueryVerificar.SQL.Add('VALOR_TOTAL NUMERIC(15,2) DEFAULT 0, ');
      DM.QueryVerificar.SQL.Add('CONSTRAINT FK_OS_CLIENTE FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE(ID) ');
      DM.QueryVerificar.SQL.Add(');');
      DM.QueryVerificar.ExecSQL();

      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE TRIGGER ORDEM_SERVICO_INSERIR FOR ORDEM_SERVICO ');
      DM.QueryVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      DM.QueryVerificar.SQL.Add('BEGIN ');
      DM.QueryVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      DM.QueryVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_ORDEM_SERVICO_ID; ');
      DM.QueryVerificar.SQL.Add('END;');
      DM.QueryVerificar.ExecSQL();

      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE INDEX IDX_OS_STATUS ON ORDEM_SERVICO (STATUS);');
      DM.QueryVerificar.ExecSQL();

      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE INDEX IDX_OS_CLIENTE ON ORDEM_SERVICO (CLIENTE_ID);');
      DM.QueryVerificar.ExecSQL();

      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE INDEX IDX_OS_DATA_ABERTURA ON ORDEM_SERVICO (DATA_ABERTURA);');
      DM.QueryVerificar.ExecSQL();
    end;

    if not(VerificarExistenciaDeTabela('ITEM_ORDEM'))then
    begin
      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE SEQUENCE GENERATOR_ITEM_ORDEM_ID;');
      DM.QueryVerificar.ExecSQL();

      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE TABLE ITEM_ORDEM( ');
      DM.QueryVerificar.SQL.Add('ID INTEGER NOT NULL PRIMARY KEY, ');
      DM.QueryVerificar.SQL.Add('ORDEM_ID INTEGER NOT NULL, ');
      DM.QueryVerificar.SQL.Add('DESCRICAO VARCHAR(200) NOT NULL, ');
      DM.QueryVerificar.SQL.Add('QUANTIDADE NUMERIC(12,2) NOT NULL, ');
      DM.QueryVerificar.SQL.Add('VALOR_UNITARIO NUMERIC(15,2) NOT NULL, ');
      DM.QueryVerificar.SQL.Add('CONSTRAINT FK_ITEM_ORDEM FOREIGN KEY (ORDEM_ID) REFERENCES ORDEM_SERVICO(ID) ');
      DM.QueryVerificar.SQL.Add(');');
      DM.QueryVerificar.ExecSQL();

      DM.QueryVerificar.SQL.Clear;
      DM.QueryVerificar.SQL.Add('CREATE TRIGGER ITEM_ORDEM_INSERIR FOR ITEM_ORDEM ');
      DM.QueryVerificar.SQL.Add('ACTIVE BEFORE INSERT POSITION 0 AS ');
      DM.QueryVerificar.SQL.Add('BEGIN ');
      DM.QueryVerificar.SQL.Add('  IF (NEW.ID IS NULL) THEN ');
      DM.QueryVerificar.SQL.Add('    NEW.ID = NEXT VALUE FOR GENERATOR_ITEM_ORDEM_ID; ');
      DM.QueryVerificar.SQL.Add('END;');
      DM.QueryVerificar.ExecSQL();
    end;
  end;
end;

class function TUtilidades.ConsumirAPISemAutenticacao(pURL: String; pBody: String = ''; pMetodo: String = 'POST'): String;
var
  IdHTTP: TIdHTTP;
  IdSSLIOHandler: TIdSSLIOHandlerSocketOpenSSL;
  Response: TStringStream;
  RequestStream: TStringStream;
begin
  Result := '';
  try
    IdHTTP := TIdHTTP.Create(nil);
    IdSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    Response := TStringStream.Create('');
    RequestStream := TStringStream.Create('');
    try
      IdSSLIOHandler.SSLOptions.Method := sslvTLSv1_2; // Força TLS 1.2
      IdSSLIOHandler.SSLOptions.SSLVersions := [sslvTLSv1_2]; // Só permite TLS 1.2
      IdHTTP.IOHandler := IdSSLIOHandler;
      IdHTTP.Request.ContentType := 'application/json';
      IdHTTP.Request.Accept := 'application/json';
      IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
      RequestStream.WriteString(pBody);
      RequestStream.Position := 0;

      if(pMetodo = 'POST')then
        IdHTTP.Post(pURL, RequestStream, Response)
      else if(pMetodo = 'GET')then
        IdHTTP.Get(pURL,Response)
      else if(pMetodo = 'PATCH')then
        IdHTTP.Patch(pURL, RequestStream, Response)
      else if(pMetodo = 'DELETE')then
        IdHTTP.Delete(pURL, Response);

      Result := Response.DataString;
    finally
      RequestStream.Free;
      Response.Free;
      IdSSLIOHandler.Free;
      IdHTTP.Free;
    end;
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

class function TUtilidades.ExtrairValorNoDoJSON(pJSON, pNo: String): String;
var
  i, tamanho_json, tamanho_no: Integer;
  letra, palavra, valorno, ultimocaracter: String;
begin
  valorno := '';
  pNo := '"'+pNo+'"';
  tamanho_no := Length(pNo);
  tamanho_json := Length(pJSON);
  i := 1;
  while(i <= tamanho_json)do
  begin
    palavra := Copy(pJSON, i, tamanho_no);
    if(palavra = pNo)then
    begin
      i := i + tamanho_no + 1;
      letra := Copy(pJSON,i,1);
      while(letra = ' ')do
      begin
        i := i + 1;
        letra := Copy(pJSON,i,1);
        if(i > tamanho_json)then
          letra := '"';
      end;

      if(letra = '"')then
        ultimocaracter := '"'
      else
        ultimocaracter := ',';

      i := i + 1;
      letra := Copy(pJSON,i,1);
      while(letra <> ultimocaracter)do
      begin
        letra := Copy(pJSON,i,1);
        if(letra <> ultimocaracter)then
        begin
          valorno := valorno + letra;
        end;
        i := i + 1;
        if(i > tamanho_json)then
          letra := ultimocaracter;
      end;
    end;
    i := i + 1;
  end;
  Result := valorno;
end;

class function TUtilidades.ExtrairApenasNumeros(leitura: String): String;
var
   c: Integer;
   t: Integer;
   l: String;
   leit: String;
   resultado: String;
begin
   leit := leitura;
   c := 1;
   t := Length(leit);
   resultado := '';

   while(c <= t)do
   begin
      l := Copy(leit, c, 1);

      if ((l = '0') or (l = '1') or (l = '2') or (l = '3') or (l = '4') or (l = '5') or (l = '6') or (l = '7')
        or (l = '8') or (l = '9')) then
      begin
         resultado := resultado + l;
      end;
      c := c + 1;
   end;

   Result := resultado;
end;

class function TUtilidades.GerarChavePrimaria(pTabela: String): Integer;
var
  lQryGerarChavePrimaria: TSQLQuery;
  lQryGerarChavePrimariaZeos: TZQuery;
begin
  if(FConexao = 'Zeos')then
  begin
    lQryGerarChavePrimariaZeos := TZQuery.Create(nil);
    try
      lQryGerarChavePrimariaZeos.Connection := DM.ZConnection1;
      lQryGerarChavePrimariaZeos.SQL.Add('SELECT MAX(ID) AS ID FROM '+pTabela);
      lQryGerarChavePrimariaZeos.Open;
      Result := lQryGerarChavePrimariaZeos.Fields.FieldByName('ID').AsInteger + 1;
    finally
      lQryGerarChavePrimariaZeos.Free;
    end;
  end else
  begin
    lQryGerarChavePrimaria := TSQLQuery.Create(nil);
    try
      lQryGerarChavePrimaria.SQLConnection := DM.SQLConnection1;
      lQryGerarChavePrimaria.SQL.Add('SELECT MAX(ID) AS ID FROM '+pTabela);
      lQryGerarChavePrimaria.Open;
      Result := lQryGerarChavePrimaria.Fields.FieldByName('ID').AsInteger + 1;
    finally
      lQryGerarChavePrimaria.Free;
    end;
  end;
end;

class function TUtilidades.ValidarValorReal(pCampo: String): Boolean;
var
   i: Integer;
   c: String;
   lQtdVirgulas: Integer;
begin
   Result := true;
   lQtdVirgulas := 0;
   i := 1;
   while(i <= length(pCampo))do
   begin
      c := Copy(pCampo,i,1);

      if not((c='1')or(c='2')or(c='3')or(c='4')or(c='5')
      or(c='6')or(c='7')or(c='8')or(c='9')or(c='0')or(c=','))then
      begin
         Result := false;
      end;

      if(c=',')then
        lQtdVirgulas := lQtdVirgulas + 1;

      i := i + 1;
   end;

   if(Copy(pCampo,1,1)=',')then
     Result := false;

   if(Copy(pCampo,length(pCampo),1)=',')then
     Result := false;

   if(lQtdVirgulas >= 2)then
     Result := false;

   if(Length(pCampo) <= 0)then
     Result := false;
end;

end.
 