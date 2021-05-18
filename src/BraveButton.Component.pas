{ Diferenca entre Invalidate/Update/Refresh/Repaint }
{ https://pt.stackoverflow.com/questions/37413/qual-a-diferen%C3%A7a-nos-m%C3%A9todos-refresh-update-repaint-invalidate-e-no-applicati }
unit BraveButton.Component;

interface

uses
  {Embarcadero}
  GraphUtil,
  Vcl.Themes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.buttons,
  Vcl.Controls,
  System.SysUtils,
  System.Classes,
  System.UITypes,
  System.Math,
  System.TypInfo,
  Winapi.Messages,
  Winapi.Windows,

  {Brave}
  BraveButton.Interfaces,
  BraveButton.Consts,
  Common.Utils, Vcl.Dialogs;

type
  TBraveButton = class;

  TFocusControl = class(TWinControl)
  private
    FGraphicControl: TBraveButton;
  protected
    procedure WndProc(var Message: TMessage); override;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKeyUp(var Message: TWMKeyDown); message WM_KEYUP;
  public
    constructor Create(AOwner: TComponent; AGraphicControl: TBraveButton); reintroduce;
    property TabStop default true;
    property TabOrder;
  end;

  TButtonChangeFont = procedure(const Value: Boolean) of Object;

  TButtonFont = class(TFont)
  private
    FCopyOfFont: Boolean;
    FonChange: TButtonChangeFont;

    function IsCopyOfFont: Boolean;
    procedure SetCopyOfFont(const Value: Boolean);
  published
    property CopyOfFont: Boolean read FCopyOfFont write SetCopyOfFont stored IsCopyOfFont default false;
  public
    property onChange: TButtonChangeFont read FonChange write FonChange;
  end;

  TBraveButton = class(TGraphicControl)
  private
    FBraveButtonTemplateColor   : iBraveButtonTemplateColor;
    FBraveButtonTemplateStyle   : iBraveButtonTemplateStyle;

    FOwner                     : TComponent;

    FAbout                     : String;

    FMouseEnter                : Boolean;
    FState                     : TButtonState;
    FFocusControl              : TFocusControl;
    FControllerStyleTemplate   : Boolean;

    FPen                       : TPen;
    FPenDown                   : TPen;
    FPenFocused                : TPen;
    FPenDisabled               : TPen;
    FPenGlassy                 : TPen;

    FBrush                     : TBrush;
    FBrushDown                 : TBrush;
    FBrushFocused              : TBrush;
    FBrushDisabled             : TBrush;
    FBrushGlassy               : TBrush;

    FPicture                   : TPicture;
    FPictureFocused            : TPicture;
    FPictureDisabled           : TPicture;
    FPictureDark               : TPicture;
    FPictureMarginLeft         : SmallInt;

    FSubFont                   : TControlCanvas;
    FFontDown                  : TButtonFont;
    FFontFocused               : TButtonFont;
    FFontDisabled              : TButtonFont;

    FSubFontDisabled           : TButtonFont;
    FSubFontFocused            : TButtonFont;
    FSubFontDown               : TButtonFont;

    FCaption                   : TCaption;
    FCaptionSub                : TCaption;
    FShowCaption               : Boolean;

    FRadius                    : SmallInt;
    FSpacing                   : SmallInt;

    FCaptionLayout             : TCaptionLayout;

    FSizeLayout                : TSizeLayout;
    FShape                     : TButtonStyleType;
    FTemplateColor             : TTemplateColor;
    FStyleOutline              : Boolean;
    FTemplateStyle             : TTemplateStyle;
    FPictureLayout             : TPictureLayout;

    FImageList                 : TImageList;
    FImageIndexPicture         : Integer;
    FImageIndexPictureFocused  : Integer;
    FImageIndexPictureDisabled : Integer;
    FIMageIndexPictureDark     : Integer;
    FGlassy: Boolean;
    FAlignment: TButtonAlignment;


    procedure SetPen              ( Value: TPen              );
    procedure SetPenDown          ( const Value: TPen        );
    procedure SetPenFocused       ( const Value: TPen        );
    procedure SetPenDisabled      ( const Value: TPen        );

    procedure SetBrush            ( Value: TBrush            );
    procedure SetBrushDown        ( const Value: TBrush      );
    procedure SetBrushFocused     ( const Value: TBrush      );
    procedure SetBrushDisabled    ( const Value: TBrush      );

    procedure SetPicture          ( const Value: TPicture    );
    procedure SetPictureFocused   ( const Value: TPicture    );
    procedure SetPictureDisabled  ( const Value: TPicture    );
    procedure SetPictureDark      ( const Value: TPicture    );

    procedure SetPictureMarginLeft( const Value: SmallInt    );

    procedure SetFontDown         ( const Value: TButtonFont );
    procedure SetFontFocused      ( const Value: TButtonFont );
    procedure SetFontDisabled     ( const Value: TButtonFont );

    procedure SetSubFont          ( const Value: TControlCanvas );
    procedure SetSubFontDisabled  ( const Value: TButtonFont    );
    procedure SetSubFontDown      ( const Value: TButtonFont    );
    procedure SetSubFontFocused   ( const Value: TButtonFont    );

    procedure SetCaptionSub       ( const Value: TCaption    );

    function IsRadius           : Boolean;
    function IsSpacing          : Boolean;
    function IsShowCaption      : Boolean;
    function IsCaptionLayout    : Boolean;
    function IsPictureMarginLeft: Boolean;

    function GetTabOrder: Integer;
    procedure SetTabStop(const Value: Boolean);

    function GetTabStop: Boolean;
    procedure SetTabOrder(const Value: Integer);

    function GetFocused: Boolean;
    function GetCanFocus: Boolean;

    procedure SetRadius(const Value: SmallInt);
    procedure SetCaption(const Value: TCaption);
    procedure SetSpacing(const Value: SmallInt);
    procedure SetShape(Value: TButtonStyleType);
    procedure SetShowCaption(const Value: Boolean);
    procedure SetCaptionLayout(const Value: TCaptionLayout);

    procedure DestroyFocusControl;
    procedure CreateFocusControl(AOwner: TComponent; AParent: TWinControl);
    procedure WMEraseBkgnd(var Message: TWMEraseBkGnd); message WM_ERASEBKGND;
    procedure DoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function informedPicture: Boolean;

    function GetPictureMarginLeft: SmallInt;
    function GetPictureWidth: SmallInt;
    function GetPictureHeight: SmallInt;
    function GetSpacing: SmallInt;

    procedure SetTemplateColor(const Value: TTemplateColor);

    function IsStyleOutline       : Boolean;
    function IsStoredTemplateColor: Boolean;
    function IsStoredTemplateStyle: Boolean;

    procedure SetStyleOutline(const Value: Boolean);
    procedure SetTemplateStyle(const Value: TTemplateStyle);

    procedure StyleChanged(Sender: TObject);
    procedure StyleOutlineConfig;

    procedure FontDownCopyOfFont    ( const AValue: Boolean );
    procedure FontFocusedCopyOfFont ( const AValue: Boolean );
    procedure FontDisabledCopyOfFont( const AValue: Boolean );

    procedure LoadingTemplateInfo;
    procedure LoadingTemplateDark;
    procedure LoadingTemplateLight;
    procedure LoadingTemplateDanger;
    procedure LoadingTemplateSuccess;
    procedure LoadingTemplateWarning;
    procedure LoadingTemplatePrimary;
    procedure LoadingTemplateSecondary;
    procedure LoadingTemplateGlassy;
    //procedure LoadingTemplateDefault;

    procedure CreateButtonColor   ( ATemplateColor: TTemplateColor );
    procedure CreateButtonTemplate( ATemplateStyle: TTemplateStyle   );

    procedure ApplyTemplate;
    procedure SetPictureTemplate;

    function isTemplateStyle            : Boolean;
    function IsPictureLayout            : Boolean;
    function IsSizeLayout               : Boolean;
    function IsImageIndexPicture        : Boolean;
    function IsImageIndexPictureDisabled: Boolean;
    function IsImageIndexPictureFocused : Boolean;
    function IsImageIndexPictureDark    : Boolean;

    procedure SetPictureLayout             ( const Value: TPictureLayout   );
    procedure SetImageList                 ( const Value: TImageList       );
    procedure SetImageIndexPicture         ( const Value: Integer          );
    procedure SetImageIndexPictureFocused  ( const Value: Integer          );
    procedure SetImageIndexPictureDisabled ( const Value: Integer          );
    procedure SetImageIndexPictureDark     ( const Value: Integer          );
    procedure SetSizeLayout                ( const Value: TSizeLayout      );

    procedure AdjustSizeLayout;
    procedure RedefineColors;
    function IsGlassy: Boolean;
    procedure SetGlassy(const Value: Boolean);



    function GetAbsolutMargin: Integer;
    function IsAligned       : Boolean;
    function IsAlignment     : Boolean;
    procedure SetAlignment(const Value: TButtonAlignment);
    procedure DefineAlignment;
  protected
    procedure DoKeyUp;
    procedure Paint; override;
    procedure SetParent(AParent: TWinControl); override;
    procedure DoKeyDown(var Key: Word; Shift: TShiftState);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure CMMouseEnter(var Message: TNotifyEvent); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TNotifyEvent); message CM_MOUSELEAVE;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure WndProc(var Message: TMessage); override;
  public
    property Focused: Boolean read GetFocused;
    property CanFocus: Boolean read GetCanFocus;

    procedure SetFocus;
    procedure Click; override;
    procedure Assign(Source: TPersistent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Action;
    property Anchors;
    property Cursor default crHandPoint;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Constraints;
    property ParentShowHint;
    property ShowHint;
    property Touch;
    property Visible;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnGesture;
    property OnStartDock;
    property OnStartDrag;
    property OnClick;
    property Font;
    property ParentFont default true;

    property About             : String              read FAbout              write FAbout Stored false;

    property Pen               : TPen                read FPen                write SetPen;
    property PenDown           : TPen                read FPenDown            write SetPenDown;
    property PenFocused        : TPen                read FPenFocused         write SetPenFocused;
    property PenDisabled       : TPen                read FPenDisabled        write SetPenDisabled;

    property Brush             : TBrush              read FBrush              write SetBrush;
    property BrushDown         : TBrush              read FBrushDown          write SetBrushDown;
    property BrushFocused      : TBrush              read FBrushFocused       write SetBrushFocused;
    property BrushDisabled     : TBrush              read FBrushDisabled      write SetBrushDisabled;

    property Picture           : TPicture            read FPicture            write SetPicture;
    property PictureFocused    : TPicture            read FPictureFocused     write SetPictureFocused;
    property PictureDisabled   : TPicture            read FPictureDisabled    write SetPictureDisabled;
    property PictureDark       : TPicture            read FPictureDark        write SetPictureDark;

    property FontDown          : TButtonFont         read FFontDown           write SetFontDown;
    property FontFocused       : TButtonFont         read FFontFocused        write SetFontFocused;
    property FontDisabled      : TButtonFont         read FFontDisabled       write SetFontDisabled;

    property SubFont           : TControlCanvas      read FSubFont            write SetSubFont;
    property SubFontDown       : TButtonFont         read FSubFontDown        write SetSubFontDown;
    property SubFontFocused    : TButtonFont         read FSubFontFocused     write SetSubFontFocused;
    property SubFontDisabled   : TButtonFont         read FSubFontDisabled    write SetSubFontDisabled;

    property Alignment         : TButtonAlignment    read FAlignment          write SetAlignment           stored IsAlignment                 default baNone;
    property Caption           : TCaption            read FCaption            write SetCaption;
    property CaptionSub        : TCaption            read FCaptionSub         write SetCaptionSub;
    property TabOrder          : Integer             read GetTabOrder         write SetTabOrder;
    property TabStop           : Boolean             read GetTabStop          write SetTabStop                                                default true;
    property Shape             : TButtonStyleType    read FShape              write SetShape                                                  default stRectangle;
    property Radius            : SmallInt            read FRadius             write SetRadius              stored IsRadius                    default 4;
    property Glassy            : Boolean             read FGlassy             write SetGlassy              stored IsGlassy                    default False;
    property Spacing           : SmallInt            read FSpacing            write SetSpacing             stored IsSpacing                   default 10;
    property ShowCaption       : Boolean             read FShowCaption        write SetShowCaption         stored IsShowCaption               default true;
    property CaptionLayout     : TCaptionLayout      read FCaptionLayout      write SetCaptionLayout       stored IsCaptionLayout             default clNone;
    property PictureMarginLeft : SmallInt            read FPictureMarginLeft  write SetPictureMarginLeft   stored IsPictureMarginLeft         default 6;
    property TemplateColor     : TTemplateColor      read FTemplateColor      write SetTemplateColor       stored IsStoredTemplateColor       default tcCustom;
    property StyleOutline      : Boolean             read FStyleOutline       write SetStyleOutline        stored IsStyleOutline              default false;
    property TemplateStyle     : TTemplateStyle      read FTemplateStyle      write SetTemplateStyle       stored IsStoredTemplateStyle       default tsBasic;
    property PictureLayout     : TPictureLayout      read FPictureLayout      write SetPictureLayout       stored IsPictureLayout             default plGraphicCenter;
    property SizeLayout        : TSizeLayout         read FSizeLayout         write SetSizeLayout          stored IsSizeLayout                default sl110x35;

    property ImageList                : TImageList read FImageList                 write SetImageList;
    property ImageIndexPicture        : Integer    read FImageIndexPicture         write SetImageIndexPicture         stored IsImageIndexPicture         default -1;
    property ImageIndexPictureFocused : Integer    read FImageIndexPictureFocused  write SetImageIndexPictureFocused  stored IsImageIndexPictureFocused  default -1;
    property ImageIndexPictureDisabled: Integer    read FImageIndexPictureDisabled write SetImageIndexPictureDisabled stored IsImageIndexPictureDisabled default -1;
    property IMageIndexPictureDark    : Integer    read FIMageIndexPictureDark     write SetIMageIndexPictureDark     stored IsImageIndexPictureDark     default -1;
  end;

implementation

uses
  BraveButton.TemplateColor,
  BraveButton.TemplateStyle;

constructor TBraveButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FOwner := AOwner;

  FFocusControl := nil;
  CreateFocusControl(nil, TWinControl(AOwner));

  Cursor := crHandPoint;
  ControlStyle := ControlStyle + [csReplicatable];
  ParentFont := true;


  SetSizeLayout(sl110x35);

  // Pen
  FPen              := TPen.Create;
  FPen.onChange     := StyleChanged;
  // PenDown
  FPenDown          := TPen.Create;
  FPenDown.onChange := StyleChanged;
  // PenFocused
  FPenFocused := TPen.Create;
  FPenFocused.onChange := StyleChanged;
  // PenDisabled
  FPenDisabled := TPen.Create;
  FPenDisabled.onChange := StyleChanged;
  // PenGlassy
  FPenGlassy := TPen.Create;
  FPenGlassy.OnChange := StyleChanged;

  // Brush
  FBrush := TBrush.Create;
  FBrush.onChange := StyleChanged;
  // BrushDown
  FBrushDown := TBrush.Create;
  FBrushDown.onChange := StyleChanged;
  // BrushFocused
  FBrushFocused := TBrush.Create;
  FBrushFocused.onChange := StyleChanged;
  // BrushDisabled
  FBrushDisabled := TBrush.Create;
  FBrushDisabled.onChange := StyleChanged;
  // BrushGlassy
  FBrushGlassy := TBrush.Create;
  FBrushGlassy.OnChange := StyleChanged;

  // Picture
  FPicture := TPicture.Create;
  FPicture.onChange := StyleChanged;

  // PictureFocused
  FPictureFocused := TPicture.Create;
  FPictureFocused.onChange := StyleChanged;

  // PictureDisabled
  FPictureDisabled := TPicture.Create;
  FPictureDisabled.onChange := StyleChanged;

  // PictureDark
  FPictureDark := TPicture.Create;
  FPictureDark.onChange := StyleChanged;

  // FontDown
  FFontDown := TButtonFont.Create;
  FFontDown.onChange := FontDownCopyOfFont;

  // FontFocused
  FFontFocused := TButtonFont.Create;
  FFontFocused.onChange := FontFocusedCopyOfFont;

  // FontDisabled
  FFontDisabled := TButtonFont.Create;
  FFontDisabled.onChange := FontDisabledCopyOfFont;


  // SubFont
  FSubFont            := TControlCanvas.Create;
  FSubFont.Control    := Self;

  //FSubFont.onChange := FontDownCopyOfFont;

  // SubFontDown
  FSubFontDown := TButtonFont.Create;
  FSubFontDown.onChange := FontDownCopyOfFont;

  // SubFontFocused
  FSubFontFocused := TButtonFont.Create;
  FSubFontFocused.onChange := FontFocusedCopyOfFont;

  // SubFontDisabled
  FSubFontDisabled := TButtonFont.Create;
  FSubFontDisabled.onChange := FontDisabledCopyOfFont;

  FMouseEnter := false;
  FShowCaption := true;

  TabStop := true;

  OnMouseDown := DoMouseDown;
  OnMouseUp := DoMouseUp;

  FControllerStyleTemplate := false;

  FStyleOutline := false;
  FAlignment := baNone;

  ImageIndexPicture         := -1;
  ImageIndexPictureFocused  := -1;
  ImageIndexPictureDisabled := -1;
  IMageIndexPictureDark     := -1;

  CreateButtonTemplate(tsBasic);
end;

procedure TBraveButton.AdjustSizeLayout;
begin
  case FSizeLayout of
    sl25x25  :
    begin
      Self.Width  := 25;
      Self.Height := 25;
    end;
    sl90x25:
    begin
      Self.Width  := 90;
      Self.Height := 25;
    end;
    sl90x30:
    begin
      Self.Width  := 90;
      Self.Height := 30;
    end;
    sl110x30 :
    begin
      Self.Width  := 110;
      Self.Height := 30;
    end;
    sl110x25 :
    begin
      Self.Width  := 110;
      Self.Height := 25;
    end;
    sl110x35 :
    begin
      Self.Width  := 110;
      Self.Height := 35;
    end;
    sl110x60 :
    begin
      Self.Width  := 110;
      Self.Height := 60;
    end;
    sl110x90 :
    begin
      Self.Width  := 110;
      Self.Height := 90;
    end;
  end;
end;

procedure TBraveButton.ApplyTemplate;
begin
  Brush.Color         := FBraveButtonTemplateColor.GetBrushConfigurationCommon.GetBrushColor;
  BrushFocused.Color  := FBraveButtonTemplateColor.GetBrushConfigurationCommon.GetBrushFocusedColor;
  BrushDown.Color     := FBraveButtonTemplateColor.GetBrushConfigurationCommon.GetBrushDownColor;
  BrushDisabled.Color := FBraveButtonTemplateColor.GetBrushConfigurationCommon.GetBrushDisabledColor;
  FBrushGlassy.Color  := FBraveButtonTemplateColor.GetBrushConfigurationCommon.GetBrushGlassyColor;

  Pen.Color           := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenColor;
  Pen.Style           := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenStyle;
  Pen.Width           := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenDownWidth;

  PenFocused.Color    := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenFocusedColor;
  PenFocused.Style    := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenFocusedStyle;
  PenFocused.Width    := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenFocusedWidth;

  PenDown.Color       := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenDownColor;
  PenDown.Style       := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenDownStyle;
  PenDown.Width       := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenDownWidth;

  PenDisabled.Color   := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenDisabledColor;
  PenDisabled.Style   := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenDisabledStyle;
  PenDisabled.Width   := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenDisabledWidth;

  FPenGlassy.Color   := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenGlassyColor;
  FPenGlassy.Style   := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenGlassyStyle;
  FPenGlassy.Width   := FBraveButtonTemplateColor.GetPenConfigurationCommon.GetPenGlassyWidth;

  Font.Assign           ( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFont          );
  FontDown.Assign       ( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFontDown      );
  FontDisabled.Assign   ( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFontDisabled  );
  FontFocused.Assign    ( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFontFocused   );

  SubFont.Font.Assign   ( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFont          );
  SubFontDown.Assign    ( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFontDown      );
  SubFontFocused.Assign ( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFontFocused   );
  SubFontDisabled.Assign( FBraveButtonTemplateColor.GetFontConfigurationCommon.GetFontDisabled  );
end;

procedure TBraveButton.Assign(Source: TPersistent);
begin
  if Source is TBraveButton then
  begin
    Brush.Assign(TBraveButton(Source).Brush);
    BrushFocused.Assign(TBraveButton(Source).BrushFocused);
    Pen.Assign(TBraveButton(Source).Pen);
    PenFocused.Assign(TBraveButton(Source).PenFocused);
    Font.Assign(TBraveButton(Source).Font);
    FontFocused.Assign(TBraveButton(Source).FontFocused);
    FontDown.Assign(TBraveButton(Source).FontDown);
    Radius := TBraveButton(Source).Radius;
  end
  else
    inherited Assign(Source);
end;

procedure TBraveButton.ChangeScale(M, D: Integer; isDpiChange: Boolean);
var
  Flags: TScalingFlags;
begin
  FPen.Width := MulDiv(FPen.Width, M, D);
  // Scaling of other Fonts as current Font
  if csLoading in ComponentState then
    Flags := ScalingFlags
  else
    Flags := DefaultScalingFlags;

  if not ParentFont and (sfFont in Flags) then
  begin
    FFontDown.Height     := MulDiv( FFontDown.Height    , M, D );
    FFontFocused.Height  := MulDiv( FFontFocused.Height , M, D );
    FFontDisabled.Height := MulDiv( FFontDisabled.Height, M, D );
  end;

  inherited;
end;

procedure TBraveButton.Click;
begin
  inherited;
end;

procedure TBraveButton.CMEnter(var Message: TCMEnter);
begin
  if not(Enabled) or (csDesigning in ComponentState) then
    Exit;

  FMouseEnter := false;
  invalidate;
end;

procedure TBraveButton.CMMouseEnter(var Message: TNotifyEvent);
begin
  if not(Enabled) or (csDesigning in ComponentState) then
    Exit;

  FMouseEnter := true;
  invalidate;
end;

procedure TBraveButton.CMMouseLeave(var Message: TNotifyEvent);
begin
  if not(Enabled) or (csDesigning in ComponentState) then
    Exit;

  FMouseEnter := false;
  invalidate;
end;

procedure TBraveButton.FontDisabledCopyOfFont(const AValue: Boolean);
begin
  if AValue then
    FFontDisabled.Assign(Font);
end;

procedure TBraveButton.FontDownCopyOfFont(const AValue: Boolean);
begin
  if AValue then
    FFontDown.Assign(Font);
end;

procedure TBraveButton.FontFocusedCopyOfFont(const AValue: Boolean);
begin
  if AValue then
    FFontFocused.Assign(Font);
end;

procedure TBraveButton.CreateButtonColor(ATemplateColor: TTemplateColor);
begin
  case ATemplateColor of
    tcCustom:
    begin

    end;

    tcWarning:
    begin
      LoadingTemplateWarning;
    end;

    tcDanger:
    begin
      LoadingTemplateDanger;
    end;

    tcPrimary:
    begin
      LoadingTemplatePrimary;
    end;

    tcSecondary:
    begin
      LoadingTemplateSecondary;
    end;

    tcLight:
    begin
      LoadingTemplateLight;
    end;

    tcDark:
    begin
      LoadingTemplateDark;
    end;

    tcSuccess:
    begin
      LoadingTemplateSuccess;
    end;

    tcInfo:
    begin
      LoadingTemplateInfo;
    end;
  end;
end;

procedure TBraveButton.CreateButtonTemplate(ATemplateStyle: TTemplateStyle);
begin
  case ATemplateStyle of
    tsBasic:
    begin
      SetSizeLayout(sl90x25);
      LoadingTemplateLight;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsBasic, tcLight);

      Self.Caption           := '';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsAdd:
    begin
      SetSizeLayout(sl25x25);

      LoadingTemplateDark;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsAdd, tcDark);

      Self.Caption           := '';
      Self.CaptionLayout     := clCenter;
      Self.PictureMarginLeft := 0;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 0;
    end;

    tsRemove:
    begin
      SetSizeLayout(sl25x25);

      LoadingTemplateDark;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsRemove, tcDark);

      Self.Caption           := '';
      Self.CaptionLayout     := clCenter;
      Self.PictureMarginLeft := 0;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 0;
    end;

    tsCancel:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplateDark;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsCancel, tcDark);

      Self.Caption           := 'CANCELAR';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsOK:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplateSuccess;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsOK, tcSuccess);

      Self.Caption           := 'OK';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsDelete:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplateDanger;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsDelete, tcDanger);

      Self.Caption           := 'DELETAR';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsSave:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplateSuccess;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsSave, tcSuccess);

      Self.Caption           := 'SALVAR';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsNew:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsNew, tcPrimary);

      Self.Caption           := 'NOVO';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsEdit:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplateWarning;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsEdit, tcWarning);

      Self.Caption           := 'EDITAR';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsFind:
    begin
      SetSizeLayout(sl25x25);

      LoadingTemplateDark;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsFind, tcDark);

      Self.Caption           := '';
      Self.CaptionLayout     := clCenter;
      Self.PictureMarginLeft := 0;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 0;
    end;

    tsSearch:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsSearch, tcPrimary);

      Self.Caption           := 'Procurar';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsPrint:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsPrint, tcLight);

      Self.Caption           := 'Imprimir';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsRefresh:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsRefresh, tcLight);

      Self.Caption           := 'Atualizar';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsArrowUp:
    begin
      SetSizeLayout(sl25x25);

      LoadingTemplateDark;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsArrowUp, tcDark);

      Self.Caption           := '';
      Self.CaptionLayout     := clCenter;
      Self.PictureMarginLeft := 0;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 0;
    end;

    tsArrowDown:
    begin
      SetSizeLayout(sl25x25);

      LoadingTemplateDark;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsArrowDown, tcDark);

      Self.Caption           := '';
      Self.CaptionLayout     := clCenter;
      Self.PictureMarginLeft := 0;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 0;
    end;

    tsArrowRight:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsArrowRight, tcPrimary);

      Self.Caption           := 'PRÓXIMO';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsArrowLeft:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsArrowLeft, tcPrimary);

      Self.Caption           := 'ANTERIOR';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsKey:
    begin
      SetSizeLayout(sl90x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsKey, tcPrimary);

      Self.Caption           := 'PERMISSÃO';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsConfig:
    begin
      SetSizeLayout(sl110x25);

      LoadingTemplatePrimary;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsConfig, tcPrimary);

      Self.Caption           := 'CONFIGURAÇÃO';
      Self.CaptionLayout     := clLeft;
      Self.PictureMarginLeft := 2;
      Self.PictureLayout     := plGraphicCenter;
      Self.Spacing           := 2;
    end;

    tsMain:
    begin
      SetSizeLayout(sl110x90);

      LoadingTemplateLight;
      FBraveButtonTemplateStyle := TBraveButtonTemplateStyle.New(tsNew, tcLight);

      Self.Caption           := '';
      Self.CaptionLayout     := clCenter;
      Self.PictureMarginLeft := 0;
      Self.PictureLayout     := plGraphicTop;
    end;
  end;
