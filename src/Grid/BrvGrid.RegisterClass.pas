unit BrvGrid.RegisterClass;

interface

uses
  Windows, SysUtils, Classes, Forms, Dialogs, TypInfo, DesignIntf,
  DesignEditors, WideStrings;

type
  { TGridEditor }
  TGridEditor = class(TDefaultEditor)
  private
    FCollection: TCollection;
    procedure FindCollectionEditor(const PropertyEditor: IProperty);
  protected
    procedure EditProperty(const PropertyEditor: IProperty; var Continue: Boolean); override;
    procedure ShowCollectionEditor(ACollection: TCollection);
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TGridColumnsProperty }
  TGridColumnsProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  { TGridHeaderProperty }
  TGridHeaderProperty = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

implementation

uses
  BrvGrid,
  BrvGrid.ColumnsEditor,
  BrvGrid.HeaderEditor;

{ TGridEditor }

procedure TGridEditor.FindCollectionEditor(const PropertyEditor: IProperty);
var
  P: PTypeInfo;
begin
  if FCollection <> nil then
  begin
    P := PropertyEditor.GetPropType;
    if (P <> nil) and (P.Kind = tkClass) and (CompareText(string(P.Name), FCollection.ClassName) = 0) then
    begin
      PropertyEditor.Edit;
      FCollection := nil;
    end;
  end;
{  if FContinue then
    EditProperty(Prop, FContinue);!!!}
end;

procedure TGridEditor.EditProperty(const PropertyEditor: IProperty; var Continue: Boolean);
begin
  if CompareText(PropertyEditor.GetName, 'ONGETCELLTEXT') = 0 then
  begin
    PropertyEditor.Edit;
    Continue := False;
  end;
end;

procedure TGridEditor.ShowCollectionEditor(ACollection: TCollection);
var
  List: IDesignerSelections;
begin
  FCollection := ACollection;
  List := TDesignerSelections.Create;
  List.Add(Self.Component);
  GetComponentProperties(List, [tkClass], Self.Designer, FindCollectionEditor);
end;

procedure TGridEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowCollectionEditor(TCustomGridView(Component).Columns);
    1: if EditGridHeader(TCustomGridView(Component)) then Designer.Modified;
  end;
end;

function TGridEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Columns Editor...';
    1: Result := 'Header Editor...';
  end;
end;

function TGridEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

{ TGridColumnsProperty }

procedure TGridColumnsProperty.Edit;
begin
  if EditGridColumns(TGridColumns(GetOrdValue).Grid) then Modified;
end;

function TGridColumnsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

{ TGridHeaderProperty }

procedure TGridHeaderProperty.Edit;
begin
  if EditGridHeader(TGridHeaderSections(GetOrdValue).Header.Grid) then Modified;
end;

function TGridHeaderProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

end.
