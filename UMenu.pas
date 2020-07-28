unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, DateUtils, Data.DB, System.JSON, IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Ani, FMX.Controls.Presentation, FMX.MultiView,
  FMX.Layouts, FMX.TabControl, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, FMX.ScrollBox, FMX.Memo, REST.Types,
  System.permissions, IdTCPClient, Soap.EncdDecd, System.NetEncoding,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, web.HTTPApp,
  FMX.ListBox, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.DBScope, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFormat;

type
  TFrmMenu = class(TForm)
    rect_toolbar: TRectangle;
    lbl_titulo: TLabel;
    img_busca: TImage;
    img_cancelar: TImage;
    rect_busca: TRectangle;
    img_cancel_busca: TImage;
    AnimationBusca: TFloatAnimation;
    RoundRect1: TRoundRect;
    edt_busca: TEdit;
    img_salvar: TImage;
    img_favorito: TImage;
    btnMenu: TSpeedButton;
    rect_tabs: TRectangle;
    layout_aba1: TLayout;
    img_aba1: TImage;
    img_aba1_sel: TImage;
    img_pulso: TImage;
    AnimationPulso: TFloatAnimation;
    AnimationPulsoW: TFloatAnimation;
    layout_aba2: TLayout;
    img_aba2: TImage;
    img_aba2_sel: TImage;
    layout_aba3: TLayout;
    img_aba3: TImage;
    img_aba3_sel: TImage;
    layout_aba4: TLayout;
    img_aba4: TImage;
    img_aba4_sel: TImage;
    img_ball: TImage;
    AnimationBall: TFloatAnimation;
    MultiView1: TMultiView;
    LayoutMenuTopo: TLayout;
    VertScrollBox1: TVertScrollBox;
    CircleFoto: TCircle;
    LabelNomeUser: TLabel;
    RectMeusDados: TRoundRect;
    Label1: TLabel;
    RectFavoritos: TRoundRect;
    Label2: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ActionList1: TActionList;
    TabAction1: TChangeTabAction;
    TabAction2: TChangeTabAction;
    VertScrollBoxMeusDados: TVertScrollBox;
    Image1: TImage;
    Layout1: TLayout;
    LayoutFoto: TLayout;
    CircleFotoCadastro: TCircle;
    img_add: TImage;
    ActionPhotoLibrary: TTakePhotoFromLibraryAction;
    LayoutNome: TLayout;
    Edt_Nome: TEdit;
    Line3: TLine;
    Label3: TLabel;
    LayoutCPF: TLayout;
    Edt_Cpf: TEdit;
    Line2: TLine;
    Label5: TLabel;
    LayoutCompEnd1: TLayout;
    LayoutCEP: TLayout;
    Label4: TLabel;
    Edt_Cep: TEdit;
    Line1: TLine;
    LayoutGrupo: TLayout;
    edt_Celular: TEdit;
    Line4: TLine;
    Label6: TLabel;
    LayoutEnd: TLayout;
    Edt_end: TEdit;
    Line5: TLine;
    Label7: TLabel;
    LayoutCompEnd: TLayout;
    LayoutComplemento: TLayout;
    Label8: TLabel;
    Edt_complemento: TEdit;
    Line6: TLine;
    LayoutCidade: TLayout;
    Label9: TLabel;
    Edt_cidade: TEdit;
    Line7: TLine;
    LayoutBairro: TLayout;
    Label10: TLabel;
    Edt_bairro: TEdit;
    Line8: TLine;
    LayoutNascimento: TLayout;
    edt_nascimento: TEdit;
    Line9: TLine;
    Label11: TLabel;
    LabelIdade: TLabel;
    LayoutObservacao: TLayout;
    Line10: TLine;
    Label13: TLabel;
    LayoutDIsponibilidade: TLayout;
    Label14: TLabel;
    CheckBoxSegunda: TCheckBox;
    CheckBoxTerca: TCheckBox;
    CheckBoxQuinta: TCheckBox;
    CheckBoxQuarta: TCheckBox;
    CheckBoxSexta: TCheckBox;
    CheckBoxSabado: TCheckBox;
    CheckBoxDomingo: TCheckBox;
    MemoObservacao: TMemo;
    EdtDomingo: TEdit;
    EdtSegunda: TEdit;
    EdtTerca: TEdit;
    EdtQuarta: TEdit;
    EdtSexta: TEdit;
    EdtQuinta: TEdit;
    EdtSabado: TEdit;
    StyleBook1: TStyleBook;
    edt_uf: TEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabAction3: TChangeTabAction;
    TabAction4: TChangeTabAction;
    Layout3: TLayout;
    Label12: TLabel;
    VertScrollBoxFavoritos: TVertScrollBox;
    Layout4: TLayout;
    LabelProfissionais2: TLabel;
    VertScrollBoxLista: TVertScrollBox;
    LayoutSexo: TLayout;
    LayoutCelular: TLayout;
    Label16: TLabel;
    ComboBox1: TComboBox;
    BindingsList1: TBindingsList;
    RoundProfissionais: TRoundRect;
    LabelProfissionais: TLabel;
    LayoutEspecialidade: TLayout;
    Line11: TLine;
    Label17: TLabel;
    VertScrollBox5Especialidade: TVertScrollBox;
    LayoutValor: TLayout;
    Label15: TLabel;
    edt_valor: TEdit;
    Line12: TLine;
    ImageFavoritos: TImage;
    Label18: TLabel;
    TabItem5: TTabItem;
    TabAction5: TChangeTabAction;
    VertScrollBox2: TVertScrollBox;
    Layout2: TLayout;
    Layout5: TLayout;
    CircleFotoContratado: TCircle;
    Layout6: TLayout;
    Edt_visualizarNome: TEdit;
    Line13: TLine;
    Label19: TLabel;
    Layout19: TLayout;
    Line22: TLine;
    Label30: TLabel;
    MemoObservacao1: TMemo;
    Layout20: TLayout;
    Label31: TLabel;
    CheckBoxSegunda1: TCheckBox;
    CheckBoxTerca1: TCheckBox;
    CheckBoxquinta1: TCheckBox;
    CheckBoxquarta1: TCheckBox;
    CheckBoxsexta1: TCheckBox;
    CheckBoxsabado1: TCheckBox;
    CheckBoxDomingo1: TCheckBox;
    EditDomingo: TEdit;
    Editsegunda: TEdit;
    Editterca: TEdit;
    Editquarta: TEdit;
    Editsexta: TEdit;
    Editquinta: TEdit;
    Editsabado: TEdit;
    Layoutespecialidade2: TLayout;
    Line23: TLine;
    Label32: TLabel;
    Layoutvalor2: TLayout;
    Label33: TLabel;
    EditValor: TEdit;
    Layout8: TLayout;
    RectaContato: TRectangle;
    Label21: TLabel;
    Memo1: TMemo;
    labelIdade1: TLabel;
    LabelAvaliacao: TLabel;
    LayoutEmail: TLayout;
    Label20: TLabel;
    edt_email: TEdit;
    Line14: TLine;
    procedure RectMeusDadosClick(Sender: TObject);
    procedure ActionPhotoLibraryDidFinishTaking(Image: TBitmap);
    procedure edt_nascimentoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img_salvarClick(Sender: TObject);
    procedure img_cancelarClick(Sender: TObject);
    procedure Edt_CepExit(Sender: TObject);
    procedure layout_aba1Click(Sender: TObject);
    procedure AnimationBallFinish(Sender: TObject);
    procedure layout_aba2Click(Sender: TObject);
    procedure layout_aba3Click(Sender: TObject);
    procedure layout_aba4Click(Sender: TObject);
    procedure SelecionaAba(lyt: TLayout);
    procedure Pulsar(aba: integer);
    procedure PaintIcone(aba: integer);
    procedure AddItemFavorito(codigo: integer; avaliacao: real;
      nome, cidade, especialidade, valor, foto: string);
    procedure AddItem(codigo: integer; avaliacao: real;
      nome, profissao, cidade, especialidade, valor, foto: string;
      favorito: boolean);
    procedure CarregarMeusDados;
    procedure OcultaBotoes;
    procedure CalculaIdade;
    procedure FormCreate(Sender: TObject);
    procedure RectFavoritosClick(Sender: TObject);
    procedure RoundProfissionaisClick(Sender: TObject);
    procedure edt_nascimentoTyping(Sender: TObject);
    procedure edt_valorTyping(Sender: TObject);
    procedure edt_emailExit(Sender: TObject);
    procedure Edt_NomeExit(Sender: TObject);
    procedure Edt_CpfExit(Sender: TObject);
  private
    procedure CarregarEspecialidades;
    procedure atualizaEspecialidade;
    procedure InsertEspecialidade(Sender: TObject);
    procedure EnviaRegistrosPessoa;
    procedure CarregarListaPessoas(tpPessoa: integer);
    procedure CarregarEspecialidadesServidor;
    procedure AddFavoritos(Sender: TObject);
    procedure CarregarFavoritos(tpPessoa: integer);
    procedure getPessoaID(id_server: integer; var retorno: TJSONObject);
    procedure VisualizarPessoa(Sender: TObject);
    procedure ExtrairEspecialidade(especialidadejson: string;
      var especialidade: string);
    function Base64FromBitmap(Bitmap: TBitmap): string;

    { Private declarations }
  public
    { Public declarations }
    conexao: boolean;
    especialidade: string;
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses UDM, FMX.DialogService, loading
{$IFDEF ANDROID}
    , Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}
    ;

