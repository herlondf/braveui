unit BraveButton.TemplateColor;

interface

uses
  Vcl.Themes,
  Vcl.Graphics,
  Winapi.Windows,
  System.Typinfo,
  System.Classes,
  System.SysUtils,
  BraveButton.Consts,
  BraveButton.Interfaces;

type
  TFontConfiguration = class(TInterfacedObject, iFontConfigurationCommon)
    constructor Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
    destructor Destroy; override;
    class function New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iFontConfigurationCommon;
  private
    FOwner                  : TComponent;
    FStyleTemplateColor     : TStyleTemplateColor;

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
    constructor Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
    class function New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iPenConfigurationCommon;
  private
    FOwner                    : TComponent;
    FStyleTemplateColor       : TStyleTemplateColor;

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

  TBrushConfiguration = class(TInterfacedObject, iBrushConfigurationCommom)
    constructor Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
    class function New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iBrushConfigurationCommom;
  private
    FOwner                        : TComponent;
    FStyleTemplateColor           : TStyleTemplateColor;

    function GetBrushColor        : TColor;
    function GetBrushFocusedColor : TColor;
    function GetBrushDisabledColor: TColor;
    function GetBrushDownColor    : TColor;
  end;

  TButtonStyleTemplateColor = class(TInterfacedObject, iButtonStyleTemplate)
    constructor Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
    class function New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iButtonStyleTemplate;
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

{ TButtonStyleTemplateColor }

constructor TButtonStyleTemplateColor.Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
begin
  FPenConfigurationCommon   := TPenConfiguration.New  ( AStyleTemplateColor, AOwner );
  FBrushConfigurationCommon := TBrushConfiguration.New( AStyleTemplateColor, AOwner );
  FFontConfigurationCommon  := TFontConfiguration.New ( AStyleTemplateColor, AOwner );
end;

class function TButtonStyleTemplateColor.New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iButtonStyleTemplate;
begin
  Result := Self.Create(AStyleTemplateColor, AOwner);
end;

function TButtonStyleTemplateColor.GetPenConfigurationCommon: iPenConfigurationCommon;
begin
  Result := FPenConfigurationCommon;
end;

function TButtonStyleTemplateColor.GetBrushConfigurationCommon: iBrushConfigurationCommom;
begin
  Result := FBrushConfigurationCommon;
end;

function TButtonStyleTemplateColor.GetFontConfigurationCommon: iFontConfigurationCommon;
begin
  Result := FFontConfigurationCommon;
end;



{ TBrushConfiguration }

constructor TBrushConfiguration.Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
begin
  FStyleTemplateColor := AStyleTemplateColor;
  FOwner              := AOwner;
end;

class function TBrushConfiguration.New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iBrushConfigurationCommom;
begin
  Result := Self.Create(AStyleTemplateColor, AOwner);
end;

function TBrushConfiguration.GetBrushColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning    : Result := RGB( 251, 198, 88  );
    stDanger     : Result := RGB( 239, 129, 87  );
    stPrimary    : Result := RGB( 81 , 203, 206 );
    stSecondary  : Result := RGB( 132, 106, 208 );
    stLight      : Result := RGB( 255, 255, 255 );
    stDark       : Result := RGB( 102, 97 , 91  );
    stSuccess    : Result := RGB( 107, 208, 152 );
    stInfo       : Result := RGB( 81 , 188, 218 );
  end;
end;

function TBrushConfiguration.GetBrushDisabledColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning     : Result := Intensity( GetBrushColor, 80 );
    stDanger      : Result := Intensity( GetBrushColor, 80 );
    stPrimary     : Result := Intensity( GetBrushColor, 80 );
    stSecondary   : Result := Intensity( GetBrushColor, 80 );
    stLight       : Result := Intensity( GetBrushColor, 80 );
    stDark        : Result := Intensity( GetBrushColor, 80 );
    stSuccess     : Result := Intensity( GetBrushColor, 80 );
    stInfo        : Result := Intensity( GetBrushColor, 80 );
  end;
end;

