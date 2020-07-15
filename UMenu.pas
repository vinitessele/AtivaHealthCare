unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, DateUtils, Data.DB, uCComunicacao, System.JSON, IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Ani, FMX.Controls.Presentation, FMX.MultiView,
  FMX.Layouts, FMX.TabControl, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, FMX.ScrollBox, FMX.Memo, REST.Types,
  System.permissions,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, web.HTTPApp;

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
    RectHistorico: TRoundRect;
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
    LayoutCelular: TLayout;
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
    Layout2: TLayout;
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
    Label15: TLabel;
    VertScrollBox4: TVertScrollBox;
    procedure RectMeusDadosClick(Sender: TObject);
    procedure img_addClick(Sender: TObject);
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
    procedure AddItem(codigo: integer; avaliacao: real;
      nome, profissao, cidade: string);
    procedure CarregarMeusDados;
    procedure OcultaBotoes;
    procedure CalculaIdade;
  private

    { Private declarations }
{$IFDEF ANDROID}
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage: string;
    procedure LibraryPermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
      const APermissions: TArray<string>; const APostProc: TProc);
{$ENDIF}
  public
    procedure FormActivate(Sender: TObject);
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses UDM, FMX.DialogService
{$IFDEF ANDROID}
    , Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}
    ;
{$IFDEF ANDROID}

procedure TFrmMenu.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
  // 2 Permissoes: READ_EXTERNAL_STORAGE e WRITE_EXTERNAL_STORAGE
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
    ActionPhotoLibrary.Execute
  else
    TDialogService.ShowMessage('Você não tem permissão para acessar as fotos');
end;

procedure TFrmMenu.DisplayMessageLibrary(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage
    ('O app precisa acessar as fotos do seu dispositivo',
    procedure(const AResult: TModalResult)
    begin
      APostProc;
    end);
end;
{$ENDIF}

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

procedure TFrmMenu.edt_nascimentoExit(Sender: TObject);
begin
  CalculaIdade;
end;

procedure TFrmMenu.FormActivate(Sender: TObject);
begin

end;

procedure TFrmMenu.FormShow(Sender: TObject);
var
  vFoto: TStream;
begin
  TabAction1.Execute;
  CalculaIdade;
  SelecionaAba(layout_aba1);
  LabelNomeUser.Text := DM.FDQLoginnome.AsString;
  vFoto := DM.FDQLogin.CreateBlobStream
    (DM.FDQLogin.FieldByName('img_usuario'), bmRead);
  if not DM.FDQLoginimg_usuario.IsNull then
  begin
    CircleFoto.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
  end;

  AddItem(1, 3.3, 'Maria', 'enfermeiro(a)', 'Toledo - PR');
  AddItem(2, 4, 'Alex', 'Auxiliar de enfermagem', 'Toledo - PR');
  AddItem(3, 2, 'Flavia', 'cuidador(a)', 'Toledo - PR');
  AddItem(4, 4.5, 'Tereza', 'cuidador(a)', 'Toledo - PR');
  AddItem(5, 1, 'Cleusa', 'enfermeiro(a)', 'Toledo - PR');

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

procedure TFrmMenu.img_addClick(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoReadStorage,
    PermissaoWriteStorage], LibraryPermissionRequestResult,
    DisplayMessageLibrary);
{$ENDIF}
{$IFDEF IOS}
  ActionPhotoLibrary.Execute;
{$ENDIF}
end;

procedure TFrmMenu.img_cancelarClick(Sender: TObject);
begin
  OcultaBotoes;
  TabAction1.Execute;
  DM.FDQLogin.Cancel;
  DM.FDConnection1.RollbackRetaining;
end;

procedure TFrmMenu.img_salvarClick(Sender: TObject);
begin
  DM.FDQLogin.Edit;
  DM.FDQLoginnome.AsString := Edt_Nome.Text;
  DM.FDQLogincpf.AsString := Edt_Cpf.Text;
  DM.FDQLogincep.AsString := Edt_Cep.Text;
  DM.FDQLogincelular.AsString := edt_Celular.Text;
  DM.FDQLoginendreco.AsString := Edt_end.Text;
  DM.FDQLogincomplemento.AsString := Edt_complemento.Text;
  DM.FDQLogincidade.AsString := Edt_cidade.Text;
  DM.FDQLoginuf.AsString := edt_uf.Text;
  DM.FDQLoginbairro.AsString := Edt_bairro.Text;
  DM.FDQLogindt_nascimento.AsString := edt_nascimento.Text;
  DM.FDQLoginobservacao.AsString := MemoObservacao.Text;
  DM.FDQLogindomingoHoras.AsString := EdtDomingo.Text;
  DM.FDQLoginsegundaHoras.AsString := EdtSegunda.Text;
  DM.FDQLogintercaHoras.AsString := EdtTerca.Text;
  DM.FDQLoginquartaHoras.AsString := EdtQuarta.Text;
  DM.FDQLoginquintaHoras.AsString := EdtQuinta.Text;
  DM.FDQLoginsextaHoras.AsString := EdtSexta.Text;
  DM.FDQLoginsabadoHoras.AsString := EdtSabado.Text;

  if CheckBoxDomingo.IsChecked then
    DM.FDQLogindomingo.AsString := 'X'
  else
    DM.FDQLogindomingo.AsString := EmptyStr;

  if CheckBoxSegunda.IsChecked then
    DM.FDQLoginsegunda.AsString := 'X'
  else
    DM.FDQLoginsegunda.AsString := EmptyStr;

  if CheckBoxTerca.IsChecked then
    DM.FDQLoginterca.AsString := 'X'
  else
    DM.FDQLoginterca.AsString := EmptyStr;

  if CheckBoxQuarta.IsChecked then
    DM.FDQLoginquarta.AsString := 'X'
  else
    DM.FDQLoginquarta.AsString := EmptyStr;

  if CheckBoxQuinta.IsChecked then
    DM.FDQLoginquinta.AsString := 'X'
  else
    DM.FDQLoginquinta.AsString := EmptyStr;

  if CheckBoxSexta.IsChecked then
    DM.FDQLoginsexta.AsString := 'X'
  else
    DM.FDQLoginsexta.AsString := EmptyStr;

  if CheckBoxSabado.IsChecked then
    DM.FDQLoginsabado.AsString := 'X'
  else
    DM.FDQLoginsabado.AsString := EmptyStr;

  DM.FDQLogin.Post;
  DM.FDConnection1.CommitRetaining;
  OcultaBotoes;
  TabAction1.Execute;
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
      .Visible := false;
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
  img_ball.Visible := false;

  TImage(FrmMenu.FindComponent('img_aba' + aba.ToString)).Visible := false;
  TImage(FrmMenu.FindComponent('img_aba' + aba.ToString + '_sel'))
    .Visible := true;
