unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, DateUtils, Data.DB, System.JSON, IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Ani, FMX.Controls.Presentation, FMX.MultiView,
  FMX.Layouts, FMX.TabControl, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, FMX.ScrollBox, FMX.Memo, REST.Types,
  System.permissions, IdTCPClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, web.HTTPApp,
  FMX.ListBox, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.DBScope, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    VertScrollBox2: TVertScrollBox;
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
    VertScrollBox3: TVertScrollBox;
    Layout4: TLayout;
    LabelProfissionais2: TLabel;
    VertScrollBox4: TVertScrollBox;
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
      nome, cidade, especialidade: string);
    procedure AddItem(codigo: integer; avaliacao: real;
      nome, profissao, cidade, especialidade: string);
    procedure CarregarMeusDados;
    procedure OcultaBotoes;
    procedure CalculaIdade;
    procedure FormCreate(Sender: TObject);
    procedure RectFavoritosClick(Sender: TObject);
    procedure RoundProfissionaisClick(Sender: TObject);
  private
    procedure CarregarEspecialidades;
    procedure atualizaEspecialidade;
    procedure InsertEspecialidade(Sender: TObject);
    procedure EnviaRegistrosPessoa;
    procedure CarregarListaPessoas(tpPessoa: integer);
    procedure CarregarEspecialidadesServidor;
    procedure AddFavoritos(Sender: TObject);
    procedure AddItemavoritos(nome: string; id: integer; cidade: string;
      estado: string; cpf: string; especialidadejson: string; pontuacao: real);
    procedure CarregarFavoritos(tpPessoa: integer);

    { Private declarations }
  public
    { Public declarations }
    conexao: Boolean;
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

function CheckInternet: Boolean;

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

procedure TFrmMenu.CarregarListaPessoas(tpPessoa: integer);
var
  retorno: TJSONArray;
  nome, profissao, cidade, estado, especialidadejson, especialidade: string;
  pontuacao: real;
  id: integer;
  o: TJSOnObject;
  i, x, count: integer;
  StrList: TStringList;
begin
  dm.RESTRequestTipoPessoa.Resource := '?tipopessoa={tp}';
  dm.RESTRequestTipoPessoa.Params.AddUrlSegment('tp', IntToStr(tpPessoa));
  dm.RESTRequestTipoPessoa.Execute;

  retorno := dm.RESTRequestTipoPessoa.Response.JSONValue as TJSONArray;
  for i := 0 to retorno.Size - 1 do
  begin
    o := retorno.Items[i] as TJSOnObject;
    nome := o.GetValue('nome').Value;
    id := StrToInt(o.GetValue('id').Value);
    cidade := o.GetValue('cidade').Value;
    estado := o.GetValue('uf').Value;
    especialidadejson := o.GetValue('especialidade').Value;
    pontuacao := StrToFloat(o.GetValue('avaliacao').Value);
    especialidade := EmptyStr;
    StrList := TStringList.Create;
    try
      // alimentar a lista com a string
      StrList.Delimiter := '|';
      StrList.StrictDelimiter := true;
      StrList.DelimitedText := especialidadejson;
      for x := 1 to StrList.count - 1 do
      begin
        dm.FDQEspecialidade.Locate('id', StrList[x], []);
        especialidade := especialidade + dm.FDQEspecialidadedescricao.
          AsString + ' - ';
      end;

    finally
      StrList.Free;
    end;

    AddItem(id, pontuacao, nome, profissao, cidade + '-' + estado,
      especialidade);
  end;

end;

procedure TFrmMenu.Edt_CepExit(Sender: TObject);
var
  retorno: TJSOnObject;
begin
  if Edt_Cep.Text <> EmptyStr then
  begin
    RESTRequest1.Resource := '{cep}/json/';
    RESTRequest1.Params.AddUrlSegment('cep', Edt_Cep.Text);
    RESTRequest1.Execute;

    retorno := RESTRequest1.Response.JSONValue as TJSOnObject;

    Edt_cidade.Text := retorno.GetValue('localidade').Value;
    edt_uf.Text := retorno.GetValue('uf').Value;
    Edt_end.Text := retorno.GetValue('logradouro').Value;
    Edt_bairro.Text := retorno.GetValue('bairro').Value;

  end;