end;

procedure TBraveButton.CreateFocusControl(AOwner: TComponent; AParent: TWinControl);
begin
  if not Assigned(FFocusControl) then
  begin
    FFocusControl := TFocusControl.Create(AOwner, Self);
    try
      FFocusControl.TabStop := true;
      FFocusControl.SetBounds(0, 0, 0, 0);
    except
      raise;
    end;
  end;
end;

procedure TBraveButton.DefineAlignment;
begin
  if not IsAligned then
  begin
    case Alignment of
      baLeftCenter :
      begin
        Self.Left := 0;
        Self.Top  := ( ( ( Self.Parent.Height + GetAbsolutMargin ) div 2 ) - ( Self.Height div 2 ) );
      end;

      baLeftCustom   :
      begin
        Self.Left := 0 ;
      end;

      baRightCenter:
      begin
        Self.Left := Self.Parent.Width - Self.Width - GetAbsolutMargin;
        Self.Top  := ( ( ( Self.Parent.Height + GetAbsolutMargin ) div 2 ) - ( Self.Height div 2 ) );
      end;

      baRightCustom  :
      begin
        Self.Left := Self.Parent.Width - Self.Width - GetAbsolutMargin;
      end;

      baTopCenter:
      begin
        Self.Top  := 0;
        Self.Left := ( Self.Parent.Width div 2 ) - ( Self.Width div 2 );
      end;

      baTopCustom    :
      begin
        Self.Top  := 0;
      end;

      baBottomCenter :
      begin
        Self.Top  := Self.Parent.Height - Self.Height - GetAbsolutMargin;
        Self.Left := ( Self.Parent.Width div 2 ) - ( Self.Width div 2 );
      end;

      baBottomCustom :
      begin
        Self.Top  := Self.Parent.Height - Self.Height - GetAbsolutMargin;
      end;

      baCenter:
      begin
        Self.Top  := ( Self.Parent.Height div 2 ) - ( Self.Height div 2 );
        Self.Left := ( Self.Parent.Width div 2  ) - ( Self.Width div 2  );
      end;
    end;
  end;
