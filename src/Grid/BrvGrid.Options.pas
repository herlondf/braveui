unit BrvGrid.Options;

interface

uses
  System.Classes;

type
  TCustomBrvGridOptions = class(TPersistent)
    constructor Create; virtual;
    destructor Destroy; override;
  private
    FAllowEdit: Boolean;

    procedure SetAllowEdit(const Value: Boolean);
  public
    property AllowEdit: Boolean read FAllowEdit write SetAllowEdit default False;
  end;

  TBrvGridOptions = class(TCustomBrvGridOptions)

  published
    property AllowEdit;
  end;

implementation

{ TCustomBrvGridOptions }

constructor TCustomBrvGridOptions.Create;
begin

end;

destructor TCustomBrvGridOptions.Destroy;
begin

  inherited;
end;

procedure TCustomBrvGridOptions.SetAllowEdit(const Value: Boolean);
begin
  if FAllowEdit <> Value then
  begin
    FAllowEdit := Value;
  end;
end;

end.
