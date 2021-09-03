unit BrvButton.Style;

interface

uses
  Vcl.Graphics,
  System.SysUtils,
  BrvUtils,
  BrvButton.Consts,
  BrvButton.Interfaces;

type
  TBraveButtonTemplateStyle = class(TInterfacedObject, iBraveButtonTemplateStyle)
    constructor Create(ATemplateStyle: TTemplateStyle; ATemplateColor: TTemplateColor);
    destructor Destroy; override;
    class function New(ATemplateStyle: TTemplateStyle; ATemplateColor: TTemplateColor): iBraveButtonTemplateStyle;
  private
    FTemplateStyle                         : TTemplateStyle;
    FTemplateColor                         : TTemplateColor;

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
    property Picture                       : TPicture       read GetPicture;
    property PictureDark                   : TPicture       read GetPictureDark;
    property PictureFocused                : TPicture       read GetPictureFocused;
    property PictureStyleOutline           : TPicture       read GetPictureStyleOutline;
    property PictureFocusedStyleOutline    : TPicture       read GetPictureFocusedStyleOutline;
    property PictureDisabled               : TPicture       read GetPictureDisabled;
  end;

implementation

constructor TBraveButtonTemplateStyle.Create(ATemplateStyle: TTemplateStyle; ATemplateColor: TTemplateColor);
begin
  FTemplateStyle              := ATemplateStyle;
  FTemplateColor              := ATemplateColor;

  FPicture                    := TPicture.Create;
  FPictureFocused             := TPicture.Create;
  FPictureStyleOutline        := TPicture.Create;
  FPictureFocusedStyleOutline := TPicture.Create;
  FPictureDisabled            := TPicture.Create;
  FPictureDark                := TPicture.Create;
end;

destructor TBraveButtonTemplateStyle.Destroy;
begin
  FreeAndNil( FPicture                    );
  FreeAndNil( FPictureFocused             );
  FreeAndNil( FPictureStyleOutline        );
  FreeAndNil( FPictureFocusedStyleOutline );
  FreeAndNil( FPictureDisabled            );
  FreeAndNil( FPictureDark                );

  inherited;
end;

class function TBraveButtonTemplateStyle.New(ATemplateStyle: TTemplateStyle; ATemplateColor: TTemplateColor): iBraveButtonTemplateStyle;
begin
  Result := Self.Create(ATemplateStyle, ATemplateColor);
end;

function TBraveButtonTemplateStyle.GetPicture: TPicture;
begin
  case FTemplateStyle of
    tsBasic        : FPicture.Graphic := nil;
    tsAdd          : FPicture.Assign( GetPictureOfResource( ADD_ENABLED         ) );
    tsRemove       : FPicture.Assign( GetPictureOfResource( REMOVE_ENABLED      ) );
    tsCancel       : FPicture.Assign( GetPictureOfResource( CANCEL_ENABLED      ) );
    tsOK           : FPicture.Assign( GetPictureOfResource( OK_ENABLED          ) );
    tsDelete       : FPicture.Assign( GetPictureOfResource( DELETE_ENABLED      ) );
    tsSave         : FPicture.Assign( GetPictureOfResource( SAVE_ENABLED        ) );
    tsNew          : FPicture.Assign( GetPictureOfResource( NEW_ENABLED         ) );
    tsEdit         : FPicture.Assign( GetPictureOfResource( EDIT_ENABLED        ) );
    tsFind,
    tsSearch       : FPicture.Assign( GetPictureOfResource( FIND_ENABLED        ) );
    tsPrint        : FPicture.Assign( GetPictureOfResource( PRINT_ENABLED       ) );
    tsRefresh      : FPicture.Assign( GetPictureOfResource( REFRESH_ENABLED     ) );
    tsArrowUp      : FPicture.Assign( GetPictureOfResource( ARROW_UP_ENABLED    ) );
    tsArrowDown    : FPicture.Assign( GetPictureOfResource( ARROW_DOWN_ENABLED  ) );
    tsArrowRight   : FPicture.Assign( GetPictureOfResource( ARROW_RIGHT_ENABLED ) );
    tsArrowLeft    : FPicture.Assign( GetPictureOfResource( ARROW_LEFT_ENABLED  ) );
    tsKey          : FPicture.Assign( GetPictureOfResource( KEY_ENABLED         ) );
    tsConfig       : FPicture.Assign( GetPictureOfResource( GEAR_ENABLED        ) );
    tsMain         : FPicture.Graphic := nil;
  end;

  Result := FPicture;
end;