end;

destructor TBraveButton.Destroy;
begin
  FPen.Free;
  FPenDown.Free;
  FPenFocused.Free;
  FPenDisabled.Free;
  FPenGlassy.Free;

  FBrush.Free;
  FBrushDown.Free;
  FBrushFocused.Free;
  FBrushDisabled.Free;
  FBrushGlassy.Free;

  FPicture.Free;
  FPictureFocused.Free;
  FPictureDisabled.Free;
  FPictureDark.Free;

  FFontDown.Free;
  FFontFocused.Free;
  FFontDisabled.Free;

  FSubFont.Free;
  FSubFontDown.Free;
  FSubFontFocused.Free;
  FSubFontDisabled.Free;

  DestroyFocusControl;

  inherited Destroy;
end;

procedure TBraveButton.DestroyFocusControl;
begin
  if Assigned(FFocusControl) then
  begin
    if Assigned(FFocusControl.Parent) then
      FreeAndNil(FFocusControl);
  end;
end;

procedure TBraveButton.DoKeyDown(var Key: Word; Shift: TShiftState);
begin
  if ( Key in [13, 32] ) then
  begin
    FState := bsDown;
    invalidate;

    Self.Click;
  end;
end;

procedure TBraveButton.DoKeyUp;
begin
  FState := bsUp;

  invalidate;
