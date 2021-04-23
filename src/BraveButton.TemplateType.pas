unit BraveButton.TemplateType;

interface

uses
  Vcl.Graphics,
  System.SysUtils,
  Common.Utils,
  BraveButton.Consts,
  BraveButton.Interfaces;

type
  TButtonStyleTemplateType = class(TInterfacedObject, iButtonStyleTemplateType)
    constructor Create(AStyleTemplateType: TStyleTemplateType; AStyleTemplateColor: TStyleTemplateColor);
    destructor Destroy; override;
    class function New(AStyleTemplateType: TStyleTemplateType; AStyleTemplateColor: TStyleTemplateColor): iButtonStyleTemplateType;
  private
    FStyleTemplateType                     : TStyleTemplateType;
    FStyleTemplateColor                    : TStyleTemplateColor;

    FPicture                               : TPicture;
    FPictureDark                           : TPicture;
    FPictureFocused                        : TPicture;
    FPictureStyleOutline                   : TPicture;
    FPictureFocusedStyleOutline            : TPicture;
    FPictureDisabled                       : TPicture;

    function GetPicture                    : TPicture;
    function GetPictureDark                : TPicture;
    function GetPictureFocused             : TPicture;
    function GetPictureStyleOutline        : TPicture;
    function GetPictureFocusedStyleOutline : TPicture;
    function GetPictureDisabled            : TPicture;
  public
    property Picture                       : TPicture read GetPicture;
    property PictureDark                   : TPicture read GetPictureDark;
    property PictureFocused                : TPicture read GetPictureFocused;
    property PictureStyleOutline           : TPicture read GetPictureStyleOutline;
    property PictureFocusedStyleOutline    : TPicture read GetPictureFocusedStyleOutline;
    property PictureDisabled               : TPicture read GetPictureDisabled;
  end;

implementation

constructor TButtonStyleTemplateType.Create(AStyleTemplateType: TStyleTemplateType; AStyleTemplateColor: TStyleTemplateColor);
begin
  FStyleTemplateType          := AStyleTemplateType;
  FStyleTemplateColor         := AStyleTemplateColor;

  FPicture                    := TPicture.Create;
  FPictureFocused             := TPicture.Create;
  FPictureStyleOutline        := TPicture.Create;
  FPictureFocusedStyleOutline := TPicture.Create;
  FPictureDisabled            := TPicture.Create;
  FPictureDark                := TPicture.Create;
end;

destructor TButtonStyleTemplateType.Destroy;
begin
  FreeAndNil( FPicture                    );
  FreeAndNil( FPictureFocused             );
  FreeAndNil( FPictureStyleOutline        );
  FreeAndNil( FPictureFocusedStyleOutline );
  FreeAndNil( FPictureDisabled            );
  FreeAndNil( FPictureDark                );

  inherited;
end;

class function TButtonStyleTemplateType.New(AStyleTemplateType: TStyleTemplateType; AStyleTemplateColor: TStyleTemplateColor): iButtonStyleTemplateType;
begin
  Result := Self.Create(AStyleTemplateType, AStyleTemplateColor);
end;

function TButtonStyleTemplateType.GetPicture: TPicture;
begin
  case FStyleTemplateType of
    tsBasic     : FPicture.Graphic := nil;
    tsAdd       : FPicture.Assign( GetPictureOfResource( ADD_ENABLED        ) );
    tsRemove    : FPicture.Assign( GetPictureOfResource( REMOVE_ENABLED     ) );
    tsCancel    : FPicture.Assign( GetPictureOfResource( CANCEL_ENABLED     ) );
    tsOK        : FPicture.Assign( GetPictureOfResource( OK_ENABLED         ) );
    tsDelete    : FPicture.Assign( GetPictureOfResource( DELETE_ENABLED     ) );
    tsSave      : FPicture.Assign( GetPictureOfResource( SAVE_ENABLED       ) );
    tsNew       : FPicture.Assign( GetPictureOfResource( NEW_ENABLED        ) );
    tsEdit      : FPicture.Assign( GetPictureOfResource( EDIT_ENABLED       ) );
    tsFind      : FPicture.Assign( GetPictureOfResource( FIND_ENABLED       ) );
    tsPrint     : FPicture.Assign( GetPictureOfResource( PRINT_ENABLED      ) );
    tsRefresh   : FPicture.Assign( GetPictureOfResource( REFRESH_ENABLED    ) );
    tsArrowUp   : FPicture.Assign( GetPictureOfResource( ARROW_UP_ENABLED   ) );
    tsArrowDown : FPicture.Assign( GetPictureOfResource( ARROW_DOWN_ENABLED ) );
    tsMain      : FPicture.Graphic := nil;
  end;

  Result := FPicture;
end;

