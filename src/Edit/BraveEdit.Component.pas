unit BraveEdit.Component;

interface

uses
  Vcl.Controls,
  System.Classes,
  Vcl.StdCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.ExtCtrls,
  Winapi.Windows,
  Winapi.Messages,

  {Brave}
  Common.Utils,
  Common.GraphicControl,
  Common.Font,
  Common.Caption;

type
  TBraveEdit = class(TCustomControl)
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FEdit           : TEdit;
    FPictureWarning : TBraveImage;
    FAbout          : String;

    FOnEnter        : Boolean;
    FCanNull        : Boolean;
    FCaption        : TBraveCaption;

    FPaintWarning   : Boolean;

    procedure SetPictureWarning( const Value: TBraveImage );
    function  HasPictureWarning: Boolean;

    procedure SetCanNull( const Value: Boolean        );
    procedure SetCaption( const Value: TBraveCaption  );

    function  IsNull: Boolean;
  protected
    procedure Paint;   override;
    procedure DoEnter; override;
    procedure DoExit;  override;

  public

  published
    {Common fields}
    property About          : String        read FAbout          write FAbout Stored false;
    property PictureWarning : TBraveImage   read FPictureWarning write SetPictureWarning stored HasPictureWarning;
    property Caption        : TBraveCaption read FCaption        write SetCaption;

    {Validates fields}
    property CanNull: Boolean read FCanNull write SetCanNull stored IsNull default false;

  end;

implementation

{ TBraveEdit }

constructor TBraveEdit.Create(AOwner: TComponent);
begin
  inherited;

  FEdit              := TEdit.Create(Self);
  FEdit.Parent       := Self;
  //FEdit.BorderStyle  := bsNone;
  FEdit.Visible      := True;

  FPictureWarning        := TBraveImage.Create(Self);

  if ( csDesigning in ComponentState) then
  begin
    FPictureWarning.Picture.Assign( GetPictureOfResource( 'VALIDATION_DANGER_DANGER' ) );
    FPictureWarning.Height := FPictureWarning.Picture.Graphic.Height;
    FPictureWarning.Width  := FPictureWarning.Picture.Graphic.Width;
  end;

  FCaption := TBraveCaption.Create(Self);
  FEdit.Font.Assign( FCaption.Font );

  Canvas.Brush.Style := bsClear;
end;

destructor TBraveEdit.Destroy;
begin
  FEdit.Free;
  FPictureWarning.Free;
  FCaption.Free;
  inherited;
end;

procedure TBraveEdit.DoEnter;
begin
  inherited;
  FOnEnter      := True;
  FPaintWarning := False;

  FEdit.TextHint := '';


  Invalidate;
end;

procedure TBraveEdit.DoExit;
begin
  inherited;
  FOnEnter := False;
  FPaintWarning := IsNull;
  Invalidate;
end;

function TBraveEdit.HasPictureWarning: Boolean;
begin
  Result := Assigned( FPictureWarning.Picture.Graphic );
end;

procedure TBraveEdit.SetPictureWarning(const Value: TBraveImage);
begin
  FPictureWarning.Assign( Value );
end;

procedure TBraveEdit.SetCanNull(const Value: Boolean);
begin
  FCanNull := Value;
end;

procedure TBraveEdit.SetCaption(const Value: TBraveCaption);
begin
  FCaption := Value;
end;

function TBraveEdit.IsNull: Boolean;
begin
  Result := ( FCanNull ) and ( FEdit.Text = '' );
end;

procedure TBraveEdit.Paint;
var
  XPictureWarning, YPictureWarning: Integer;
begin
  inherited;

  FEdit.Width     := Self.Width  - FPictureWarning.Width - 5;
  FEdit.Height    := Self.Height - Canvas.TextHeight( FEdit.TextHint );
  FEdit.Top       := Canvas.TextHeight( FEdit.TextHint );

  XPictureWarning := FEdit.Width + 5;
  YPictureWarning := ( FEdit.Height div 2 ) - ( FPictureWarning.Height div 2 ) + Canvas.TextHeight( FEdit.TextHint ) - 2 ;

  if FPaintWarning then
    FPictureWarning.DrawImage( XPictureWarning, YPictureWarning, Canvas );

  if FOnEnter then
    FCaption.DrawCaption(0, 0, FCaption.Caption, Canvas);

  FEdit.TextHint := FCaption.Caption;
end;



end.