end;

procedure TBraveButton.DoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FState := bsDown;

  invalidate;
end;

procedure TBraveButton.DoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FState := bsUp;

  invalidate;
end;

function TBraveButton.GetCanFocus: Boolean;
begin
  if Assigned(FFocusControl) then
    result := FFocusControl.CanFocus
  else
    result := false;
end;

function TBraveButton.GetFocused: Boolean;
begin
  if Assigned(FFocusControl) then
    result := FFocusControl.Focused
  else
    result := false;
end;

function TBraveButton.GetAbsolutMargin: Integer;
begin
  Result := 0;

  case TForm(Self.Parent).BorderStyle of
    bsNone        : Result := 0  + TForm(Self.Parent).BorderWidth;
    bsSingle      : Result := 8  + TForm(Self.Parent).BorderWidth;
    bsSizeable    : Result := 16 + TForm(Self.Parent).BorderWidth;
    bsDialog      : Result := 8  + TForm(Self.Parent).BorderWidth;
    bsToolWindow  : Result := 8  + TForm(Self.Parent).BorderWidth;
    bsSizeToolWin : Result := 16 + TForm(Self.Parent).BorderWidth;
  end;
end;

function TBraveButton.GetPictureHeight: SmallInt;
begin
  result := 0;
  if informedPicture then
    result := MaxIntValue([FPicture.Height, FPictureFocused.Height, FPictureDisabled.Height, FPictureDark.Height]);
