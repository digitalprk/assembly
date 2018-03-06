.data

mainmenubackcolor	db "main.menu.backcolor",0
mainwindowbackcolor	db "main.window.backcolor",0
mainwindowbordercolor	db "main.window.bordercolor",0
runwindowbackcolor	db "run.window.backcolor",0
runwindowbordercolor	db "run.window.bordercolor",0
runbuttontextcolor	db "run.button.textcolor",0
runbuttonbackcolor	db "run.button.backcolor",0
runbuttonbordercolor	db "run.button.bordercolor",0
notewindowbackcolor	db "note.window.backcolor",0
notewindowbordercolor	db "note.window.bordercolor",0
notewindowtextcolor	db "note.window.textcolor",0
mainwindowtextcolor	db "main.window.textcolor",0
sglobalalpha		db "globalalpha",0
smenualpha		db "menualpha",0
alphadef		db "200",0
menualpha		dd 0
globalalpha		dd 0
procalpha		dd 0
sdelayshow		db "delayshow",0
sdelayhide		db "delayhide",0
delaydef		db "1000",0
delayshow		dd 0
delayhide		dd 0
cmainwindowtextcolor	dd 0
cmainmenubackcolor	dd 0
cmainwindowbackcolor	dd 0
cmainwindowbordercolor	dd 0
crunwindowbackcolor	dd 0
crunwindowbordercolor	dd 0
crunbuttontextcolor	dd 0
crunbuttonbackcolor	dd 0
crunbuttonbordercolor	dd 0
cnotewindowbackcolor	dd 0
cnotewindowbordercolor	dd 0
cnotewindowtextcolor	dd 0
buttontop		dd 5
lbutdown		dd 0
countermov		dd 0
MoveRect		 RECT <>
defaultpen		db "0",0
defaultbrush		db "222B2F",0
defaultcolor		db "808042",0
Formatkey		db "Format",0
Positionstr		db "Position",0
Positionleft		db "Left",0
Positionright		db "Right",0
Positionbottom		db "Bottom",0
PositionUp		db "Up",0
cFormat			dd 0
cFormat2		dd 0

MSG STRUCT
  mshwnd      DWORD      ?
  msmessage   DWORD      ?
  mswParam    DWORD      ?
  mslParam    DWORD      ?
  mstime      DWORD      ?
  mspt        POINT      <>
MSG ENDS

MEASUREITEMSTRUCT STRUCT
  CtlType       DWORD      ?
  CtlID         DWORD      ?
  itemID        DWORD      ?
  itemWidth     DWORD      ?
  itemHeight    DWORD      ?
  itemData      DWORD      ?
MEASUREITEMSTRUCT ENDS

WNDCLASSEX STRUCT
  wccbSize            dd      ?
  wcstyle             dd      ?
  wclpfnWndProc       dd      ?
  wccbClsExtra        dd      ?
  wccbWndExtra        dd      ?
  wchInstance         dd      ?
  wchIcon             dd      ?
  wchCursor           dd      ?
  wchbrBackground     dd      ?
  wclpszMenuName      dd      ?
  wclpszClassName     dd      ?
  wchIconSm           dd      ?
WNDCLASSEX ENDS

ABM_GETAUTOHIDEBAR equ 7
TPM_LEFTBUTTON                       equ 0h
TPM_RIGHTBUTTON                      equ 2h
TPM_LEFTALIGN                        equ 0h
TPM_CENTERALIGN                      equ 4h
TPM_RIGHTALIGN                       equ 8h
CS_VREDRAW                           equ 1h
CS_HREDRAW                           equ 2h
CS_KEYCVTWINDOW                      equ 4h
TTS_ALWAYSTIP   		     equ 01h
WM_MOUSEHOOK equ WM_USER+6
TTS_NOPREFIX     		     equ 02h
TTF_IDISHWND     equ 01h
TTF_CENTERTIP    equ 02h
TTF_RTLREADING   equ 04h
TTF_SUBCLASS     equ 10h
TTM_ACTIVATE     equ WM_USER + 1
TTM_SETDELAYTIME equ WM_USER + 3

