unit Sample.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BraveButton.Component,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Common.Caption, BraveEdit.Component, BraveLabel.Component,
  BraveEditTag.Component, BrvGrid;

type
  TfrmSample = class(TForm)
    BrvGrid1: TBrvGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSample: TfrmSample;

implementation

{$R *.dfm}

end.