end;

function TBraveButton.GetPictureMarginLeft: SmallInt;
begin
  result := 0;
  if informedPicture then
    result := FPictureMarginLeft;
end;

function TBraveButton.GetPictureWidth: SmallInt;
begin
  result := 0;
  if informedPicture then
    result := MaxIntValue([FPicture.Width, FPictureFocused.Width, FPictureDisabled.Width, FPictureDark.Width]);
end;

function TBraveButton.GetSpacing: SmallInt;
begin
  result := 0;
  if informedPicture then
    result := FSpacing;
end;

function TBraveButton.GetTabOrder: Integer;
begin
  if Assigned(FFocusControl) then
    result := FFocusControl.TabOrder
  else
    result := -1;
end;

function TBraveButton.GetTabStop: Boolean;
begin
  if Assigned(FFocusControl) then
    result := FFocusControl.TabStop
  else
    result := false;
end;

function TBraveButton.informedPicture: Boolean;
begin
  result := Assigned(FPicture.Graphic) or Assigned(FPictureFocused.Graphic) or Assigned(FPictureDisabled.Graphic) or Assigned(FPictureDark.Graphic);
end;

function TBraveButton.IsAligned: Boolean;
begin
  case Alignment of
      baLeftCenter :
      begin
        Result :=
          ( Self.Left = 0 )
          and
          ( Self.Top = ( ( ( Self.Parent.Height + GetAbsolutMargin ) div 2 ) - ( Self.Height div 2 ) ) )
          and
          ( FAlignment = baLeftCenter );
      end;

      baLeftCustom   :
      begin
        Result :=
          ( Self.Left = 0 )
          and
          ( FAlignment = baLeftCustom );
      end;

      baRightCenter:
      begin
        Result :=
          ( Self.Left = Self.Parent.Width - Self.Width - GetAbsolutMargin )
          and
          ( Self.Top = ( ( ( Self.Parent.Height + GetAbsolutMargin ) div 2 ) - ( Self.Height div 2 ) ) )
          and
          ( FAlignment = baRightCenter );
      end;

      baRightCustom  :
      begin
        Result :=
          ( Self.Left = Self.Parent.Width - Self.Width - GetAbsolutMargin )
          and
          ( FAlignment = baRightCustom );
      end;

      baTopCenter:
      begin
        Result :=
          ( Self.Top = 0 )
          and
          ( Self.Left = ( Self.Parent.Width div 2 ) - ( Self.Width div 2 ) )
          and
          ( FAlignment = baTopCenter );
      end;

      baTopCustom    :
      begin
        Result :=
          ( Self.Top = 0 )
          and
          ( FAlignment = baTopCustom );
      end;

      baBottomCenter :
      begin
        Result :=
          ( Self.Top = Self.Parent.Height - Self.Height - GetAbsolutMargin )
          and
          ( Self.Left = ( Self.Parent.Width div 2 ) - ( Self.Width div 2 ) )
          and
          ( FAlignment = baBottomCenter );
      end;

      baBottomCustom :
      begin
        Result :=
          ( Self.Top = Self.Parent.Height - Self.Height - GetAbsolutMargin )
          and
          ( FAlignment = baBottomCustom );
      end;

      baCenter:
      begin
        Result :=
          ( Self.Top = ( Self.Parent.Height div 2 ) - ( Self.Height div 2 ) )
          and
          ( Self.Left = ( Self.Parent.Width div 2  ) - ( Self.Width div 2  ) )
          and
          ( FAlignment = baCenter );
      end;
  end;
end;

function TBraveButton.IsAlignment: Boolean;
begin
  Result := FAlignment <> baNone;
end;

function TBraveButton.IsGlassy: Boolean;
begin
  Result := Glassy <> false;
end;

function TBraveButton.IsImageIndexPicture: Boolean;
begin
  result := ImageIndexPicture <> -1;
end;

function TBraveButton.IsImageIndexPictureDark: Boolean;
begin
  result := ImageIndexPictureDark <> -1;
end;

function TBraveButton.IsImageIndexPictureDisabled: Boolean;
begin
  result := ImageIndexPictureDisabled <> -1;
end;

function TBraveButton.IsImageIndexPictureFocused: Boolean;
begin
  result := ImageIndexPictureFocused <> -1;
