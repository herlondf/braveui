unit BraveButton.TemplateColor;

interface

uses
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Graphics,
  Vcl.Controls,
  Winapi.Windows,
  System.Typinfo,
  System.Classes,
  System.SysUtils,
  BraveButton.Consts,
  BraveButton.Interfaces;

type
  TFontConfiguration = class(TInterfacedObject, iFontConfigurationCommon)
    constructor Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
    destructor Destroy; override;
    class function New(ATemplateColor: TTemplateColor; AOwner: TComponent): iFontConfigurationCommon;
  private
    FOwner                  : TComponent;
    FTemplateColor          : TTemplateColor;

    FFont                   : TFont;
    FFontDisabled           : TFont;
    FFontFocused            : TFont;
    FFontDown               : TFont;

    function GetFont        : TFont;
    function GetFontDown    : TFont;
    function GetFontFocused : TFont;
    function GetFontDisabled: TFont;
  public
    property Font           : TFont read GetFont;
    property FontDown       : TFont read GetFontDown;
    property FontFocused    : TFont read GetFontFocused;
    property FontDisabled   : TFont read GetFontDisabled;
  end;

  TPenConfiguration = class(TInterfacedObject, iPenConfigurationCommon)
    constructor Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
    class function New(ATemplateColor: TTemplateColor; AOwner: TComponent): iPenConfigurationCommon;
  private
    FOwner                    : TComponent;
    FTemplateColor            : TTemplateColor;

    function GetPenStyle          : TPenStyle;
    function GetPenFocusedStyle   : TPenStyle;
    function GetPenDisabledStyle  : TPenStyle;
    function GetPenDownStyle      : TPenStyle;
    function GetPenGlassyStyle    : TPenStyle;

    function GetPenWidth          : Smallint;
    function GetPenFocusedWidth   : Smallint;
    function GetPenDisabledWidth  : Smallint;
    function GetPenDownWidth      : Smallint;
    function GetPenGlassyWidth    : Smallint;

    function GetPenColor          : TColor;
    function GetPenFocusedColor   : TColor;
    function GetPenDisabledColor  : TColor;
    function GetPenDownColor      : TColor;
    function GetPenGlassyColor    : TColor;
  end;

  TBrushConfiguration = class(TInterfacedObject, iBrushConfigurationCommom)
    constructor Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
    class function New(ATemplateColor: TTemplateColor; AOwner: TComponent): iBrushConfigurationCommom;
  private
    FOwner                        : TComponent;
    FTemplateColor                : TTemplateColor;

    function GetBrushColor        : TColor;
    function GetBrushFocusedColor : TColor;
    function GetBrushDisabledColor: TColor;
    function GetBrushDownColor    : TColor;
    function GetBrushGlassyColor  : TColor;
  end;

  TBraveButtonTemplateColor = class(TInterfacedObject, iBraveButtonTemplateColor)
    constructor Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
    class function New(ATemplateColor: TTemplateColor; AOwner: TComponent): iBraveButtonTemplateColor;
  private
    FPenConfigurationCommon              : iPenConfigurationCommon;
    FBrushConfigurationCommon            : iBrushConfigurationCommom;
    FFontConfigurationCommon             : iFontConfigurationCommon;

    function GetPenConfigurationCommon   : iPenConfigurationCommon;
    function GetBrushConfigurationCommon : iBrushConfigurationCommom;
    function GetFontConfigurationCommon  : iFontConfigurationCommon;
  public
    property PenConfigurationCommon      : iPenConfigurationCommon   read GetPenConfigurationCommon;
    property BrushConfiguartionCommon    : iBrushConfigurationCommom read GetBrushConfigurationCommon;
    property FontConfigurationCommon     : iFontConfigurationCommon  read GetFontConfigurationCommon;
  end;

implementation

{ TBraveButtonTemplateColor }

