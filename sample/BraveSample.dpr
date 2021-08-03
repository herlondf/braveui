program BraveSample;

uses
  Vcl.Forms,
  Sample.View in 'Sample.View.pas' {frmSample},
  Vcl.Themes,
  Vcl.Styles,
  BraveAbout.View in '..\src\BraveAbout.View.pas' {frmBraveAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSample, frmSample);
  Application.CreateForm(TfrmBraveAbout, frmBraveAbout);
  Application.Run;
end.
