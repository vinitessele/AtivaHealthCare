unit UInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.DB, System.permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions;

type
  TFrmInicial = class(TForm)
    Image1: TImage;
    layout_rodape: TLayout;
    Image2: TImage;
    Label3: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Image3: TImage;
    Label1: TLabel;
    Image4: TImage;
    Label2: TLabel;
    ActionList1: TActionList;
    TabAction1: TChangeTabAction;
    TabAction2: TChangeTabAction;
    TabAction3: TChangeTabAction;
    LayoutCorpo: TLayout;
    Image5: TImage;
    GridLayout1: TGridLayout;
    LayoutProfissional: TLayout;
    RoundRectProfissional: TRoundRect;
    Label4: TLabel;
    LayoutContratante: TLayout;
    RoundRectContratante: TRoundRect;
    Label5: TLabel;
    TabItem4: TTabItem;
    TabAction4: TChangeTabAction;
    LayoutCadProfissional: TLayout;
    layout_cad_senha: TLayout;
    Layout4: TLayout;
    edt_senha: TEdit;
    Line7: TLine;
    Label7: TLabel;
    Layout5: TLayout;
    img_exibir: TImage;
    img_esconder: TImage;
    Layout6: TLayout;
    Edt_email: TEdit;
    Line8: TLine;
    Label8: TLabel;
    StyleBook1: TStyleBook;
    RectaCadastroSenha: TRectangle;
    Label16: TLabel;
    Label6: TLabel;
    LabeltelaSenha: TLabel;
    TabItem5: TTabItem;
    LayoutLogin: TLayout;
    Layout1: TLayout;
    LayoutSenha: TLayout;
    edt_senhalogin: TEdit;
    Line1: TLine;
    Label9: TLabel;
    Layout3: TLayout;
    Image_exibir: TImage;
    Image_esconder: TImage;
    LayoutEmail: TLayout;
    edt_login: TEdit;
    Line2: TLine;
    Label10: TLabel;
    RectEntrar: TRectangle;
    Label11: TLabel;
    LayoutImg: TLayout;
    CircleFoto: TCircle;
    TabAction5: TChangeTabAction;
    CircleFotoCadastro: TCircle;
    img_add: TImage;
    ActionPhotoLibrary: TTakePhotoFromLibraryAction;
    procedure Label3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RoundRectProfissionalClick(Sender: TObject);
    procedure img_esconderClick(Sender: TObject);
    procedure img_exibirClick(Sender: TObject);
    procedure RoundRectProfissionalMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure RoundRectProfissionalMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure RoundRectContratanteMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure RoundRectContratanteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure RoundRectContratanteClick(Sender: TObject);
    procedure RectaCadastroSenhaClick(Sender: TObject);
    procedure RectEntrarClick(Sender: TObject);
    procedure img_addClick(Sender: TObject);
    procedure ActionPhotoLibraryDidFinishTaking(Image: TBitmap);
    procedure FormActivate(Sender: TObject);
    procedure Image_esconderClick(Sender: TObject);
    procedure Image_exibirClick(Sender: TObject);
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
    { Public declarations }
    StreamImg: TStream;
  end;

var
  FrmInicial: TFrmInicial;

implementation

{$R *.fmx}

uses UDM, UMenu, FMX.DialogService
{$IFDEF ANDROID}
    , Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.Os
{$ENDIF}
    ;
{$IFDEF ANDROID}

