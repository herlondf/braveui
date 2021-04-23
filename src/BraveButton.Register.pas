unit BraveButton.Register;

interface

uses
  ShellApi,
  ToolsAPI,
  DesignIntf,
  DesignEditors,
  Vcl.Graphics,
  System.Classes;

type
  TUIComponentProperty = class(TStringProperty)
  public
//    function GetValue: string; override;
//    function GetAttributes: TPropertyAttributes; override;
//    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  UIConsts,
  BraveButton;

procedure Register;
begin
  RegisterComponents('BraveUI', [ TBraveButton ] );

  //RegisterPropertyEditor(TypeInfo(String), TButtonStyle, 'AboutInfo', TUIComponentProperty);
end;

//procedure AddSplash;
//Var
//  bmp: TBitmap;
//Begin
//  bmp := TBitmap.Create;
//  try
//    bmp.LoadFromResourceName(HInstance, 'TPraLogo');
//    SplashScreenServices.AddPluginBitmap(PraTitleDialog, bmp.Handle, false, PraAboutlicenseStatus + ' ' + 'v' + Version, '');
//  finally
//    bmp.Free;
//  end;
//End;

//procedure TUIComponentProperty.Edit;
//begin
//  with TUIViewAbout.Create(nil) do
//  begin
//    try
//      ShowModal;
//    finally
//      Free;
//    end;
//  end;
//end;

//function TUIComponentProperty.GetAttributes: TPropertyAttributes;
//begin
// Result := [paReadOnly, paDialog];
//end;

//function TUIComponentProperty.GetValue: string;
//begin
//  Result := Version;
//end;

initialization

//AddSplash;

end.