function TBraveButtonTemplateStyle.GetPictureDark: TPicture;
begin
  case FTemplateStyle of
    tsBasic     : FPicture.Graphic := nil;
    tsAdd       : FPictureDark.Assign( GetPictureOfResource( ADD_DARK         ) );
    tsRemove    : FPictureDark.Assign( GetPictureOfResource( REMOVE_DARK      ) );
    tsCancel    : FPictureDark.Assign( GetPictureOfResource( CANCEL_DARK      ) );
    tsOK        : FPictureDark.Assign( GetPictureOfResource( OK_DARK          ) );
    tsDelete    : FPictureDark.Assign( GetPictureOfResource( DELETE_DARK      ) );
    tsSave      : FPictureDark.Assign( GetPictureOfResource( SAVE_DARK        ) );
    tsNew       : FPictureDark.Assign( GetPictureOfResource( NEW_DARK         ) );
    tsEdit      : FPictureDark.Assign( GetPictureOfResource( EDIT_DARK        ) );
    tsFind,
    tsSearch    : FPictureDark.Assign( GetPictureOfResource( FIND_DARK        ) );
    tsPrint     : FPictureDark.Assign( GetPictureOfResource( PRINT_DARK       ) );
    tsRefresh   : FPictureDark.Assign( GetPictureOfResource( REFRESH_DARK     ) );
    tsArrowUp   : FPictureDark.Assign( GetPictureOfResource( ARROW_UP_DARK    ) );
    tsArrowDown : FPictureDark.Assign( GetPictureOfResource( ARROW_DOWN_DARK  ) );
    tsArrowRight: FPictureDark.Assign( GetPictureOfResource( ARROW_RIGHT_DARK ) );
    tsArrowLeft : FPictureDark.Assign( GetPictureOfResource( ARROW_LEFT_DARK  ) );
    tsKey       : FPictureDark.Assign( GetPictureOfResource( KEY_DARK         ) );
    tsConfig    : FPictureDark.Assign( GetPictureOfResource( GEAR_DARK        ) );
    tsMain      : FPictureDark.Graphic := nil;
  end;

  Result := FPictureDark;
end;

function TBraveButtonTemplateStyle.GetPictureDisabled: TPicture;
begin
  case FTemplateStyle of
    tsBasic     : FPicture.Graphic := nil;
    tsAdd       : FPictureDisabled.Assign( GetPictureOfResource( ADD_DISABLED         ) );
    tsRemove    : FPictureDisabled.Assign( GetPictureOfResource( REMOVE_DISABLED      ) );
    tsCancel    : FPictureDisabled.Assign( GetPictureOfResource( CANCEL_DISABLED      ) );
    tsOK        : FPictureDisabled.Assign( GetPictureOfResource( OK_DISABLED          ) );
    tsDelete    : FPictureDisabled.Assign( GetPictureOfResource( DELETE_DISABLED      ) );
    tsSave      : FPictureDisabled.Assign( GetPictureOfResource( SAVE_DISABLED        ) );
    tsNew       : FPictureDisabled.Assign( GetPictureOfResource( NEW_DISABLED         ) );
    tsEdit      : FPictureDisabled.Assign( GetPictureOfResource( EDIT_DISABLED        ) );
    tsFind,
    tsSearch    : FPictureDisabled.Assign( GetPictureOfResource( FIND_DISABLED        ) );
    tsPrint     : FPictureDisabled.Assign( GetPictureOfResource( PRINT_DISABLED       ) );
    tsRefresh   : FPictureDisabled.Assign( GetPictureOfResource( REFRESH_DISABLED     ) );
    tsArrowUp   : FPictureDisabled.Assign( GetPictureOfResource( ARROW_UP_DISABLED    ) );
    tsArrowDown : FPictureDisabled.Assign( GetPictureOfResource( ARROW_DOWN_DISABLED  ) );
    tsArrowRight: FPictureDisabled.Assign( GetPictureOfResource( ARROW_RIGHT_DISABLED ) );
    tsArrowLeft : FPictureDisabled.Assign( GetPictureOfResource( ARROW_LEFT_DISABLED  ) );
    tsKey       : FPictureDisabled.Assign( GetPictureOfResource( KEY_DISABLED         ) );
    tsConfig    : FPictureDisabled.Assign( GetPictureOfResource( GEAR_DISABLED        ) );
    tsMain      : FPictureDisabled.Graphic := nil;
  end;

  Result := FPictureDisabled;
end;