HWND_TOPMOST                         equ -1
TTM_ADDTOOL      equ WM_USER + 4
TTM_SETTIPBKCOLOR   = (WM_USER + 19)
TTM_SETTIPTEXTCOLOR = (WM_USER + 20)
TTM_ADDTOOLW     equ WM_USER + 50
TTM_DELTOOL      equ WM_USER + 5
TTM_DELTOOLW     equ WM_USER + 51
TTM_NEWTOOLRECT  equ WM_USER + 6
TTM_NEWTOOLRECTW equ WM_USER + 52
TTM_RELAYEVENT   equ WM_USER + 7
TTM_GETTOOLINFO  equ WM_USER + 8
TTM_GETTOOLINFOW equ WM_USER + 53
TTM_SETTOOLINFO  equ WM_USER + 9

MFT_OWNERDRAW                         equ 100h
TTM_SETTOOLINFOW equ WM_USER + 54
TTM_HITTEST      equ WM_USER +10
TTM_HITTESTW     equ WM_USER +55
TTN_FIRST        equ 0-520
TTM_GETTEXT      equ WM_USER +11
TTM_GETTEXTW     equ WM_USER +56
GCL_HBRBACKGROUND                    equ -10

TTM_UPDATETIPTEXT                equ WM_USER +12
TTM_UPDATETIPTEXTW               equ WM_USER +57
TTM_GETTOOLCOUNT equ WM_USER +13
TTM_ENUMTOOLS    equ WM_USER +14
TTM_ENUMTOOLSW   equ WM_USER +58
TTM_GETCURRENTTOOL               equ WM_USER + 15
TTM_GETCURRENTTOOLW              equ WM_USER + 59
TTM_WINDOWFROMPOINT              equ WM_USER + 16
TTN_NEEDTEXTW    equ TTN_FIRST - 10
TTN_SHOW         equ TTN_FIRST - 1
TTN_POP          equ TTN_FIRST - 2
FILE_READ_DATA equ ( 0001h )    
FILE_LIST_DIRECTORY equ ( 0001h )    
FILE_WRITE_DATA equ ( 0002h )    
FILE_ADD_FILE equ ( 0002h )    
FILE_APPEND_DATA equ ( 0004h )    
FILE_ADD_SUBDIRECTORY equ ( 0004h )    
FILE_CREATE_PIPE_INSTANCE equ ( 0004h )    
FILE_READ_EA equ ( 0008h )    
FILE_WRITE_EA equ ( 0010h )    
FILE_EXECUTE equ ( 0020h )    
FILE_TRAVERSE equ ( 0020h )    
FILE_DELETE_CHILD equ ( 0040h )    
FILE_READ_ATTRIBUTES equ ( 0080h )    
FILE_WRITE_ATTRIBUTES equ ( 0100h )    
GENERIC_READ                         equ 80000000h
GENERIC_WRITE                        equ 40000000h
                                   GMEM_FIXED                           equ 0h
