unit BraveButton.Interfaces;

interface

uses
  Vcl.Graphics;

type
  iPenConfigurationCommon = interface
    ['{445BF2CB-24A2-47FE-98CD-EB06D9844CEC}']
    function GetPenStyle          : TPenStyle;
    function GetPenFocusedStyle   : TPenStyle;
    function GetPenDisabledStyle  : TPenStyle;
    function GetPenDownStyle      : TPenStyle;

    function GetPenWidth          : Smallint;
    function GetPenFocusedWidth   : Smallint;
    function GetPenDisabledWidth  : Smallint;
    function GetPenDownWidth      : Smallint;

    function GetPenColor          : TColor;
    function GetPenFocusedColor   : TColor;
    function GetPenDisabledColor  : TColor;
    function GetPenDownColor      : TColor;
  end;

  iBrushConfigurationCommom = interface
    ['{D122D2F0-8563-4932-B765-7789201A8B49}']
    function GetBrushColor        : TColor;
    function GetBrushFocusedColor : TColor;
    function GetBrushDisabledColor: TColor;
    function GetBrushDownColor    : TColor;
  end;

  iFontConfigurationCommon = interface
    ['{BC383558-1635-48C5-80FF-F12C16D3A22B}']
    function GetFont              : TFont;
    function GetFontDown          : TFont;
    function GetFontFocused       : TFont;
    function GetFontDisabled      : TFont;
  end;

  iButtonStyleTemplate = interface
    ['{031E5FF4-2134-4E99-B3E1-7108533DC890}']
    function GetPenConfigurationCommon   : iPenConfigurationCommon;
    function GetBrushConfigurationCommon : iBrushConfigurationCommom;
    function GetFontConfigurationCommon  : iFontConfigurationCommon;
  end;

  iButtonStyleTemplateType = interface
    ['{97B300BD-3362-49C1-AE07-CC3A37C4987A}']
    function GetPicture                   : TPicture;
    function GetPictureDark               : TPicture;
    function GetPictureFocused            : TPicture;
    function GetPictureStyleOutline       : TPicture;
    function GetPictureFocusedStyleOutline: TPicture;
    function GetPictureDisabled           : TPicture;
  end;

implementation

end.