function CheckInternet: boolean;

var
  TCPClient: TIdTCPClient;

begin
  TCPClient := TIdTCPClient.Create(NIL);

  try
    try
      TCPClient.ReadTimeout := 2000;
      TCPClient.ConnectTimeout := 2000;
      TCPClient.Port := 443;
      TCPClient.Host := 'www.google.com';
      TCPClient.Connect;
      TCPClient.Disconnect;
      Result := true;

    except
      Result := False;
    end; { try / except }

  finally
    TCPClient.Free;
  end; { try / finally }
end;

function BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

function TFrmMenu.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
  Encoding: TBase64Encoding;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);

    try
      Encoding := TBase64Encoding.Create(0);
      Encoding.Encode(Input, Output);
      Result := Output.DataString;
    finally
      Encoding.Free;
      Output.Free;
    end;

  finally
    Input.Free;
  end;
end;

function ValidarEMail(aStr: string): boolean;
begin
  aStr := Trim(UpperCase(aStr));
  if Pos('@', aStr) > 1 then
  begin
    Delete(aStr, 1, Pos('@', aStr));
    Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
  end
  else
    Result := False;
end;

function ValidarCpf(num: string): boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  d1, d2: integer;
  digitado, calculado: string;
begin
{$IFDEF ANDROID}
  n1 := StrToInt(num[0]);
  n2 := StrToInt(num[1]);
  n3 := StrToInt(num[2]);
  n4 := StrToInt(num[3]);
  n5 := StrToInt(num[4]);
  n6 := StrToInt(num[5]);
  n7 := StrToInt(num[6]);
  n8 := StrToInt(num[7]);
  n9 := StrToInt(num[8]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9
    + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 +
    n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[9] + num[10];
{$ENDIF}
{$IFDEF MSWINDOWS}
  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9
    + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 +
    n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[10] + num[11];
{$ENDIF}
  if calculado = digitado then
    Result := true
  else
    Result := False;
end;

procedure TFrmMenu.CarregarListaPessoas(tpPessoa: integer);
var
  retorno: TJSONArray;
  nome, profissao, cidade, estado, especialidadejson, especialidade, pont, vlr,
    foto: string;
  pontuacao, valor: real;
  id: integer;
  o: TJSONObject;
  i, x, count: integer;
  StrList: TStringList;
  favorito: boolean;
begin
  dm.RESTRequestTipoPessoa.Resource := '?tipopessoa={tp}';
  dm.RESTRequestTipoPessoa.Params.AddUrlSegment('tp', inttostr(tpPessoa));
  dm.RESTRequestTipoPessoa.Execute;

  retorno := dm.RESTRequestTipoPessoa.Response.JSONValue as TJSONArray;

  for i := 0 to retorno.Size - 1 do
  begin
    pontuacao := 0;
    o := retorno.Items[i] as TJSONObject;
    nome := o.GetValue('nome').Value;
    id := StrToInt(o.GetValue('id').Value);
    cidade := o.GetValue('cidade').Value;
    estado := o.GetValue('uf').Value;
    especialidadejson := o.GetValue('especialidade').Value;
    pont := o.GetValue('avaliacao').Value;
    vlr := Trim(o.GetValue('valor_hora').Value);
    foto := o.GetValue('img_usuario').Value;

    if pont <> 'null' then
      pontuacao := StrToFloat(pont)
    else
      pontuacao := 0;

    if (vlr = 'null') or (vlr = '') then
      vlr := '0';

    if dm.FDQPessoatp_login.AsInteger = 1 then
      ExtrairEspecialidade(especialidadejson, especialidade)
    else
      especialidade := o.GetValue('observacao').Value;

    favorito := False;
    favorito := dm.FDQFavorito.Locate('id_server', id, []);

    if nome <> EmptyStr then
      AddItem(id, pontuacao, nome, profissao, cidade + '-' + estado,
        especialidade, vlr, foto, favorito);
  end;

end;

procedure TFrmMenu.Edt_CepExit(Sender: TObject);
var
  retorno: TJSONObject;
begin
  if Edt_Cep.Text <> EmptyStr then
  begin
    RESTRequest1.Resource := '{cep}/json/';
    RESTRequest1.Params.AddUrlSegment('cep', Edt_Cep.Text);
    RESTRequest1.Execute;

    retorno := RESTRequest1.Response.JSONValue as TJSONObject;

    Edt_cidade.Text := retorno.GetValue('localidade').Value;
    edt_uf.Text := retorno.GetValue('uf').Value;
    Edt_end.Text := retorno.GetValue('logradouro').Value;
    Edt_bairro.Text := retorno.GetValue('bairro').Value;

  end;
end;

procedure TFrmMenu.Edt_CpfExit(Sender: TObject);
begin
  if not ValidarCpf(Edt_Cpf.Text) then
  begin
    ShowMessage('CPF é inválido!');
    Edt_Cpf.SetFocus;
    Exit;
  end;
end;

procedure TFrmMenu.edt_emailExit(Sender: TObject);
begin
  if not ValidarEMail(edt_email.Text) then
  begin
    ShowMessage('Endereço de E-mail informado incorretamente.');
    Abort;
  end;
end;

procedure TFrmMenu.edt_nascimentoExit(Sender: TObject);
begin
  CalculaIdade;
end;

procedure TFrmMenu.edt_nascimentoTyping(Sender: TObject);
begin
  Formatar(edt_nascimento, TFormato.Dt);
end;

procedure TFrmMenu.Edt_NomeExit(Sender: TObject);
begin
  if Edt_Nome.Text <> EmptyStr then
  begin
    ShowMessage('Nome é campo obrigatório');
    Abort;
  end;
end;

procedure TFrmMenu.edt_valorTyping(Sender: TObject);
begin
  Formatar(edt_valor, TFormato.valor);
end;

procedure TFrmMenu.atualizaEspecialidade;
begin
  dm.FDQEspecialidade.Close;
  dm.FDQEspecialidade.Open;
  dm.FDQEspecialidade.First;
end;

procedure TFrmMenu.CarregarEspecialidades;
var
  check: TCheckBox;
  StrList: TStringList;
  i, count: integer;
begin
  atualizaEspecialidade;
  i := 1;
  while not dm.FDQEspecialidade.EOF do
  begin
    check := TCheckBox.Create(VertScrollBox5Especialidade);
    with check do
    begin
      Align := TAlignLayout.Top;
      Text := dm.FDQEspecialidadedescricao.AsString;
      TextSettings.FontColor := $EF700680;
      Margins.Top := 5;
      Margins.Left := 5;
      TagString := dm.FDQEspecialidadeid.AsString;
      Name := 'check' + dm.FDQEspecialidadeid.AsString;
      OnClick := InsertEspecialidade;

      StrList := TStringList.Create;
      try
        // alimentar a lista com a string
        StrList.Delimiter := '|';
        StrList.StrictDelimiter := true;
        StrList.DelimitedText := dm.FDQPessoaespecialidade.AsString;
        count := StrList.count;
        if count <> 0 then
        begin
          if StrList[i] = dm.FDQEspecialidadeid.AsString then
          begin
            IsChecked := true;
            i := i + 1;
            if i >= count then
              i := 0;
          end;
        end;
      finally
        StrList.Free;
      end;
    end;
    VertScrollBox5Especialidade.AddObject(check);
    dm.FDQEspecialidade.Next;
  end;

end;

// TODO: inserir especialidades para o profissional
procedure TFrmMenu.InsertEspecialidade(Sender: TObject);
var
  coditem: integer;
begin
  coditem := StrToInt(TCheckBox(Sender).TagString);
  especialidade := especialidade + '|' + inttostr(coditem);
end;

procedure TFrmMenu.FormCreate(Sender: TObject);
begin
  conexao := CheckInternet;
  // Atualização app
  if conexao then
  begin

    CarregarEspecialidadesServidor;

  end;
end;

procedure TFrmMenu.CarregarEspecialidadesServidor;
var
  retorno: TJSONArray;
  descricao: string;
  id: integer;
  o: TJSONObject;
  i: integer;
begin
  dm.FDQEspecialidade.Close;
  dm.FDQEspecialidade.Open();
  dm.RESTRequestEspecialidade.Execute;

  retorno := dm.RESTRequestEspecialidade.Response.JSONValue as TJSONArray;
  for i := 0 to retorno.Size - 1 do
  begin
    o := retorno.Items[i] as TJSONObject;
    descricao := o.GetValue('descricao').Value;
    id := StrToInt(o.GetValue('id').Value);
    if not dm.FDQEspecialidade.Locate('id_server', id, []) then
    begin
      dm.FDQEspecialidade.Append;
      dm.FDQEspecialidadedescricao.AsString := descricao;
      dm.FDQEspecialidadeServer.AsString := 'S';
      dm.FDQEspecialidadeid_server.AsInteger := id;
      dm.FDQEspecialidade.Post;
      dm.FDConnection1.CommitRetaining;
    end;
  end;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
var
  vFoto: TStream;
begin
  TabAction1.Execute;
  SelecionaAba(layout_aba1);
  LabelNomeUser.Text := dm.FDQPessoanome.AsString;
  vFoto := dm.FDQPessoa.CreateBlobStream
    (dm.FDQPessoa.FieldByName('img_usuario'), bmRead);

  if not dm.FDQPessoaimg_usuario.IsNull then
  begin
    CircleFoto.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
    CircleFotoCadastro.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
  end;

  CarregarEspecialidades;

  if dm.FDQPessoatp_login.AsInteger = 1 then
  begin
    LabelProfissionais.Text := 'Profissionais';
    LabelProfissionais2.Text := 'Profissionais';
    CarregarListaPessoas(2);
    CarregarFavoritos(2);
    LayoutDIsponibilidade.Visible := False;
  end
  else
  begin
    LabelProfissionais2.Text := 'Contratante';
    LabelProfissionais.Text := 'Contratante';
    CarregarListaPessoas(1);
    CarregarFavoritos(1);
    LayoutDIsponibilidade.Visible := true;
  end;

end;

procedure TFrmMenu.CarregarFavoritos(tpPessoa: integer);
var
  retorno: TJSONObject;
  nome, cidade, estado, cpf, especialidadejson, valor, foto, point: string;
  pontuacao: real;
  id, id_server: integer;
begin
  dm.FDQFavorito.Close;
  dm.FDQFavorito.Open;

  id_server := dm.FDQFavoritoid_server.AsInteger;

  while not dm.FDQFavorito.EOF do
  begin
    ImageFavoritos.Visible := False;

    getPessoaID(id_server, retorno);

    nome := retorno.GetValue('nome').Value;
    id := StrToInt(retorno.GetValue('id').Value);
    cidade := retorno.GetValue('cidade').Value;
    estado := retorno.GetValue('uf').Value;
    cpf := retorno.GetValue('cpf').Value;
    especialidadejson := retorno.GetValue('especialidade').Value;
    point := retorno.GetValue('avaliacao').Value;
    if (point <> EmptyStr) and (point <> 'null') then
      pontuacao := StrToFloat(point);
    valor := retorno.GetValue('valor_hora').Value;

    ExtrairEspecialidade(especialidadejson, especialidade);

    AddItemFavorito(dm.FDQFavoritoid_server.AsInteger, pontuacao,
      dm.FDQFavoritonome.AsString, dm.FDQFavoritocidade.AsString + '-' +
      dm.FDQFavoritouf.AsString, especialidade, valor, foto);
    dm.FDQFavorito.Next;
  end;
end;

procedure TFrmMenu.getPessoaID(id_server: integer; var retorno: TJSONObject);
begin
  dm.RESTRequestGetPessoaId.Resource := '{id}';
  dm.RESTRequestGetPessoaId.Params.AddUrlSegment('id', inttostr(id_server));
  dm.RESTRequestGetPessoaId.Execute;

  retorno := dm.RESTRequestGetPessoaId.Response.JSONValue as TJSONObject;
end;

procedure TFrmMenu.AnimationBallFinish(Sender: TObject);
begin
  PaintIcone(AnimationBall.Tag);
end;

procedure TFrmMenu.CalculaIdade;
begin
  if edt_nascimento.Text <> EmptyStr then
  begin
    LabelIdade.Text := inttostr(DateUtils.YearsBetween(date,
      StrToDate(edt_nascimento.Text)));
  end;
end;

procedure TFrmMenu.img_cancelarClick(Sender: TObject);
begin
  OcultaBotoes;
  TabAction1.Execute;
  dm.FDQPessoa.Cancel;
  dm.FDConnection1.RollbackRetaining;
end;

procedure TFrmMenu.img_salvarClick(Sender: TObject);
begin
  if Edt_Cpf.Text = EmptyStr then
  begin
    Edt_Cpf.SetFocus;
    ShowMessage('CPF é um campo obrigatório');
    Abort;
  end;

  dm.FDQPessoa.Edit;
  dm.FDQPessoanome.AsString := Edt_Nome.Text;
  dm.FDQPessoacpf.AsString := Edt_Cpf.Text;
  dm.FDQPessoacep.AsString := Edt_Cep.Text;
  dm.FDQPessoacelular.AsString := edt_Celular.Text;
  dm.FDQPessoaendereco.AsString := Edt_end.Text;
  dm.FDQPessoacomplemento.AsString := Edt_complemento.Text;
  dm.FDQPessoacidade.AsString := Edt_cidade.Text;
  dm.FDQPessoauf.AsString := edt_uf.Text;
  dm.FDQPessoabairro.AsString := Edt_bairro.Text;
  dm.FDQPessoadt_nascimento.AsString := edt_nascimento.Text;
  dm.FDQPessoaobservacao.AsString := MemoObservacao.Text;
  dm.FDQPessoadomingoHoras.AsString := EdtDomingo.Text;
  dm.FDQPessoasegundaHoras.AsString := EdtSegunda.Text;
  dm.FDQPessoatercaHoras.AsString := EdtTerca.Text;
  dm.FDQPessoaquartaHoras.AsString := EdtQuarta.Text;
  dm.FDQPessoaquintaHoras.AsString := EdtQuinta.Text;
  dm.FDQPessoasextaHoras.AsString := EdtSexta.Text;
  dm.FDQPessoasabadoHoras.AsString := EdtSabado.Text;
  dm.FDQPessoasexo.AsString := ComboBox1.Items[ComboBox1.ItemIndex];
  dm.FDQPessoavalor_hora.AsString := edt_valor.Text;
  dm.FDQPessoaespecialidade.AsString := especialidade;
  dm.FDQPessoacad_aprovado.AsString := 'N';
  dm.FDQPessoastatus.AsString := 'A';

  if CheckBoxDomingo.IsChecked then
    dm.FDQPessoadomingo.AsString := 'X'
  else
    dm.FDQPessoadomingo.AsString := EmptyStr;

  if CheckBoxSegunda.IsChecked then
    dm.FDQPessoasegunda.AsString := 'X'
  else
    dm.FDQPessoasegunda.AsString := EmptyStr;

  if CheckBoxTerca.IsChecked then
    dm.FDQPessoaterca.AsString := 'X'
  else
    dm.FDQPessoaterca.AsString := EmptyStr;

  if CheckBoxQuarta.IsChecked then
    dm.FDQPessoaquarta.AsString := 'X'
  else
    dm.FDQPessoaquarta.AsString := EmptyStr;

  if CheckBoxQuinta.IsChecked then
    dm.FDQPessoaquinta.AsString := 'X'
  else
    dm.FDQPessoaquinta.AsString := EmptyStr;

  if CheckBoxSexta.IsChecked then
    dm.FDQPessoasexta.AsString := 'X'
  else
    dm.FDQPessoasexta.AsString := EmptyStr;

  if CheckBoxSabado.IsChecked then
    dm.FDQPessoasabado.AsString := 'X'
  else
    dm.FDQPessoasabado.AsString := EmptyStr;

  dm.FDQPessoa.Post;
  dm.FDConnection1.CommitRetaining;

  EnviaRegistrosPessoa;
  OcultaBotoes;
  TabAction1.Execute;

end;

procedure TFrmMenu.EnviaRegistrosPessoa();
var
  f: TField;
  o: TJSONObject;
  retornoPost, retornoverifica: TJSONObject;
  sql: string;
  id: string;
  foto64: string;
begin
  if dm.FDQPessoaid_server.AsString = EmptyStr then
  begin
    // se não estiver no server enviar dados pessoais
    dm.FDQPessoa.First;
    while not dm.FDQPessoa.EOF do
    begin
      o := TJSONObject.Create;
      for f in dm.FDQPessoa.Fields do
        if f.FieldName = 'img_usuario' then
        begin
          foto64 := Base64FromBitmap(CircleFoto.Fill.Bitmap.Bitmap);
          // o.AddPair(f.FieldName, EmptyStr)
          o.AddPair(f.FieldName, foto64)
        end
        else
          o.AddPair(f.FieldName, VarToStr(f.Value));
      dm.FDQPessoa.Next;

      dm.RESTRequestPostPessoa.AddBody(o.ToString,
        ContentTypeFromString('application/json'));
      ShowMessage(o.ToString);
      dm.RESTRequestPostPessoa.Execute;
      try
        retornoPost := dm.RESTRequestPostPessoa.Response.JSONValue as
          TJSONObject;

        if dm.RESTResponsePostPessoa.StatusCode = 201 then
          ShowMessage('Incluido com sucesso.');
      finally
        sleep(100);
      end;
    end;
    sleep(100);
    // Primeiro verifica se o usuário não esta no server pelo cpf
    dm.RESTRequestgetPessoaCpf.Resource := '?cpf={cpf}';
    dm.RESTRequestgetPessoaCpf.Params.AddUrlSegment('cpf',
      dm.FDQPessoacpf.AsString);
    try
      dm.RESTRequestgetPessoaCpf.Execute;
      retornoverifica := dm.RESTRequestgetPessoaCpf.Response.JSONValue as
        TJSONObject;
    finally
      sleep(100);
      if retornoverifica <> nil then
      begin
        // TODO: Aqui tenho que pegar o ID e retornar
        id := retornoverifica.GetValue('id').Value;

        sql := 'update pessoa set id_server = ' + id + ' where id = ' +
          dm.FDQPessoaid.AsString;
        dm.FDConnection1.ExecSQL(sql);
        dm.FDConnection1.CommitRetaining;
      end
    end;
  end
  else
  begin
    // TODO aqui chamada do put
    dm.RESTRequestPutPessoa.Resource := '{id}';
    dm.RESTRequestgetPessoaCpf.Params.AddUrlSegment('id',
      dm.FDQPessoaid_server.AsString);
    dm.RESTRequestgetPessoaCpf.Execute;
  end;

end;

procedure TFrmMenu.layout_aba1Click(Sender: TObject);
begin
  SelecionaAba(TLayout(Sender));
  OcultaBotoes;
end;

procedure TFrmMenu.layout_aba2Click(Sender: TObject);
begin
  SelecionaAba(TLayout(Sender));
  CarregarMeusDados;
end;

procedure TFrmMenu.layout_aba3Click(Sender: TObject);
begin
  SelecionaAba(TLayout(Sender));
  OcultaBotoes;
end;

procedure TFrmMenu.layout_aba4Click(Sender: TObject);
begin
  SelecionaAba(TLayout(Sender));
  OcultaBotoes;
end;

procedure TFrmMenu.SelecionaAba(lyt: TLayout);
var
  x: integer;
begin
  // Exibir apenas imagem cinza...
  for x := 1 to 4 do
  begin
    TImage(FrmMenu.FindComponent('img_aba' + x.ToString)).Visible := true;
    TImage(FrmMenu.FindComponent('img_aba' + x.ToString + '_sel'))
      .Visible := False;
  end;

  // Move a bolinha...
  img_ball.Visible := true;
  AnimationBall.Tag := lyt.Tag;
  // Guarda a aba selecionada....
  AnimationBall.StopValue := lyt.Position.x + (lyt.Width / 2) -
    (img_ball.Width / 2);
  AnimationBall.Start;

  // Executar o pulasr...
  Pulsar(lyt.Tag);

  // Mover tabcontrol...
  TChangeTabAction(FrmMenu.FindComponent('TabAction' +
    lyt.Tag.ToString)).Execute;
end;

procedure TFrmMenu.Pulsar(aba: integer);
begin
  img_pulso.SendToBack;
  img_pulso.Parent :=
    TLayout(FrmMenu.FindComponent('layout_aba' + aba.ToString));

  AnimationPulso.Start;

  AnimationPulsoW.StopValue := layout_aba1.Width;
  AnimationPulsoW.Start;
end;

procedure TFrmMenu.PaintIcone(aba: integer);
begin
  img_ball.Visible := False;

  TImage(FrmMenu.FindComponent('img_aba' + aba.ToString)).Visible := False;
  TImage(FrmMenu.FindComponent('img_aba' + aba.ToString + '_sel'))
    .Visible := true;
end;

procedure TFrmMenu.RectFavoritosClick(Sender: TObject);
begin
  TabAction3.Execute();
end;

procedure TFrmMenu.RectMeusDadosClick(Sender: TObject);
begin
  TabAction2.Execute();
  dm.FDQPessoa.Close;
  dm.FDQPessoa.Open();
  CarregarMeusDados;
end;

procedure TFrmMenu.RoundProfissionaisClick(Sender: TObject);
begin
  TabAction4.Execute();
end;

procedure TFrmMenu.ActionPhotoLibraryDidFinishTaking(Image: TBitmap);
begin
  CircleFotoCadastro.Fill.Bitmap.Bitmap := Image;
end;

procedure TFrmMenu.AddItemFavorito(codigo: integer; avaliacao: real;
  nome, cidade, especialidade, valor, foto: string);
var
  rect, rect_barra: TRectangle;
  rect_icone: TCircle;
  lbl: TLabel;
  img: TImage;
  i, valorEstrela: integer;
  fracao: real;
begin

  // fundo
  rect := TRectangle.Create(VertScrollBoxFavoritos);
  with rect do
  begin
    Align := TAlignLayout.Top;
    Height := 110;
    Fill.Color := $FFFFFFFF;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Margins.Top := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    XRadius := 8;
    YRadius := 8;
    TagString := inttostr(codigo);
    OnDblClick := VisualizarPessoa;
  end;

  // Barra inferior...
  rect_barra := TRectangle.Create(rect);
  with rect_barra do
  begin
    Align := TAlignLayout.Bottom;
    Height := 55;
    Fill.Color := $FFF4F4F4;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Sides := [TSide.Left, TSide.Bottom, TSide.Right];
    XRadius := 8;
    YRadius := 8;
    Corners := [TCorner.BottomLeft, TCorner.BottomRight];
    HitTest := False;
    rect.AddObject(rect_barra);
  end;

  // Nome
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := nome;
    font.Size := 16;
    font.Style := [TFontStyle.fsBold];
    Position.x := 50;
    Position.Y := 10;
    Width := 200;
    rect.AddObject(lbl);
  end;

  // Especialidade
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $EF700680;
    Text := especialidade;
    font.Size := 11;
    font.Style := [TFontStyle.fsBold];
    Position.x := 5;
    Position.Y := 40;
    Width := 500;
    rect.AddObject(lbl);

  end;

  img := TImage.Create(rect);
  with img do
  begin
{$IFDEF MSWINDOWS}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine
      ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
      'heart_sek.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
      'heart_sek.png'));
{$ENDIF}
    Height := 30;
    Width := 30;
    Position.x := 210;
    Position.Y := 5;
    name := 'imgheartSel' + inttostr(codigo);
    TagString := inttostr(codigo);
    OnClick := AddFavoritos;
    Visible := true;
    rect.AddObject(img);
  end;

  // avaliações
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akRight];
    TextSettings.FontColor := $EF700680;
    TextSettings.HorzAlign := TTextAlign.Trailing;
    Text := 'Avaliações';
    font.Size := 12;
    Width := 150;
    Position.x := -160;
    Position.Y := 4;
    rect.AddObject(lbl);
  end;

  // estrela
  valorEstrela := trunc(avaliacao);
  fracao := frac(avaliacao);

  for i := 1 to valorEstrela do
  begin
    img := TImage.Create(rect);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'Star.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'Star.png'));
{$ENDIF}
      Align := Align.alRight;
      Height := 20;
      Width := 20;
      Position.x := i * 12;
      Position.Y := 30;
      rect.AddObject(img);
    end;
  end;

  if fracao >= 0.5 then
  begin
    img := TImage.Create(rect);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'StarHalf.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'StarHalf.png'));
{$ENDIF}
      Height := 20;
      Width := 20;
      Align := Align.alRight;
      Position.x := i * 12;
      Position.Y := 30;
      rect.AddObject(img);
    end;
  end;

  // avaliação
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akRight];
    TextSettings.FontColor := $FF685FEE;
    TextSettings.HorzAlign := TTextAlign.Trailing;
    Text := FloatToStr(avaliacao);
    font.Size := 12;
    Width := 150;
    // if Length(FloatToStr(avaliacao)) = 1 then
    Position.x := -165; // VertScrollBox1.Width - 180;
    // else
    // Position.x := -160;
    Position.Y := 32;
    font.Style := [TFontStyle.fsBold];
    img.AddObject(lbl);
  end;

  img := TImage.Create(rect);
  with img do
  begin
{$IFDEF MSWINDOWS}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine
      ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
      'location.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
      'location.png'));
{$ENDIF}
    Height := 30;
    Width := 30;
    Position.x := 2;
    Position.Y := 20;
    rect_barra.AddObject(img);
  end;

  // Cidade
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
    TextSettings.FontColor := $EF700680;
    TextSettings.HorzAlign := TTextAlign.Leading;
    Text := cidade;
    font.Size := 12;
    Position.x := 30;
    Position.Y := 25;
    rect_barra.AddObject(lbl);
  end;

  // valor
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
    TextSettings.FontColor := $EF700680;
    TextSettings.HorzAlign := TTextAlign.Leading;
    Text := 'Valor por hora';
    font.Size := 12;
    Position.x := 100;
    Position.Y := 25;
    rect_barra.AddObject(lbl);
  end;

  // valor
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
    TextSettings.FontColor := $EF700680;
    TextSettings.HorzAlign := TTextAlign.Leading;
    Text := FormatFloat('R$ #,##0.00', StrToFloat(valor));
    font.Size := 12;
    Position.x := 200;
    Position.Y := 25;
    rect_barra.AddObject(lbl);
  end;

  // Caixa de Icone...
  rect_icone := TCircle.Create(rect);
  with rect_icone do
  begin
    Height := 40;
    Width := 40;

    Stroke.Kind := TBrushKind.None;
    Position.x := 1;
    Position.Y := 1;
    if foto <> EmptyStr then
    begin
      Fill.Kind := TBrushKind.Bitmap;
      Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
      Fill.Bitmap.Bitmap := BitmapFromBase64(foto);
    end
    else
    begin
      Fill.Kind := TBrushKind.Solid;
      Fill.Color := $EF700680;
    end;

    HitTest := False;
    rect.AddObject(rect_icone);
  end;

  if foto = EmptyStr then
  begin
    // Label do icone...
    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      Align := TAlignLayout.Client;
      Height := 20;
      TextSettings.FontColor := $FFFFFFFF;
      TextSettings.VertAlign := TTextAlign.Center;
      TextSettings.HorzAlign := TTextAlign.Center;
      Text := Copy(nome, 1, 1);
      font.Size := 12;
      font.Style := [TFontStyle.fsBold];
      rect_icone.AddObject(lbl);
    end;
  end;

  VertScrollBoxFavoritos.AddObject(rect);

