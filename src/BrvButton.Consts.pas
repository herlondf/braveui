unit BrvButton.Consts;

interface

uses
  GraphUtil,
  System.UITypes,
  Winapi.Windows;

type
  TTemplateColor = (
    tcCustom,
    tcWarning,
    tcDanger,
    tcPrimary,
    tcSecondary,
    tcLight,
    tcDark,
    tcSuccess,
    tcInfo,
    tcGlassy
  );

  TTemplateStyle = (
    tsBasic,
    tsAdd,
    tsRemove,
    tsCancel,
    tsOK,
    tsDelete,
    tsSave,
    tsNew,
    tsEdit,
    tsFind,
    tsPrint,
    tsRefresh,
    tsArrowUp,
    tsArrowDown,
    tsMain,
    tsArrowRight,
    tsArrowLeft,
    tsKey,
    tsConfig,
    tsSearch
  );

  TSizeLayout = (
    sl25x25,
    sl90x25,
    sl90x30,
    sl110x25,
    sl110x30,
    sl110x35,
    sl110x60,
    sl110x90
  );

  TButtonAlignment = (
    baLeftCustom,
    baLeftCenter,
    baRightCustom,
    baRightCenter,
    baTopCustom,
    baTopCenter,
    baBottomCustom,
    baBottomCenter,
    baCenter,
    baNone
  );

  TCaptionLayout = (
    clLeft,
    clCenter,
    clRight,
    clNone
  );

  TPictureLayout       = (
    plGraphicCenter,
    plGraphicBottom,
    plGraphicTop
  );

  TButtonStyleType  = (
    stRoundRect,
    stRectangle
  );


  function Intensity(AColor: TColor; ALum: Integer): TColor;