GMEM_MOVEABLE                        equ 2h
GMEM_NOCOMPACT                       equ 10h
ABN_FULLSCREENAPP	equ 2h
GMEM_NODISCARD                       equ 20h
GMEM_ZEROINIT                        equ 40h
GMEM_MODIFY                          equ 80h
GMEM_DISCARDABLE                     equ 100h
GMEM_NOT_BANKED                      equ 1000h
GMEM_SHARE                           equ 2000h
GMEM_DDESHARE                        equ 2000h
GMEM_NOTIFY                          equ 4000h
GMEM_LOWER                           equ GMEM_NOT_BANKED
GMEM_VALID_FLAGS                     equ 7F72h
GMEM_INVALID_HANDLE                  equ 8000h
GMEM_DISCARDED                       equ 4000h
GMEM_LOCKCOUNT                       equ 0FFh
FILE_SHARE_READ equ 00000001h  
FILE_SHARE_WRITE equ 00000002h  
FILE_SHARE_DELETE equ 00000004h  
FILE_ATTRIBUTE_READONLY equ 00000001h  
FILE_ATTRIBUTE_HIDDEN equ 00000002h  
FILE_ATTRIBUTE_SYSTEM equ 00000004h  
FILE_ATTRIBUTE_DIRECTORY equ 00000010h  
FILE_ATTRIBUTE_ARCHIVE equ 00000020h  
FILE_ATTRIBUTE_ENCRYPTED equ 00000040h  
FILE_ATTRIBUTE_NORMAL equ 00000080h  
FILE_ATTRIBUTE_TEMPORARY equ 00000100h  
FILE_ATTRIBUTE_SPARSE_FILE equ 00000200h  
FILE_ATTRIBUTE_REPARSE_POINT equ 00000400h  
FILE_ATTRIBUTE_COMPRESSED equ 00000800h  
FILE_ATTRIBUTE_OFFLINE equ 00001000h  
FILE_ATTRIBUTE_NOT_CONTENT_INDEXED equ 00002000h  
FILE_NOTIFY_CHANGE_FILE_NAME equ 00000001h   
FILE_NOTIFY_CHANGE_DIR_NAME equ 00000002h   
FILE_NOTIFY_CHANGE_ATTRIBUTES equ 00000004h   
FILE_NOTIFY_CHANGE_SIZE equ 00000008h   
FILE_NOTIFY_CHANGE_LAST_WRITE equ 00000010h   
FILE_NOTIFY_CHANGE_LAST_ACCESS equ 00000020h   
FILE_NOTIFY_CHANGE_CREATION equ 00000040h   
FILE_NOTIFY_CHANGE_SECURITY equ 00000100h   
FILE_ACTION_ADDED equ 00000001h   
FILE_ACTION_REMOVED equ 00000002h   
FILE_ACTION_MODIFIED equ 00000003h   
FILE_ACTION_RENAMED_OLD_NAME equ 00000004h   
FILE_ACTION_RENAMED_NEW_NAME equ 00000005h   
MAILSLOT_NO_MESSAGE equ (-1) 
MAILSLOT_WAIT_FOREVER equ (-1) 
FILE_CASE_SENSITIVE_SEARCH equ 00000001h  
FILE_CASE_PRESERVED_NAMES equ 00000002h  
FILE_UNICODE_ON_DISK equ 00000004h  
FILE_PERSISTENT_ACLS equ 00000008h  
FILE_FILE_COMPRESSION equ 00000010h  
FILE_VOLUME_QUOTAS equ 00000020h  
FILE_SUPPORTS_SPARSE_FILES equ 00000040h  
FILE_SUPPORTS_REPARSE_POINTS equ 00000080h  
FILE_SUPPORTS_REMOTE_STORAGE equ 00000100h  
FILE_VOLUME_IS_COMPRESSED equ 00008000h  
FILE_SUPPORTS_OBJECT_IDS equ 00010000h  
FILE_SUPPORTS_ENCRYPTION equ 00020000h  
MAXIMUM_REPARSE_DATA_BUFFER_SIZE equ ( 16 * 1024 )
CS_DBLCLKS                           equ 8h
CS_OWNDC                             equ 20h
CS_CLASSDC                           equ 40h
CS_PARENTDC                          equ 80h
CS_NOKEYCVT                          equ 100h