end;

function TBraveButton.IsStyleOutline: Boolean;
begin
  result := StyleOutline <> false;
end;

function TBraveButton.IsPictureLayout: Boolean;
begin
  result := PictureLayout <> plGraphicCenter;
end;

function TBraveButton.IsPictureMarginLeft: Boolean;
begin
  result := PictureMarginLeft <> 6;
end;

function TBraveButton.IsRadius: Boolean;
begin
  result := Radius <> 3;
end;

function TBraveButton.IsShowCaption: Boolean;
begin
  result := ShowCaption <> true;
end;

function TBraveButton.IsSizeLayout: Boolean;
begin
  Result := False;

  case FSizeLayout of
    sl25x25  : Result := ( Width =  25 ) AND ( Height = 25 );
    sl90x25  : Result := ( Width =  90 ) AND ( Height = 25 );
    sl90x30  : Result := ( Width =  90 ) AND ( Height = 30 );
    sl110x25 : Result := ( Width = 110 ) AND ( Height = 25 );
    sl110x30 : Result := ( Width = 110 ) AND ( Height = 30 );
    sl110x35 : Result := ( Width = 110 ) AND ( Height = 35 );
    sl110x60 : Result := ( Width = 110 ) AND ( Height = 60 );
    sl110x90 : Result := ( Width = 110 ) AND ( Height = 90 );
  end;
end;

function TBraveButton.IsSpacing: Boolean;
begin
  result := Spacing <> 10;
end;

function TBraveButton.IsCaptionLayout: Boolean;
begin
  result := CaptionLayout <> clNone;
end;

function TBraveButton.IsStoredTemplateColor: Boolean;
begin
  result := TemplateColor <> tcCustom;
end;

function TBraveButton.IsStoredTemplateStyle: Boolean;
begin
  result := TemplateStyle <> tsBasic;
end;

procedure TBraveButton.Paint;
var
  ClientSize, X, Y, w, h: Integer;
begin
  inherited;

  with Canvas do
  begin
    if not IsSizeLayout then
      AdjustSizeLayout;

    if IsAlignment then
      DefineAlignment;

    if not(Enabled) then
    begin
      Pen                 := FPenDisabled;
      Brush               := FBrushDisabled;
      Font                := FFontDisabled;

      FSubFont.Pen        := FPenDisabled;
      FSubFont.Brush      := FBrushDisabled;
      FSubFont.Font       := FFontDisabled;
      FSubFont.Font.Size  := Font.Size - 2;
      FSubFont.Font.Style := [];

      if IsStyleOutline then
      begin
        Font.Color         := FPenDisabled.Color;
        FSubFont.Pen.Color := FPenDisabled.Color;
      end;
    end
    else if FState = bsDown then
    begin
      Pen                 := FPenDown;
      Brush               := FBrushDown;
      Font                := FFontDown;

      FSubFont.Pen        := FPenDown;
      FSubFont.Brush      := FBrushDown;
      FSubFont.Font       := FFontDown;
      FSubFont.Font.Size  := Font.Size - 2;
      FSubFont.Font.Style := [];
    end
    else if FMouseEnter or Focused then
    begin
      Pen                 := FPenFocused;
      Brush               := FBrushFocused;
      Font                := FFontFocused;

      FSubFont.Pen        := FPenFocused;
      FSubFont.Brush      := FBrushFocused;
      FSubFont.Font       := FFontFocused;
      FSubFont.Font.Size  := Font.Size - 2;
      FSubFont.Font.Style := [];

      if IsStyleOutline then
      begin
        //Font.Color         := FPenFocused.Color;
        //FSubFont.Pen.Color := FPenFocused.Color;
      end;
    end
    else
    begin
      Pen                 := FPen;
      Brush               := FBrush;
      Font                := Self.Font;

      FSubFont.Pen        := FPen;
      FSubFont.Brush      := FBrush;
      FSubFont.Font       := Self.Font;
      FSubFont.Font.Size  := Font.Size - 2;
      FSubFont.Font.Style := [];

      if IsStyleOutline then
      begin
        Font.Color         := FPen.Color;
        FSubFont.Pen.Color := FPen.Color;
      end;

      if IsGlassy then
      begin
        Brush              := FBrushGlassy;
        Font.Color         := FPen.Color;
        FSubFont.Pen.Color := FPen.Color;
        FPen               := FPenGlassy;
      end;
    end;

    if (FShape = stRoundRect) and (Pen.Width = 2) then
      Pen.Width := 1;

    X := Pen.Width div 2;

    Y := X;
    w := Width - Pen.Width + 1;
    h := Height - Pen.Width + 1;

    if Pen.Width = 0 then
    begin
      Dec(w);
      Dec(h);
    end;

    case FShape of
      stRectangle:
        Rectangle(X, Y, X + w, Y + h);
      stRoundRect:
        RoundRect(X, Y, X + w, Y + h, Radius, Radius);
    end;

    X := GetPictureMarginLeft;

    if ( (Caption = '') or (FPictureLayout <> plGraphicCenter)) then
      X := ( ClientWidth - GetPictureWidth ) div 2;

    ClientSize := ClientHeight - GetPictureHeight;
    case PictureLayout of
      plGraphicCenter:
      begin
        h := ClientSize div 2;
      end;
      plGraphicBottom:
      begin
        h := (ClientSize + Canvas.TextHeight(Caption)) div 2;
        PictureMarginLeft := 0;
        CaptionLayout := clCenter;
      end;
      plGraphicTop:
      begin
        h := (ClientSize - Canvas.TextHeight(Caption)) div 2;
        PictureMarginLeft := 0;
        CaptionLayout := clCenter;
      end;
    end;

    if not(Enabled) then
    begin
      if Assigned(PictureDisabled.Graphic) then
        Draw(X, h, PictureDisabled.Graphic)
      else
        Draw(X, h, Picture.Graphic);
    end
    else if FMouseEnter or Focused then
    begin
      if Assigned(PictureFocused.Graphic) then
        Draw(X, h, PictureFocused.Graphic)
      else
        Draw(X, h, Picture.Graphic);
    end
    else
      Draw(X, h, Picture.Graphic);

    if FShowCaption and (Trim(Caption) <> '') then
    begin
      if CaptionLayout = clCenter then
      begin
        if (Assigned(Picture.Graphic) or (Assigned(PictureFocused.Graphic) and (FMouseEnter or Focused))) and (FPictureLayout = plGraphicCenter) then
          X    := ( ( ClientWidth - ( GetPictureWidth + PictureMarginLeft ) ) div 2 ) - 7
        else
          X    := ( ( ClientWidth - Canvas.TextWidth(Caption) ) div 2 ) - 7;
      end
      else
        X := GetPictureWidth + PictureMarginLeft + GetSpacing;

      ClientSize := ClientHeight - Canvas.TextHeight(Caption);
      case PictureLayout of
        plGraphicCenter:
          Y := ClientSize div 2;
        plGraphicBottom:
          Y := ((ClientSize - GetPictureHeight) div 2) - 2 + Spacing;
        plGraphicTop:
          Y := ((ClientSize + GetPictureHeight) div 2) - 2 + Spacing;
      end;

      if FCaptionSub <> '' then
      begin
        TextOut         ( X, Y + FSubFont.Font.Height + 4, AnsiUpperCase( Caption     ) );
        FSubFont.TextOut( X, Y - FSubFont.Font.Height - 2, AnsiUpperCase( FCaptionSub ) );
      end
      else
        TextOut( X, Y, AnsiUpperCase( Caption ) );
    end;
  end;
