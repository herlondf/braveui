unit Common.Register;

interface

uses
  {Embarcadero}
  ShellApi,
  ToolsAPI,
  DesignIntf,
  DesignEditors,
  Vcl.Graphics,
  System.Classes,
  Vcl.Dialogs,
  ColnEdit,

  {Brave}
  Common.Consts,
  Common.Utils,
  BraveAbout.View,
  BraveButton.Component,
  BraveEdit.Component,
  BraveEditTag.Component,
  BraveLabel.Component,
  BrvGrid;

type
  TBrvGridEditor = class(TComponentEditor)
  protected
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

  TBraveUIComponentProperty = class(TStringProperty)
  public
    function GetValue: string; override;
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('BraveUI', [ TBraveButton   ] );
  RegisterPropertyEditor( TypeInfo(String), TBraveButton, 'About', TBraveUIComponentProperty);

  RegisterComponents('BraveUI', [ TBraveEdit     ] );
  RegisterPropertyEditor( TypeInfo(String), TBraveEdit, 'About', TBraveUIComponentProperty);

  RegisterComponents('BraveUI', [ TBraveEditTag  ] );
  RegisterPropertyEditor( TypeInfo(String), TBraveEditTag, 'About', TBraveUIComponentProperty);

  RegisterComponents('BraveUI', [ TBraveLabel  ] );
  RegisterPropertyEditor( TypeInfo(String), TBraveLabel, 'About', TBraveUIComponentProperty);

  RegisterComponents('BraveUI', [ TBrvGrid  ] );
  RegisterComponentEditor(TBrvGrid, TBrvGridEditor);
  RegisterPropertyEditor( TypeInfo(String), TBraveLabel, 'About', TBraveUIComponentProperty);
end;

procedure AddSplash;
Var
  LBraveLogo: TBitmap;
  LFormAbout: TfrmBraveAbout;
Begin
  ForceDemandLoadState(dlDisable);

  LFormAbout := TfrmBraveAbout.Create(nil);
  LBraveLogo := TBitmap.Create;

  try
    LFormAbout.imgList.GetBitmap(1, LBraveLogo);

    SplashScreenServices.AddPluginBitmap(BraveTitle, LBraveLogo.Handle, false, BraveLicense + ' ' + BraveUpdated + ' ' + 'v' + BraveVersion, '');
  finally
    LBraveLogo.Free;
    LFormAbout.Free;
  end;
End;







{ TBrvGridEditor }

procedure TBrvGridEditor.ExecuteVerb(Index: Integer);
begin
  case Index of

    0: ShowCollectionEditorClass(
      Designer,
      TCollectionEditor,
      Component,
      TBrvGrid(Component).Columns,
      'Columns',
      [coAdd, coDelete, coMove]
    );

    1: ShowMessage(
         'TBrvGrid v1.00'
       );

  end;
end;

function TBrvGridEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Edit Columns ...';
    1: Result := 'About';
  end;
end;

function TBrvGridEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;




 { TBraveUIComponentProperty }

procedure TBraveUIComponentProperty.Edit;
begin
  with TfrmBraveAbout.Create(nil) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

function TBraveUIComponentProperty.GetAttributes: TPropertyAttributes;
begin
 Result := [paReadOnly, paDialog];
end;

function TBraveUIComponentProperty.GetValue: string;
begin
  Result := BraveVersion;
end;

initialization

AddSplash;

end.