end;

procedure TFrmMenu.RectMeusDadosClick(Sender: TObject);
begin
  TabAction2.Execute();
  DM.FDQLogin.Close;
  DM.FDQLogin.Open();
  CarregarMeusDados;
end;

procedure TFrmMenu.ActionPhotoLibraryDidFinishTaking(Image: TBitmap);
begin
  CircleFotoCadastro.Fill.Bitmap.Bitmap := Image;
end;

procedure TFrmMenu.AddItem(codigo: integer; avaliacao: real;
nome, profissao, cidade: string);
var
  rect, rect_barra, rect_icone: TRectangle;
  lbl: TLabel;
  img: TImage;
  I: integer;
  pontos: integer;
begin
  // fundo
  rect := TRectangle.Create(VertScrollBox3);
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
    HitTest := false;
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
    Position.Y := 20;
    Width := 200;
    rect.AddObject(lbl);
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

  // Valor avaliação
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

  // profissao
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
    TextSettings.FontColor := $EF700680;
    TextSettings.HorzAlign := TTextAlign.Leading;
    Text := profissao;
    Width := 250;
    font.Size := 12;
    Position.x := 4;
    Position.Y := 1;
    rect_barra.AddObject(lbl);
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
    Position.Y := 15;
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
    Position.Y := 20;
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
    Position.Y := 12;
    HitTest := false;
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

procedure TFrmMenu.CarregarMeusDados;
begin
  img_salvar.Visible := true;
  img_cancelar.Visible := true;
  // 1 contratante
  if DM.FDQLogintp_login.AsInteger = 1 then
  begin
    Label13.Text := 'Observação - Cuidados Necessários';
  end
  else // 2 profissional
    if DM.FDQLogintp_login.AsInteger = 2 then
    begin
      Label13.Text := 'Observação - Procedimentos oferecidos';
    end;
  Edt_Nome.Text := DM.FDQLoginnome.AsString;
  Edt_Cpf.Text := DM.FDQLogincpf.AsString;
  Edt_Cep.Text := DM.FDQLogincep.AsString;
  edt_Celular.Text := DM.FDQLogincelular.AsString;
  Edt_end.Text := DM.FDQLoginendreco.AsString;
  Edt_complemento.Text := DM.FDQLoginendreco.AsString;
  Edt_cidade.Text := DM.FDQLogincidade.AsString;
  edt_uf.Text := DM.FDQLoginuf.AsString;
  Edt_bairro.Text := DM.FDQLoginbairro.AsString;
  edt_nascimento.Text := DM.FDQLogindt_nascimento.AsString;
  MemoObservacao.Text := DM.FDQLoginobservacao.AsString;
  EdtDomingo.Text := DM.FDQLogindomingoHoras.AsString;
  EdtSegunda.Text := DM.FDQLoginsegundaHoras.AsString;
  EdtTerca.Text := DM.FDQLogintercaHoras.AsString;
  EdtQuarta.Text := DM.FDQLoginquartaHoras.AsString;
  EdtQuinta.Text := DM.FDQLoginquintaHoras.AsString;
  EdtSexta.Text := DM.FDQLoginsextaHoras.AsString;
  EdtSabado.Text := DM.FDQLoginsabadoHoras.AsString;
  if DM.FDQLogindomingo.AsString = 'X' then
    CheckBoxDomingo.IsChecked
  else
    CheckBoxDomingo.IsChecked := false;
  if DM.FDQLoginsegunda.AsString = 'X' then
    CheckBoxSegunda.IsChecked
  else
    CheckBoxSegunda.IsChecked := false;
  if DM.FDQLoginterca.AsString = 'X' then
    CheckBoxTerca.IsChecked
  else
    CheckBoxTerca.IsChecked := false;
  if DM.FDQLoginquarta.AsString = 'X' then
    CheckBoxQuarta.IsChecked
  else
    CheckBoxQuarta.IsChecked := false;
  if DM.FDQLoginquinta.AsString = 'X' then
    CheckBoxQuinta.IsChecked
  else
    CheckBoxQuinta.IsChecked := false;
  if DM.FDQLoginsexta.AsString = 'X' then
    CheckBoxSexta.IsChecked
  else
    CheckBoxSexta.IsChecked := false;
  if DM.FDQLoginsabado.AsString = 'X' then
    CheckBoxSabado.IsChecked
  else
    CheckBoxSabado.IsChecked := false;
end;

procedure TFrmMenu.OcultaBotoes;
begin
  img_cancelar.Visible := false;
  img_salvar.Visible := false;
end;

end.