end;

procedure TBraveButton.RedefineColors;
begin

  //LoadingTemplateGlassy;
end;

procedure TBraveButton.SetCaptionLayout(const Value: TCaptionLayout);
begin
  if FCaptionLayout <> Value then
  begin
    FCaptionLayout := Value;
    invalidate;
  end;
end;

procedure TBraveButton.SetAlignment(const Value: TButtonAlignment);
begin
  FAlignment := Value;
end;

procedure TBraveButton.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  Repaint;
end;

procedure TBraveButton.SetBrush(Value: TBrush);
begin
  FBrush.Assign(Value);
end;

procedure TBraveButton.SetBrushDisabled(const Value: TBrush);
begin
  FBrushDisabled.Assign(Value);
end;

procedure TBraveButton.SetBrushDown(const Value: TBrush);
begin
  FBrushDown.Assign(Value);
end;

procedure TBraveButton.SetBrushFocused(const Value: TBrush);
begin
  FBrushFocused.Assign(Value);
end;

procedure TBraveButton.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
  Invalidate;
end;

procedure TBraveButton.SetCaptionSub(const Value: TCaption);
begin
  FCaptionSub := Value;
  Invalidate;
end;

procedure TBraveButton.SetFocus;
begin
  if Assigned(FFocusControl) then
    if FFocusControl.CanFocus then
      FFocusControl.SetFocus;
end;

procedure TBraveButton.SetFontDisabled(const Value: TButtonFont);
begin
  FFontDisabled.Assign(Value);
end;

procedure TBraveButton.SetFontDown(const Value: TButtonFont);
begin
  FFontDown.Assign(Value);
end;

procedure TBraveButton.SetFontFocused(const Value: TButtonFont);
begin
  FFontFocused.Assign(Value);
end;

procedure TBraveButton.SetGlassy(const Value: Boolean);
begin
  if FGlassy <> Value then
    FGlassy := Value;
  Invalidate;
end;

procedure TBraveButton.SetImageIndexPicture(const Value: Integer);
begin
  if FImageIndexPicture <> Value then
  begin
    FImageIndexPicture := Value;

    if Assigned(ImageList) then
    begin
      FPicture.Graphic := nil;
      ImageList.GetBitmap(Value, FPicture.bitmap);

      invalidate;
    end;
  end;
end;

procedure TBraveButton.SetImageIndexPictureDark(const Value: Integer);
begin
  if FIMageIndexPictureDark <> Value then
  begin
    FIMageIndexPictureDark := Value;

    if Assigned(ImageList) then
    begin
      FPictureDark.Graphic := nil;
      ImageList.GetBitmap(Value, FPictureDark.bitmap);

      invalidate;
    end;
  end;
end;

procedure TBraveButton.SetImageIndexPictureDisabled(const Value: Integer);
begin
  if FImageIndexPictureDisabled <> Value then
  begin
    FImageIndexPictureDisabled := Value;

    if Assigned(ImageList) then
    begin
      FPictureDisabled.Graphic := nil;
      ImageList.GetBitmap(Value, FPictureDisabled.bitmap);

      invalidate;
    end;
  end;
end;

procedure TBraveButton.SetImageIndexPictureFocused(const Value: Integer);
begin
  if FImageIndexPictureFocused <> Value then
  begin
    FImageIndexPictureFocused := Value;

    if Assigned(ImageList) then
    begin
      FPictureFocused.Graphic := nil;
      ImageList.GetBitmap(Value, FPictureFocused.bitmap);

      invalidate;
    end;
  end;
end;

procedure TBraveButton.SetImageList(const Value: TImageList);
begin
  if FImageList <> Value then
  begin
    FImageList := Value;

    invalidate;
  end;
end;

procedure TBraveButton.SetStyleOutline(const Value: Boolean);
begin
  if FStyleOutline <> Value then
  begin
    FStyleOutline := Value;

    if TemplateColor <> tcCustom then
      SetTemplateColor(FTemplateColor)
    else if isTemplateStyle then
      SetTemplateStyle(FTemplateStyle);
  end;
end;

procedure TBraveButton.SetSubFont(const Value: TControlCanvas);
begin
  FSubFont := Value;
end;

procedure TBraveButton.SetSubFontDisabled(const Value: TButtonFont);
begin
  FSubFontDisabled := Value;
end;

procedure TBraveButton.SetSubFontDown(const Value: TButtonFont);
begin
  FSubFontDown := Value;
end;

procedure TBraveButton.SetSubFontFocused(const Value: TButtonFont);
begin
  FSubFontFocused := Value;
end;

procedure TBraveButton.SetParent(AParent: TWinControl);
begin
  inherited;
  if Assigned(Self.Parent) then
  begin
    FFocusControl.Parent := Self.Parent;
    FFocusControl.Show;
  end;
end;

procedure TBraveButton.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TBraveButton.SetPenDisabled(const Value: TPen);
begin
  FPenDisabled.Assign(Value);
end;

procedure TBraveButton.SetPenDown(const Value: TPen);
begin
  FPenDown.Assign(Value);
end;

procedure TBraveButton.SetPenFocused(const Value: TPen);
begin
  FPenFocused.Assign(Value);
end;