constructor TBraveButtonTemplateColor.Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
begin
  FPenConfigurationCommon   := TPenConfiguration.New  ( ATemplateColor, AOwner );
  FBrushConfigurationCommon := TBrushConfiguration.New( ATemplateColor, AOwner );
  FFontConfigurationCommon  := TFontConfiguration.New ( ATemplateColor, AOwner );
end;

class function TBraveButtonTemplateColor.New(ATemplateColor: TTemplateColor; AOwner: TComponent): iBraveButtonTemplateColor;
begin
  Result := Self.Create(ATemplateColor, AOwner);
end;

function TBraveButtonTemplateColor.GetPenConfigurationCommon: iPenConfigurationCommon;
begin
  Result := FPenConfigurationCommon;
end;

function TBraveButtonTemplateColor.GetBrushConfigurationCommon: iBrushConfigurationCommom;
begin
  Result := FBrushConfigurationCommon;
end;

function TBraveButtonTemplateColor.GetFontConfigurationCommon: iFontConfigurationCommon;
begin
  Result := FFontConfigurationCommon;
end;



{ TBrushConfiguration }

constructor TBrushConfiguration.Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
begin
  FTemplateColor      := ATemplateColor;
  FOwner              := AOwner;
end;

class function TBrushConfiguration.New(ATemplateColor: TTemplateColor; AOwner: TComponent): iBrushConfigurationCommom;
begin
  Result := Self.Create(ATemplateColor, AOwner);
end;

function TBrushConfiguration.GetBrushColor: TColor;
var
   H, S, L: Word;
begin
  Result := clWhite;

  case FTemplateColor of
    tcWarning    : Result := RGB( 251, 198, 88  );
    tcDanger     : Result := RGB( 239, 129, 87  );
    tcPrimary    : Result := RGB( 81 , 203, 206 );
    tcSecondary  : Result := RGB( 132, 106, 208 );
    tcLight      : Result := RGB( 255, 255, 255 );
    tcDark       : Result := RGB( 102, 97 , 91  );
    tcSuccess    : Result := RGB( 107, 208, 152 );
    tcInfo       : Result := RGB( 81 , 188, 218 );
    tcGlassy     :
    begin
      if ( TStyleManager.IsCustomStyleActive ) then
        Result := StyleServices.GetStyleColor(scWindow)
      else
        Result := TCustomControl(FOwner).Brush.Color;
    end;
  end;
end;

function TBrushConfiguration.GetBrushDisabledColor: TColor;
begin
  Result := clWhite;

  case FTemplateColor of
    tcWarning     : Result := Intensity( GetBrushColor, 80 );
    tcDanger      : Result := Intensity( GetBrushColor, 80 );
    tcPrimary     : Result := Intensity( GetBrushColor, 80 );
    tcSecondary   : Result := Intensity( GetBrushColor, 80 );
    tcLight       : Result := Intensity( GetBrushColor, 80 );
    tcDark        : Result := Intensity( GetBrushColor, 80 );
    tcSuccess     : Result := Intensity( GetBrushColor, 80 );
    tcInfo        : Result := Intensity( GetBrushColor, 80 );
    tcGlassy      :
    begin
      if ( TStyleManager.IsCustomStyleActive ) then
        Result := Intensity( StyleServices.GetStyleColor(scWindow), 80 )
      else
        Result := Intensity( TWinControl(FOwner).Brush.Color, 80 );
    end;
  end;
end;

function TBrushConfiguration.GetBrushDownColor: TColor;
begin
  Result := clWhite;

  case FTemplateColor of
    tcWarning    : Result := Intensity( GetBrushColor, 50 );
    tcDanger     : Result := Intensity( GetBrushColor, 50 );
    tcPrimary    : Result := Intensity( GetBrushColor, 45 );
    tcSecondary  : Result := Intensity( GetBrushColor, 50 );
    tcLight      : Result := Intensity( GetBrushColor, 50 );
    tcDark       : Result := Intensity( GetBrushColor, 25 );
    tcSuccess    : Result := Intensity( GetBrushColor, 50 );
    tcInfo       : Result := Intensity( GetBrushColor, 45 );
    tcGlassy      :
    begin
      if ( TStyleManager.IsCustomStyleActive ) then
        Result := Intensity( StyleServices.GetStyleColor(scWindow), 40 )
      else
        Result := Intensity( TWinControl(FOwner).Brush.Color, 40 );
    end;
  end;