end;

procedure TFrmMenu.VisualizarPessoa(Sender: TObject);
var
  id_server, valorEstrela, i: integer;
  retorno: TJSONObject;
  especialidadejson, point: string;
  pontuacao, fracao: real;
  fs: TFormatSettings;
  s, valor, foto64: string;
  Dt: TDateTime;
  img: TImage;
begin

  id_server := StrToInt(TRectangle(Sender).TagString);
  getPessoaID(id_server, retorno);

  // 1 contratante
  if dm.FDQPessoatp_login.AsInteger = 1 then
  begin

    Label30.Text := 'Observação - Procedimentos oferecidos';
    Layoutespecialidade2.Visible := true;
    Layoutvalor2.Visible := true;
  end
  else
    // 2 profissional
    if dm.FDQPessoatp_login.AsInteger = 2 then
    begin
      Label30.Text := 'Observação - Cuidados Necessários';
      Layoutespecialidade2.Visible := False;
      Layoutvalor2.Visible := False;
    end;

  TabAction5.Execute;

  Edt_visualizarNome.Text := retorno.GetValue('nome').Value;
  especialidadejson := retorno.GetValue('especialidade').Value;
  point := retorno.GetValue('avaliacao').Value;
  if (point <> EmptyStr) and (point <> 'null') then
    pontuacao := StrToFloat(point);
  MemoObservacao1.Text := retorno.GetValue('observacao').Value;
  foto64 := retorno.GetValue('img_usuario').Value;
  LabelAvaliacao.Text := 'Avaliação ' + FloatToStr(pontuacao);

  CircleFotoContratado.Fill.Bitmap.Bitmap := BitmapFromBase64(foto64);
  // dt_nascimento := Copy(retorno.GetValue('dt_nascimento').Value, 1, 10);

  fs := TFormatSettings.Create;
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'yyyy-MM-dd';
  fs.TimeSeparator := ':';
  fs.ShortTimeFormat := 'hh:mm';
  fs.LongTimeFormat := 'hh:mm:ss';

  s := retorno.GetValue('dt_nascimento').Value;
  if s = EmptyStr then
    s := '01/01/1900';
  Dt := StrToDateTime(s, fs);

  labelIdade1.Text := inttostr(DateUtils.YearsBetween(date, Dt)) + 'anos';
  EditDomingo.Text := retorno.GetValue('domingohoras').Value;
  Editsegunda.Text := retorno.GetValue('segundahoras').Value;
  Editterca.Text := retorno.GetValue('tercahoras').Value;
  Editquarta.Text := retorno.GetValue('quartahoras').Value;
  Editquinta.Text := retorno.GetValue('quintahoras').Value;
  Editsexta.Text := retorno.GetValue('sextahoras').Value;
  Editsabado.Text := retorno.GetValue('sabadohoras').Value;
  valor := retorno.GetValue('valor_hora').Value;
  if dm.FDQPessoatp_login.AsInteger = 1 then
  begin
    Layoutvalor2.Visible := true;
    EditValor.Text := FormatFloat('R$ #,##0.00', StrToFloat(valor));
  end
  else
  begin
    Layoutvalor2.Visible := False;
  end;

  ExtrairEspecialidade(especialidadejson, especialidade);

  Memo1.Lines.Add(especialidade);

  if retorno.GetValue('domingo').Value = 'X' then
    CheckBoxDomingo1.IsChecked := true
  else
    CheckBoxDomingo1.IsChecked := False;

  if retorno.GetValue('segunda').Value = 'X' then
    CheckBoxSegunda1.IsChecked := true
  else
    CheckBoxSegunda1.IsChecked := False;

  if retorno.GetValue('terca').Value = 'X' then
    CheckBoxTerca1.IsChecked := true
  else
    CheckBoxTerca1.IsChecked := False;

  if retorno.GetValue('quarta').Value = 'X' then
    CheckBoxquarta1.IsChecked := true
  else
    CheckBoxquarta1.IsChecked := False;

  if retorno.GetValue('quinta').Value = 'X' then
    CheckBoxquinta1.IsChecked := true
  else
    CheckBoxquinta1.IsChecked := False;

  if retorno.GetValue('sexta').Value = 'X' then
    CheckBoxsexta1.IsChecked := true
  else
    CheckBoxsexta1.IsChecked := False;

  if retorno.GetValue('sabado').Value = 'X' then
    CheckBoxsabado1.IsChecked := true
  else
    CheckBoxsabado1.IsChecked := False;

  // estrela
  valorEstrela := trunc(pontuacao);
  fracao := frac(pontuacao);

  for i := 1 to valorEstrela do
  begin
    img := TImage.Create(LabelAvaliacao);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'Star.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'Star.png'));
{$ENDIF}
      Align := TAlignLayout.Right;
      Height := 20;
      Width := 20;
      Position.x := i * 12;
      Position.Y := 30;
      LabelAvaliacao.AddObject(img);
    end;
  end;

  if fracao >= 0.5 then
  begin
    img := TImage.Create(LabelAvaliacao);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'StarHalf.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'StarHalf.png'));
{$ENDIF}
      Height := 20;
      Width := 20;
      Align := TAlignLayout.Right;
      Position.x := i * 12;
      Position.Y := 30;
      LabelAvaliacao.AddObject(img);
    end;
  end;