function TButtonStyleTemplateType.GetPictureDark: TPicture;
begin
  case FStyleTemplateType of
    tsBasic     : FPicture.Graphic := nil;
    tsAdd       : FPictureDark.Assign( GetPictureOfResource( ADD_DARK        ) );
    tsRemove    : FPictureDark.Assign( GetPictureOfResource( REMOVE_DARK     ) );
    tsCancel    : FPictureDark.Assign( GetPictureOfResource( CANCEL_DARK     ) );
    tsOK        : FPictureDark.Assign( GetPictureOfResource( OK_DARK         ) );
    tsDelete    : FPictureDark.Assign( GetPictureOfResource( DELETE_DARK     ) );
    tsSave      : FPictureDark.Assign( GetPictureOfResource( SAVE_DARK       ) );
    tsNew       : FPictureDark.Assign( GetPictureOfResource( NEW_DARK        ) );
    tsEdit      : FPictureDark.Assign( GetPictureOfResource( EDIT_DARK       ) );
    tsFind      : FPictureDark.Assign( GetPictureOfResource( FIND_DARK       ) );
    tsPrint     : FPictureDark.Assign( GetPictureOfResource( PRINT_DARK      ) );
    tsRefresh   : FPictureDark.Assign( GetPictureOfResource( REFRESH_DARK    ) );
    tsArrowUp   : FPictureDark.Assign( GetPictureOfResource( ARROW_UP_DARK   ) );
    tsArrowDown : FPictureDark.Assign( GetPictureOfResource( ARROW_DOWN_DARK ) );
    tsMain      : FPicture.Graphic := nil;
  end;

  Result := FPictureDark;
end;

function TButtonStyleTemplateType.GetPictureDisabled: TPicture;
begin
  case FStyleTemplateType of
    tsBasic     : FPicture.Graphic := nil;
    tsAdd       : FPictureDisabled.Assign( GetPictureOfResource( ADD_DISABLED        ) );
    tsRemove    : FPictureDisabled.Assign( GetPictureOfResource( REMOVE_DISABLED     ) );
    tsCancel    : FPictureDisabled.Assign( GetPictureOfResource( CANCEL_DISABLED     ) );
    tsOK        : FPictureDisabled.Assign( GetPictureOfResource( OK_DISABLED         ) );
    tsDelete    : FPictureDisabled.Assign( GetPictureOfResource( DELETE_DISABLED     ) );
    tsSave      : FPictureDisabled.Assign( GetPictureOfResource( SAVE_DISABLED       ) );
    tsNew       : FPictureDisabled.Assign( GetPictureOfResource( NEW_DISABLED        ) );
    tsEdit      : FPictureDisabled.Assign( GetPictureOfResource( EDIT_DISABLED       ) );
    tsFind      : FPictureDisabled.Assign( GetPictureOfResource( FIND_DISABLED       ) );
    tsPrint     : FPictureDisabled.Assign( GetPictureOfResource( PRINT_DISABLED      ) );
    tsRefresh   : FPictureDisabled.Assign( GetPictureOfResource( REFRESH_DISABLED    ) );
    tsArrowUp   : FPictureDisabled.Assign( GetPictureOfResource( ARROW_UP_DISABLED   ) );
    tsArrowDown : FPictureDisabled.Assign( GetPictureOfResource( ARROW_DOWN_DISABLED ) );
    tsMain      : FPicture.Graphic := nil;
  end;

  Result := FPictureDisabled;
end;

function TButtonStyleTemplateType.GetPictureFocused: TPicture;
begin
  case FStyleTemplateType of
    tsBasic     : FPicture.Graphic := nil;
    tsAdd       : FPictureFocused.Assign( GetPictureOfResource( ADD_FOCUSED        ) );
    tsRemove    : FPictureFocused.Assign( GetPictureOfResource( REMOVE_FOCUSED     ) );
    tsCancel    : FPictureFocused.Assign( GetPictureOfResource( CANCEL_FOCUSED     ) );
    tsOK        : FPictureFocused.Assign( GetPictureOfResource( OK_FOCUSED         ) );
    tsDelete    : FPictureFocused.Assign( GetPictureOfResource( DELETE_FOCUSED     ) );
    tsSave      : FPictureFocused.Assign( GetPictureOfResource( SAVE_FOCUSED       ) );
    tsNew       : FPictureFocused.Assign( GetPictureOfResource( NEW_FOCUSED        ) );
    tsEdit      : FPictureFocused.Assign( GetPictureOfResource( EDIT_FOCUSED       ) );
    tsFind      : FPictureFocused.Assign( GetPictureOfResource( FIND_FOCUSED       ) );
    tsPrint     : FPictureFocused.Assign( GetPictureOfResource( PRINT_FOCUSED      ) );
    tsRefresh   : FPictureFocused.Assign( GetPictureOfResource( REFRESH_FOCUSED    ) );
    tsArrowUp   : FPictureFocused.Assign( GetPictureOfResource( ARROW_UP_FOCUSED   ) );
    tsArrowDown : FPictureFocused.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
    tsMain      : FPicture.Graphic := nil;
  end;



  Result := FPictureFocused;
end;