end;

function TBrushConfiguration.GetBrushFocusedColor: TColor;
begin
  Result := clWhite;

  case FTemplateColor of
    tcWarning    : Result := Intensity( GetBrushColor, 55 );
    tcDanger     : Result := Intensity( GetBrushColor, 55 );
    tcPrimary    : Result := Intensity( GetBrushColor, 50 );
    tcSecondary  : Result := Intensity( GetBrushColor, 55 );
    tcLight      : Result := Intensity( GetBrushColor, 55 );
    tcDark       : Result := Intensity( GetBrushColor, 30 );
    tcSuccess    : Result := Intensity( GetBrushColor, 55 );
    tcInfo       : Result := Intensity( GetBrushColor, 50 );
    tcGlassy      :
    begin
      if ( TStyleManager.IsCustomStyleActive ) then
        Result := Intensity( StyleServices.GetStyleColor(scWindow), 55 )
      else
        Result := Intensity( TWinControl(FOwner).Brush.Color, 55 );
    end;
  end;
end;

function TBrushConfiguration.GetBrushGlassyColor: TColor;
begin
  if ( TStyleManager.IsCustomStyleActive ) then
    Result := StyleServices.GetStyleColor(scWindow)
  else
    Result := TWinControl(FOwner).Brush.Color;
end;

{ TPenConfiguration }

constructor TPenConfiguration.Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
begin
  FOwner              := AOwner;
  FTemplateColor := ATemplateColor;
end;

class function TPenConfiguration.New(ATemplateColor: TTemplateColor; AOwner: TComponent): iPenConfigurationCommon;
begin
  Result := Self.Create(ATemplateColor, AOwner);
end;

function TPenConfiguration.GetPenColor: TColor;
begin
  Result := clWhite;

  case FTemplateColor of
    tcWarning    : Result := RGB( 251, 198, 88  );
    tcDanger     : Result := RGB( 239, 129, 87  );
    tcPrimary    : Result := RGB( 81 , 203, 206 );
    tcSecondary  : Result := RGB( 132, 106, 208 );
    tcLight      : Result := RGB( 255, 255, 255 );
    tcDark       : Result := RGB( 102, 97 , 91  );
    tcSuccess    : Result := RGB( 107, 208, 152 );
    tcInfo       : Result := RGB( 81 , 188, 218 );
    tcGlassy     :
    begin
      if ( TStyleManager.IsCustomStyleActive ) then
        Result := StyleServices.GetStyleColor(scWindow)
      else
        Result := TWinControl(FOwner).Brush.Color;
    end;
  end;
end;

function TPenConfiguration.GetPenDisabledColor: TColor;
begin
  Result := clWhite;

  case FTemplateColor of
    tcWarning    : Result := Intensity( GetPenColor, 80 );
    tcDanger     : Result := Intensity( GetPenColor, 80 );
    tcPrimary    : Result := Intensity( GetPenColor, 80 );
    tcSecondary  : Result := Intensity( GetPenColor, 80 );
    tcLight      : Result := Intensity( GetPenColor, 80 );
    tcDark       : Result := Intensity( GetPenColor, 80 );
    tcSuccess    : Result := Intensity( GetPenColor, 80 );
    tcInfo       : Result := Intensity( GetPenColor, 80 );
    tcGlassy     : Result := Intensity( TWinControl(FOwner).Brush.Color, 80 );
  end;
end;

