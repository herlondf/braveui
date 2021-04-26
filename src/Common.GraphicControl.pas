unit Common.GraphicControl;

interface

uses
  {Embarcadero}
  Vcl.Controls,
  Vcl.Graphics,
  System.Classes;

type
  TBraveImage = class(TGraphicControl)
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  strict private
    FPicture : TPicture;
  private
    procedure SetPicture( const Value: TPicture   );
  protected
//    procedure Paint; override;
  public
    procedure DrawImage(X, Y: Integer; ACanvas: TCanvas);
    function IsAssigned: Boolean;
  published
    property Picture : TPicture read FPicture write SetPicture stored IsAssigned;
  end;


implementation

{ TBraveImage }

constructor TBraveImage.Create(AOwner: TComponent);
begin
  inherited;

  FPicture := TPicture.Create;
end;

destructor TBraveImage.Destroy;
begin
  FPicture.Free;

  inherited;
end;

procedure TBraveImage.DrawImage(X, Y: Integer; ACanvas: TCanvas);
begin
  ACanvas.Draw(X, Y, FPicture.Graphic);
end;

function TBraveImage.IsAssigned: Boolean;
begin
  Result := Assigned( FPicture.Graphic );
end;

//procedure TBraveImage.Paint;
//begin
//  inherited;
//
//end;

procedure TBraveImage.SetPicture(const Value: TPicture);
begin
  FPicture.Assign( Value );
end;

end.
