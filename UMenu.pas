unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, DateUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Ani, FMX.Controls.Presentation, FMX.MultiView,
  FMX.Layouts, FMX.TabControl, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, FMX.ScrollBox, FMX.Memo;

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
    Circle1: TCircle;
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
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
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
    procedure RectMeusDadosClick(Sender: TObject);
    procedure img_addClick(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure edt_nascimentoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CalculaIdade;
    { Private declarations }
{$IFDEF ANDROID}
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage: string;
    procedure LibraryPermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure DisplayMessageLibrary(Sender: TObject;
      const APermissions: TArray<string>; const APostProc: TProc);
    procedure CalculaIdade;

{$ENDIF}
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses UDM
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

procedure TFrmMenu.edt_nascimentoExit(Sender: TObject);
begin
  CalculaIdade;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  TabAction1.Execute;
  CalculaIdade
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

procedure TFrmMenu.RectMeusDadosClick(Sender: TObject);
begin
  TabAction2.Execute();
  dm.FDQLogin.Close;
  dm.FDQLogin.Open();
  img_salvar.Visible := True;
  img_cancelar.Visible := True;
  dm.FDQLogin.Edit;
  // 1 contratante
  if dm.FDQLogintp_login.AsInteger = 1 then
  begin
    Label13.Text := 'Observação - Cuidados Necessários';
  end
  // 2 profissional
  else if dm.FDQLogintp_login.AsInteger = 2 then
  begin
    Label13.Text := 'Observação - Procedimentos oferecidos';
  end;

  Edt_Nome.Text := dm.FDQLoginnome.AsString;
  Edt_Cpf.Text := dm.FDQLogincpf.AsString;
  Edt_Cep.Text := dm.FDQLogincep.AsString;
  edt_Celular.Text := dm.FDQLogincelular.AsString;
  Edt_end.Text := dm.FDQLoginendreco.AsString;
  Edt_complemento.Text := dm.FDQLoginendreco.AsString;
  Edt_cidade.Text := dm.FDQLogincidade.AsString;
  Edt_bairro.Text := dm.FDQLoginbairro.AsString;
  edt_nascimento.Text := dm.FDQLogindt_nascimento.AsString;
  MemoObservacao.Text := dm.FDQLoginobservacao.AsString;
  EdtDomingo.Text := dm.FDQLogindomingoHoras.AsString;
  EdtSegunda.Text := dm.FDQLoginsegundaHoras.AsString;
  EdtTerca.Text := dm.FDQLogintercaHoras.AsString;
  EdtQuarta.Text := dm.FDQLoginquartaHoras.AsString;
  EdtQuinta.Text := dm.FDQLoginquintaHoras.AsString;
  EdtSexta.Text := dm.FDQLoginsextaHoras.AsString;
  EdtSabado.Text := dm.FDQLoginsabadoHoras.AsString;

  if dm.FDQLogindomingo.AsString = 'X' then
    CheckBoxDomingo.IsChecked
  else
    CheckBoxDomingo.IsChecked := False;

  if dm.FDQLoginsegunda.AsString = 'X' then
    CheckBoxSegunda.IsChecked
  else
    CheckBoxSegunda.IsChecked := False;

  if dm.FDQLoginterca.AsString = 'X' then
    CheckBoxTerca.IsChecked
  else
    CheckBoxTerca.IsChecked := False;

  if dm.FDQLoginquarta.AsString = 'X' then
    CheckBoxQuarta.IsChecked
  else
    CheckBoxQuarta.IsChecked := False;

  if dm.FDQLoginquinta.AsString = 'X' then
    CheckBoxQuinta.IsChecked
  else
    CheckBoxQuinta.IsChecked := False;

  if dm.FDQLoginsexta.AsString = 'X' then
    CheckBoxSexta.IsChecked
  else
    CheckBoxSexta.IsChecked := False;

  if dm.FDQLoginsabado.AsString = 'X' then
    CheckBoxSabado.IsChecked
  else
    CheckBoxSabado.IsChecked := False;

end;

procedure TFrmMenu.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  CircleFotoCadastro.Fill.Bitmap.Bitmap := Image;
end;

end.