function TPenConfiguration.GetPenDisabledStyle: TPenStyle;
begin
  Result := psSolid;

  case FTemplateColor of
    tcWarning    : Result := psSolid;
    tcDanger     : Result := psSolid;
    tcPrimary    : Result := psSolid;
    tcSecondary  : Result := psSolid;
    tcLight      : Result := psSolid;
    tcDark       : Result := psSolid;
    tcSuccess    : Result := psSolid;
    tcInfo       : Result := psSolid;
    tcGlassy     : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenDisabledWidth: Smallint;
begin
  Result := 0;

  case FTemplateColor of
    tcWarning    : Result := 1;
    tcDanger     : Result := 1;
    tcPrimary    : Result := 1;
    tcSecondary  : Result := 1;
    tcLight      : Result := 1;
    tcDark       : Result := 1;
    tcSuccess    : Result := 1;
    tcInfo       : Result := 1;
    tcGlassy     : Result := 1;
  end;
end;

function TPenConfiguration.GetPenDownColor: TColor;
begin
  Result := clWhite;

  case FTemplateColor of
    tcWarning    : Result := Intensity( GetPenColor, 50 );
    tcDanger     : Result := Intensity( GetPenColor, 50 );
    tcPrimary    : Result := Intensity( GetPenColor, 40 );
    tcSecondary  : Result := Intensity( GetPenColor, 50 );
    tcLight      : Result := Intensity( GetPenColor, 40 );
    tcDark       : Result := Intensity( GetPenColor, 25 );
    tcSuccess    : Result := Intensity( GetPenColor, 50 );
    tcInfo       : Result := Intensity( GetPenColor, 50 );
    tcGlassy     : Result := Intensity( TWinControl(FOwner).Brush.Color, 50 );
  end;
end;

function TPenConfiguration.GetPenDownStyle: TPenStyle;
begin
  Result := psSolid;

  case FTemplateColor of
    tcWarning    : Result := psSolid;
    tcDanger     : Result := psSolid;
    tcPrimary    : Result := psSolid;
    tcSecondary  : Result := psSolid;
    tcLight      : Result := psSolid;
    tcDark       : Result := psSolid;
    tcSuccess    : Result := psSolid;
    tcInfo       : Result := psSolid;
    tcGlassy     : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenDownWidth: Smallint;
begin
  Result := 0;

  case FTemplateColor of
    tcWarning    : Result := 1;
    tcDanger     : Result := 1;
    tcPrimary    : Result := 1;
    tcSecondary  : Result := 1;
    tcLight      : Result := 1;
    tcDark       : Result := 1;
    tcSuccess    : Result := 1;
    tcInfo       : Result := 1;
    tcGlassy     : Result := 1;
  end;
end;

function TPenConfiguration.GetPenFocusedColor: TColor;
begin
  Result := 0;

  case FTemplateColor of
    tcWarning    : Result := Intensity( GetPenColor, 45 );
    tcDanger     : Result := Intensity( GetPenColor, 45 );
    tcPrimary    : Result := Intensity( GetPenColor, 40 );
    tcSecondary  : Result := Intensity( GetPenColor, 45 );
    tcLight      : Result := Intensity( GetPenColor, 45 );
    tcDark       : Result := Intensity( GetPenColor, 45 );
    tcSuccess    : Result := Intensity( GetPenColor, 45 );
    tcInfo       : Result := Intensity( GetPenColor, 40 );
    tcGlassy     : Result := Intensity( TWinControl(FOwner).Brush.Color, 40 );
  end;
end;

function TPenConfiguration.GetPenGlassyColor: TColor;
begin
  if ( TStyleManager.IsCustomStyleActive ) then
    Result := StyleServices.GetStyleColor(scWindow)
  else
    Result := TWinControl(FOwner).Brush.Color;
end;