end;

procedure TFrmMenu.ExtrairEspecialidade(especialidadejson: string;
  var especialidade: string);
var
  StrList: TStringList;
  x: integer;
begin
  especialidade := EmptyStr;
  StrList := TStringList.Create;
  try
    // alimentar a lista com a string
    StrList.Delimiter := '|';
    StrList.StrictDelimiter := true;
    StrList.DelimitedText := especialidadejson;
    for x := 1 to StrList.count - 1 do
    begin
      if x = 2 then
        especialidade := especialidade + ' - ';
      dm.FDQEspecialidade.Locate('id', StrList[x], []);
      especialidade := especialidade + dm.FDQEspecialidadedescricao.AsString;

    end;
  finally
    StrList.Free;
  end;
end;

procedure TFrmMenu.AddItem(codigo: integer; avaliacao: real;
  nome, profissao, cidade, especialidade, valor, foto: string;
  favorito: boolean);
var
  rect, rect_barra: TRectangle;
  rect_icone: TCircle;
  lbl: TLabel;
  img: TImage;
  i, valorEstrela: integer;
  fracao: real;
begin

  // fundo
  rect := TRectangle.Create(VertScrollBoxLista);
  with rect do
  begin
    Align := TAlignLayout.Top;
    Height := 110;
    Fill.Color := $FFFFFFFF;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Margins.Top := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    XRadius := 8;
    YRadius := 8;
    TagString := inttostr(codigo);
    OnClick := VisualizarPessoa;
  end;

  // Barra inferior...
  rect_barra := TRectangle.Create(rect);
  with rect_barra do
  begin
    Align := TAlignLayout.Bottom;
    Height := 55;
    Fill.Color := $FFF4F4F4;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Sides := [TSide.Left, TSide.Bottom, TSide.Right];
    XRadius := 8;
    YRadius := 8;
    Corners := [TCorner.BottomLeft, TCorner.BottomRight];
    HitTest := False;
    rect.AddObject(rect_barra);
  end;

  // Nome
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := nome;
    font.Size := 16;
    font.Style := [TFontStyle.fsBold];
    Position.x := 50;
    Position.Y := 10;
    Width := 200;
    rect.AddObject(lbl);
  end;

  if dm.FDQPessoatp_login.AsInteger = 1 then
  begin
    // Especialidade
    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor := $EF700680;
      Text := especialidade;
      font.Size := 11;
      font.Style := [TFontStyle.fsBold];
      Position.x := 5;
      Position.Y := 40;
      Width := 500;
      rect.AddObject(lbl);
    end;
  end
  else
  begin
    // Cuidados necessários
    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      TextSettings.FontColor := $EF700680;
      Text := especialidade;
      font.Size := 11;
      font.Style := [TFontStyle.fsBold];
      Position.x := 5;
      Position.Y := 40;
      Width := 600;
      rect.AddObject(lbl);
    end;
  end;
  if not favorito then
  begin
    img := TImage.Create(rect);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'heart_nosel.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'heart_nosel.png'));
{$ENDIF}
      Height := 30;
      Width := 30;
      Position.x := 210;
      Position.Y := 5;
      name := 'imgheartNoSel' + inttostr(codigo);
      TagString := inttostr(codigo);
      OnClick := AddFavoritos;
      Visible := true;
      rect.AddObject(img);
    end;
  end
  else
  begin
    img := TImage.Create(rect);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'heart_sek.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'heart_sek.png'));
{$ENDIF}
      Height := 30;
      Width := 30;
      Position.x := 210;
      Position.Y := 5;
      name := 'imgheartSel' + inttostr(codigo);
      TagString := inttostr(codigo);
      OnClick := AddFavoritos;
      Visible := true;
      rect.AddObject(img);
    end;
  end;

  // avaliações
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akRight];
    TextSettings.FontColor := $EF700680;
    TextSettings.HorzAlign := TTextAlign.Trailing;
    Text := 'Avaliações';
    font.Size := 12;
    Width := 150;
    Position.x := -160;
    Position.Y := 4;
    rect.AddObject(lbl);
  end;

  // estrela
  valorEstrela := trunc(avaliacao);
  fracao := frac(avaliacao);

  for i := 1 to valorEstrela do
  begin
    img := TImage.Create(rect);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'Star.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'Star.png'));
{$ENDIF}
      Align := TAlignLayout.Right;
      Height := 20;
      Width := 20;
      Position.x := i * 12;
      Position.Y := 30;
      rect.AddObject(img);
    end;
  end;

  if fracao >= 0.5 then
  begin
    img := TImage.Create(rect);
    with img do
    begin
{$IFDEF MSWINDOWS}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine
        ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
        'StarHalf.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
      Bitmap.LoadFromFile
        (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
        'StarHalf.png'));
{$ENDIF}
      Height := 20;
      Width := 20;
      Align := TAlignLayout.Right;
      Position.x := i * 12;
      Position.Y := 30;
      rect.AddObject(img);
    end;
  end;

  if avaliacao <> 0 then
  begin
    // avaliação
    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      Anchors := [TAnchorKind.akTop, TAnchorKind.akRight];
      TextSettings.FontColor := $FF685FEE;
      TextSettings.HorzAlign := TTextAlign.Trailing;
      Text := FloatToStr(avaliacao);
      font.Size := 12;
      Width := 150;
      // if Length(FloatToStr(avaliacao)) = 1 then
      Position.x := -165; // VertScrollBox1.Width - 180;
      // else
      // Position.x := -160;
      Position.Y := 32;
      font.Style := [TFontStyle.fsBold];
      img.AddObject(lbl);
    end;
  end;

  img := TImage.Create(rect);
  with img do
  begin
{$IFDEF MSWINDOWS}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine
      ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AtivaHealthCare\img\',
      'location.png'));
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
    Bitmap.LoadFromFile
      (IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
      'location.png'));
{$ENDIF}
    Height := 30;
    Width := 30;
    Position.x := 2;
    Position.Y := 20;
    rect_barra.AddObject(img);
  end;

  // Cidade
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
    TextSettings.FontColor := $EF700680;
    TextSettings.HorzAlign := TTextAlign.Leading;
    Text := cidade;
    font.Size := 12;
    Position.x := 30;
    Position.Y := 25;
    rect_barra.AddObject(lbl);
  end;

  if dm.FDQPessoatp_login.AsInteger = 1 then
  begin
    // valor
    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
      TextSettings.FontColor := $EF700680;
      TextSettings.HorzAlign := TTextAlign.Leading;
      Text := 'Valor por hora';
      font.Size := 12;
      Position.x := 100;
      Position.Y := 25;
      rect_barra.AddObject(lbl);
    end;

    // valor
    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
      TextSettings.FontColor := $EF700680;
      TextSettings.HorzAlign := TTextAlign.Leading;
      Text := FormatFloat('R$ #,##0.00', StrToFloat(valor));
      font.Size := 12;
      Position.x := 200;
      Position.Y := 25;
      rect_barra.AddObject(lbl);
    end;
  end;

  // Caixa de Icone...
  rect_icone := TCircle.Create(rect);
  with rect_icone do
  begin
    Height := 40;
    Width := 40;

    Stroke.Kind := TBrushKind.None;
    Position.x := 1;
    Position.Y := 1;
    if foto <> EmptyStr then
    begin
      Fill.Kind := TBrushKind.Bitmap;
      Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
      Fill.Bitmap.Bitmap := BitmapFromBase64(foto);
    end
    else
    begin
      Fill.Kind := TBrushKind.Solid;
      Fill.Color := $EF700680;
    end;

    HitTest := False;
    rect.AddObject(rect_icone);
  end;

  if foto = EmptyStr then
  begin
    // Label do icone...
    lbl := TLabel.Create(rect);
    with lbl do
    begin
      StyledSettings := StyledSettings - [TStyledSetting.Size,
        TStyledSetting.FontColor, TStyledSetting.Style];
      Align := TAlignLayout.Client;
      Height := 20;
      TextSettings.FontColor := $FFFFFFFF;
      TextSettings.VertAlign := TTextAlign.Center;
      TextSettings.HorzAlign := TTextAlign.Center;
      Text := Copy(nome, 1, 1);
      font.Size := 12;
      font.Style := [TFontStyle.fsBold];
      rect_icone.AddObject(lbl);
    end;
  end;

  VertScrollBoxLista.AddObject(rect);
