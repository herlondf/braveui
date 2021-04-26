program BraveSample;

uses
  Vcl.Forms,
  Sample.View in 'Sample.View.pas' {frmSample};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSample, frmSample);
  Application.Run;
end.