function TPenConfiguration.GetPenFocusedStyle: TPenStyle;
begin
  Result := psSolid;

  case FTemplateColor of
    tcWarning    : Result := psSolid;
    tcDanger     : Result := psSolid;
    tcPrimary    : Result := psSolid;
    tcSecondary  : Result := psSolid;
    tcLight      : Result := psSolid;
    tcDark       : Result := psSolid;
    tcSuccess    : Result := psSolid;
    tcInfo       : Result := psSolid;
    tcGlassy     : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenGlassyStyle: TPenStyle;
begin
  Result := psSolid;
end;

function TPenConfiguration.GetPenFocusedWidth: Smallint;
begin
  Result := 0;

  case FTemplateColor of
    tcWarning    : Result := 1;
    tcDanger     : Result := 1;
    tcPrimary    : Result := 1;
    tcSecondary  : Result := 1;
    tcLight      : Result := 1;
    tcDark       : Result := 1;
    tcSuccess    : Result := 1;
    tcInfo       : Result := 1;
    tcGlassy     : Result := 1;
  end;
end;

function TPenConfiguration.GetPenGlassyWidth: Smallint;
begin
  Result := 1;
end;

function TPenConfiguration.GetPenStyle: TPenStyle;
begin
  Result := psSolid;

  case FTemplateColor of
    tcWarning    : Result := psSolid;
    tcDanger     : Result := psSolid;
    tcPrimary    : Result := psSolid;
    tcSecondary  : Result := psSolid;
    tcLight      : Result := psSolid;
    tcDark       : Result := psSolid;
    tcSuccess    : Result := psSolid;
    tcInfo       : Result := psSolid;
    tcGlassy     : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenWidth: Smallint;
begin
  Result := 0;

  case FTemplateColor of
    tcWarning    : Result := 1;
    tcDanger     : Result := 1;
    tcPrimary    : Result := 1;
    tcSecondary  : Result := 1;
    tcLight      : Result := 1;
    tcDark       : Result := 1;
    tcSuccess    : Result := 1;
    tcInfo       : Result := 1;
    tcGlassy     : Result := 1;
  end;
end;

{ TFontConfiguration }

constructor TFontConfiguration.Create(ATemplateColor: TTemplateColor; AOwner: TComponent);
begin
  FOwner              := AOwner;
  FTemplateColor := ATemplateColor;

  FFont              := TFont.Create;
  Font.Color         := RGB(255,255,255);
  Font.Name          := 'Segoe UI Semibold';
  Font.Style         := [];
  Font.Size          := 9;

  FFontDisabled      := TFont.Create;
  FontDisabled.Color := RGB(255,255,255);
  FontDisabled.Name  := 'Segoe UI Semibold';
  FontDisabled.Style := [];
  FontDisabled.Size  := 9;

  FFontFocused       := TFont.Create;
  FontFocused.Color  := RGB(255,255,255);
  FontFocused.Name   := 'Segoe UI Semibold';
  FontFocused.Style  := [];
  FontFocused.Size   := 9;

  FFontDown          := TFont.Create;
  FontDown.Color     := RGB(255,255,255);
  FontDown.Name      := 'Segoe UI Semibold';
  FontDown.Style     := [];
  FontDown.Size      := 9;
end;

destructor TFontConfiguration.Destroy;
begin
  FreeandNil(FFont);
  FreeandNil(FFontDisabled);
  FreeandNil(FFontFocused);
  FreeandNil(FFontDown);

  inherited;
end;

class function TFontConfiguration.New(ATemplateColor: TTemplateColor; AOwner: TComponent): iFontConfigurationCommon;
begin
  Result := Self.Create(ATemplateColor, AOwner);
end;

function TFontConfiguration.GetFont: TFont;
begin
  Result := FFont;
end;

function TFontConfiguration.GetFontDisabled: TFont;
begin
  Result := FFontDisabled;
end;

function TFontConfiguration.GetFontDown: TFont;
begin
  Result := FFontDown;
end;

function TFontConfiguration.GetFontFocused: TFont;
begin
  Result := FFontFocused;
end;

end.
