unit Common.Caption;

interface

uses
  Vcl.Controls,
  Vcl.Graphics,
  System.Classes;

type
  TBraveCaption = class
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  strict private
    FCaption: String;
    FFont   : TFont;
    FOwner  : TComponent;
  private
    procedure SetCaption( const Value: String );
    procedure SetFont   ( const Value: TFont  );
  protected

  public
    procedure DrawCaption(X, Y: Integer; AText: String; ACanvas: TCanvas);
        property Caption: String read FCaption write SetCaption;
  published

    property Font   : TFont  read FFont    write SetFont;
  end;

implementation

{ TBraveCaption }

constructor TBraveCaption.Create(AOwner: TComponent);
begin
  FOwner := AOwner;
  FFont  := TFont.Create;
end;

destructor TBraveCaption.Destroy;
begin
  FFont.Free;

  inherited;
end;

procedure TBraveCaption.DrawCaption(X, Y: Integer; AText: String; ACanvas: TCanvas);
begin
  ACanvas.TextOut(X, Y, AText);
end;

procedure TBraveCaption.SetCaption(const Value: String);
begin
  FCaption := Value;
  TCustomControl( FOwner ).Invalidate;
end;

procedure TBraveCaption.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

end.
