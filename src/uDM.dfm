object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 891
  Top = 330
  Height = 249
  Width = 391
  object SQLConnection1: TSQLConnection
    ConnectionName = 'ORDEMSERVICO'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      
        'Database=D:\Sistemas\SkyInformatica\OrdemServico\src\BASEDADOS.F' +
        'DB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 32
    Top = 8
  end
  object SQLCliente: TSQLDataSet
    CommandText = 'CLIENTE'
    CommandType = ctTable
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 120
    Top = 8
    object SQLClienteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SQLClienteNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 120
    end
    object SQLClienteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object SQLClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object SQLClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object SQLClienteDATACADASTRO: TSQLTimeStampField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DSPCliente: TDataSetProvider
    DataSet = SQLCliente
    Left = 120
    Top = 56
  end
  object TBCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCliente'
    Left = 120
    Top = 104
    object TBClienteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TBClienteNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 120
    end
    object TBClienteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object TBClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object TBClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '!\(99\)99999-9999'
      Size = 30
    end
    object TBClienteDATACADASTRO: TSQLTimeStampField
      FieldName = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object DSCliente: TDataSource
    DataSet = TBCliente
    Left = 120
    Top = 152
  end
  object SQLOrdemServico: TSQLDataSet
    CommandText = 'ORDEM_SERVICO'
    CommandType = ctTable
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 208
    Top = 8
    object SQLOrdemServicoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLOrdemServicoCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object SQLOrdemServicoDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object SQLOrdemServicoDATA_PREVISTA: TDateField
      FieldName = 'DATA_PREVISTA'
      ProviderFlags = [pfInUpdate]
    end
    object SQLOrdemServicoDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object SQLOrdemServicoSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object SQLOrdemServicoDESCRICAO_PROBLEMA: TStringField
      FieldName = 'DESCRICAO_PROBLEMA'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object SQLOrdemServicoVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
  end
  object DSPOrdemServico: TDataSetProvider
    DataSet = SQLOrdemServico
    Left = 208
    Top = 56
  end
  object TBOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOrdemServico'
    Left = 208
    Top = 104
    object TBOrdemServicoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBOrdemServicoCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object TBOrdemServicoDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object TBOrdemServicoDATA_PREVISTA: TDateField
      FieldName = 'DATA_PREVISTA'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object TBOrdemServicoDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
    object TBOrdemServicoSTATUS: TStringField
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 15
    end
    object TBOrdemServicoDESCRICAO_PROBLEMA: TStringField
      FieldName = 'DESCRICAO_PROBLEMA'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object TBOrdemServicoVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      ProviderFlags = [pfInUpdate]
      currency = True
      Precision = 15
      Size = 2
    end
  end
  object DSOrdemServico: TDataSource
    DataSet = TBOrdemServico
    Left = 208
    Top = 152
  end
  object SQLItemOrdem: TSQLDataSet
    CommandText = 'ITEM_ORDEM'
    CommandType = ctTable
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 304
    Top = 8
    object SQLItemOrdemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLItemOrdemORDEM_ID: TIntegerField
      FieldName = 'ORDEM_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object SQLItemOrdemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object SQLItemOrdemQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object SQLItemOrdemVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object DSPItemOrdem: TDataSetProvider
    DataSet = SQLItemOrdem
    Left = 304
    Top = 56
  end
  object TBItemOrdem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItemOrdem'
    Left = 304
    Top = 104
    object TBItemOrdemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TBItemOrdemORDEM_ID: TIntegerField
      FieldName = 'ORDEM_ID'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object TBItemOrdemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object TBItemOrdemQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object TBItemOrdemVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 15
      Size = 2
    end
  end
  object DSItemOrdem: TDataSource
    DataSet = TBItemOrdem
    Left = 304
    Top = 152
  end
  object QueryVerificar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 32
    Top = 64
  end
end