procedure TFrmInicial.LibraryPermissionRequestResult(Sender: TObject;
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

procedure TFrmInicial.DisplayMessageLibrary(Sender: TObject;
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

procedure TFrmInicial.FormActivate(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissaoCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage := JStringToString
    (TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString
    (TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
{$ENDIF}
end;

procedure TFrmInicial.FormCreate(Sender: TObject);
var
  vFoto: TStream;
begin
  dm.FDQLogin.Close;
  dm.FDQLogin.Open();
  if dm.FDQLogin.RecordCount > 0 then
  begin
    TabAction5.Execute;
    layout_rodape.Visible := false;
    vFoto := dm.FDQLogin.CreateBlobStream
      (dm.FDQLogin.FieldByName('img_usuario'), bmRead);
    if not dm.FDQLoginimg_usuario.IsNull then
    begin
      CircleFoto.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
    end;
  end
  else
  begin
    TabAction1.Execute;
  end;
end;

procedure TFrmInicial.Image2Click(Sender: TObject);
begin
  case TabControl1.TabIndex of
    0:
      begin
        TabAction2.Execute;
      end;
    1:
      begin
        layout_rodape.Visible := false;
        TabAction3.Execute;
      end;
  end;
end;

procedure TFrmInicial.Image_esconderClick(Sender: TObject);
begin
  Image_esconder.Visible := false;
  Image_exibir.Visible := True;
  edt_senhalogin.Password := false;
end;

procedure TFrmInicial.Image_exibirClick(Sender: TObject);
begin
  Image_esconder.Visible := True;
  Image_exibir.Visible := false;
  edt_senhalogin.Password := True;
end;

procedure TFrmInicial.img_addClick(Sender: TObject);
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

procedure TFrmInicial.img_esconderClick(Sender: TObject);
begin
  img_esconder.Visible := false;
  img_exibir.Visible := True;
  edt_senha.Password := false;
end;

procedure TFrmInicial.img_exibirClick(Sender: TObject);
begin
  img_esconder.Visible := True;
  img_exibir.Visible := false;
  edt_senha.Password := True;
end;

procedure TFrmInicial.Label3Click(Sender: TObject);
begin
  layout_rodape.Visible := false;
  TabAction3.Execute;
end;

procedure TFrmInicial.RectaCadastroSenhaClick(Sender: TObject);
begin
  dm.FDQLogin.Close;
  dm.FDQLogin.Open();
  if (Edt_email.Text = EmptyStr) or (edt_senha.Text = EmptyStr) then
    Abort;

  dm.FDQLogin.Append;
  dm.FDQLoginemail.AsString := Edt_email.Text;
  dm.FDQLoginsenha.AsString := edt_senha.Text;
  StreamImg := TMemoryStream.Create;
  CircleFotoCadastro.Fill.Bitmap.Bitmap.SaveToStream(StreamImg);
  CircleFoto.Fill.Bitmap.Bitmap.SaveToStream(StreamImg);
  dm.FDQLoginimg_usuario.LoadFromStream(StreamImg);

  if LabeltelaSenha.Text = 'Contratante' then
    dm.FDQLogintp_login.AsInteger := 1
  else
    dm.FDQLogintp_login.AsInteger := 2;

  dm.FDQLogin.Post;
  dm.FDConnection1.CommitRetaining;

  TabAction5.Execute;
end;

procedure TFrmInicial.RectEntrarClick(Sender: TObject);
begin

  if (edt_login.Text = dm.FDQLoginemail.AsString) and
    (edt_senhalogin.Text = dm.FDQLoginsenha.AsString) then
  begin
    if not Assigned(FrmMenu) then
      Application.CreateForm(TFrmMenu, FrmMenu);

    FrmMenu.Show;

  end
  else
  begin
    ShowMessage('Login ou senha não confere');
  end;

end;

procedure TFrmInicial.RoundRectContratanteClick(Sender: TObject);
begin
  TabAction4.Execute;
  LabeltelaSenha.Text := 'Contratante';
end;

procedure TFrmInicial.RoundRectContratanteMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RoundRectContratante.Opacity := 0.5;
end;

procedure TFrmInicial.RoundRectContratanteMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RoundRectContratante.Opacity := 1.0;
end;

procedure TFrmInicial.RoundRectProfissionalClick(Sender: TObject);
begin
  TabAction4.Execute;
  LabeltelaSenha.Text := 'Profissional';
end;

procedure TFrmInicial.RoundRectProfissionalMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RoundRectProfissional.Opacity := 0.5;
end;

procedure TFrmInicial.RoundRectProfissionalMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RoundRectProfissional.Opacity := 1.0;
end;

procedure TFrmInicial.ActionPhotoLibraryDidFinishTaking(Image: TBitmap);
begin
  CircleFotoCadastro.Fill.Bitmap.Bitmap := Image;
end;

end.
