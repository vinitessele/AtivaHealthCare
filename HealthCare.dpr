program HealthCare;

uses
  System.StartUpCopy,
  FMX.Forms,
  UInicial in 'UInicial.pas' {FrmInicial},
  USplash in 'USplash.pas' {FrmSplash},
  UDM in 'UDM.pas' {DM: TDataModule},
  UMenu in 'UMenu.pas' {FrmMenu},
  Loading in 'Loading.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