procedure TBraveButton.SetPicture(const Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TBraveButton.SetPictureDark(const Value: TPicture);
begin
  FPictureDark.Assign(Value);
end;

procedure TBraveButton.SetPictureDisabled(const Value: TPicture);
begin
  FPictureDisabled.Assign(Value);
end;

procedure TBraveButton.SetPictureTemplate;
begin
  if not Assigned((FBraveButtonTemplateStyle)) then
    Exit;

  if StyleOutline then
  begin
    Picture.Assign       ( FBraveButtonTemplateStyle.GetPictureStyleOutline        );
    PictureFocused.Assign( FBraveButtonTemplateStyle.GetPictureFocusedStyleOutline );
  end
  else
  begin
    Picture.Assign       ( FBraveButtonTemplateStyle.GetPicture        );
    PictureFocused.Assign( FBraveButtonTemplateStyle.GetPictureFocused );
  end;

  PictureDark.Assign    ( FBraveButtonTemplateStyle.GetPictureDark     );
  PictureDisabled.Assign( FBraveButtonTemplateStyle.GetPictureDisabled );
  PictureDisabled.Assign( FBraveButtonTemplateStyle.GetPicture         );
end;

procedure TBraveButton.SetPictureMarginLeft(const Value: SmallInt);
begin
  if (FPictureMarginLeft >= 0) and (FPictureMarginLeft <> Value) then
  begin
    FPictureMarginLeft := Value;
    Invalidate;
  end;
end;

procedure TBraveButton.SetPictureFocused(const Value: TPicture);
begin
  FPictureFocused.Assign(Value);
end;

procedure TBraveButton.SetPictureLayout(const Value: TPictureLayout);
begin
  if FPictureLayout <> Value then
  begin
    case Value of
      plGraphicCenter:
      begin
        case FSizeLayout of
          sl25x25 :
          begin
            FPictureLayout     := Value;
            FPictureMarginLeft := 0;
            FSpacing           := 0;
          end;
          sl90x25, sl90x30, sl110x25, sl110x30, sl110x35, sl110x60, sl110x90:
          begin
            FPictureLayout    := Value;
            PictureMarginLeft := 6;
            Spacing           := 0;
          end;
        end;
      end;

      plGraphicBottom:
      begin
        case FSizeLayout of
          sl25x25 : ; {nothing}
          sl90x25, sl90x30, sl110x25, sl110x30, sl110x35:
          begin
            if FCaptionSub = '' then
            begin
              FPictureLayout    := Value;
              FPictureMarginLeft := 0;
              FSpacing          := 10;
            end;
          end;
          sl110x60, sl110x90:
          begin
            FPictureLayout     := Value;
            FPictureMarginLeft := 0;
            FSpacing           := 10;
          end;
        end;
      end;

      plGraphicTop:
      begin
        case FSizeLayout of
          sl25x25 : ;  {nothing}
          sl90x25, sl90x30, sl110x25, sl110x30, sl110x35:
          begin
            if FCaptionSub = '' then
            begin
              FPictureLayout    := Value;
              FPictureMarginLeft := 0;
              FSpacing          := 10;
            end;
          end;
          sl110x60, sl110x90:
          begin
            FPictureLayout    := Value;
            PictureMarginLeft := 0;
            Spacing           := 10;
          end;
        end;
      end;
    end;

    Invalidate;
  end;
end;

procedure TBraveButton.SetRadius(const Value: SmallInt);
begin
  if FRadius <> Value then
  begin
    FRadius := Value;
    invalidate;
  end;
end;

procedure TBraveButton.SetShape(Value: TButtonStyleType);
begin
  if FShape <> Value then
  begin
    FShape := Value;
    invalidate;
  end;
end;

procedure TBraveButton.SetShowCaption(const Value: Boolean);
begin
  if FShowCaption <> Value then
  begin
    FShowCaption := Value;
    invalidate;
  end;
end;

procedure TBraveButton.SetSizeLayout(const Value: TSizeLayout);
begin
  Self.FSizeLayout := Value;

  case FSizeLayout of
    sl25x25 :
    begin
      FCaption           := '';
      FCaptionSub        := '';
      FSpacing           := 0;
      FPictureMarginLeft := 0;
    end;
    sl90x25 : ;
    sl90x30 : ;
    sl110x25: ;
    sl110x30: ;
    sl110x35: ;
    sl110x60: ;
    sl110x90: ;
  end;

  Invalidate;
end;

procedure TBraveButton.SetSpacing(const Value: SmallInt);
begin
  if FSpacing <> Value then
  begin
    FSpacing := Value;
    invalidate;
  end;
end;

procedure TBraveButton.SetTemplateColor(const Value: TTemplateColor);
begin
  if isTemplateStyle then
  begin
    FControllerStyleTemplate := true;
    TemplateStyle            := tsBasic;
  end;

  if FControllerStyleTemplate then
  begin
    CreateButtonColor(tcCustom);
    FControllerStyleTemplate := false;
    Exit;
  end;

  Self.FTemplateColor := Value;

  CreateButtonColor(FTemplateColor);

  if Value <> tcCustom then
  begin
    if StyleOutline then
    begin
      SetPictureTemplate;
      StyleOutlineConfig;
    end;
  end;
end;

procedure TBraveButton.SetTabOrder(const Value: Integer);
begin
  if Assigned(FFocusControl) then
    FFocusControl.TabOrder := Value;
end;

procedure TBraveButton.SetTabStop(const Value: Boolean);
begin
  if Assigned(FFocusControl) then
    FFocusControl.TabStop := Value;
end;

procedure TBraveButton.SetTemplateStyle(const Value: TTemplateStyle);
begin
  if FControllerStyleTemplate then
  begin
    CreateButtonColor(tcCustom);
    FControllerStyleTemplate := false;
    Exit;
  end;

  if TemplateColor <> tcCustom then
  begin
    FControllerStyleTemplate := true;
    TemplateColor := tcCustom;
  end;

  Self.FTemplateStyle := Value;

  if not(csReading in ComponentState) then
  begin
    CreateButtonTemplate(Value);

    SetPictureTemplate;

    if Value <> tsBasic then
    begin
      if StyleOutline then
        StyleOutlineConfig;
    end;
  end;

end;

procedure TBraveButton.StyleChanged(Sender: TObject);
begin
  invalidate;
end;

procedure TBraveButton.StyleOutlineConfig;
var
  lBrushColor: TColor;
begin
  lBrushColor := Brush.Color;
  Brush.Color := Font.Color;

  Font.Color := lBrushColor;

  Pen.Style := psSolid;
  Pen.Color := lBrushColor;
  Pen.Width := 1;
end;

function TBraveButton.isTemplateStyle: Boolean;
begin
  result := true;
  //TemplateStyle <> tsBasic;
end;

procedure TBraveButton.LoadingTemplateDanger;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcDanger, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplateDark;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcDark, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplateGlassy;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcGlassy, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplateInfo;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcInfo, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplateLight;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcLight, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplatePrimary;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcPrimary, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplateSecondary;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcSecondary, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplateSuccess;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcSuccess, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.LoadingTemplateWarning;
begin
  FBraveButtonTemplateColor := TBraveButtonTemplateColor.New(tcWarning, Self.Owner);

  ApplyTemplate;
end;

procedure TBraveButton.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if Operation = opRemove then
  begin
    if AComponent = ImageList then
      ImageList := nil;
  end;
end;

procedure TBraveButton.WMEraseBkgnd(var Message: TWMEraseBkGnd);
begin
  message.result := 1;
end;

procedure TBraveButton.WndProc(var Message: TMessage);
begin
  inherited;

//  case Message.Msg of
//    WM_PAINT : ShowMessage('ACTIVATE');
//    WM_ACTIVATE: ShowMessage('ACTIVATE');
//  end;
end;

constructor TFocusControl.Create(AOwner: TComponent; AGraphicControl: TBraveButton);
begin
  inherited Create(AOwner);

  Assert(Assigned(AGraphicControl), 'Não é possível criar um FocusControl com GraphicControl não atribuído.');

  FGraphicControl := AGraphicControl;
  Self.TabStop := false;
end;

procedure TFocusControl.WMKeyDown(var Message: TWMKeyDown);
var
  Shift: TShiftState;
begin
  if Assigned(FGraphicControl) then
  begin
    Shift := KeyDataToShiftState(Message.KeyData);
    FGraphicControl.DoKeyDown(Message.CharCode, Shift);
  end;

  inherited;
end;

procedure TFocusControl.WMKeyUp(var Message: TWMKeyDown);
begin
  if Assigned(FGraphicControl) then
    FGraphicControl.DoKeyUp;

  inherited;
end;

procedure TFocusControl.WndProc(var Message: TMessage);
begin
  inherited;

  case Message.Msg of
    WM_SETFOCUS, WM_KILLFOCUS:
      begin
        if Assigned(FGraphicControl) then
          FGraphicControl.Repaint;
      end;
  end;
end;

function TButtonFont.IsCopyOfFont: Boolean;
begin
  result := CopyOfFont <> false;
end;

procedure TButtonFont.SetCopyOfFont(const Value: Boolean);
begin
  if FCopyOfFont <> Value then
  begin
    FCopyOfFont := Value;
    onChange(Value);
  end;
end;

end.
