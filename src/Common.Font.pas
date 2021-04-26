unit Common.Font;

interface

uses
  Vcl.Graphics;

type
  TBraveChangeFont = procedure(const Value: Boolean) of Object;

  TBraveFont = class(TFont)
  private
//    FCopyOfFont: Boolean;
//    FonChange: TBraveChangeFont;
//
//    function IsCopyOfFont: Boolean;
//    procedure SetCopyOfFont(const Value: Boolean);
//  published
//    property CopyOfFont: Boolean read FCopyOfFont write SetCopyOfFont stored IsCopyOfFont default false;
//  public
//    property OnChange: TBraveChangeFont read FOnChange write FOnChange;
  end;

implementation

{ TBraveFont }

//function TBraveFont.IsCopyOfFont: Boolean;
//begin
//  result := CopyOfFont <> false;
//end;
//
//procedure TBraveFont.SetCopyOfFont(const Value: Boolean);
//begin
//  if FCopyOfFont <> Value then
//  begin
//    FCopyOfFont := Value;
//    onChange(Value);
//  end;
//end;

end.
