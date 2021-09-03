program BraveSample;

uses
  Vcl.Forms,
  Sample.View in 'Sample.View.pas' {frmSample},
  Vcl.Themes,
  Vcl.Styles,
  BrvGrid.Options in '..\src\Grid\BrvGrid.Options.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSample, frmSample);
  Application.Run;
end.