end;

procedure TFrmMenu.edt_nascimentoExit(Sender: TObject);
begin
  CalculaIdade;
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
  especialidade := especialidade + '|' + IntToStr(coditem);
end;

procedure TFrmMenu.FormCreate(Sender: TObject);
begin
  conexao := CheckInternet;
  // Atualização app
  if conexao then
  begin

    TLoading.Show(FrmMenu, 'Consultando...');

    TThread.CreateAnonymousThread(
      procedure
      begin

        CarregarEspecialidadesServidor;

        TThread.Synchronize(nil,
          procedure
          begin
            TLoading.Hide;
          end);
      end).Start;

  end;
end;

procedure TFrmMenu.CarregarEspecialidadesServidor;
var
  retorno: TJSONArray;
  descricao: string;
  id: integer;
  o: TJSOnObject;
  i: integer;
begin
  dm.FDQEspecialidade.Close;
  dm.FDQEspecialidade.Open();
  dm.RESTRequestEspecialidade.Execute;

  retorno := dm.RESTRequestEspecialidade.Response.JSONValue as TJSONArray;
  for i := 0 to retorno.Size - 1 do
  begin
    o := retorno.Items[i] as TJSOnObject;
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
  CalculaIdade;
  SelecionaAba(layout_aba1);
  LabelNomeUser.Text := dm.FDQPessoanome.AsString;
  vFoto := dm.FDQPessoa.CreateBlobStream
    (dm.FDQPessoa.FieldByName('img_usuario'), bmRead);

  if not dm.FDQPessoaimg_usuario.IsNull then
  begin
    CircleFoto.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
  end;

  CarregarEspecialidades;

  if dm.FDQPessoatp_login.AsInteger = 1 then
  begin
    LabelProfissionais.Text := 'Profissionais';
    LabelProfissionais2.Text := 'Profissionais';
    CarregarListaPessoas(2);
    CarregarFavoritos(2);
  end
  else
  begin
    LabelProfissionais2.Text := 'Contratante';
    LabelProfissionais.Text := 'Contratante';
    CarregarListaPessoas(1);
    CarregarFavoritos(1);
  end;

end;

procedure TFrmMenu.CarregarFavoritos(tpPessoa: integer);
var
  retorno: TJSOnObject;
  nome, cidade, estado, cpf, especialidadejson: string;
  pontuacao: real;
  id, x: integer;
  StrList: TStringList;
begin
  dm.FDQFavorito.Close;
  dm.FDQFavorito.Open;

  while not dm.FDQFavorito.EOF do
  begin
    dm.RESTRequestGetPessoaId.Resource := '{id}';
    dm.RESTRequestGetPessoaId.Params.AddUrlSegment('id',
      dm.FDQFavoritoid_server.AsString);
    dm.RESTRequestGetPessoaId.Execute;

    retorno := dm.RESTRequestGetPessoaId.Response.JSONValue as TJSOnObject;

    nome := retorno.GetValue('nome').Value;
    id := StrToInt(retorno.GetValue('id').Value);
    cidade := retorno.GetValue('cidade').Value;
    estado := retorno.GetValue('uf').Value;
    cpf := retorno.GetValue('cpf').Value;
    especialidadejson := retorno.GetValue('especialidade').Value;
    pontuacao := StrToFloat(retorno.GetValue('avaliacao').Value);
    especialidade := EmptyStr;
    StrList := TStringList.Create;
    try
      // alimentar a lista com a string
      StrList.Delimiter := '|';
      StrList.StrictDelimiter := true;
      StrList.DelimitedText := especialidadejson;
      for x := 1 to StrList.count - 1 do
      begin
        dm.FDQEspecialidade.Locate('id', StrList[x], []);
        especialidade := especialidade + dm.FDQEspecialidadedescricao.
          AsString + ' - ';
      end;

    finally
      StrList.Free;
    end;

    AddItemFavorito(dm.FDQFavoritoid_server.AsInteger, pontuacao,
      dm.FDQFavoritonome.AsString, dm.FDQFavoritocidade.AsString + '-' +
      dm.FDQFavoritouf.AsString, especialidade);
    dm.FDQFavorito.Next;
  end;