const
  PRATITLEDIALOG                   = 'BraveUI';
  PRAABOUTLICENSESTATUS            = 'Open Source - Free Version';
  VERSION                          = '1.00';

  ADD_COMPONENT                    = 'ADD_';
  ADD_ENABLED                      = ADD_COMPONENT + 'ENABLED';
  ADD_DISABLED                     = ADD_COMPONENT + 'DISABLED';
  ADD_FOCUSED                      = ADD_COMPONENT + 'ENABLED';
  ADD_DARK                         = ADD_COMPONENT + 'DARK';
  ADD_WARNING                      = ADD_COMPONENT + 'WARNING';
  ADD_DANGER                       = ADD_COMPONENT + 'DANGER';
  ADD_PRIMARY                      = ADD_COMPONENT + 'PRIMARY';
  ADD_SECONDARY                    = ADD_COMPONENT + 'SECONDARY';
  ADD_LIGHT                        = ADD_COMPONENT + 'LIGHT';
  ADD_SUCCESS                      = ADD_COMPONENT + 'SUCCESS';
  ADD_INFO                         = ADD_COMPONENT + 'INFO';

  ARROW_DOWN_COMPONENT             = 'ARROW_DOWN_';
  ARROW_DOWN_ENABLED               = ARROW_DOWN_COMPONENT + 'ENABLED';
  ARROW_DOWN_DISABLED              = ARROW_DOWN_COMPONENT + 'DISABLED';
  ARROW_DOWN_FOCUSED               = ARROW_DOWN_COMPONENT + 'ENABLED';
  ARROW_DOWN_DARK                  = ARROW_DOWN_COMPONENT + 'DARK';
  ARROW_DOWN_WARNING               = ARROW_DOWN_COMPONENT + 'ARROW_DWARNING';
  ARROW_DOWN_DANGER                = ARROW_DOWN_COMPONENT + 'DANGER';
  ARROW_DOWN_PRIMARY               = ARROW_DOWN_COMPONENT + 'PRIMARY';
  ARROW_DOWN_SECONDARY             = ARROW_DOWN_COMPONENT + 'SECONDARY';
  ARROW_DOWN_LIGHT                 = ARROW_DOWN_COMPONENT + 'LIGHT';
  ARROW_DOWN_SUCCESS               = ARROW_DOWN_COMPONENT + 'SUCCESS';
  ARROW_DOWN_INFO                  = ARROW_DOWN_COMPONENT + 'INFO';

  ARROW_UP_COMPONENT               = 'ARROW_UP_';
  ARROW_UP_ENABLED                 = ARROW_UP_COMPONENT + 'ENABLED';
  ARROW_UP_DISABLED                = ARROW_UP_COMPONENT + 'DISABLED';
  ARROW_UP_FOCUSED                 = ARROW_UP_COMPONENT + 'ENABLED';
  ARROW_UP_DARK                    = ARROW_UP_COMPONENT + 'DARK';
  ARROW_UP_WARNING                 = ARROW_UP_COMPONENT + 'ARROWWARNING';
  ARROW_UP_DANGER                  = ARROW_UP_COMPONENT + 'DANGER';
  ARROW_UP_PRIMARY                 = ARROW_UP_COMPONENT + 'PRIMARY';
  ARROW_UP_SECONDARY               = ARROW_UP_COMPONENT + 'SECONDARY';
  ARROW_UP_LIGHT                   = ARROW_UP_COMPONENT + 'LIGHT';
  ARROW_UP_SUCCESS                 = ARROW_UP_COMPONENT + 'SUCCESS';
  ARROW_UP_INFO                    = ARROW_UP_COMPONENT + 'INFO';

  ARROW_RIGHT_COMPONENT               = 'ARROW_RIGHT_';
  ARROW_RIGHT_ENABLED                 = ARROW_RIGHT_COMPONENT + 'ENABLED';
  ARROW_RIGHT_DISABLED                = ARROW_RIGHT_COMPONENT + 'DISABLED';
  ARROW_RIGHT_FOCUSED                 = ARROW_RIGHT_COMPONENT + 'ENABLED';
  ARROW_RIGHT_DARK                    = ARROW_RIGHT_COMPONENT + 'DARK';
  ARROW_RIGHT_WARNING                 = ARROW_RIGHT_COMPONENT + 'ARROWWARNING';
  ARROW_RIGHT_DANGER                  = ARROW_RIGHT_COMPONENT + 'DANGER';
  ARROW_RIGHT_PRIMARY                 = ARROW_RIGHT_COMPONENT + 'PRIMARY';
  ARROW_RIGHT_SECONDARY               = ARROW_RIGHT_COMPONENT + 'SECONDARY';
  ARROW_RIGHT_LIGHT                   = ARROW_RIGHT_COMPONENT + 'LIGHT';
  ARROW_RIGHT_SUCCESS                 = ARROW_RIGHT_COMPONENT + 'SUCCESS';
  ARROW_RIGHT_INFO                    = ARROW_RIGHT_COMPONENT + 'INFO';

  ARROW_LEFT_COMPONENT               = 'ARROW_LEFT_';
  ARROW_LEFT_ENABLED                 = ARROW_LEFT_COMPONENT + 'ENABLED';
  ARROW_LEFT_DISABLED                = ARROW_LEFT_COMPONENT + 'DISABLED';
  ARROW_LEFT_FOCUSED                 = ARROW_LEFT_COMPONENT + 'ENABLED';
  ARROW_LEFT_DARK                    = ARROW_LEFT_COMPONENT + 'DARK';
  ARROW_LEFT_WARNING                 = ARROW_LEFT_COMPONENT + 'ARROWWARNING';
  ARROW_LEFT_DANGER                  = ARROW_LEFT_COMPONENT + 'DANGER';
  ARROW_LEFT_PRIMARY                 = ARROW_LEFT_COMPONENT + 'PRIMARY';
  ARROW_LEFT_SECONDARY               = ARROW_LEFT_COMPONENT + 'SECONDARY';
  ARROW_LEFT_LIGHT                   = ARROW_LEFT_COMPONENT + 'LIGHT';
  ARROW_LEFT_SUCCESS                 = ARROW_LEFT_COMPONENT + 'SUCCESS';
  ARROW_LEFT_INFO                    = ARROW_LEFT_COMPONENT + 'INFO';

  KEY_COMPONENT               = 'KEY_';
  KEY_ENABLED                 = KEY_COMPONENT + 'ENABLED';
  KEY_DISABLED                = KEY_COMPONENT + 'DISABLED';
  KEY_FOCUSED                 = KEY_COMPONENT + 'ENABLED';
  KEY_DARK                    = KEY_COMPONENT + 'DARK';
  KEY_WARNING                 = KEY_COMPONENT + 'ARROWWARNING';
  KEY_DANGER                  = KEY_COMPONENT + 'DANGER';
  KEY_PRIMARY                 = KEY_COMPONENT + 'PRIMARY';
  KEY_SECONDARY               = KEY_COMPONENT + 'SECONDARY';
  KEY_LIGHT                   = KEY_COMPONENT + 'LIGHT';
  KEY_SUCCESS                 = KEY_COMPONENT + 'SUCCESS';
  KEY_INFO                    = KEY_COMPONENT + 'INFO';

	GEAR_COMPONENT               = 'GEAR_';
  GEAR_ENABLED                 = GEAR_COMPONENT + 'ENABLED';
  GEAR_DISABLED                = GEAR_COMPONENT + 'DISABLED';
  GEAR_FOCUSED                 = GEAR_COMPONENT + 'ENABLED';
  GEAR_DARK                    = GEAR_COMPONENT + 'DARK';
  GEAR_WARNING                 = GEAR_COMPONENT + 'ARROWWARNING';
  GEAR_DANGER                  = GEAR_COMPONENT + 'DANGER';
  GEAR_PRIMARY                 = GEAR_COMPONENT + 'PRIMARY';
  GEAR_SECONDARY               = GEAR_COMPONENT + 'SECONDARY';
  GEAR_LIGHT                   = GEAR_COMPONENT + 'LIGHT';
  GEAR_SUCCESS                 = GEAR_COMPONENT + 'SUCCESS';
  GEAR_INFO                    = GEAR_COMPONENT + 'INFO';



  CANCEL_COMPONENT                 = 'CANCEL_';
  CANCEL_ENABLED                   = CANCEL_COMPONENT + 'ENABLED';
  CANCEL_DISABLED                  = CANCEL_COMPONENT + 'DISABLED';
  CANCEL_FOCUSED                   = CANCEL_COMPONENT + 'ENABLED';
  CANCEL_DARK                      = CANCEL_COMPONENT + 'DARK';
  CANCEL_WARNING                   = CANCEL_COMPONENT + 'CANWARNING';
  CANCEL_DANGER                    = CANCEL_COMPONENT + 'DANGER';
  CANCEL_PRIMARY                   = CANCEL_COMPONENT + 'PRIMARY';
  CANCEL_SECONDARY                 = CANCEL_COMPONENT + 'SECONDARY';
  CANCEL_LIGHT                     = CANCEL_COMPONENT + 'LIGHT';
  CANCEL_SUCCESS                   = CANCEL_COMPONENT + 'SUCCESS';
  CANCEL_INFO                      = CANCEL_COMPONENT + 'INFO';

  DELETE_COMPONENT                 = 'DELETE_';
  DELETE_ENABLED                   = DELETE_COMPONENT + 'ENABLED';
  DELETE_DISABLED                  = DELETE_COMPONENT + 'DISABLED';
  DELETE_FOCUSED                   = DELETE_COMPONENT + 'ENABLED';
  DELETE_DARK                      = DELETE_COMPONENT + 'DARK';
  DELETE_WARNING                   = DELETE_COMPONENT + 'DELWARNING';
  DELETE_DANGER                    = DELETE_COMPONENT + 'DANGER';
  DELETE_PRIMARY                   = DELETE_COMPONENT + 'PRIMARY';
  DELETE_SECONDARY                 = DELETE_COMPONENT + 'SECONDARY';
  DELETE_LIGHT                     = DELETE_COMPONENT + 'LIGHT';
  DELETE_SUCCESS                   = DELETE_COMPONENT + 'SUCCESS';
  DELETE_INFO                      = DELETE_COMPONENT + 'INFO';

  EDIT_COMPONENT                   = 'EDIT_';
  EDIT_ENABLED                     = EDIT_COMPONENT + 'ENABLED';
  EDIT_DISABLED                    = EDIT_COMPONENT + 'DISABLED';
  EDIT_FOCUSED                     = EDIT_COMPONENT + 'ENABLED';
  EDIT_DARK                        = EDIT_COMPONENT + 'DARK';
  EDIT_WARNING                     = EDIT_COMPONENT + 'EWARNING';
  EDIT_DANGER                      = EDIT_COMPONENT + 'DANGER';
  EDIT_PRIMARY                     = EDIT_COMPONENT + 'PRIMARY';
  EDIT_SECONDARY                   = EDIT_COMPONENT + 'SECONDARY';
  EDIT_LIGHT                       = EDIT_COMPONENT + 'LIGHT';
  EDIT_SUCCESS                     = EDIT_COMPONENT + 'SUCCESS';
  EDIT_INFO                        = EDIT_COMPONENT + 'INFO';

  FIND_COMPONENT                   = 'FIND_';
  FIND_ENABLED                     = FIND_COMPONENT + 'ENABLED';
  FIND_DISABLED                    = FIND_COMPONENT + 'DISABLED';
  FIND_FOCUSED                     = FIND_COMPONENT + 'ENABLED';
  FIND_DARK                        = FIND_COMPONENT + 'DARK';
  FIND_WARNING                     = FIND_COMPONENT + 'FWARNING';
  FIND_DANGER                      = FIND_COMPONENT + 'DANGER';
  FIND_PRIMARY                     = FIND_COMPONENT + 'PRIMARY';
  FIND_SECONDARY                   = FIND_COMPONENT + 'SECONDARY';
  FIND_LIGHT                       = FIND_COMPONENT + 'LIGHT';
  FIND_SUCCESS                     = FIND_COMPONENT + 'SUCCESS';
  FIND_INFO                        = FIND_COMPONENT + 'INFO';

  NEW_COMPONENT                    = 'NEW_';
  NEW_ENABLED                      = NEW_COMPONENT + 'ENABLED';
  NEW_DISABLED                     = NEW_COMPONENT + 'DISABLED';
  NEW_FOCUSED                      = NEW_COMPONENT + 'ENABLED';
  NEW_DARK                         = NEW_COMPONENT + 'DARK';
  NEW_WARNING                      = NEW_COMPONENT + 'WARNING';
  NEW_DANGER                       = NEW_COMPONENT + 'DANGER';
  NEW_PRIMARY                      = NEW_COMPONENT + 'PRIMARY';
  NEW_SECONDARY                    = NEW_COMPONENT + 'SECONDARY';
  NEW_LIGHT                        = NEW_COMPONENT + 'LIGHT';
  NEW_SUCCESS                      = NEW_COMPONENT + 'SUCCESS';
  NEW_INFO                         = NEW_COMPONENT + 'INFO';

  OK_COMPONENT                     = 'OK_';
  OK_ENABLED                       = OK_COMPONENT + 'ENABLED';
  OK_DISABLED                      = OK_COMPONENT + 'DISABLED';
  OK_FOCUSED                       = OK_COMPONENT + 'ENABLED';
  OK_DARK                          = OK_COMPONENT + 'DARK';
  OK_WARNING                       = OK_COMPONENT + 'WARNING';
  OK_DANGER                        = OK_COMPONENT + 'DANGER';
  OK_PRIMARY                       = OK_COMPONENT + 'PRIMARY';
  OK_SECONDARY                     = OK_COMPONENT + 'SECONDARY';
  OK_LIGHT                         = OK_COMPONENT + 'LIGHT';
  OK_SUCCESS                       = OK_COMPONENT + 'SUCCESS';
  OK_INFO                          = OK_COMPONENT + 'INFO';

  PRINT_COMPONENT                  = 'PRINT_';
  PRINT_ENABLED                    = PRINT_COMPONENT + 'ENABLED';
  PRINT_DISABLED                   = PRINT_COMPONENT + 'DISABLED';
  PRINT_FOCUSED                    = PRINT_COMPONENT + 'ENABLED';
  PRINT_DARK                       = PRINT_COMPONENT + 'DARK';
  PRINT_WARNING                    = PRINT_COMPONENT + 'PRWARNING';
  PRINT_DANGER                     = PRINT_COMPONENT + 'DANGER';
  PRINT_PRIMARY                    = PRINT_COMPONENT + 'PRIMARY';
  PRINT_SECONDARY                  = PRINT_COMPONENT + 'SECONDARY';
  PRINT_LIGHT                      = PRINT_COMPONENT + 'LIGHT';
  PRINT_SUCCESS                    = PRINT_COMPONENT + 'SUCCESS';
  PRINT_INFO                       = PRINT_COMPONENT + 'INFO';

  REFRESH_COMPONENT                = 'REFRESH_';
  REFRESH_ENABLED                  = REFRESH_COMPONENT + 'ENABLED';
  REFRESH_DISABLED                 = REFRESH_COMPONENT + 'DISABLED';
  REFRESH_FOCUSED                  = REFRESH_COMPONENT + 'ENABLED';
  REFRESH_DARK                     = REFRESH_COMPONENT + 'DARK';
  REFRESH_WARNING                  = REFRESH_COMPONENT + 'REFRWARNING';
  REFRESH_DANGER                   = REFRESH_COMPONENT + 'DANGER';
  REFRESH_PRIMARY                  = REFRESH_COMPONENT + 'PRIMARY';
  REFRESH_SECONDARY                = REFRESH_COMPONENT + 'SECONDARY';
  REFRESH_LIGHT                    = REFRESH_COMPONENT + 'LIGHT';
  REFRESH_SUCCESS                  = REFRESH_COMPONENT + 'SUCCESS';
  REFRESH_INFO                     = REFRESH_COMPONENT + 'INFO';

  REMOVE_COMPONENT                 = 'REMOVE_';
  REMOVE_ENABLED                   = REMOVE_COMPONENT + 'ENABLED';
  REMOVE_DISABLED                  = REMOVE_COMPONENT + 'DISABLED';
  REMOVE_FOCUSED                   = REMOVE_COMPONENT + 'ENABLED';
  REMOVE_DARK                      = REMOVE_COMPONENT + 'DARK';
  REMOVE_WARNING                   = REMOVE_COMPONENT + 'REMWARNING';
  REMOVE_DANGER                    = REMOVE_COMPONENT + 'DANGER';
  REMOVE_PRIMARY                   = REMOVE_COMPONENT + 'PRIMARY';
  REMOVE_SECONDARY                 = REMOVE_COMPONENT + 'SECONDARY';
  REMOVE_LIGHT                     = REMOVE_COMPONENT + 'LIGHT';
  REMOVE_SUCCESS                   = REMOVE_COMPONENT + 'SUCCESS';
  REMOVE_INFO                      = REMOVE_COMPONENT + 'INFO';

  SAVE_COMPONENT                   = 'SAVE_';
  SAVE_ENABLED                     = SAVE_COMPONENT + 'ENABLED';
  SAVE_DISABLED                    = SAVE_COMPONENT + 'DISABLED';
  SAVE_FOCUSED                     = SAVE_COMPONENT + 'ENABLED';
  SAVE_DARK                        = SAVE_COMPONENT + 'DARK';
  SAVE_WARNING                     = SAVE_COMPONENT + 'SWARNING';
  SAVE_DANGER                      = SAVE_COMPONENT + 'DANGER';
  SAVE_PRIMARY                     = SAVE_COMPONENT + 'PRIMARY';
  SAVE_SECONDARY                   = SAVE_COMPONENT + 'SECONDARY';
  SAVE_LIGHT                       = SAVE_COMPONENT + 'LIGHT';
  SAVE_SUCCESS                     = SAVE_COMPONENT + 'SUCCESS';
  SAVE_INFO                        = SAVE_COMPONENT + 'INFO';


implementation

function Intensity(AColor: TColor; ALum: Integer): TColor;
var
   H, S, L: Word;
begin
   ColorRGBToHLS(AColor, H, L, S);

   if ALum > 100 then ALum := 100;
   if ALum < 0   then ALum := 0;

   ALum := Trunc( ( 255*ALum ) / 100);

   Result := ColorHLSToRGB(H, ALum, S);
end;

end.