function TBraveButtonTemplateStyle.GetPictureFocused: TPicture;
begin
  case FTemplateStyle of
    tsBasic     : FPicture.Graphic := nil;
    tsAdd       : FPictureFocused.Assign( GetPictureOfResource( ADD_FOCUSED         ) );
    tsRemove    : FPictureFocused.Assign( GetPictureOfResource( REMOVE_FOCUSED      ) );
    tsCancel    : FPictureFocused.Assign( GetPictureOfResource( CANCEL_FOCUSED      ) );
    tsOK        : FPictureFocused.Assign( GetPictureOfResource( OK_FOCUSED          ) );
    tsDelete    : FPictureFocused.Assign( GetPictureOfResource( DELETE_FOCUSED      ) );
    tsSave      : FPictureFocused.Assign( GetPictureOfResource( SAVE_FOCUSED        ) );
    tsNew       : FPictureFocused.Assign( GetPictureOfResource( NEW_FOCUSED         ) );
    tsEdit      : FPictureFocused.Assign( GetPictureOfResource( EDIT_FOCUSED        ) );
    tsFind,
    tsSearch    : FPictureFocused.Assign( GetPictureOfResource( FIND_FOCUSED        ) );
    tsPrint     : FPictureFocused.Assign( GetPictureOfResource( PRINT_FOCUSED       ) );
    tsRefresh   : FPictureFocused.Assign( GetPictureOfResource( REFRESH_FOCUSED     ) );
    tsArrowUp   : FPictureFocused.Assign( GetPictureOfResource( ARROW_UP_FOCUSED    ) );
    tsArrowDown : FPictureFocused.Assign( GetPictureOfResource( ARROW_DOWN_FOCUSED  ) );
    tsArrowRight: FPictureFocused.Assign( GetPictureOfResource( ARROW_RIGHT_FOCUSED ) );
    tsArrowLeft : FPictureFocused.Assign( GetPictureOfResource( ARROW_LEFT_FOCUSED  ) );
    tsKey       : FPictureFocused.Assign( GetPictureOfResource( KEY_FOCUSED         ) );
    tsConfig    : FPictureFocused.Assign( GetPictureOfResource( GEAR_FOCUSED        ) );
    tsMain      : FPictureFocused.Graphic := nil;
  end;



  Result := FPictureFocused;
end;

function TBraveButtonTemplateStyle.GetPictureFocusedStyleOutline: TPicture;
begin
  case FTemplateStyle of
    tsBasic         :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Graphic := nil ;
        tcWarning   : FPictureFocusedStyleOutline.Graphic := nil ;
        tcDanger    : FPictureFocusedStyleOutline.Graphic := nil ;
        tcPrimary   : FPictureFocusedStyleOutline.Graphic := nil ;
        tcSecondary : FPictureFocusedStyleOutline.Graphic := nil ;
        tcLight     : FPictureFocusedStyleOutline.Graphic := nil ;
        tcDark      : FPictureFocusedStyleOutline.Graphic := nil ;
        tcSuccess   : FPictureFocusedStyleOutline.Graphic := nil ;
        tcInfo      : FPictureFocusedStyleOutline.Graphic := nil ;
      end;
    end;

    tsAdd           :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED' ) );
      end;
    end;

    tsRemove        :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED' ) );
      end;
    end;

    tsCancel        :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED' ) );
      end;
    end;

    tsOK            :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED' ) );
      end;
    end;

    tsDelete        :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED' ) );
      end;
    end;

    tsSave          :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED' ) );
      end;
    end;

    tsNew           :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED' ) );
      end;
    end;

    tsEdit          :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED' ) );
      end;
    end;

    tsFind, tsSearch:
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED' ) );
      end;
    end;

    tsPrint         :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED' ) );
      end;
    end;

    tsRefresh       :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED' ) );
      end;
    end;

    tsArrowUp       :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED' ) );
      end;
    end;

    tsArrowDown     :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED' ) );
      end;
    end;

    tsArrowRight:
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED' ) );
      end;
    end;

    tsArrowLeft :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED' ) );
      end;
    end;

    tsKey       :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED' ) );
      end;
    end;

    tsConfig    :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcWarning   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcDanger    : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcPrimary   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcSecondary : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcLight     : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcDark      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcSuccess   : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
        tcInfo      : FPictureFocusedStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED' ) );
      end;
    end;

    tsMain          :
    begin
      case FTemplateColor of
        tcCustom    : FPictureFocusedStyleOutline.Graphic := nil ;
        tcWarning   : FPictureFocusedStyleOutline.Graphic := nil ;
        tcDanger    : FPictureFocusedStyleOutline.Graphic := nil ;
        tcPrimary   : FPictureFocusedStyleOutline.Graphic := nil ;
        tcSecondary : FPictureFocusedStyleOutline.Graphic := nil ;
        tcLight     : FPictureFocusedStyleOutline.Graphic := nil ;
        tcDark      : FPictureFocusedStyleOutline.Graphic := nil ;
        tcSuccess   : FPictureFocusedStyleOutline.Graphic := nil ;
        tcInfo      : FPictureFocusedStyleOutline.Graphic := nil ;
      end;
    end;
  end;

  Result := FPictureFocusedStyleOutline;