end;

procedure TFrmMenu.AnimationBallFinish(Sender: TObject);
begin
  PaintIcone(AnimationBall.Tag);
end;

procedure TFrmMenu.CalculaIdade;
begin
  if edt_nascimento.Text <> EmptyStr then
  begin
    LabelIdade.Text := IntToStr(DateUtils.YearsBetween(date,
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

  if conexao then
  begin
    TLoading.Show(FrmMenu, 'Enviadno registro...');

    TThread.CreateAnonymousThread(
      procedure
      begin

        EnviaRegistrosPessoa;

        TThread.Synchronize(nil,
          procedure
          begin
            TLoading.Hide;
          end);
      end).Start;
  end;

  OcultaBotoes;
  TabAction1.Execute;
end;

procedure TFrmMenu.EnviaRegistrosPessoa();
var
  f: TField;
  o: TJSOnObject;
  retornoPost, retornoverifica: TJSOnObject;
  sql: string;
  id: string;
begin
  if dm.FDQPessoaid_server.AsString = EmptyStr then
  begin
    // se não estiver no server enviar dados pessoais
    dm.FDQPessoa.First;
    while not dm.FDQPessoa.EOF do
    begin
      o := TJSOnObject.Create;
      for f in dm.FDQPessoa.Fields do
        if f.FieldName = 'img_usuario' then
          o.AddPair(f.FieldName, VarToStr(EmptyStr))
        else
          o.AddPair(f.FieldName, VarToStr(f.Value));
      dm.FDQPessoa.Next;

      dm.RESTRequestPostPessoa.AddBody(o.ToString,
        ContentTypeFromString('application/json'));
      dm.RESTRequestPostPessoa.Execute;
      try
        retornoPost := dm.RESTRequestPostPessoa.Response.JSONValue as
          TJSOnObject;

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
        TJSOnObject;
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
  AnimationBall.Tag := lyt.Tag; // Guarda a aba selecionada....
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
nome, cidade, especialidade: string);
var
  rect, rect_barra, rect_icone: TRectangle;
  lbl: TLabel;
  img: TImage;
  i: integer;
begin

  // fundo
  rect := TRectangle.Create(VertScrollBox4);
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
    TagString := IntToStr(codigo);
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
    name := 'imgheartNoSel' + IntToStr(codigo);
    TagString := IntToStr(codigo);
    OnClick := AddFavoritos;
    Visible := true;
    rect.AddObject(img);
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
    name := 'imgheartSel' + IntToStr(codigo);
    TagString := IntToStr(codigo);
    OnClick := AddFavoritos;
    Visible := False;
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
    Position.Y := 7;
    rect.AddObject(lbl);
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
    Position.x := -160; // VertScrollBox1.Width - 180;
    Position.Y := 23;
    font.Style := [TFontStyle.fsBold];
    rect.AddObject(lbl);
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

  // Caixa de Icone...
  rect_icone := TRectangle.Create(rect);
  with rect_icone do
  begin
    Height := 30;
    Width := 30;
    Fill.Color := $EF700680;
    Stroke.Kind := TBrushKind.None;
    XRadius := 4;
    YRadius := 4;
    Position.x := 10;
    Position.Y := 5;
    HitTest := False;
    rect.AddObject(rect_icone);
  end;

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

  VertScrollBox3.AddObject(rect);
end;

procedure TFrmMenu.AddItem(codigo: integer; avaliacao: real;
nome, profissao, cidade, especialidade: string);
var
  rect, rect_barra, rect_icone: TRectangle;
  lbl: TLabel;
  img: TImage;
  i: integer;
begin

  // fundo
  rect := TRectangle.Create(VertScrollBox4);
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
    TagString := IntToStr(codigo);
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
    name := 'imgheartNoSel' + IntToStr(codigo);
    TagString := IntToStr(codigo);
    OnClick := AddFavoritos;
    Visible := true;
    rect.AddObject(img);
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
    name := 'imgheartSel' + IntToStr(codigo);
    TagString := IntToStr(codigo);
    OnClick := AddFavoritos;
    Visible := False;
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
    Position.Y := 7;
    rect.AddObject(lbl);
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
    Position.x := -160; // VertScrollBox1.Width - 180;
    Position.Y := 23;
    font.Style := [TFontStyle.fsBold];
    rect.AddObject(lbl);
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

  // Caixa de Icone...
  rect_icone := TRectangle.Create(rect);
  with rect_icone do
  begin
    Height := 30;
    Width := 30;
    Fill.Color := $EF700680;
    Stroke.Kind := TBrushKind.None;
    XRadius := 4;
    YRadius := 4;
    Position.x := 10;
    Position.Y := 5;
    HitTest := False;
    rect.AddObject(rect_icone);
  end;

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

  VertScrollBox4.AddObject(rect);
end;

procedure TFrmMenu.AddFavoritos(Sender: TObject);
var
  retorno: TJSOnObject;
  nome, cidade, estado, cpf, especialidadejson: string;
  pontuacao: real;
  id, x: integer;
  StrList: TStringList;
begin
  dm.RESTRequestGetPessoaId.Resource := '{id}';
  dm.RESTRequestGetPessoaId.Params.AddUrlSegment('id',
    TImage(Sender).TagString);
  dm.RESTRequestGetPessoaId.Execute;

  retorno := dm.RESTRequestGetPessoaId.Response.JSONValue as TJSOnObject;

  nome := retorno.GetValue('nome').Value;
  id := StrToInt(retorno.GetValue('id').Value);
  cidade := retorno.GetValue('cidade').Value;
  estado := retorno.GetValue('uf').Value;
  cpf := retorno.GetValue('cpf').Value;
  especialidadejson := retorno.GetValue('especialidade').Value;
  pontuacao := StrToFloat(retorno.GetValue('avaliacao').Value);
  especialidade := EmptyStr;
  StrList := TStringList.Create;
  try
    // alimentar a lista com a string
    StrList.Delimiter := '|';
    StrList.StrictDelimiter := true;
    StrList.DelimitedText := especialidadejson;
    for x := 1 to StrList.count - 1 do
    begin
      dm.FDQEspecialidade.Locate('id', StrList[x], []);
      especialidade := especialidade + dm.FDQEspecialidadedescricao.
        AsString + ' - ';
    end;

  finally
    StrList.Free;
  end;
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
    AddItemFavorito(id, pontuacao, dm.FDQFavoritonome.AsString,
      dm.FDQFavoritocidade.AsString + '-' + dm.FDQFavoritouf.AsString,
      especialidade);
    dm.FDQFavorito.Next;
  end;
end;

procedure TFrmMenu.CarregarMeusDados;
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
  MemoObservacao.Text := dm.FDQPessoaobservacao.AsString;
  EdtDomingo.Text := dm.FDQPessoadomingoHoras.AsString;
  EdtSegunda.Text := dm.FDQPessoasegundaHoras.AsString;
  EdtTerca.Text := dm.FDQPessoatercaHoras.AsString;
  EdtQuarta.Text := dm.FDQPessoaquartaHoras.AsString;
  EdtQuinta.Text := dm.FDQPessoaquintaHoras.AsString;
  EdtSexta.Text := dm.FDQPessoasextaHoras.AsString;
  EdtSabado.Text := dm.FDQPessoasabadoHoras.AsString;
  ComboBox1.Items.IndexOf(dm.FDQPessoasexo.AsString);
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
