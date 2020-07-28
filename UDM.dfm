object DM: TDM
  OldCreateOrder = False
  Height = 560
  Width = 785
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\vinic\Documents\Embarcadero\Studio\Projects\At' +
        'ivaHealthCare\bd\bd.sqlite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 40
    Top = 32
  end
  object FDQPessoa: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from PESSOA')
    Left = 32
    Top = 280
    object FDQPessoaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQPessoaid_server: TIntegerField
      FieldName = 'id_server'
      Origin = 'id_server'
    end
    object FDQPessoanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object FDQPessoacpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 11
    end
    object FDQPessoadt_nascimento: TDateField
      FieldName = 'dt_nascimento'
      Origin = 'dt_nascimento'
    end
    object FDQPessoasexo: TStringField
      FieldName = 'sexo'
      Origin = 'sexo'
      FixedChar = True
      Size = 1
    end
    object FDQPessoacelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      Size = 13
    end
    object FDQPessoacep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object FDQPessoacidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 60
    end
    object FDQPessoauf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object FDQPessoacomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 60
    end
    object FDQPessoabairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 60
    end
    object FDQPessoaobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 300
    end
    object FDQPessoadomingo: TStringField
      FieldName = 'domingo'
      Origin = 'domingo'
      FixedChar = True
      Size = 1
    end
    object FDQPessoadomingoHoras: TStringField
      FieldName = 'domingoHoras'
      Origin = 'domingoHoras'
      Size = 30
    end
    object FDQPessoasegunda: TStringField
      FieldName = 'segunda'
      Origin = 'segunda'
      FixedChar = True
      Size = 1
    end
    object FDQPessoasegundaHoras: TStringField
      FieldName = 'segundaHoras'
      Origin = 'segundaHoras'
      Size = 30
    end
    object FDQPessoaterca: TStringField
      FieldName = 'terca'
      Origin = 'terca'
      FixedChar = True
      Size = 1
    end
    object FDQPessoatercaHoras: TStringField
      FieldName = 'tercaHoras'
      Origin = 'tercaHoras'
      Size = 30
    end
    object FDQPessoaquarta: TStringField
      FieldName = 'quarta'
      Origin = 'quarta'
      FixedChar = True
      Size = 1
    end
    object FDQPessoaquartaHoras: TStringField
      FieldName = 'quartaHoras'
      Origin = 'quartaHoras'
      Size = 30
    end
    object FDQPessoaquinta: TStringField
      FieldName = 'quinta'
      Origin = 'quinta'
      FixedChar = True
      Size = 1
    end
    object FDQPessoaquintaHoras: TStringField
      FieldName = 'quintaHoras'
      Origin = 'quintaHoras'
      Size = 30
    end
    object FDQPessoasexta: TStringField
      FieldName = 'sexta'
      Origin = 'sexta'
      FixedChar = True
      Size = 1
    end
    object FDQPessoasextaHoras: TStringField
      FieldName = 'sextaHoras'
      Origin = 'sextaHoras'
      Size = 30
    end
    object FDQPessoasabado: TStringField
      FieldName = 'sabado'
      Origin = 'sabado'
      FixedChar = True
      Size = 1
    end
    object FDQPessoasabadoHoras: TStringField
      FieldName = 'sabadoHoras'
      Origin = 'sabadoHoras'
      Size = 30
    end
    object FDQPessoaemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 60
    end
    object FDQPessoatp_login: TIntegerField
      FieldName = 'tp_login'
      Origin = 'tp_login'
    end
    object FDQPessoaimg_usuario: TBlobField
      FieldName = 'img_usuario'
      Origin = 'img_usuario'
    end
    object FDQPessoastatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      FixedChar = True
      Size = 1
    end
    object FDQPessoacad_aprovado: TStringField
      FieldName = 'cad_aprovado'
      Origin = 'cad_aprovado'
      FixedChar = True
      Size = 1
    end
    object FDQPessoaavaliacao: TIntegerField
      FieldName = 'avaliacao'
      Origin = 'avaliacao'
    end
    object FDQPessoavalor_hora: TStringField
      FieldName = 'valor_hora'
      Origin = 'valor_hora'
      FixedChar = True
      Size = 8
    end
    object FDQPessoaespecialidade: TStringField
      FieldName = 'especialidade'
      Origin = 'especialidade'
      Size = 300
    end
    object FDQPessoaendereco: TStringField
      FieldName = 'endereco'
      Size = 60
    end
    object FDQPessoasenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 40
    end
  end
  object FDQEspecialidade: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from especialidade')
    Left = 32
    Top = 160
    object FDQEspecialidadeid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQEspecialidadedescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 40
    end
    object FDQEspecialidadeServer: TStringField
      FieldName = 'Server'
      Origin = 'Server'
      FixedChar = True
      Size = 1
    end
    object FDQEspecialidadeid_server: TIntegerField
      FieldName = 'id_server'
      Origin = 'id_server'
    end
  end
  object RESTClientTipoPessoa: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://167.114.110.121:8081/api/pessoa'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 648
    Top = 128
  end
  object RESTRequestTipoPessoa: TRESTRequest
    Client = RESTClientTipoPessoa
    Params = <>
    Resource = '?Tipopessoa=1'
    Response = RESTResponseTipoPessoa
    SynchronizedEvents = False
    Left = 648
    Top = 72
  end
  object RESTResponseTipoPessoa: TRESTResponse
    Left = 648
    Top = 16
  end
  object RESTClientPostPessoa: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://167.114.110.121:8081/api/pessoa'
    ContentType = 'application/json'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 656
    Top = 312
  end
  object RESTRequestPostPessoa: TRESTRequest
    Client = RESTClientPostPessoa
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponsePostPessoa
    SynchronizedEvents = False
    Left = 648
    Top = 200
  end
  object RESTResponsePostPessoa: TRESTResponse
    Left = 648
    Top = 256
  end
  object RESTClientEspecialidade: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://167.114.110.121:8081/api/especialidade'
    ContentType = 'application/json'
    Params = <>
    Left = 656
    Top = 376
  end
  object RESTRequestEspecialidade: TRESTRequest
    Client = RESTClientEspecialidade
    Params = <>
    Response = RESTResponseEspecialidade
    SynchronizedEvents = False
    Left = 656
    Top = 432
  end
  object RESTResponseEspecialidade: TRESTResponse
    ContentType = 'application/json'
    Left = 656
    Top = 480
  end
  object RESTClientGetPessoaId: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://167.114.110.121:8081/api/pessoa'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 520
    Top = 24
  end
  object RESTRequestGetPessoaId: TRESTRequest
    Client = RESTClientGetPessoaId
    Params = <>
    Resource = '1'
    Response = RESTResponseGetPessoaId
    SynchronizedEvents = False
    Left = 520
    Top = 72
  end
  object RESTResponseGetPessoaId: TRESTResponse
    ContentType = 'application/json'
    Left = 520
    Top = 120
  end
  object FDQFavorito: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from favorito')
    Left = 32
    Top = 216
    object FDQFavoritoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQFavoritoid_server: TIntegerField
      FieldName = 'id_server'
      Origin = 'id_server'
    end
    object FDQFavoritonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object FDQFavoritocpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 11
    end
    object FDQFavoritocidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 60
    end
    object FDQFavoritouf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object FDQFavoritoespecialidade: TStringField
      FieldName = 'especialidade'
      Origin = 'especialidade'
      Size = 300
    end
  end
  object RESTClientGetPessoaCPF: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://167.114.110.121:8081/api/pessoa'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 512
    Top = 176
  end
  object RESTRequestGetPessoaCPF: TRESTRequest
    Client = RESTClientGetPessoaCPF
    Params = <>
    Resource = '?cpf=03627117980'
    Response = RESTResponseGetPessoaCPF
    SynchronizedEvents = False
    Left = 512
    Top = 288
  end
  object RESTResponseGetPessoaCPF: TRESTResponse
    ContentType = 'application/json'
    Left = 512
    Top = 224
  end
  object RESTClientPutPessoa: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://167.114.110.121:8081/api/pessoa'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 520
    Top = 344
  end
  object RESTRequestPutPessoa: TRESTRequest
    Client = RESTClientPutPessoa
    Method = rmPUT
    Params = <>
    Resource = '2'
    Response = RESTResponsePutPessoa
    SynchronizedEvents = False
    Left = 528
    Top = 456
  end
  object RESTResponsePutPessoa: TRESTResponse
    Left = 528
    Top = 400
  end
end
