program BraveSample;

uses
  Vcl.Forms,
  Sample.View in 'Sample.View.pas' {frmSample},
  BraveLabel.Component in '..\src\BraveLabel.Component.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSample, frmSample);
  Application.Run;
end.