function TBrushConfiguration.GetBrushDownColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning    : Result := Intensity( GetBrushColor, 50 );
    stDanger     : Result := Intensity( GetBrushColor, 50 );
    stPrimary    : Result := Intensity( GetBrushColor, 45 );
    stSecondary  : Result := Intensity( GetBrushColor, 50 );
    stLight      : Result := Intensity( GetBrushColor, 50 );
    stDark       : Result := Intensity( GetBrushColor, 25 );
    stSuccess    : Result := Intensity( GetBrushColor, 50 );
    stInfo       : Result := Intensity( GetBrushColor, 45 );
  end;
end;

function TBrushConfiguration.GetBrushFocusedColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning    : Result := Intensity( GetBrushColor, 55 );
    stDanger     : Result := Intensity( GetBrushColor, 55 );
    stPrimary    : Result := Intensity( GetBrushColor, 50 );
    stSecondary  : Result := Intensity( GetBrushColor, 55 );
    stLight      : Result := Intensity( GetBrushColor, 55 );
    stDark       : Result := Intensity( GetBrushColor, 30 );
    stSuccess    : Result := Intensity( GetBrushColor, 55 );
    stInfo       : Result := Intensity( GetBrushColor, 50 );
  end;
end;

{ TPenConfiguration }

constructor TPenConfiguration.Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
begin
  FOwner              := AOwner;
  FStyleTemplateColor := AStyleTemplateColor;
end;

class function TPenConfiguration.New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iPenConfigurationCommon;
begin
  Result := Self.Create(AStyleTemplateColor, AOwner);
end;

function TPenConfiguration.GetPenColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning    : Result := RGB( 251, 198, 88  );
    stDanger     : Result := RGB( 239, 129, 87  );
    stPrimary    : Result := RGB( 81 , 203, 206 );
    stSecondary  : Result := RGB( 132, 106, 208 );
    stLight      : Result := RGB( 255, 255, 255 );
    stDark       : Result := RGB( 102, 97 , 91  );
    stSuccess    : Result := RGB( 107, 208, 152 );
    stInfo       : Result := RGB( 81 , 188, 218 );
  end;
end;

function TPenConfiguration.GetPenDisabledColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning    : Result := Intensity( GetPenColor, 80 );
    stDanger     : Result := Intensity( GetPenColor, 80 );
    stPrimary    : Result := Intensity( GetPenColor, 80 );
    stSecondary  : Result := Intensity( GetPenColor, 80 );
    stLight      : Result := Intensity( GetPenColor, 80 );
    stDark       : Result := Intensity( GetPenColor, 80 );
    stSuccess    : Result := Intensity( GetPenColor, 80 );
    stInfo       : Result := Intensity( GetPenColor, 80 );
  end;
end;

function TPenConfiguration.GetPenDisabledStyle: TPenStyle;
begin
  case FStyleTemplateColor of
    stWarning    : Result := psSolid;
    stDanger     : Result := psSolid;
    stPrimary    : Result := psSolid;
    stSecondary  : Result := psSolid;
    stLight      : Result := psSolid;
    stDark       : Result := psSolid;
    stSuccess    : Result := psSolid;
    stInfo       : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenDisabledWidth: Smallint;
begin
  case FStyleTemplateColor of
    stWarning    : Result := 1;
    stDanger     : Result := 1;
    stPrimary    : Result := 1;
    stSecondary  : Result := 1;
    stLight      : Result := 1;
    stDark       : Result := 1;
    stSuccess    : Result := 1;
    stInfo       : Result := 1;
  end;
end;

function TPenConfiguration.GetPenDownColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning    : Result := Intensity( GetPenColor, 50 );
    stDanger     : Result := Intensity( GetPenColor, 50 );
    stPrimary    : Result := Intensity( GetPenColor, 40 );
    stSecondary  : Result := Intensity( GetPenColor, 50 );
    stLight      : Result := Intensity( GetPenColor, 40 );
    stDark       : Result := Intensity( GetPenColor, 25 );
    stSuccess    : Result := Intensity( GetPenColor, 50 );
    stInfo       : Result := Intensity( GetPenColor, 50 );
  end;
end;

function TPenConfiguration.GetPenDownStyle: TPenStyle;
begin
  case FStyleTemplateColor of
    stWarning    : Result := psSolid;
    stDanger     : Result := psSolid;
    stPrimary    : Result := psSolid;
    stSecondary  : Result := psSolid;
    stLight      : Result := psSolid;
    stDark       : Result := psSolid;
    stSuccess    : Result := psSolid;
    stInfo       : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenDownWidth: Smallint;
