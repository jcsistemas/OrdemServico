object frmBuscaCNPJ: TfrmBuscaCNPJ
  Left = 214
  Top = 116
  Width = 665
  Height = 492
  Caption = 'frmBuscaCNPJ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 5
    Width = 634
    Height = 92
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lbl1: TLabel
      Left = 9
      Top = 12
      Width = 110
      Height = 16
      Caption = 'Busca pelo CNPJ: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object btnBuscar: TSpeedButton
      Left = 280
      Top = 10
      Width = 121
      Height = 74
      Cursor = crHandPoint
      Caption = 'Buscar (F5)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnBuscarClick
    end
    object edtBuscaCNPJ: TMaskEdit
      Left = 9
      Top = 31
      Width = 261
      Height = 33
      EditMask = '00.000.000/0000-00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      TabOrder = 0
      Text = '  .   .   /    -  '
    end
  end
  object grp1: TGroupBox
    Left = 8
    Top = 107
    Width = 633
    Height = 254
    Caption = ' DADOS RETORNADOS '
    TabOrder = 1
    object lbl2: TLabel
      Left = 8
      Top = 16
      Width = 105
      Height = 16
      Caption = 'Porte da Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 128
      Top = 16
      Width = 77
      Height = 16
      Caption = 'Raz'#227'o Social'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 536
      Top = 16
      Width = 79
      Height = 16
      Caption = 'Data Abertura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 248
      Top = 64
      Width = 131
      Height = 16
      Caption = 'Endere'#231'o (Logradouro)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 8
      Top = 110
      Width = 45
      Height = 16
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 112
      Top = 110
      Width = 80
      Height = 16
      Caption = 'Complemento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 344
      Top = 110
      Width = 34
      Height = 16
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 8
      Top = 158
      Width = 40
      Height = 16
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl10: TLabel
      Left = 273
      Top = 158
      Width = 17
      Height = 16
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 312
      Top = 158
      Width = 27
      Height = 16
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl12: TLabel
      Left = 424
      Top = 158
      Width = 51
      Height = 16
      Caption = 'Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl13: TLabel
      Left = 8
      Top = 64
      Width = 88
      Height = 16
      Caption = 'Nome Fantasia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl16: TLabel
      Left = 8
      Top = 206
      Width = 37
      Height = 16
      Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 272
      Top = 206
      Width = 47
      Height = 16
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl18: TLabel
      Left = 408
      Top = 206
      Width = 100
      Height = 16
      Caption = 'Natureza Jur'#237'dica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edtPorte: TEdit
      Left = 8
      Top = 32
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtRazaoSocial: TEdit
      Left = 128
      Top = 32
      Width = 402
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtAbertura: TEdit
      Left = 536
      Top = 32
      Width = 88
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtEndereco: TEdit
      Left = 248
      Top = 80
      Width = 377
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtNumero: TEdit
      Left = 8
      Top = 126
      Width = 97
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtComplemento: TEdit
      Left = 112
      Top = 126
      Width = 225
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtBairro: TEdit
      Left = 344
      Top = 126
      Width = 280
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtCidade: TEdit
      Left = 8
      Top = 174
      Width = 257
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtUF: TEdit
      Left = 273
      Top = 174
      Width = 35
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object edtCEP: TEdit
      Left = 312
      Top = 174
      Width = 105
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object edtSituacao: TEdit
      Left = 424
      Top = 174
      Width = 200
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object edtFantasia: TEdit
      Left = 8
      Top = 80
      Width = 233
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object edtEmail: TEdit
      Left = 8
      Top = 222
      Width = 257
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object edtTelefone: TEdit
      Left = 272
      Top = 222
      Width = 129
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object edtNaturezaJurifica: TEdit
      Left = 408
      Top = 222
      Width = 215
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 370
    Width = 657
    Height = 91
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnSair: TSpeedButton
      Left = 493
      Top = 5
      Width = 150
      Height = 75
      Cursor = crHandPoint
      Caption = 'Sair'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000232E0000232E00000000000000000001FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCFCFCF6F6F6EFEFEFEAEAEAEEEEEEF9F9F9F9F9F9EEEEEE
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
        E9E9E9E9E9E8E8E8E3E3E3D7D7D7C9C9C9BFBFBFCDCDCDEEEEEEF4F4F4DDDDDD
        D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2CDCDCDC2C2C2BCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCB5B7B9869CAE658AA74B7CA469A6DAE9E9E9F9F9F95C5C5C
        5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5D5C5A5D5B595C5A5A5A5A5A5A5A5B5A5A
        5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5A5C595757
        6570536E834E7B9F4C7FAA4C7FA94B7EA85081A867A4D8E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9386CA1706B666D6B696D6B6A6D6B
        6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6A686F68644A
        86B54C83AE4D82AC4D81AA4D81AA4C80A95786AC66A3D6E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E93C6B9C6D67616A67656967666967
        666967666967666967666967666967666967666967666967666A67656C645F4B
        85B44E83AE4E82AC4E82AC4E82AC4C80AB5B8BB164A1D3E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E93D6B9C6B66606866646766656766
        6567666567666567666567666567666567666567666567666567666469635D4B
        86B64E83AF4E83AE4E83AE4E83AE4C81AD628FB3629FD2E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E93F6D9D6A635E6764626664636664
        6366646366646366646366646366646366646366646366646366646269615B4D
        87B74F84B04F84AF4F84AF4F84AF4D82AD6694B8619DCFE9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFF9F9F9F0F0F0F2F2F2E5E5E53F6E9E67615B6462606462616462
        6164626164626164626164626164626164626164626164626164615F665E594E
        8AB95087B25086B15086B15086B14D84AF6C99BA609CCEE9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFEEEEEED1D1D1D1D1D1D5D5D5416EA1655F5A62615F6261606261
        6062616062616062616062616062616062616062616062616062605F645D574F
        8BBC5188B55187B35187B35187B34E85B1729CBF5E9ACCE9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFE9E9E9008E4D3C9A6DBDBDBD466CA5655D59615F5D615F5E615F
        5E615F5E615F5E615F5E615F5E615F5E615F5E615F5E615F5E615E5C635B5550
        8CBD5289B65288B45288B45288B44F86B378A1C35C98CAE9E9E9FAFAFAEFEFEF
        E9E9E9E9E9E9D8D8D8008B4B00C8854A9970496AA8655A57605C5B5F5D5C5F5D
        5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5C5A60585352
        8EBF538AB85389B65389B65389B64D82AD7CA5C65B96C8E9E9E9EFEFEFCECECE
        BDBDBDBCBCBCB7B7B700884800E5A600C27D157E6867535860595B5D5B5B5D5B
        5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5A595E565153
        90C1548CB9548BB7548BB7548BB7497BA282AACA5A95C5E9E9E9E9E9E90C9054
        008A4900884700874600834200DCA100DCA000C07E1F764B6453575E58595B5A
        595B5A595B5A595B5A595B5A595B5A595B5A595B5A595B5A595B59575C554F54
        91C3558DBB558CB9568BB8578AB745709687ADCD5892C4E9E9E9E9E9E9008948
        39E8BE00DAA100D9A100D8A000D39C00D39C00D79F00BE801F754A6151555B56
        5759585759585759585759585759585759585759585759585759575559524C56
        93C4568EBC568DBA588BB73AA8DF23B8F78EB1CF5791C1E9E9E9E9E9E9008745
        52E5C300CF9A00CF9B00CF9B00CD9A00CD9A00CF9B00D39F00BC811C794D5D52
        5659555658565658565658565658565658565658565658565658555458504B57
        95C75790BE588FBB5A8CB827B8F55482AE92B4D25590BEE9E9E9E9E9E9008744
        6DE6CD00C89700C89800C99900C99900C99A00C99906CEA128DFB60093475D50
        53575454565554565554565554565554565554565554565554565452564F4958
        96C95891C05990BD5C8DBA27BAF74F7BA497B8D7558EBDE9E9E9E9E9E9008744
        87E9D800C39700C39800C39800C49800C59900C69A60E1C700B78119774B594F
        53555353545353545353545353545353545353545353545353545251534D4859
        97CA5992C15A91BE5C8EBC27B9F74A72999DBDD9538CBBE9E9E9EFEFEF008946
        9DF0E64EE9D451E9D44DE7D194E6D700C0975EDDC600B47F1A75475B4A4F554F
        5153515153515153515153515153515153515153515153515153504F524A455B
        99CD5A93C35A92C15C90BF3BA9E121B7F6A0BFD9528ABAE9E9E9FAFAFA0F9356
        00894600874400864200823B82E3D658DAC400AF7D19734659474C544D4F514F
        4F514F4F514F4F514F4F514F4F514F4F514F4F514F4F514F4F514E4D5048435C
        9BCE5B95C45B94C25C94C15C92BF588FBEA5C3DD5089B7E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFE9E9E900894479E3D800AC7C16846A574548514C4D4F4E4E4F4E
        4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4D4C4E46415C
        9DD15B96C65B95C45B95C45A94C35691C2A9C6E14F87B6E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFEEEEEE008C4A00AC855CAC814F77B25046454D4B4B4D4C4C4D4C
        4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4B4A4B443F5E
        9ED35C97C85C96C65C96C65B95C65693C4ADCAE34D85B3E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFF9F9F9008E4D51B081E5E5E54C7AB14E45424C49484C4A4A4C4A
        4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C49484A423D5F
        9FD45D98C95D97C75D97C75C96C75793C5B2CFE64C84B1E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E94B7DAF4B44404A48474A49494A49
        494A49494A49494A49494A49494A49494A49494A49494A49494A484748413C60
        A1D75E9BCB5E99C95E99C95D98C95895C7B6D2E84A82B0E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9497FAE48423D4846454847474847
        47484747484747484747484747484747484747484747484747484545463E3961
        A3D85F9CCC5F9ACA5F9ACA5E99CA5996C8BBD5EB4981ADE9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E94A7FAE463F3B4644434645454645
        45464545464545464545464545464545464545464545464545464343433C3762
        A4DA609CCE609BCC609BCC5F9ACC5997CAC0D9ED477EABE9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA4980AD453E394542414543424543
        4245434245434245434245434245434245434245434245434244414040393460
        A2DB5E9BD05F9BCE619CCE5F9BCE5A98CCC5DCF0467DAAE9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F24980AC413730423B36423C37423C
        37423C37423C37423C37423C37423C37423C37423C37423C37413A353B322ABC
        DCF77AAED95B9ACD5F9CCE5F9CCE5A9ACDC9DFF2457CA7E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB7EA2BF4A82AE4B83B04B83B14B83
        B14B83B14B83B14B83B14B83B14B83B14B83B14B83B14B83B14A82AF447CA980
        A9CBB9D3EAA7C9E56CA4D35B9ACF5999CFCDE2F3437AA6E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFCFCD0E0EEC2DBEE9AC2E25A9AD0CFE3F54177A3E9E9E9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEF2F5F8CADDEEBDD6EDD3E7F74076A2EEEEEEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEE9EFF5CEE3F63E759FF9F9F9}
      OnClick = btnSairClick
    end
  end
  object PopUp1: TPopupMenu
    Left = 552
    Top = 104
    object B1: TMenuItem
      Caption = 'Buscar'
      ShortCut = 116
      Visible = False
      OnClick = B1Click
    end
  end
end