end;

function TBraveButtonTemplateStyle.GetPictureStyleOutline: TPicture;
begin
  case FTemplateStyle of
    tsBasic         :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Graphic := nil ;
        tcWarning   : FPictureStyleOutline.Graphic := nil ;
        tcDanger    : FPictureStyleOutline.Graphic := nil ;
        tcPrimary   : FPictureStyleOutline.Graphic := nil ;
        tcSecondary : FPictureStyleOutline.Graphic := nil ;
        tcLight     : FPictureStyleOutline.Graphic := nil ;
        tcDark      : FPictureStyleOutline.Graphic := nil ;
        tcSuccess   : FPictureStyleOutline.Graphic := nil ;
        tcInfo      : FPictureStyleOutline.Graphic := nil ;
      end;
    end;

    tsAdd           :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ADD_INFO'       ) );
      end;
    end;

    tsRemove        :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_ENABLED'   ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_WARNING'   ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_DANGER'    ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_PRIMARY'   ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_SECONDARY' ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_LIGHT'     ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_DARK'      ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_SUCCESS'   ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REMOVE_INFO'      ) );
      end;
    end;

    tsCancel        :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'CANCEL_INFO'       ) );
      end;
    end;

    tsOK            :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_ENABLED'       ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_WARNING'       ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_DANGER'        ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_PRIMARY'       ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_SECONDARY'     ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_LIGHT'         ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_DARK'          ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_SUCCESS'       ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'OK_INFO'          ) );
      end;
    end;

    tsDelete        :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'DELETE_INFO'       ) );
      end;
    end;

    tsSave          :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_ENABLED'     ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_WARNING'     ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_DANGER'      ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_PRIMARY'     ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_SECONDARY'   ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_LIGHT'       ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_DARK'        ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_SUCCESS'     ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'SAVE_INFO'        ) );
      end;
    end;

    tsNew           :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_ENABLED'       ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_WARNING'       ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_DANGER'        ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_PRIMARY'       ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_SECONDARY'     ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_LIGHT'         ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_DARK'          ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_SUCCESS'       ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'NEW_INFO'          ) );
      end;
    end;

    tsEdit          :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_ENABLED'     ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_WARNING'     ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_DANGER'      ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_PRIMARY'     ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_SECONDARY'   ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_LIGHT'       ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_DARK'        ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_SUCCESS'     ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'EDIT_INFO'        ) );
      end;
    end;

    tsFind          :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_ENABLED'     ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_WARNING'     ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_DANGER'      ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_PRIMARY'     ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_SECONDARY'   ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_LIGHT'       ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_DARK'        ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_SUCCESS'     ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'FIND_INFO'        ) );
      end;
    end;

    tsPrint         :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'PRINT_INFO'       ) );
      end;
    end;

    tsRefresh       :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'REFRESH_INFO'       ) );
      end;
    end;

    tsArrowUp       :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_ENABLED'   ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_WARNING'   ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_DANGER'    ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_PRIMARY'   ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_SECONDARY' ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_LIGHT'     ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_DARK'      ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_SUCCESS'   ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_UP_INFO'      ) );
      end;
    end;

    tsArrowDown     :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_DOWN_INFO'       ) );
      end;
    end;

    tsArrowRight:
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_RIGHT_INFO'       ) );
      end;
    end;

    tsArrowLeft :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'ARROW_LEFT_INFO'       ) );
      end;
    end;

    tsKey       :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'KEY_INFO'       ) );
      end;
    end;

    tsConfig    :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_ENABLED'    ) );
        tcWarning   : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_WARNING'    ) );
        tcDanger    : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_DANGER'     ) );
        tcPrimary   : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_PRIMARY'    ) );
        tcSecondary : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_SECONDARY'  ) );
        tcLight     : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_LIGHT'      ) );
        tcDark      : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_DARK'       ) );
        tcSuccess   : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_SUCCESS'    ) );
        tcInfo      : FPictureStyleOutline.Assign( GetPictureOfResource( 'GEAR_INFO'       ) );
      end;
    end;

   tsMain           :
    begin
      case FTemplateColor of
        tcCustom    : FPictureStyleOutline.Graphic := nil ;
        tcWarning   : FPictureStyleOutline.Graphic := nil ;
        tcDanger    : FPictureStyleOutline.Graphic := nil ;
        tcPrimary   : FPictureStyleOutline.Graphic := nil ;
        tcSecondary : FPictureStyleOutline.Graphic := nil ;
        tcLight     : FPictureStyleOutline.Graphic := nil ;
        tcDark      : FPictureStyleOutline.Graphic := nil ;
        tcSuccess   : FPictureStyleOutline.Graphic := nil ;
        tcInfo      : FPictureStyleOutline.Graphic := nil ;
      end;
    end;
  end;

  Result := FPictureStyleOutline;
end;

end.
