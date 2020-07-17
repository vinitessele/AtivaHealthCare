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
  object FDQLogin: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from login')
    Left = 32
    Top = 224
    object FDQLoginid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQLoginnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 40
    end
    object FDQLogincpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 11
    end
    object FDQLogindt_nascimento: TDateField
      FieldName = 'dt_nascimento'
      Origin = 'dt_nascimento'
    end
    object FDQLogincelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      Size = 13
    end
    object FDQLogincep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object FDQLoginendreco: TStringField
      FieldName = 'endreco'
      Origin = 'endreco'
      Size = 60
    end
    object FDQLogincidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 60
    end
    object FDQLoginuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      FixedChar = True
      Size = 2
    end
    object FDQLogincomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 60
    end
    object FDQLoginbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 60
    end
    object FDQLoginobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 300
    end
    object FDQLogindomingo: TStringField
      FieldName = 'domingo'
      Origin = 'domingo'
      FixedChar = True
      Size = 1
    end
    object FDQLogindomingoHoras: TStringField
      FieldName = 'domingoHoras'
      Origin = 'domingoHoras'
      Size = 30
    end
    object FDQLoginsegunda: TStringField
      FieldName = 'segunda'
      Origin = 'segunda'
      FixedChar = True
      Size = 1
    end
    object FDQLoginsegundaHoras: TStringField
      FieldName = 'segundaHoras'
      Origin = 'segundaHoras'
      Size = 30
    end
    object FDQLoginterca: TStringField
      FieldName = 'terca'
      Origin = 'terca'
      FixedChar = True
      Size = 1
    end
    object FDQLogintercaHoras: TStringField
      FieldName = 'tercaHoras'
      Origin = 'tercaHoras'
      Size = 30
    end
    object FDQLoginquarta: TStringField
      FieldName = 'quarta'
      Origin = 'quarta'
      FixedChar = True
      Size = 1
    end
    object FDQLoginquartaHoras: TStringField
      FieldName = 'quartaHoras'
      Origin = 'quartaHoras'
      Size = 30
    end
    object FDQLoginquinta: TStringField
      FieldName = 'quinta'
      Origin = 'quinta'
      FixedChar = True
      Size = 1
    end
    object FDQLoginquintaHoras: TStringField
      FieldName = 'quintaHoras'
      Origin = 'quintaHoras'
      Size = 30
    end
    object FDQLoginsexta: TStringField
      FieldName = 'sexta'
      Origin = 'sexta'
      FixedChar = True
      Size = 1
    end
    object FDQLoginsextaHoras: TStringField
      FieldName = 'sextaHoras'
      Origin = 'sextaHoras'
      Size = 30
    end
    object FDQLoginsabado: TStringField
      FieldName = 'sabado'
      Origin = 'sabado'
      FixedChar = True
      Size = 1
    end
    object FDQLoginsabadoHoras: TStringField
      FieldName = 'sabadoHoras'
      Origin = 'sabadoHoras'
      Size = 30
    end
    object FDQLoginemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 60
    end
    object FDQLoginsenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 10
    end
    object FDQLogintp_login: TIntegerField
      FieldName = 'tp_login'
      Origin = 'tp_login'
    end
    object FDQLoginimg_usuario: TBlobField
      FieldName = 'img_usuario'
      Origin = 'img_usuario'
    end
    object FDQLoginsexo: TStringField
      FieldName = 'sexo'
      Origin = 'sexo'
      FixedChar = True
      Size = 1
    end
    object FDQLoginhash: TStringField
      FieldName = 'hash'
      Origin = 'hash'
      FixedChar = True
      Size = 32
    end
  end
  object FDQConfig: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from config where campo= :versao')
    Left = 32
    Top = 104
    ParamData = <
      item
        Name = 'VERSAO'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object FDQEspecialidade: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from especialidade')
    Left = 32
    Top = 160
    object FDQEspecialidadeid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQEspecialidadedescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 40
    end
  end
  object FDQProfissionalEspecialidade: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from ProfissionalEspecialidade ')
    Left = 40
    Top = 296
    object FDQProfissionalEspecialidadeid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQProfissionalEspecialidadeid_especialidade: TIntegerField
      FieldName = 'id_especialidade'
      Origin = 'id_especialidade'
    end
    object FDQProfissionalEspecialidadeid_login: TIntegerField
      FieldName = 'id_login'
      Origin = 'id_login'
    end
  end
end
