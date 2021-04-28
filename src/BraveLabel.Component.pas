unit BraveLabel.Component;

interface

uses
  {Embarcadero}
  Vcl.Controls,
  Vcl.StdCtrls,
  System.Classes,

  {Brave}
  Common.Caption, Vcl.Graphics;

type
  TBraveLabel = class(TGraphicControl)
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FLineTitle: TControlCanvas;
  protected
    procedure Paint; override;
  public
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

  published

  end;

implementation

{ TBraveLabel }

constructor TBraveLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csReplicatable];

  FLineTitle := TControlCanvas.Create;
end;

destructor TBraveLabel.Destroy;
begin
  FLineTitle.Free;
  inherited;
end;

procedure TBraveLabel.Paint;
begin
  inherited;

//  Canvas.TextOut(0, 0, 'TESTE');
//  Canvas.LineTo(0, 0);



//  FLineTitle.Pen.Style := psSolid;
//  FLineTitle.Pen.Color := clRed;
//  FLineTitle.Brush.Style := bsClear;
//
  FLineTitle.TextOut(0, 0, 'aaaa');
end;

procedure TBraveLabel.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  Repaint;
end;

end.
