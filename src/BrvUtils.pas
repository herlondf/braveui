unit BrvUtils;

interface

uses
  Vcl.Imaging.pngimage;

function GetPictureOfResource(const AValue: String): TPngImage;

implementation

function GetPictureOfResource(const AValue: String): TPngImage;
var
  lPNG: TPngImage;
begin
  lPNG := TPngImage.Create;
  try
    try
      lPNG.LoadFromResourceName(SysInit.HInstance, AValue);
    finally
      result := lPNG;
    end;
  except
    result := lPNG;
  end;

  //lPNG.Free;
end;

end.