function TButtonStyleTemplateType.GetPictureFocusedStyleOutline: TPicture;
begin
  case FStyleTemplateType of
    tsBasic         :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Graphic := nil ;
        stWarning   : FPictureStyleOutline.Graphic := nil ;
        stDanger    : FPictureStyleOutline.Graphic := nil ;
        stPrimary   : FPictureStyleOutline.Graphic := nil ;
        stSecondary : FPictureStyleOutline.Graphic := nil ;
        stLight     : FPictureStyleOutline.Graphic := nil ;
        stDark      : FPictureStyleOutline.Graphic := nil ;
        stSuccess   : FPictureStyleOutline.Graphic := nil ;
        stInfo      : FPictureStyleOutline.Graphic := nil ;
      end;
    end;

    tsAdd           :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ADD_FOCUSED  ) );
      end;
    end;

    tsRemove        :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REMOVE_FOCUSED  ) );
      end;
    end;

    tsCancel        :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( CANCEL_FOCUSED  ) );
      end;
    end;

    tsOK            :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( OK_FOCUSED  ) );
      end;
    end;

    tsDelete        :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( DELETE_FOCUSED ) );
      end;
    end;

    tsSave          :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( SAVE_FOCUSED ) );
      end;
    end;

    tsNew           :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( NEW_FOCUSED ) );
      end;
    end;

    tsEdit          :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( EDIT_FOCUSED ) );
      end;
    end;

    tsFind          :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( FIND_FOCUSED ) );
      end;
    end;

    tsPrint         :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( PRINT_FOCUSED ) );
      end;
    end;

    tsRefresh       :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( REFRESH_FOCUSED ) );
      end;
    end;

    tsArrowUp       :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_UP_FOCUSED ) );
      end;
    end;

    tsArrowDown     :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
        stInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED ) );
      end;
    end;

    tsMain          :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Graphic := nil ;
        stWarning   : FPictureStyleOutline.Graphic := nil ;
        stDanger    : FPictureStyleOutline.Graphic := nil ;
        stPrimary   : FPictureStyleOutline.Graphic := nil ;
        stSecondary : FPictureStyleOutline.Graphic := nil ;
        stLight     : FPictureStyleOutline.Graphic := nil ;
        stDark      : FPictureStyleOutline.Graphic := nil ;
        stSuccess   : FPictureStyleOutline.Graphic := nil ;
        stInfo      : FPictureStyleOutline.Graphic := nil ;
      end;
    end;
  end;

  Result := FPictureFocusedStyleOutline;
end;

function TButtonStyleTemplateType.GetPictureStyleOutline: TPicture;
begin
  case FStyleTemplateType of
    tsBasic         :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Graphic := nil ;
        stWarning   : FPictureStyleOutline.Graphic := nil ;
        stDanger    : FPictureStyleOutline.Graphic := nil ;
        stPrimary   : FPictureStyleOutline.Graphic := nil ;
        stSecondary : FPictureStyleOutline.Graphic := nil ;
        stLight     : FPictureStyleOutline.Graphic := nil ;
        stDark      : FPictureStyleOutline.Graphic := nil ;
        stSuccess   : FPictureStyleOutline.Graphic := nil ;
        stInfo      : FPictureStyleOutline.Graphic := nil ;
      end;
    end;

    tsAdd           :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_INFO'      ) );
      end;
    end;

    tsRemove        :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_INFO'      ) );
      end;
    end;

    tsCancel        :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_INFO'      ) );
      end;
    end;

    tsOK            :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_INFO'      ) );
      end;
    end;

    tsDelete        :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_INFO'      ) );
      end;
    end;

    tsSave          :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_INFO'      ) );
      end;
    end;

    tsNew           :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_INFO'      ) );
      end;
    end;

    tsEdit          :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_INFO'      ) );
      end;
    end;

    tsFind          :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_INFO'      ) );
      end;
    end;

    tsPrint         :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_INFO'      ) );
      end;
    end;

    tsRefresh       :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_INFO'      ) );
      end;
    end;

    tsArrowUp       :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_INFO'      ) );
      end;
    end;

    tsArrowDown     :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED'   ) );
        stWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_WARNING'   ) );
        stDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_DANGER'    ) );
        stPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_PRIMARY'   ) );
        stSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_SECONDARY' ) );
        stLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_LIGHT'     ) );
        stDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_DARK'      ) );
        stSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_SUCCESS'   ) );
        stInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_INFO'      ) );
      end;
    end;

   tsMain           :
    begin
      case FStyleTemplateColor of
        stCustom    : FPictureStyleOutline.Graphic := nil ;
        stWarning   : FPictureStyleOutline.Graphic := nil ;
        stDanger    : FPictureStyleOutline.Graphic := nil ;
        stPrimary   : FPictureStyleOutline.Graphic := nil ;
        stSecondary : FPictureStyleOutline.Graphic := nil ;
        stLight     : FPictureStyleOutline.Graphic := nil ;
        stDark      : FPictureStyleOutline.Graphic := nil ;
        stSuccess   : FPictureStyleOutline.Graphic := nil ;
        stInfo      : FPictureStyleOutline.Graphic := nil ;
      end;
    end;
  end;

  Result := FPictureStyleOutline;
end;

end.