end;

procedure TFrmMenu.AddFavoritos(Sender: TObject);
var
  retorno: TJSONObject;
  nome, cidade, estado, cpf, especialidadejson, valor, foto, point: string;
  pontuacao: real;
  id, id_server: integer;
begin
  id_server := StrToInt(TImage(Sender).TagString);

  getPessoaID(id_server, retorno);

  nome := retorno.GetValue('nome').Value;
  id := StrToInt(retorno.GetValue('id').Value);
  cidade := retorno.GetValue('cidade').Value;
  estado := retorno.GetValue('uf').Value;
  cpf := retorno.GetValue('cpf').Value;
  especialidadejson := retorno.GetValue('especialidade').Value;
  point := retorno.GetValue('avaliacao').Value;
  if (point <> EmptyStr) and (point <> 'null') then
    pontuacao := StrToFloat(point);

  valor := retorno.GetValue('valor_hora').Value;

  ExtrairEspecialidade(especialidadejson, especialidade);

  dm.FDQFavorito.Append;
  dm.FDQFavoritonome.AsString := nome;
  dm.FDQFavoritoid_server.AsInteger := id;
  dm.FDQFavoritocpf.AsString := cpf;
  dm.FDQFavoritocidade.AsString := cidade;
  dm.FDQFavoritouf.AsString := estado;
  dm.FDQFavoritoespecialidade.AsString := especialidadejson;
  dm.FDQFavorito.Post;
  dm.FDConnection1.CommitRetaining;

  dm.FDQFavorito.Close;
  dm.FDQFavorito.Open;

  while not dm.FDQFavorito.EOF do
  begin
    ImageFavoritos.Visible := False;
    AddItemFavorito(id, pontuacao, dm.FDQFavoritonome.AsString,
      dm.FDQFavoritocidade.AsString + '-' + dm.FDQFavoritouf.AsString,
      especialidade, valor, foto);
    dm.FDQFavorito.Next;
  end;