begin
  case FStyleTemplateColor of
    stWarning    : Result := 1;
    stDanger     : Result := 1;
    stPrimary    : Result := 1;
    stSecondary  : Result := 1;
    stLight      : Result := 1;
    stDark       : Result := 1;
    stSuccess    : Result := 1;
    stInfo       : Result := 1;
  end;
end;

function TPenConfiguration.GetPenFocusedColor: TColor;
begin
  case FStyleTemplateColor of
    stWarning    : Result := Intensity( GetPenColor, 45 );
    stDanger     : Result := Intensity( GetPenColor, 45 );
    stPrimary    : Result := Intensity( GetPenColor, 40 );
    stSecondary  : Result := Intensity( GetPenColor, 45 );
    stLight      : Result := Intensity( GetPenColor, 45 );
    stDark       : Result := Intensity( GetPenColor, 45 );
    stSuccess    : Result := Intensity( GetPenColor, 45 );
    stInfo       : Result := Intensity( GetPenColor, 40 );
  end;
end;

function TPenConfiguration.GetPenFocusedStyle: TPenStyle;
begin
  case FStyleTemplateColor of
    stWarning    : Result := psSolid;
    stDanger     : Result := psSolid;
    stPrimary    : Result := psSolid;
    stSecondary  : Result := psSolid;
    stLight      : Result := psSolid;
    stDark       : Result := psSolid;
    stSuccess    : Result := psSolid;
    stInfo       : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenFocusedWidth: Smallint;
begin
  case FStyleTemplateColor of
    stWarning    : Result := 1;
    stDanger     : Result := 1;
    stPrimary    : Result := 1;
    stSecondary  : Result := 1;
    stLight      : Result := 1;
    stDark       : Result := 1;
    stSuccess    : Result := 1;
    stInfo       : Result := 1;
  end;
end;

function TPenConfiguration.GetPenStyle: TPenStyle;
begin
  case FStyleTemplateColor of
    stWarning    : Result := psSolid;
    stDanger     : Result := psSolid;
    stPrimary    : Result := psSolid;
    stSecondary  : Result := psSolid;
    stLight      : Result := psSolid;
    stDark       : Result := psSolid;
    stSuccess    : Result := psSolid;
    stInfo       : Result := psSolid;
  end;
end;

function TPenConfiguration.GetPenWidth: Smallint;
begin
  case FStyleTemplateColor of
    stWarning    : Result := 1;
    stDanger     : Result := 1;
    stPrimary    : Result := 1;
    stSecondary  : Result := 1;
    stLight      : Result := 1;
    stDark       : Result := 1;
    stSuccess    : Result := 1;
    stInfo       : Result := 1;
  end;
end;

{ TFontConfiguration }

constructor TFontConfiguration.Create(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent);
begin
  FOwner              := AOwner;
  FStyleTemplateColor := AStyleTemplateColor;

  FFont              := TFont.Create;
  Font.Color         := RGB(255,255,255);
  Font.Name          := 'Segoe UI Semibold';
  Font.Style         := [];
  Font.Size          := 10;

  FFontDisabled      := TFont.Create;
  FontDisabled.Color := RGB(255,255,255);
  FontDisabled.Name  := 'Segoe UI Semibold';
  FontDisabled.Style := [];
  FontDisabled.Size  := 10;

  FFontFocused       := TFont.Create;
  FontFocused.Color  := RGB(255,255,255);
  FontFocused.Name   := 'Segoe UI Semibold';
  FontFocused.Style  := [];
  FontFocused.Size   := 10;

  FFontDown          := TFont.Create;
  FontDown.Color     := RGB(255,255,255);
  FontDown.Name      := 'Segoe UI Semibold';
  FontDown.Style     := [];
  FontDown.Size      := 10;
end;

destructor TFontConfiguration.Destroy;
begin
  FreeandNil(FFont);
  FreeandNil(FFontDisabled);
  FreeandNil(FFontFocused);
  FreeandNil(FFontDown);

  inherited;
end;

class function TFontConfiguration.New(AStyleTemplateColor: TStyleTemplateColor; AOwner: TComponent): iFontConfigurationCommon;
begin
  Result := Self.Create(AStyleTemplateColor, AOwner);
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
