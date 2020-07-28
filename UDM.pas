unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IOUtils, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.JSON, FireDAC.Stan.StorageJSON;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQPessoa: TFDQuery;
    FDQEspecialidade: TFDQuery;
    FDQEspecialidadeid: TFDAutoIncField;
    FDQEspecialidadedescricao: TStringField;
    FDQEspecialidadeServer: TStringField;
    RESTClientTipoPessoa: TRESTClient;
    RESTRequestTipoPessoa: TRESTRequest;
    RESTResponseTipoPessoa: TRESTResponse;
    RESTClientPostPessoa: TRESTClient;
    RESTRequestPostPessoa: TRESTRequest;
    RESTResponsePostPessoa: TRESTResponse;
    RESTClientEspecialidade: TRESTClient;
    RESTRequestEspecialidade: TRESTRequest;
    RESTResponseEspecialidade: TRESTResponse;
    FDQEspecialidadeid_server: TIntegerField;
    RESTClientGetPessoaId: TRESTClient;
    RESTRequestGetPessoaId: TRESTRequest;
    RESTResponseGetPessoaId: TRESTResponse;
    FDQFavorito: TFDQuery;
    FDQFavoritoid: TFDAutoIncField;
    FDQFavoritoid_server: TIntegerField;
    FDQFavoritonome: TStringField;
    FDQFavoritocpf: TStringField;
    FDQFavoritocidade: TStringField;
    FDQFavoritouf: TStringField;
    RESTClientGetPessoaCPF: TRESTClient;
    RESTRequestGetPessoaCPF: TRESTRequest;
    RESTResponseGetPessoaCPF: TRESTResponse;
    RESTClientPutPessoa: TRESTClient;
    RESTRequestPutPessoa: TRESTRequest;
    RESTResponsePutPessoa: TRESTResponse;
    FDQPessoaid: TFDAutoIncField;
    FDQPessoaid_server: TIntegerField;
    FDQPessoanome: TStringField;
    FDQPessoacpf: TStringField;
    FDQPessoadt_nascimento: TDateField;
    FDQPessoasexo: TStringField;
    FDQPessoacelular: TStringField;
    FDQPessoacep: TStringField;
    FDQPessoacidade: TStringField;
    FDQPessoauf: TStringField;
    FDQPessoacomplemento: TStringField;
    FDQPessoabairro: TStringField;
    FDQPessoaobservacao: TStringField;
    FDQPessoadomingo: TStringField;
    FDQPessoadomingoHoras: TStringField;
    FDQPessoasegunda: TStringField;
    FDQPessoasegundaHoras: TStringField;
    FDQPessoaterca: TStringField;
    FDQPessoatercaHoras: TStringField;
    FDQPessoaquarta: TStringField;
    FDQPessoaquartaHoras: TStringField;
    FDQPessoaquinta: TStringField;
    FDQPessoaquintaHoras: TStringField;
    FDQPessoasexta: TStringField;
    FDQPessoasextaHoras: TStringField;
    FDQPessoasabado: TStringField;
    FDQPessoasabadoHoras: TStringField;
    FDQPessoaemail: TStringField;
    FDQPessoatp_login: TIntegerField;
    FDQPessoaimg_usuario: TBlobField;
    FDQPessoastatus: TStringField;
    FDQPessoacad_aprovado: TStringField;
    FDQPessoaavaliacao: TIntegerField;
    FDQPessoavalor_hora: TStringField;
    FDQPessoaespecialidade: TStringField;
    FDQPessoaendereco: TStringField;
    FDQFavoritoespecialidade: TStringField;
    FDQPessoasenha: TStringField;
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
begin
    {
    strSQL := EmptyStr;
      strSQL := 'drop table pessoa';
      FDConnection1.ExecSQL(strSQL);
  }

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS especialidade( ' + //
    ' id integer not null primary key autoincrement, ' + //
    ' id_server integer,     ' + //
    ' descricao varchar(40), ' + //
    ' Server char(1))';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  // tp_login = 1 Contratante = 2 Profissional
  strSQL := //

    ' create table IF NOT EXISTS pessoa( 						 ' + //
    ' id integer not null primary key autoincrement, ' + //
    ' id_server integer,                             ' + //
    ' nome varchar(40),                              ' + //
    ' cpf varchar(11),                               ' + //
    ' dt_nascimento date (10),                       ' + //
    ' sexo char(1),                                  ' + //
    ' celular varchar(13),                           ' + //
    ' cep varchar(10),                               ' + //
    ' endereco varchar(60),                          ' + //
    ' cidade varchar(60),                            ' + //
    ' uf char(2),                                    ' + //
    ' complemento varchar(60),                       ' + //
    ' bairro varchar(60),                            ' + //
    ' observacao varchar(300),                       ' + //
    ' domingo char(1),                               ' + //
    ' domingoHoras varchar(30),                      ' + //
    ' segunda char(1),                               ' + //
    ' segundaHoras varchar(30),                      ' + //
    ' terca char(1),                                 ' + //
    ' tercaHoras varchar(30),                        ' + //
    ' quarta char(1),                                ' + //
    ' quartaHoras varchar(30),                       ' + //
    ' quinta char(1),                                ' + //
    ' quintaHoras varchar(30),                       ' + //
    ' sexta char(1),                                 ' + //
    ' sextaHoras varchar(30),                        ' + //
    ' sabado char(1),                                ' + //
    ' sabadoHoras varchar(30),                       ' + //
    ' email varchar(60),                             ' + //
    ' senha varchar(40),                             ' + //
    ' tp_login integer,                              ' + //
    ' img_usuario blob,                              ' + //
    ' status char(1),                                ' + //
    ' cad_aprovado char(1),                          ' + //
    ' avaliacao integer,                             ' + //
    ' valor_hora char(8),                            ' + //
    ' especialidade varchar(300))';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS favorito( ' + //
    ' id integer not null primary key autoincrement,  ' + //
    ' id_server integer,   ' + //
    ' nome varchar(40),    ' + //
    ' cpf varchar(11),     ' + //
    ' cidade varchar(60),  ' + //
    ' uf char(2),          ' + //
    ' especialidade varchar(300))';
  FDConnection1.ExecSQL(strSQL);

  // ativa todas Fdquerys
  FDQPessoa.Active := true;
  FDQEspecialidade.Active := true;
  FDQFavorito.Active := true;
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
