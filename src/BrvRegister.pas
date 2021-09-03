unit BrvRegister;

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
  BrvAbout,
  BrvConsts,
  BrvButton,
  BrvEditTag,
  BrvGrid,
  BrvGrid.RegisterClass;

type
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
  RegisterComponents(
    'BraveUI',
    [
      TBraveButton,
      TBraveEditTag,
      TGridView
    ]
  );

  RegisterComponentEditor(TGridView, TGridEditor);
  RegisterPropertyEditor(TypeInfo(TGridColumns), TGridView, 'Columns', TGridColumnsProperty);
  RegisterPropertyEditor(TypeInfo(TGridHeaderSections), TGridHeader, 'Sections', TGridHeaderProperty);

  RegisterPropertyEditor( TypeInfo(String), TBraveButton, 'About', TBraveUIComponentProperty);
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