GWL_WNDPROC                          equ -4
GWL_HINSTANCE                        equ -6
GWL_HWNDPARENT                       equ -8
GWL_STYLE                            equ -16
GWL_EXSTYLE                          equ -20
GWL_USERDATA                         equ -21
GWL_ID                               equ -12
LWA_ALPHA			     equ 2
CS_NOCLOSE                           equ 200h
CS_SAVEBITS                          equ 800h
CS_BYTEALIGNCLIENT                   equ 1000h
CS_BYTEALIGNWINDOW                   equ 2000h
CS_PUBLICCLASS                       equ 4000h
CS_IME              			  equ 10000h
IDC_ARROW                            equ 32512
WH_MOUSE                             equ 7
MB_TOPMOST                  		  equ 40000h
RDW_UPDATENOW                        equ 100h
ABM_NEW 	equ 0
ABM_REMOVE 	equ 1
ABM_SETAUTOHIDEBAR equ 8
ABM_SETPOS 	equ 3
ABM_GETTASKBARPOS equ 5
ABM_QUERYPOS 			     equ 2
MB_SETFOREGROUND equ 10000h
MF_BITMAP equ 04h
HKEY_CLASSES_ROOT                    equ 80000000h
HKEY_CURRENT_USER                    equ 80000001h
HKEY_LOCAL_MACHINE                   equ 80000002h
HKEY_USERS                           equ 80000003h
TPM_RIGHTALIGN			     equ 8
HKEY_PERFORMANCE_DATA                equ 80000004h
HKEY_CURRENT_CONFIG                  equ 80000005h
HKEY_DYN_DATA                        equ 80000006h
MF_BYPOSITION equ 0400h
MF_DISABLED	equ 02h
MF_POPUP	equ 10h
MF_STRING	equ 0h
REG_OPTION_RESERVED                  equ 0
REG_OPTION_NON_VOLATILE              equ 0
REG_OPTION_VOLATILE                  equ 1
REG_OPTION_CREATE_LINK               equ 2
REG_OPTION_BACKUP_RESTORE            equ 4
REG_NONE                             equ 0
REG_SZ                               equ 1
REG_EXPAND_SZ                        equ 2
REG_BINARY                           equ 3
REG_DWORD                            equ 4
REG_DWORD_LITTLE_ENDIAN              equ 4
REG_DWORD_BIG_ENDIAN                 equ 5
REG_LINK                             equ 6
REG_MULTI_SZ                         equ 7
REG_RESOURCE_LIST                    equ 8
REG_FULL_RESOURCE_DESCRIPTOR         equ 9
REG_RESOURCE_REQUIREMENTS_LIST       equ 10
REG_CREATED_NEW_KEY                  equ 1h
REG_OPENED_EXISTING_KEY              equ 2h
REG_WHOLE_HIVE_VOLATILE              equ 1h
REG_REFRESH_HIVE                     equ 2h
REG_NOTIFY_CHANGE_NAME               equ 1h
REG_NOTIFY_CHANGE_ATTRIBUTES         equ 2h
REG_NOTIFY_CHANGE_LAST_SET           equ 4h
REG_NOTIFY_CHANGE_SECURITY           equ 8h
REG_LEGAL_CHANGE_FILTER              equ REG_NOTIFY_CHANGE_NAME OR REG_NOTIFY_CHANGE_ATTRIBUTES OR REG_NOTIFY_CHANGE_LAST_SET OR REG_NOTIFY_CHANGE_SECURITY
REG_LEGAL_OPTION                     equ REG_OPTION_RESERVED OR REG_OPTION_NON_VOLATILE OR REG_OPTION_VOLATILE OR REG_OPTION_CREATE_LINK OR REG_OPTION_BACKUP_RESTORE
KEY_QUERY_VALUE                      equ 1h
KEY_SET_VALUE                        equ 2h
KEY_CREATE_SUB_KEY                   equ 4h
KEY_ENUMERATE_SUB_KEYS               equ 8h
KEY_NOTIFY                           equ 10h
KEY_CREATE_LINK                      equ 20h
STANDARD_RIGHTS_ALL                  equ 1F0000h
KEY_READ                             equ 20019h
KEY_WRITE                            equ 20006h
LR_COPYFROMRESOURCE 		     equ 4000h
IMAGE_BITMAP                equ 0
BM_SETIMAGE                          equ 0F7h
BS_PUSHBUTTON                        equ 0h
BS_DEFPUSHBUTTON                     equ 1h
BS_CHECKBOX                          equ 2h
BS_AUTOCHECKBOX                      equ 3h
BS_RADIOBUTTON                       equ 4h
BS_3STATE                            equ 5h
BS_AUTO3STATE                        equ 6h
BS_GROUPBOX                          equ 7h
BS_USERBUTTON                        equ 8h
BS_AUTORADIOBUTTON                   equ 9h
VK_ESCAPE 		equ 1Bh
WS_EX_TRANSPARENT                    equ 20h
BS_OWNERDRAW                         equ 0Bh
BS_LEFTTEXT                          equ 20h
BS_BITMAP                            equ 80h
DT_TOP                               equ 0h
DT_LEFT                              equ 0h
DT_CENTER                            equ 1h
DT_RIGHT                             equ 2h
DT_VCENTER                           equ 4h
DT_BOTTOM                            equ 8h
DT_WORDBREAK                         equ 10h
DT_SINGLELINE                        equ 20h
DT_EXPANDTABS                        equ 40h
DT_TABSTOP                           equ 80h
DT_NOCLIP                            equ 100h
DT_EXTERNALLEADING                   equ 200h
DT_CALCRECT                          equ 400h
DT_NOPREFIX                          equ 800h
DT_INTERNAL                          equ 1000h
DT_EDITCONTROL      			  equ 2000h
DT_PATH_ELLIPSIS    			  equ 4000h
DT_END_ELLIPSIS     			  equ 8000h
DT_MODIFYSTRING     			  equ 10000h
DT_RTLREADING       			  equ 20000h
DT_WORD_ELLIPSIS    			  equ 40000h
BS_ICON                              equ 40h
BDR_RAISEDOUTER                      equ 0001h
BDR_SUNKENOUTER                      equ 0002h
BDR_RAISEDINNER                      equ 0004h
BDR_SUNKENINNER                      equ 0008h
BDR_OUTER                            equ 0003h
BDR_INNER                            equ 000Ch
BDR_RAISED                           equ 0005h
BDR_SUNKEN                           equ 000Ah
BS_SOLID                             equ 0
BS_NULL                              equ 1
BS_HOLLOW                            equ 0BS_NULL
BS_HATCHED                           equ 2
BS_PATTERN                           equ 3
BS_INDEXED                           equ 4
BS_DIBPATTERN                        equ 5
BS_DIBPATTERNPT                      equ 6
BS_PATTERN8X8                        equ 7
BS_DIBPATTERN8X8                     equ 8
HS_HORIZONTAL                        equ 0
HS_VERTICAL                          equ 1
HS_FDIAGONAL                         equ 2
HS_BDIAGONAL                         equ 3
HS_CROSS                             equ 4
HS_DIAGCROSS                         equ 5
HS_FDIAGONAL1                        equ 6
HS_BDIAGONAL1                        equ 7
BF_LEFT                              equ 0001h
BF_TOP                               equ 0002h
BF_RIGHT                             equ 0004h
BF_MIDDLE                            equ 0800h
BF_SOFT                              equ 1000h
BF_ADJUST                            equ 2000h
BF_FLAT                              equ 4000h
BF_MONO                              equ 8000h
SS_OWNERDRAW 			equ 0Dh
SS_BITMAP 				equ 0Eh
SS_ENHMETAFILE 			equ 0Fh
SS_ETCHEDHORZ 			equ 10h
SS_ETCHEDVERT 			equ 11h
SS_ETCHEDFRAME 			equ 12h
SS_TYPEMASK 			equ 1Fh
SS_NOPREFIX 			equ 80h
SS_NOTIFY 				equ 100h
SS_CENTERIMAGE 			equ 200h
SS_RIGHTJUST 			equ 400h
SS_REALSIZEIMAGE 			equ 800h
SS_SUNKEN 				equ 1000h
SS_ENDELLIPSIS 			equ 4000h
SS_PATHELLIPSIS 			equ 8000h
SS_WORDELLIPSIS 			equ 0C000h
SS_ELLIPSISMASK 			equ 0C000h
STM_SETIMAGE 			equ 172h
STM_GETIMAGE 			equ 173h
BF_RECT				     equ 0Fh
BF_BOTTOM                            equ 0008h
BS_TEXT             			  equ 0
BS_ICON             			  equ 40h
BS_BITMAP           			  equ 80h
BS_LEFT             			  equ 100h
BS_RIGHT           			  equ 200h
BS_CENTER           			  equ 300h
BS_TOP              			  equ 400h
BS_BOTTOM           			  equ 800h
BS_VCENTER          			  equ 0C00h
BS_PUSHLIKE         			  equ 1000h
BS_MULTILINE        			  equ 2000h
TTM_TRACKACTIVATE equ WM_USER + 17
BS_NOTIFY           			  equ 4000h
BS_FLAT             			  equ 8000h
IMAGE_ICON                  equ 1
IMAGE_BITMAP                equ 0
KEY_EXECUTE                          equ KEY_READ
KEY_ALL_ACCESS                       equ 0F003Fh