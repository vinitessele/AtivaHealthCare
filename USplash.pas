unit USplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFrmSplash = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.fmx}

uses UInicial;

procedure TFrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FrmSplash := nil;
end;

procedure TFrmSplash.FormCreate(Sender: TObject);
begin
  Image1.Align := TAlignLayout.Center;
end;

procedure TFrmSplash.FormShow(Sender: TObject);
begin
  Timer1.Interval := 3000;
  Timer1.Enabled := True;
  Image1.Opacity := 0;
  Image1.Align := TAlignLayout.None;
  Image1.AnimateFloat('Opacity', 1, 0.8);
  Image1.AnimateFloatDelay('Position.Y', 0, 0.3, 0.9, TAnimationType.&In,
    TInterpolationType.back);
end;

procedure TFrmSplash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not Assigned(Frminicial) then
    Application.CreateForm(TFrmInicial, Frminicial);

  Application.MainForm := Frminicial;
  Frminicial.Show;

  FrmSplash.Close;

end;

end.
