unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IOUtils;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQLogin: TFDQuery;
    FDQConfig: TFDQuery;
    FDQLoginid: TFDAutoIncField;
    FDQLoginnome: TStringField;
    FDQLogincpf: TStringField;
    FDQLogindt_nascimento: TDateField;
    FDQLogincelular: TStringField;
    FDQLogincep: TStringField;
    FDQLoginendreco: TStringField;
    FDQLogincidade: TStringField;
    FDQLoginuf: TStringField;
    FDQLogincomplemento: TStringField;
    FDQLoginbairro: TStringField;
    FDQLoginobservacao: TStringField;
    FDQLogindomingo: TStringField;
    FDQLogindomingoHoras: TStringField;
    FDQLoginsegunda: TStringField;
    FDQLoginsegundaHoras: TStringField;
    FDQLoginterca: TStringField;
    FDQLogintercaHoras: TStringField;
    FDQLoginquarta: TStringField;
    FDQLoginquartaHoras: TStringField;
    FDQLoginquinta: TStringField;
    FDQLoginquintaHoras: TStringField;
    FDQLoginsexta: TStringField;
    FDQLoginsextaHoras: TStringField;
    FDQLoginsabado: TStringField;
    FDQLoginsabadoHoras: TStringField;
    FDQLoginemail: TStringField;
    FDQLoginsenha: TStringField;
    FDQLogintp_login: TIntegerField;
    FDQLoginimg_usuario: TBlobField;
    FDQLoginhash: TStringField;
    FDQLoginsexo: TStringField;
    FDQEspecialidade: TFDQuery;
    FDQEspecialidadeid: TFDAutoIncField;
    FDQEspecialidadedescricao: TStringField;
    FDQProfissionalEspecialidade: TFDQuery;
    FDQProfissionalEspecialidadeid: TFDAutoIncField;
    FDQProfissionalEspecialidadeid_especialidade: TIntegerField;
    FDQProfissionalEspecialidadeid_login: TIntegerField;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TDM.FDConnection1AfterConnect(Sender: TObject);
var
  strSQL: string;
  versao: string;
begin
  strSQL := //
    ' create table IF NOT EXISTS config( ' + //
    ' campo varchar(30),' + //
    ' valor varchar(30))';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS especialidade( ' + //
    ' id integer not null primary key autoincrement, ' + //
    ' descricao varchar(40), ' + //
    ' Server char(1))';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  // tp_login = 1 Contratante = 2 Profissional
  strSQL := //
    ' create table IF NOT EXISTS login(   ' + //
    ' id integer not null primary key autoincrement,' + //
    ' nome varchar(40),                              ' + //
    ' cpf varchar(11),                               ' + //
    ' dt_nascimento date (10),                       ' + //
    ' celular varchar(13),                           ' + //
    ' cep varchar(10),                               ' + //
    ' endreco varchar(60),                           ' + //
    ' cidade varchar(60),                            ' + //
    ' uf char(2),                                    ' + //
    ' complemento varchar(60),                      ' + //
    ' bairro varchar(60),                           ' + //
    ' observacao varchar(300),                      ' + //
    ' domingo char(1),                              ' + //
    ' domingoHoras varchar(30),                     ' + //
    ' segunda char(1),                              ' + //
    ' segundaHoras varchar(30),                     ' + //
    ' terca char(1),                                ' + //
    ' tercaHoras varchar(30),                       ' + //
    ' quarta char(1),                               ' + //
    ' quartaHoras varchar(30),                      ' + //
    ' quinta char(1),                               ' + //
    ' quintaHoras varchar(30),                      ' + //
    ' sexta char(1),                                ' + //
    ' sextaHoras varchar(30),                       ' + //
    ' sabado char(1),                               ' + //
    ' sabadoHoras varchar(30),                      ' + //
    ' email varchar(60),                            ' + //
    ' senha varchar(10),                            ' + //
    ' tp_login integer,                             ' + //
    ' img_usuario blob,                             ' + //
    ' sexo char(1),                                 ' + //
    ' Server char(1),                               ' + //
    ' cad_aprovado char(1),                         ' + //
    ' hash char(32))';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS ProfissionalEspecialidade (  ' + //
    ' id integer not null primary key autoincrement,  ' + //
    ' id_especialidade integer,   ' + //
    ' id_login integer, ' + //
    ' Server char(1))  ';
  FDConnection1.ExecSQL(strSQL);

  DM.FDQConfig.Active := false;
  DM.FDQConfig.SQL.Clear;
  DM.FDQConfig.SQL.Add('select * from config where campo = ''versao''  ');
  DM.FDQConfig.Open();
  versao := DM.FDQConfig.FieldByName('valor').AsString;
  // atualiza versao
  if versao = '1.0' then
  begin
    versao := '1.1';
    // adiciona os campos
    // DM.FDConnection1.ExecSQL('alter table config add a integer');

    DM.FDQConfig.Active := false;
    DM.FDQConfig.SQL.Clear;
    DM.FDQConfig.SQL.Add
      ('update config set valor =:valor where campo = ''versao''');
    DM.FDQConfig.ParamByName('valor').Value := versao;
    DM.FDQConfig.ExecSQL;
  end;

  // ativa todas Fdquerys
  DM.FDQLogin.Active := true;
  DM.FDQEspecialidade.Active  := true;
  DM.FDQProfissionalEspecialidade.Active  := true;
end;

procedure TDM.FDConnection1BeforeConnect(Sender: TObject);
var
  strPath: string;
begin
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine
    ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\bd\',
    'bd.sqlite');
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
    'bd.sqlite');
{$ENDIF}
  FDConnection1.Params.Values['UseUnicode'] := 'False';
  FDConnection1.Params.Values['DATABASE'] := strPath;
end;

end.