end;

procedure TFrmMenu.CarregarMeusDados;
var
  posicao: integer;
begin
  img_salvar.Visible := true;
  img_cancelar.Visible := true;

  // 1 contratante
  if dm.FDQPessoatp_login.AsInteger = 1 then
  begin
    Label13.Text := 'Observação - Cuidados Necessários';
    LayoutEspecialidade.Visible := False;
    LayoutValor.Visible := False;
  end
  else // 2 profissional
    if dm.FDQPessoatp_login.AsInteger = 2 then
    begin
      Label13.Text := 'Observação - Procedimentos oferecidos';
      LayoutEspecialidade.Visible := true;
      LayoutValor.Visible := true;
    end;

  Edt_Nome.Text := dm.FDQPessoanome.AsString;
  Edt_Cpf.Text := dm.FDQPessoacpf.AsString;
  Edt_Cep.Text := dm.FDQPessoacep.AsString;
  edt_Celular.Text := dm.FDQPessoacelular.AsString;
  Edt_end.Text := dm.FDQPessoaendereco.AsString;
  Edt_complemento.Text := dm.FDQPessoacomplemento.AsString;
  Edt_cidade.Text := dm.FDQPessoacidade.AsString;
  edt_uf.Text := dm.FDQPessoauf.AsString;
  Edt_bairro.Text := dm.FDQPessoabairro.AsString;
  edt_nascimento.Text := dm.FDQPessoadt_nascimento.AsString;
  CalculaIdade;
  MemoObservacao.Text := dm.FDQPessoaobservacao.AsString;
  EdtDomingo.Text := dm.FDQPessoadomingoHoras.AsString;
  EdtSegunda.Text := dm.FDQPessoasegundaHoras.AsString;
  EdtTerca.Text := dm.FDQPessoatercaHoras.AsString;
  EdtQuarta.Text := dm.FDQPessoaquartaHoras.AsString;
  EdtQuinta.Text := dm.FDQPessoaquintaHoras.AsString;
  EdtSexta.Text := dm.FDQPessoasextaHoras.AsString;
  EdtSabado.Text := dm.FDQPessoasabadoHoras.AsString;
  posicao := ComboBox1.Items.IndexOf(dm.FDQPessoasexo.AsString);
  ComboBox1.ItemIndex := posicao;
  edt_valor.Text := dm.FDQPessoavalor_hora.AsString;

  if dm.FDQPessoadomingo.AsString = 'X' then
    CheckBoxDomingo.IsChecked
  else
    CheckBoxDomingo.IsChecked := False;
  if dm.FDQPessoasegunda.AsString = 'X' then
    CheckBoxSegunda.IsChecked
  else
    CheckBoxSegunda.IsChecked := False;
  if dm.FDQPessoaterca.AsString = 'X' then
    CheckBoxTerca.IsChecked
  else
    CheckBoxTerca.IsChecked := False;
  if dm.FDQPessoaquarta.AsString = 'X' then
    CheckBoxQuarta.IsChecked
  else
    CheckBoxQuarta.IsChecked := False;
  if dm.FDQPessoaquinta.AsString = 'X' then
    CheckBoxQuinta.IsChecked
  else
    CheckBoxQuinta.IsChecked := False;
  if dm.FDQPessoasexta.AsString = 'X' then
    CheckBoxSexta.IsChecked
  else
    CheckBoxSexta.IsChecked := False;
  if dm.FDQPessoasabado.AsString = 'X' then
    CheckBoxSabado.IsChecked
  else
    CheckBoxSabado.IsChecked := False;

end;

procedure TFrmMenu.OcultaBotoes;
begin
  img_cancelar.Visible := False;
  img_salvar.Visible := False;
end;

end.
