unit BrvAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmBraveAbout = class(TForm)
    imgList: TImageList;
    pnlBackground: TPanel;
    imgLogo: TImage;
    lblBraveTitle: TLabel;
    lblBraveTitleUI: TLabel;
    lblDesenvolvido: TLabel;
    mmoMantenedores: TMemo;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmBraveAbout: TfrmBraveAbout;

implementation

{$R *.dfm}

procedure TfrmBraveAbout.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

end.
