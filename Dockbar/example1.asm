.386P
locals
jumps
.model flat, stdCALL
include win32.inc
include variables.asm
include NoteProc.asm
include	Runproc.asm
LONGINT  typedef DWORD
Extrn 	LoadBitmapA:PROC
Extrn 	GetDesktopWindow:PROC
Extrn	  WindowFromDC:PROC
Extrn	  GetWindowLongA:PROC
Extrn 	PostMessageA:PROC
Extrn	  GetMenuItemID:PROC
Extrn 	DestroyMenu:PROC
Extrn 	WritePrivateProfileStringA:PROC
Extrn 	FindWindowExA:PROC
Extrn   SetWindowRgn:PROC
Extrn	  DestroyWindow:PROC	
Extrn   RegDeleteValueA:Proc
Extrn 	GetModuleFileNameA:PROC
Extrn	  DrawTextA:PROC
Extrn 	PeekMessageA:PROC
Extrn	  GlobalUnlock:PROC
Extrn 	PeekMessageA:PROC


Int2Real32 macro val
  fild			 val
  fstp			 val
endm

XFORM	struct
	XF_eM11			dd ?
	XF_eM12			dd ?
	XF_eM21			dd ?
	XF_eM22			dd ?
	XF_eDx			dd ?
	XF_eDy			dd ?
XFORM	ends
       
MENUITEMINFO STRUCT
	McbSize			    dd ?
	MfMask			    dd ? 
	MfType			    dd ? 
	MfState			    dd ? 
	MwID            dd ? 
	MhSubMenu		    dd ? 
	MhbmpChecked	  dd ? 
	MhbmpUnchecked 	dd ? 
	dwItemData		  LONGINT 0
	dwTypeData		  db 128 dup(?)
	cch				      dd ?
	hbmpItem		    dd ?
MENUITEMINFO ENDS

LOGBRUSH STRUCT
	lbStyle  			DWORD      ?
	lbColor  			DWORD      ?
	lbHatch  			DWORD      ?
LOGBRUSH ENDS

LOGBRUSH STRUCT
	lbStyle				dd ?
	lbColor				dd ?
	lbHatch				LONGINT 0
LOGBRUSH ends
  
Di STRUCT
	di_CtlType       	DWORD      ?
	di_CtlID         	DWORD      ?
	di_itemID        	DWORD      ?
	di_itemAction    	DWORD      ?
	di_itemState     	DWORD      ?
	di_hwndItem      	DWORD      ?
	di_hDC           	DWORD      ?
	di_rcItem        	RECT <>
	di_itemData      	DWORD      ?
Di ENDS

TOOLINFO STRUCT
	ticbSize         	dd      ?
	tisubFlags    		dd      ?
	tihWnd      	    dd      ?
	tiuId            	dd      ?
	tirect           	RECT    <>
	tihInst          	dd      ?
	tilpszText       	dd      ?
	tilParam         	dd      ?
TOOLINFO ENDS

RECT STRUCT
	left    		    DWORD      ?
	top					    DWORD      ?
	right   			  DWORD      ?
	bottom  			  DWORD      ?
	rc_left   			LONGINT    0
	rc_top    			LONGINT    0
	rc_right  			LONGINT    0
	rc_bottom 			LONGINT    0
RECT ENDS

INTERNALAPPBARDATA STRUCT
	hwndia				      dd ?
	uCallbackMessageia  UINT ?
	uEdgeia				      UINT ?
	rcia				        RECT ?
INTERNALAPPBARDATA ENDS
	
AppBarData STRUCT
	ApcbSize			      dd ?
	Aphwnd				      dd ?
	ApuCallbackMessage	UINT ?
	ApuEdge				      UINT ?
	Aprc				        RECT ?
	AplParam			      dd ?
AppBarData ENDS

.data

abd				AppBarData <>
abd2			AppBarData <>
logb			LOGBRUSH <>
brushy		LOGBRUSH <>
Minfo			MENUITEMINFO <>
hPS				PAINTSTRUCT <>
CursPos			POINT <>
ClientPoint		POINT <>
DefaultRec		RECT <>
ClockRect	  	RECT <>
ButtonRect		RECT <>
DocRect			  RECT <>
WeatherRect		RECT <>
TempRect		  RECT <>
DlgRect			  RECT <>
DefaultRect		RECT <>
DeskRect		  RECT <>
Dlg2Rect		  RECT <>
ButtonSubRect	RECT <>
DlgRect2		  RECT <>
MenuRect		  RECT <>
DATEHOUR		  SYSTEMTIME <>
tipopup			  TOOLINFO <>
titime			  TOOLINFO <>
ti			 	    TOOLINFO <>
xform			    XFORM <>
wc				    WNDCLASSEX <>
wndc			    WNDCLASS <>


RsrcName		db "RANGE",0
Autohidestr		db "AutoHide", 0
RsrcType		db "RNG",0
KeyText			db "Software\LaunchBar\Files",0	
KeyValue		db "Count",0
Notecap			db "Post-it notes",0
timestamp		db "%02d:%02d",0
timestampzone	db "Paris: %02d:%02d - Singapore: %02d:%02d - London: %02d:%02d - New York: %02d:%02d",0
TooManyFiles	db "No more than 1 file allowed",0
AppTitle		db "LaunchBar", 0
RegFilter		db "%02d", 0
IniFilter		db "T%d",0
IniFilter2		db "T%dCap",0
IniSection		db "MenuItems",0
IniIconSec		db "IconPath",0
IniCount		db "Count",0
regsz 			db "REG_SZ",0
ButtonClass     db "BUTTON",0
StaticClass     db "STATIC",0
TooltipClass    db "Tooltips_class32",0
WindowClass	    db "RunClass",0
ConfigPanelId	db " ::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{21EC2020-3AEA-1069-A2DD-08002B30309D}",0
DocsId			db " ::{450D8FBA-AD25-11D0-98A8-0800361B1103}",0
CompId			db " ::{20D04FE0-3AEA-1069-A2D8-08002B30309D}",0
explorerstr		db "\explorer.exe",0
ShellOpen       db "open",0
rien			db "0",0
MenuEdit		db "MenuEdit", 0
userfile		db "user32.dll",0
apistr			db "SetLayeredWindowAttributes",0
NO_caract  		db "Please enter at least 1 char..",0
TrayString		db "Shell_TrayWnd",0
BoxTitle		db "Time Zones", 0
Desktopcap		db "Desktop",0
Compcap			db "My Computer",0
Docscap			db "My Documents",0
Confcap			db "Configuration Panel",0
Runcap			db "Shortcut Tool",0
ShortName		db "Shortcut",0
IconFilter		db "T%dIcon",0
ConfigSec		db "QuickLaunch",0
AutoHideKey		db "AutoHide",0
InstallHook2	db "SetHook",0
Closestr		db "Close", 0
MenuHand		db "#32768", 0
Shortcap		db "Shortcut Menu",0
IniCaptionSec	db "Tooltip",0
IniFileConfig	db "options.ini",0
hookdll			db "MouseHook.dll", 0
hookdll2		db "AppBarHook.dll",0
InstallHook		db "InstallHook",0
UnInstallHook	db "UninstallHook",0
Deletestr		db "Delete",0
defaultcn		db "0",0
defaultone		db "1",0

FileName		db 128 dup(0)
ValueSize		dd 512
timebuffer		db 25 dup(0)
timebuffer2		db 25 dup(0)
iconbuffer		db 512 dup(0)
extractname		db 128 dup(0)
WindowsPath		db 256 dup(?)
MenuHandles		db 128 dup(?)
Pathlen			dd 256
IniValue		db 128 dup(?)
szIniValue		dd 128
ValueName		db 512 dup(?)
cbbid			dd 450
PathName		db 512 dup(?)
ButtonID		db 128 dup(?)
temphandle		db 50 dup(?)
ButtonHandles	db 128 dup(?)
ButtonDC		db 128 dup(?)
IconHandles		db 128 dup(?)
ValueNamePP		db 10 dup(?)
PopupValues		db 128 dup(?)
IsButtonDown	db 100 dup(?)
defaultd		db 512 dup (0)
buffilename		db 128 dup (0)
configbuf		db 50 dup (0)

RegType			dd ?
iWeather		dd ?
hBmp			dd ?
Screen_W		dd ?
Screen_H		dd ?
hReg			dd ?
hMemDC			dd ?
lpdwDisposition dd ?
hDC				dd ?
hTimeLabel		dd ?
hButt			dd ?
hDesktopBut		dd ?
hWeather		dd ?
hWeat			dd ?
iWeat			dd ?
iComp			dd ?
hComp			dd ?
iDocs			dd ?
hDesktop		dd ?
hRun			dd ?
hDocs			dd ?
iRun			dd ?
MyHook			dd ?
hBar			dd 0
counttemp		dd 0
hMenuList		dd 0
menucount		dd 0
Desktopd		dd 0
hMenu			dd 0
FileCount		dd 0	
buttonleft		dd 8
RsrcHand		dd 0
RsrcSize		dd 0
hNote			dd 0
iNote			dd 0
hwndDC			dd 0
hPen			dd 0
OldPen			dd 0
RsrcPoint		dd 0
IconHandle		dd 0
countbut		dd 0
Popuphwnd		dd 0
valuenew		dd 0
hwnd21			dd 0
procInstallHook		dd 0
procUnInstallHook	dd 0
valuenew2		dd 0
ttc				dd 0
wpOrigMenuProc	dd 0
IconIndex		dd 0
hTip			dd 0
DefKeyValue		dd 0
GetKeyValue		dd 0
tohideornotto	db 0
county2			dd 0
hdcmem2			dd 0
hContext		dd 0
hLen			dd 0
cMenu			dd 0
cContext		dd 0
hTipMenu		dd 0
hTipTime		dd 0
slidetop		dd 0
slidewidth		dd 0
testd			dd 0
originaltop		dd 0
originalbot		dd 0
ismenu			dd 0
menuhandle		dd 0
menx			dd 0
meny			dd 0
wpOldMenuProc	dd 0
hDelete			dd 0
hKey			dd 0
hWeatID			dd 353
popupid			dd 250
StaticWeather	dd 354
hRunID			dd 350
hDocsID			dd 351
hCompID			dd 352
szconfig2		dd 50
hNoteID			dd 487

NULL            equ 0
TRUE            equ 1
FALSE           equ 0
ABE_LEFT 		equ 0
ABE_TOP 		equ 1
ABE_RIGHT 		equ 2
ABE_BOTTOM 		equ 3
IDI_NOTE		equ 109
DIALOG_MAIN     equ 1638
IDI_WEAT		equ 105
IDD_TIMEPOPUP	equ 101
IDI_DOCS		equ 103
IDI_WEATHER		equ 107
IDI_RUN			equ 108
IDI_COMP		equ 104
ID_CLOSE        equ 4811
IDI_DESKTOP		equ 102
IDM_ABOUT       equ 12
IDC_ABOUT       equ 4901
IDC_ODBUTTON    equ 4910
IDC_TIME		equ 1001
IDT_TIMER		equ 100001
HTCAPTION       equ 2
MF_UNCHECKED    equ 0h
MF_CHECKED      equ 8h
ButtonDeskID	equ 12h
IDB_BACKGROUND	equ 101
AUTOHIDETIME	equ 656
DesktopDC		dd 0
hDCmem			dd 0
popupcount		dd 0
memDC			dd 0
htid			dd 0
lengthstr		dd 0
hBrush			dd 0
county			dd 0
hTemp			dd 0
val1			dd 0
ishidden		dd 0
popuptemp		dd 0
autohidestatus	dd 0
DrawIcon2		dd 0
weatherd		dd 0
mentemp			dd 0
hwndtime		dd 0
hwndstore		dd 0
cwidth			dd 0
cheight			dd 0
hBackgroundBMP	dd 0
oldbmp			dd 0
hInstance 		dd 0    

.code
         
main:

    call    GetModuleHandle, NULL
    mov     [hInstance], eax
    
    call    DialogBoxParamA, hInstance, DIALOG_MAIN, 0, offset DialogWndProc, 0
    call    ExitProcess, NULL


DialogWndProc   proc    hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD, h0h0:DWORD

    cmp     wmsg, WM_INITDIALOG
    je      wminitdialog
    cmp     wmsg, WM_COMMAND
    je      wmcommand
    cmp     wmsg, WM_CLOSE
    je      wmclose
    cmp		  wmsg, WM_MOUSEHOOK
    je		  wmhook
    cmp		  wmsg, WM_TIMER
    je		  wmtimer
    cmp     wmsg, WM_DESTROY
    je      wmdestroy
    cmp		  wmsg, WM_DROPFILES
    je		  wmdrop
    cmp		  wmsg, WM_MEASUREITEM
    je		  wmmeasure
    cmp		  wmsg, WM_ERASEBKGND
    je		  statcol2
    cmp		  wmsg, WM_MOUSEMOVE
    je		  wmmousemove
    cmp		  wmsg, WM_MENUSELECT
    je		  menusel
    cmp     wmsg, WM_DRAWITEM
    je		  wmdrawit   
    cmp		  [wmsg], WM_CTLCOLORSTATIC
    je		  statcol3
    cmp    	wmsg, WM_LBUTTONDOWN
    je     	movewindow1
    cmp		  wmsg, WM_LBUTTONUP
    je		  lbutup
    cmp		  wmsg, WM_RBUTTONDOWN
    je		  showpopup
    mov     eax, FALSE       
    ret


statcol2:

		call	CreatePen, 0, 1, cmainwindowbordercolor
		mov		hPen, eax
		call	SelectObject, wparam, hPen
		push	cmainwindowbackcolor
		pop		brushy.lbColor
		mov		brushy.lbStyle, 0
		
		call	CreateBrushIndirect, offset brushy
		mov		hBrush, eax
		call	SelectObject, wparam, hBrush
		mov		OldPen, eax
		sub		DlgRect2.right,1
		sub		DlgRect2.bottom,1
		call	RoundRect, wparam, DlgRect2.left, DlgRect2.top, DlgRect2.right, DlgRect2.bottom, 5, 5 
		mov		eax, TRUE
		ret

wmhook:

		cmp		tohideornotto, 0
		je		end657

		.if     cFormat2==0
		mov		eax, abd.Aprc.bottom
		cmp     lparam, eax
		jb		passettimer 
		.elseif cFormat2==1
		mov		eax, abd.Aprc.right
		cmp		wparam, eax
		jb		passettimer
		.elseif cFormat2==2
		mov		eax, abd.Aprc.top
		cmp		lparam, eax
		ja		passettimer
		.elseif cFormat2==3
		mov		eax, abd.Aprc.left
		cmp		wparam, eax
		ja		passettimer
		.endif
	
		cmp		ishidden, TRUE
		je		passettimer
		call	SetTimer, hwnd, AUTOHIDETIME, delayhide, 0
		jmp		end657
	
passettimer:
		cmp		ishidden, TRUE
		jne		end656 
		.if		cFormat2==0
		cmp		lparam, 5
		ja      end656 
		.elseif	cFormat2==1
		cmp		wparam, 5
		ja		end656
		.elseif	cFormat2==2
		mov		eax, Screen_H
		sub		eax, 5
		cmp		lparam, eax
		jb		end656
		.elseif cFormat2==3
		mov		eax, Screen_W
		sub		eax, 5
		cmp		wparam, eax
		jb		end656
		.endif
		call	SetTimer, hwnd, AUTOHIDETIME, delayshow, 0
		jmp		end657
			
end656:
		call	KillTimer, hwnd, AUTOHIDETIME
end657:
		mov 	eax, TRUE
		ret
        
showpopup:

		call	CreatePopupMenu
		mov		hContext, eax
		
		.if 	tohideornotto==1
		call    AppendMenuA, hContext, MF_STRING or MF_CHECKED , 3350, offset Autohidestr
		.else
		call    AppendMenuA, hContext, MF_STRING or MF_UNCHECKED , 3350, offset Autohidestr
		.endif
		
		call    AppendMenuA, hContext, MF_STRING, 3351, offset Closestr
		call	  GetCursorPos, offset CursPos
		call    TrackPopupMenu,hContext,0,CursPos.x,CursPos.y,0,hwnd,0
wedontshow:
		mov		eax, TRUE
		ret
	
menusel:
		mov		eax, wparam
		and		eax, MF_POPUP
		cmp		eax, 0
		jne		showttip
		mov	 	eax, wparam
		shr		eax, 10h
		cmp		eax, 0FFFFh
		jne		showttip
		call	SendMessage,  hTipMenu,TTM_TRACKACTIVATE, 0, offset tipopup
		mov		eax, 0
		ret
		
showttip:
		mov		eax, wparam
		and		eax, 0FFFH
		cmp		eax, 3350
		je		retauto
		cmp		eax, 3351
		je		retauto
	
    mov		cMenu, 1
		sub		eax, 249
    call	_wsprintfA, offset ValueNamePP, offset IniFilter2, eax
    call	GetPrivateProfileStringA, offset IniSection, offset ValueNamePP, offset ShortName, offset IniValue, szIniValue, offset PathName
		lea		eax, IniValue
		mov		tipopup.tilpszText, eax
		call	SendMessage, hTipMenu,TTM_UPDATETIPTEXT, 0, offset tipopup
    call	GetCursorPos, offset CursPos
    mov		eax, CursPos.x
    add		eax, 33
    and		eax, 0FFFFh
    mov		ecx, CursPos.y
    and		eax, 0FFFFh
    shl		ecx, 10h
    or		ecx, eax
    call	SendMessage, hTipMenu, 412h, 0, ecx ;TTM_TRACKPOSITION
    call	SetWindowPos, hTipMenu, HWND_TOPMOST, 0,0,0,0, SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOMOVE
		call	SendMessage, hTipMenu,TTM_TRACKACTIVATE, 1, offset tipopup
	
		mov		eax, 0
		ret
retauto:
    mov		cContext, 1
    mov		eax, 0
    ret

wmmeasure:
		mov		esi, lparam
		mov		[esi].itemHeight, 36
		mov		[esi].itemWidth, 35
		mov		eax, TRUE
		ret
	
	     
        
wmdrawit:
        mov	esi, lparam
		push	[esi].di_rcItem.left
		pop		ButtonRect.left   
		push	[esi].di_rcItem.right
		pop		ButtonRect.right   
		push	[esi].di_rcItem.top
		pop		ButtonRect.top   
		push	[esi].di_rcItem.bottom
		pop		ButtonRect.bottom 
pasmen:
    mov		county2, 0
    xor		ecx, ecx
checkmenu2:
    mov     eax,[esi].di_itemID
    add		cx, 250
    cmp	 	ax, cx
    jne		nobut2
    sub		cx, 249
    call	_wsprintfA, offset ValueNamePP, offset IniFilter, ecx
    call	GetPrivateProfileStringA, offset IniSection, offset ValueNamePP, offset PathName, offset IniValue, szIniValue, offset PathName
		mov		ecx, county2
		inc 	ecx
    call	_wsprintfA, offset ValueNamePP, offset IconFilter, ecx
    call	lstrcpy, offset defaultd, offset IniValue
		call	GetPrivateProfileStringA, offset IniSection, offset ValueNamePP, offset defaultd, offset IniValue, szIniValue, offset PathName
		call	CreateSolidBrush, cmainmenubackcolor ;0222b2fh
		mov		hBrush, eax
		call	FillRect, [esi].di_hDC, offset ButtonRect, hBrush
    mov		IconIndex, 0
    call	ExtractAssociatedIconA, hInstance, offset IniValue, offset IconIndex
         
		mov		edx, eax
		mov		ecx, county2
		imul	ecx, 36
		add		ecx, 2
		mov		edx, [esi].di_itemState
    and   edx, 1
    cmp		edx, 0
    jne		selec
    call	DrawIcon, [esi].di_hDC, 6, ecx, eax
		jmp		enddrawmenu
selec:
		inc		ecx
		call	DrawIcon, [esi].di_hDC, 7, ecx, eax
    jmp	enddrawmenu
nobut2:
    inc		county2
    mov		ecx, county2
    cmp		ecx, popupcount
    jle		checkmenu2
    cmp		ismenu, 1
    jne		nomenualpha
     
nomenualpha:
    mov   esi, lparam
    mov   eax, [esi].di_itemState
		mov		brushy.lbStyle, 0
		push	cmainwindowbackcolor
		pop		brushy.lbColor
		call	CreateBrushIndirect, offset brushy
		mov		hBrush, eax
		call	FillRect, [esi].di_hDC, offset ButtonRect, hBrush
    mov		eax, StaticWeather
    cmp		wparam, eax
    jne		nloadweat
    mov   eax, [esi].di_itemState
    and   eax, 1
    cmp		eax, 0
    jne		sel5
    call	DrawIcon, [esi].di_hDC, 0, 0, iWeather
    jmp		enddraw 
sel5:
    call	DrawIcon, [esi].di_hDC, 2, 2, iWeather
    jmp		enddraw 
nloadweat:
    mov		eax, hDocsID
    cmp		wparam, eax
    jne		nloaddocs
    mov   eax, [esi].di_itemState
    and   eax, 1
    cmp		eax, 0
    jne		sel16
    call	DrawIcon, [esi].di_hDC, 0, 0, iDocs
    jmp		enddraw
sel16:
    call	DrawIcon, [esi].di_hDC, 2, 2, iDocs
    jmp		enddraw
    
nloaddocs:
    mov		eax, hNoteID
    cmp		wparam, eax
    jne		nloadnote
    mov   eax, [esi].di_itemState
    and   eax, 1
    cmp		eax, 0
    jne		sel1
    call	DrawIcon, [esi].di_hDC, 0, 0, iNote
    jmp		enddraw
sel1:
    call	DrawIcon, [esi].di_hDC, 2, 2, iNote
    jmp		enddraw
        
nloadnote:
    mov		eax, hCompID
    cmp		wparam, eax
    jne		nloadcomp
    mov   eax, [esi].di_itemState
    and   eax, 1
    cmp		eax, 0
    jne		sel2
    call	DrawIcon, [esi].di_hDC, 0, 0, iComp
    jmp		enddraw
sel2:
    call	DrawIcon, [esi].di_hDC, 2, 2, iComp
    jmp		enddraw
    
nloadcomp:
    mov		eax, hRunID
    cmp		wparam, eax
    jne		nloadrun
    push	[esi].di_hDC
    pop		DesktopDC
    mov   eax, [esi].di_itemState
    and   eax, 1
    cmp		eax, 0
    jne		sel3
    call	DrawIcon, [esi].di_hDC, 0, 0, iRun
    jmp		enddraw
sel3:
    call	DrawIcon, [esi].di_hDC, 2, 2, iRun
    jmp		enddraw
    
nloadrun:
    mov		eax, ButtonDeskID
    cmp		wparam, eax
    jne		nloaddesk
    mov   eax, [esi].di_itemState
    and   eax, 1
    cmp		eax, 0
    jne		seleceted
    call	DrawIcon, [esi].di_hDC, 0, 0, hTemp
    jmp		enddraw
seleceted:
    call	DrawIcon, [esi].di_hDC, 2, 2, hTemp	
    jmp	enddraw

nloaddesk:
    mov 	counttemp, 0
		xor		ecx, ecx
	
checkdrawbuttons:
		mov		eax, dword ptr [ButtonID+ecx*8]
		cmp		wparam, eax
		jne		nochec
    mov     eax, [esi].di_itemState
    and     eax, 1
    cmp		eax, 0
    jne		sel4
		call	DrawIcon,[esi].di_hDC, 0, 0, dword ptr [IconHandles+ecx*8]
		jmp	nochec
sel4:
		call	DrawIcon,[esi].di_hDC, 2, 2, dword ptr [IconHandles+ecx*8]
nochec:
		inc		counttemp
		mov		ecx, counttemp
		cmp		ecx, GetKeyValue
		jle		checkdrawbuttons
enddraw:
        
realenddraw:
    call	GetLastError
    call    DeleteDC, hDCmem
		mov 	eax, TRUE
		ret
	
enddrawmenu:
	
		call	WindowFromDC, [esi].di_hDC
		mov		menuhandle, eax
		call	GetWindowLongA, menuhandle, GWL_EXSTYLE
		or		eax, 00080000h
		call	SetWindowLongA, menuhandle, GWL_EXSTYLE, eax
		call	procalpha, menuhandle, 0, menualpha, LWA_ALPHA
		call	GetClientRect, menuhandle, offset MenuRect
		extrn	CreateRoundRectRgn:PROC
		add		MenuRect.left, 3
		add		MenuRect.top, 3
		add		MenuRect.bottom,4
		add		MenuRect.right, 2
		call	CreateRoundRectRgn, MenuRect.left, MenuRect.top, MenuRect.right, MenuRect.bottom, 5, 5
		call	SetWindowRgn,menuhandle,eax,TRUE
		call	CreatePen, 0, 1, 0
		mov		hPen, eax
		call	SelectObject, [esi].di_hDC, hPen
		mov		brushy.lbStyle, 1
		call	CreateBrushIndirect, offset brushy
		mov		hBrush, eax
		call	SelectObject, [esi].di_hDC, hBrush
		sub		MenuRect.left, 3
		sub		MenuRect.top, 3
		sub		MenuRect.right, 4
		sub		MenuRect.bottom, 4
		call	RoundRect, [esi].di_hDC, MenuRect.left, MenuRect.top, MenuRect.right, MenuRect.bottom, 5, 5 
		mov		eax, TRUE
		ret

wmcommand:
		cmp		lparam, 0
		je		MenuPop
    mov     eax,wparam
    movzx   eax, ax
    cmp     eax, ID_CLOSE
    je      wmclose2
    cmp		eax, ButtonDeskID
    je		minimize
    cmp		eax, StaticWeather
    jne		notweather
		call    ShellExecuteA,0,offset ShellOpen, offset WindowsPath,offset ConfigPanelId,0,SW_SHOWNORMAL
		jmp		fniish
    
notweather:
    cmp		eax, hCompID
    jne		notcomp
    call    ShellExecuteA,0,offset ShellOpen, offset WindowsPath,offset CompId,0,SW_SHOWNORMAL
    jmp		fniish

notcomp:
    cmp		eax, hRunID
    jne		notrun
    mov		ishidden, 1
    call	KillTimer, hwnd, AUTOHIDETIME
    call    DialogBoxParamA, hInstance, IDD_TIMEPOPUP, 0, offset RunProc, 0
    call	ShowWindow, eax, SW_SHOW
    jmp		fniish
        
notrun:
        cmp		eax, hNoteID
        jne		notnote
        mov		ishidden, 1
        call	KillTimer, hwnd, AUTOHIDETIME
        call    DialogBoxParamA, hInstance, 102, 0, offset NoteProc, 0
        call	ShowWindow, eax, SW_SHOW
        jmp		fniish
        
notnote:
    cmp		eax, hDocsID
    jne		notdocs        
		call    ShellExecuteA,0,offset ShellOpen, offset WindowsPath,offset DocsId,0,SW_SHOWNORMAL
    jmp		fniish
        
notdocs:
    mov		counttemp, 0
    xor		ecx, ecx
    
checkbuttons:
    mov		eax, wparam
		mov		edx, dword ptr [ButtonID+ecx*8]	
		inc		counttemp
    cmp		ax,  dx
    jne		noclick
		mov		ecx, counttemp
		dec		ecx
		call	_wsprintfA, offset ValueName, offset RegFilter, counttemp
		call	RegCreateKeyExA,HKEY_LOCAL_MACHINE, offset KeyText,0,offset regsz,0,KEY_ALL_ACCESS,0,offset hReg,offset lpdwDisposition
		mov		ValueSize, 512
		call	RegQueryValueExA,hReg,offset ValueName,0,offset RegType, offset PathName, offset ValueSize
		call	lstrlen, offset PathName
		sub		eax, 4
		cmp		dword ptr [PathName+eax], "lkq."
		jne		executestuff
		call    CreatePopupMenu
    mov     hMenu,eax
    mov		Minfo.McbSize, 216
    mov		Minfo.MfMask, 10h
    call	GetPrivateProfileStringA, offset IniSection, offset IniCount, offset rien, offset IniValue, szIniValue, offset PathName
    call	DecStrToInt, offset IniValue
    mov     popupcount, eax
    mov     popupid, 250
    mov		popuptemp, 1
       
addsubmenus:
    call	_wsprintfA, offset ValueNamePP, offset IniFilter2, popuptemp
    call	GetPrivateProfileStringA, offset IniSection, offset ValueNamePP, offset PathName, offset IniValue, szIniValue, offset PathName
    mov		eax, popupid
    mov		ecx, popuptemp
    dec		ecx
    mov		dword ptr [PopupValues+ecx*8], eax
    mov		mentemp, eax
    inc		popupid
    inc		popuptemp
    call    AppendMenuA, hMenu, MF_POPUP or  MFT_OWNERDRAW, dword ptr [PopupValues+ecx*8], 0
    mov		ecx, popuptemp
    cmp		ecx, popupcount
    jle		addsubmenus
    call    GetCursorPos,offset CursPos
    mov		ecx, counttemp
    dec		ecx
    mov		edx, dword ptr [ButtonHandles+ecx*8]	
    call	GetWindowRect, edx, offset DefaultRect
    .if		cFormat2==0
    add		DefaultRect.bottom, 1
    mov		ecx, DefaultRect.right
    sub		ecx, DefaultRect.left
    shr		ecx, 2
    sub     DefaultRect.left, ecx
    call    TrackPopupMenu,hMenu, 4000h ,DefaultRect.left,DefaultRect.bottom,0,hwnd,0
    .elseif cFormat2==1
    add		DefaultRect.right, 5
    sub     DefaultRect.top, 4
    call    TrackPopupMenu,hMenu, 4000h ,DefaultRect.right,DefaultRect.top,0,hwnd,0
    .elseif cFormat2==2
    add		DefaultRect.top, 1
    mov		ecx, DefaultRect.right
    sub		ecx, DefaultRect.left
    shr		ecx, 2
    sub     DefaultRect.left, ecx
    sub		DefaultRect.top, 4
    call    TrackPopupMenu,hMenu, 4000h ,DefaultRect.left,DefaultRect.top,0,hwnd,0
    .elseif	cFormat2==3
    sub		DefaultRect.left, 3
    sub     DefaultRect.top, 4
    call    TrackPopupMenu,hMenu, 4000h ,DefaultRect.left,DefaultRect.top,0,hwnd,0
    
    .endif
    jmp	noexec

	
executestuff:
		call    ShellExecuteA,0,offset ShellOpen, offset PathName,0,0,SW_SHOWNORMAL
noexec:
		call	RegCloseKey, hReg
noclick:
		mov		ecx, counttemp
		cmp		ecx, GetKeyValue
		jle		checkbuttons
fniish:
		mov		eax, TRUE
    ret
        

wmmousemove:
		cmp		lbutdown, 1
    jne		nopefinal
		mov		eax, Screen_H
		sub		eax, 60
		call	CheckMousePos, 0,  60, 60, eax
		cmp		eax, 1
		jne		nope1
		mov		cFormat, 1
		mov		cFormat2, 1
		call	CreateAppBar, hwnd
		call	MoveButtons, hwnd
		call	CreateRegn, hwnd
		jmp		nopefinal
		
nope1:
		mov		eax, Screen_W
		sub		eax, 60
		call	CheckMousePos, 60,  eax, 0, 60
		cmp		eax, 1
		jne		nope2
		mov		cFormat, 0
		mov		cFormat2, 0
		call	CreateAppBar, hwnd
		call	MoveButtons, hwnd
		call	CreateRegn, hwnd
		jmp		nopefinal
		
nope2:
		mov		eax, Screen_W
		sub		eax, 60
		mov		ecx, Screen_H
		sub		ecx, 60

		call	CheckMousePos, eax, Screen_W, 60, ecx
		cmp		eax, 1
		jne		nope3
		mov		cFormat, 1
		mov		cFormat2, 3
		call	CreateAppBar, hwnd
		call	MoveButtons, hwnd
		call	CreateRegn, hwnd
		jmp		nopefinal
		
nope3:
		mov		eax, Screen_H
		sub		eax, 60
		mov		ecx, Screen_W
		sub		ecx, 60
		call	CheckMousePos, 60, ecx, eax, Screen_H
		cmp		eax, 1
		jne		nopefimal
		mov		cFormat, 0
		mov		cFormat2, 2
		call	CreateAppBar, hwnd
		call	MoveButtons, hwnd
		call	CreateRegn, hwnd
		jmp		nopefinal
nopefimal:
		call	SetWindowPos, hwnd,0, MoveRect.left, MoveRect.top, 0, 0, SWP_NOSIZE
		
nopefinal:
		mov		lbutdown, 0
		mov		eax, TRUE
		ret
		
lbutup:
		mov		lbutdown, 0
		mov 	eax, TRUE
		ret
	
movewindow1:
		mov		lbutdown,1 
    mov		cMenu, 0
    mov		cContext, 0
		call	DestroyMenu, hMenu
		call	DestroyMenu, hContext
    mov     eax, lparam
    call    PostMessageA,hwnd,WM_NCLBUTTONDOWN,HTCAPTION,eax
    call	GetWindowRect, hwnd, offset MoveRect
    mov 	eax, TRUE
    ret
       
        
wmtimer:
		cmp		wparam, IDT_TIMER
		jne		nexttime
		call	UpdateTime, hTimeLabel, hwnd
		call	ShowRegions, hwnd
		lea		eax, timebuffer2
		mov		titime.tilpszText, eax
		call	SendMessage, hTipTime,TTM_UPDATETIPTEXT, 0, offset titime
nexttime:
		cmp		wparam, AUTOHIDETIME
		jne		notime
		call	SlideWin, hwnd, ishidden
		call	KillTimer, hwnd, AUTOHIDETIME
notime:
		mov		eax, TRUE
		ret
	

wminitdialog:
		push	hwnd
		pop		hwnd21
		call	GetModuleFileNameA, hInstance, offset FileAppName, lFileApp
		call	lstrlen, offset FileAppName
		
extractpath:
		movzx	ecx, byte ptr [FileAppName+eax-1]
		cmp		cl, '\'
		je		endd
		mov		byte ptr [FileAppName+eax-1], 0
		dec		eax
		cmp		eax, 0
		ja		extractpath
		
endd:
		call	lstrcpy, offset buffilename, offset FileAppName
		call	lstrcat, offset buffilename, offset IniFileConfig	
		call	GetPrivateProfileStringA, offset ConfigSec, offset AutoHideKey, offset defaultcn, offset configbuf, szconfig2, offset buffilename
		cmp		byte ptr [configbuf], "1"
		jne		notaudo
		mov		tohideornotto, 1
		jmp		finaudo
notaudo:
		mov		tohideornotto, 0
finaudo:
		mov		ishidden, 0
		call	InitCommonControls
		call	LoadSettings
		mov	hwndtime, 0
		call	CreateWindowExA,0,offset ButtonClass,0, WS_CHILD or WS_VISIBLE or BS_OWNERDRAW, buttonleft, buttontop,32,32,hwnd,ButtonDeskID,hInstance,0
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		mov		hDesktopBut, eax
		call	LoadIconA, hInstance, IDI_DESKTOP
		mov		hTemp, eax

		call 	CreateAppBar, hwnd
		call	GetWindowsDirectoryA, offset WindowsPath, Pathlen
		call	lstrcat, offset WindowsPath, offset explorerstr

		call	CreateWindowExA,0,offset ButtonClass,0, WS_CHILD or WS_VISIBLE or BS_OWNERDRAW, buttonleft, buttontop, 34, 34, hwnd, hNoteID,hInstance,0
		mov		hNote, eax
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	LoadIconA, hInstance, IDI_NOTE
		mov		iNote, eax
		
		call	CreateWindowExA,0,offset ButtonClass,0, WS_CHILD or WS_VISIBLE or BS_OWNERDRAW, buttonleft, buttontop, 34, 34, hwnd, hCompID,hInstance,0
		mov		hComp, eax
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	LoadIconA, hInstance, IDI_COMP
		mov		iComp, eax
		
		call	CreateWindowExA,0,offset ButtonClass,0, WS_CHILD or WS_VISIBLE or BS_OWNERDRAW, buttonleft, buttontop, 34, 34, hwnd, hDocsID,hInstance,0
		mov		hDocs, eax
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	LoadIconA, hInstance, IDI_DOCS
		mov		iDocs, eax

		call	CreateWindowExA,0,offset ButtonClass,0, WS_CHILD or WS_VISIBLE or BS_OWNERDRAW, buttonleft, buttontop, 34, 34, hwnd, StaticWeather,hInstance,0
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		mov		hWeather, eax
		call	LoadIconA, hInstance, IDI_WEATHER
		mov		iWeather, eax

		call	CreateWindowExA,0,offset ButtonClass,0, WS_CHILD or WS_VISIBLE or BS_OWNERDRAW, buttonleft, buttontop, 34, 34, hwnd, hRunID,hInstance,0
		mov		hRun, eax
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	LoadIconA, hInstance, IDI_RUN
		mov		iRun, eax	
	
		Call	ShowRegions, hwnd
		call    CreateWindowExA,WS_EX_TOPMOST,offset TooltipClass,0,TTS_ALWAYSTIP,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hInstance,0
		mov		hTipTime, eax
		mov		titime.ticbSize, 44
		mov		titime.tisubFlags, TTF_SUBCLASS
		
		push	hwnd
		pop		titime.tihWnd
		lea		eax, timebuffer
		mov		titime.tilpszText, eax
		call	GetDlgItem, hwnd, IDC_TIME
		call	GetWindowRect, eax, offset titime.tirect
		call	SendMessage, hTipTime, TTM_SETTIPBKCOLOR, 0222b2fh,0
		call	SendMessage, hTipTime, TTM_SETTIPTEXTCOLOR, 00808042h,0
		call	SendMessage, hTipTime, TTM_ADDTOOL, 0, offset titime
		call    CreateWindowExA,WS_EX_TOPMOST,offset TooltipClass,0,TTS_ALWAYSTIP,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hInstance,0
		mov		hTip, eax
		call	GetDlgItem, hwnd, IDC_TIME
		mov		hTimeLabel, eax
		
		call    CreateWindowExA,WS_EX_TOPMOST,offset TooltipClass,0, TTS_ALWAYSTIP,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,0,0,hInstance,0
		mov		hTipMenu, eax
		mov		tipopup.ticbSize, 44
		mov		tipopup.tisubFlags, TTF_IDISHWND or 20h or 100h or 80h
    push	hwnd
    pop		tipopup.tihWnd
    push	hwnd
    pop		tipopup.tiuId
    lea		eax, timebuffer
    mov		tipopup.tilpszText, eax
    call	SendMessage, hTipMenu, TTM_SETTIPBKCOLOR, 0222b2fh,0
    call	SendMessage, hTipMenu, TTM_SETTIPTEXTCOLOR, 00808042h,0
		call	SendMessage, hTipMenu, TTM_ADDTOOL, 0, offset tipopup
		mov		ti.ticbSize, 44
		lea		eax, Desktopcap
		mov		ti.tilpszText, eax
		push	hDesktopBut
		pop		ti.tiuId
		mov		ti.tisubFlags, TTF_SUBCLASS or TTF_IDISHWND or 100h
		push 	hwnd
    pop 	ti.tihWnd
    call	SendMessage, hTip, TTM_SETTIPBKCOLOR, 0222b2fh,0
    call	SendMessage, hTip, TTM_SETTIPTEXTCOLOR, 00808042h,0
		call	SendMessage, hTip, TTM_ADDTOOL, 0, offset ti
		lea		eax, Compcap
		mov		ti.tilpszText, eax
		push	hComp
		pop		ti.tiuId
		call	SendMessage, hTip, TTM_ADDTOOL, 0, offset ti
		lea		eax, Docscap
		mov		ti.tilpszText, eax
		push	hDocs
		pop		ti.tiuId
		call	SendMessage, hTip, TTM_ADDTOOL, 0, offset ti
		lea		eax, Runcap
		mov		ti.tilpszText, eax
		push	hRun
		pop		ti.tiuId
		call	SendMessage, hTip, TTM_ADDTOOL, 0, offset ti
		lea		eax, Confcap
		mov		ti.tilpszText, eax
		push	hWeather
		pop		ti.tiuId
		call	SendMessage, hTip, TTM_ADDTOOL, 0, offset ti
		lea		eax, Notecap
		mov		ti.tilpszText, eax
		push	hNote
		pop		ti.tiuId
		call	SendMessage, hTip, TTM_ADDTOOL, 0, offset ti
		call	CreateButtons, hwnd
		call	SetWindowLongA, hwnd, GWL_EXSTYLE, 00080000h or WS_EX_TOOLWINDOW or WS_EX_ACCEPTFILES
		call	LoadLibraryA, offset userfile
		call	GetProcAddress, eax, offset apistr	
		mov		procalpha, eax
		call	eax, hwnd, 0, globalalpha, LWA_ALPHA
		call	LoadLibraryA, offset hookdll
		call	GetProcAddress, eax, offset InstallHook
		mov		procInstallHook, eax
	
		call	LoadLibraryA, offset hookdll
		call	GetProcAddress, eax, offset UnInstallHook
		mov		procUnInstallHook, eax
		cmp 	tohideornotto, 0
		je		nexus
		call	procInstallHook, hwnd
nexus:
		call	GetClientRect, hwnd, offset Dlg2Rect
		call	CreateRegn, hwnd
		call	GetLastError
    mov     eax, TRUE
    ret

statcol3:
		Call	SetBkColor, wparam, cmainwindowbackcolor
		mov		eax, cmainwindowtextcolor ;00808042h
		Call	SetTextColor, wparam, eax
		call	GetStockObject, 5
		ret


wmdrop:
		call	DragQueryFile, wparam, -1, 0, 0, 0
		cmp		eax, 1
		ja		next
		call	DragQueryFile, wparam, 0, offset FileName, 128
		
		mov 	counttemp, 0
		xor		ecx, ecx

checkbuttons2:
		mov		eax, dword ptr [ButtonHandles+ecx*8]	
		call	GetWindowRect, eax, offset DefaultRec
		call	CheckMousePos, DefaultRec.left,  DefaultRec.right, DefaultRec.top, DefaultRec.bottom
		inc		counttemp
		cmp		eax, 1
		jne		noclickxxx
		mov		ecx, counttemp
		dec		ecx
		
		call	_wsprintfA, offset ValueName, offset RegFilter, counttemp
		call	RegCreateKeyExA,HKEY_LOCAL_MACHINE, offset KeyText,0,offset regsz,0,KEY_ALL_ACCESS,0,offset hReg,offset lpdwDisposition
		mov		ValueSize, 512
		call	RegQueryValueExA,hReg,offset ValueName,0,offset RegType, offset PathName, offset ValueSize
		call	lstrlen, offset PathName
		sub		eax, 4
		cmp		dword ptr [PathName+eax], "lkq."
		jne		noexec3
    call	GetPrivateProfileStringA, offset IniSection, offset IniCount, offset rien, offset IniValue, szIniValue, offset PathName
    call	StrToInt, offset IniValue
    inc		eax
    mov		ttc, eax
		call	_wsprintfA, offset ValueName, offset RegFilter, ttc
		call	WritePrivateProfileStringA, offset IniSection, offset IniCount, offset ValueName, offset PathName
		call	_wsprintfA, offset ValueName, offset IniFilter, ttc
		call	WritePrivateProfileStringA, offset IniSection, offset ValueName, offset FileName, offset PathName
		call	RegCloseKey, hReg
		jmp		next
        
noexec3:
		call	RegCloseKey, hReg
noclickxxx:
		mov		ecx, counttemp
		cmp		ecx, GetKeyValue
		jle		checkbuttons2
		mov		eax, TRUE
		call	RegCreateKeyExA,HKEY_LOCAL_MACHINE, offset KeyText,0,offset regsz,0,KEY_ALL_ACCESS,0,offset hReg,offset lpdwDisposition
		mov		eax, lpdwDisposition
		cmp		eax, REG_CREATED_NEW_KEY
		jne		donocreate
		call	RegSetValueExA, hReg, offset KeyValue,0,REG_DWORD,offset DefKeyValue,4
		
donocreate:
		call	RegQueryValueExA,hReg,offset KeyValue,0,offset RegType, offset GetKeyValue, offset ValueSize
		mov		eax, GetKeyValue
		inc 	eax
		mov		GetKeyValue, eax
		call	RegSetValueExA, hReg, offset KeyValue, 0, REG_DWORD, offset GetKeyValue,4
		call	_wsprintfA, offset ValueName, offset RegFilter, GetKeyValue
		call    lstrlen, offset FileName
		call	RegSetValueExA, hReg, offset ValueName, 0, REG_SZ, offset FileName, eax
		call	RegCloseKey, hReg	
		
		mov		ecx, countbut
		mov		eax, cbbid
		mov		dword ptr [ButtonID+ecx*8], eax
		call	CreateWindowExA,0,offset ButtonClass,0, BS_OWNERDRAW OR WS_CHILD or WS_VISIBLE, buttonleft, buttontop, 34, 34, hwnd, dword ptr [ButtonID+ecx*8],hInstance,0
		inc		cbbid

		mov		ecx, countbut
		mov		dword ptr [ButtonHandles+ecx*8], eax
		mov		hButt, eax
		call	SetWindowLongA, dword ptr [ButtonHandles+ecx*8], GWL_WNDPROC, offset FileButtonSubClassProc
		mov		wpOldMenuProc, eax
		inc		countbut  
		
		call	lstrlen, offset FileName
		sub		eax, 4
		cmp		dword ptr [FileName+eax], "lkq."
		jne		notamenu2
		
		call	GetPrivateProfileStringA, offset IniSection, offset IniIconSec, offset WindowsPath, offset IniValue, szIniValue, offset FileName
		call	ExtractAssociatedIconA, hInstance, offset IniValue, offset IconIndex
		mov		IconHandle, eax
		call    CopyImage,eax,IMAGE_ICON,32,32,LR_COPYFROMRESOURCE
		mov		hBmp, eax
		mov		ecx, countbut
		dec		ecx
		mov		dword ptr [IconHandles+ecx*8], eax
		jmp		seticn2
		
notamenu2:
		call	ExtractAssociatedIconA, hInstance, offset FileName, offset IconIndex 
		mov		IconHandle, eax
		call    CopyImage,eax,IMAGE_ICON,32,32,LR_COPYFROMRESOURCE
		mov		hBmp, eax
		mov		ecx, countbut
		dec		ecx
		mov		dword ptr [IconHandles+ecx*8], eax
		
seticn2:
		add		buttonleft, 35
		mov		ecx, countbut
		dec		ecx
		call	RedrawWindow, hwnd, 0, 0, RDW_UPDATENOW

		jmp	next2
next:
		call	MessageBoxExA, hwnd, offset TooManyFiles, offset AppTitle, MB_OK, 0
next2:
		mov		eax, 0
		ret
	
MenuPop:
		mov    	eax,wparam
    shr    	eax,16
    cmp    	eax,0
    jne    	Endit
    cmp		wparam, 3350
    jne		nothidein
    .if 	tohideornotto==1
    call	WritePrivateProfileStringA, offset ConfigSec, offset AutoHideKey, offset defaultcn, offset buffilename
    mov		tohideornotto, 0
    .else
    call	WritePrivateProfileStringA, offset ConfigSec, offset AutoHideKey, offset defaultone, offset buffilename
    mov		tohideornotto, 1
		call	procInstallHook, hwnd
    .endif
         
    jmp    Endit         
     
nothidein:
    cmp		wparam, 3351
    je		wmclose
    mov		county, 0
    xor		ecx, ecx
checkmenu:
    mov    eax,wparam
    add		cx, 250
    cmp		ax, cx
    jne		nobut
    sub		cx, 249
    call	_wsprintfA, offset ValueNamePP, offset IniFilter, ecx
    call	GetPrivateProfileStringA, offset IniSection, offset ValueNamePP, offset PathName, offset IniValue, szIniValue, offset PathName
    call    ShellExecuteA,0,offset ShellOpen, offset IniValue,0,0,SW_SHOWNORMAL
     
nobut:
    inc		county
    mov		ecx, county
    cmp		ecx, popupcount
    jle		checkmenu
		call	procInstallHook, hwnd
         

Endit:
    mov	cMenu, 0
    mov	cContext, 0
    mov	eax, TRUE
    ret
         
        
minimize:
		call	FindWindow, offset TrayString, 0
		call	PostMessageA, eax, WM_COMMAND, 415, 0
		mov		eax, TRUE
		ret

wmdestroy:
		call	procUnInstallHook
    call	SHAppBarMessage,ABM_REMOVE, offset abd
    mov		eax, TRUE
    ret
	
    
wmclose2:
	
		call	MessageBoxA, hwnd, offset timebuffer, offset timebuffer, MB_SETFOREGROUND
		mov		eax, TRUE
		ret
		
wmclose:
    call    EndDialog, hwnd, NULL
    mov     eax, TRUE
    ret

DialogWndProc   endp

LoadSettings	proc
		call	GetPrivateProfileStringA, offset ConfigSec, offset mainwindowbackcolor, offset defaultbrush, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cmainwindowbackcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset mainmenubackcolor, offset defaultbrush, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cmainmenubackcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset mainwindowbordercolor, offset defaultcn, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cmainwindowbordercolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset runwindowbackcolor, offset defaultbrush, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		crunwindowbackcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset mainwindowtextcolor, offset defaultcolor, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cmainwindowtextcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset runbuttontextcolor, offset defaultcolor, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		crunbuttontextcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset runbuttonbackcolor, offset defaultbrush, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		crunbuttonbackcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset runbuttonbordercolor, offset defaultcolor, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		crunbuttonbordercolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset notewindowbackcolor, offset defaultbrush, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cnotewindowbackcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset notewindowbordercolor, offset defaultcn, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cnotewindowbordercolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset notewindowtextcolor, offset defaultcolor, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cnotewindowtextcolor, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset sdelayhide, offset delaydef, offset configbuf, szconfig2, offset buffilename
		call	DecStrToInt, offset configbuf
		mov		delayhide, eax
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset sdelayshow, offset delaydef, offset configbuf, szconfig2, offset buffilename
		call	DecStrToInt, offset configbuf
		mov		delayshow, eax	
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset sglobalalpha, offset alphadef, offset configbuf, szconfig2, offset buffilename
		call	DecStrToInt, offset configbuf
		mov		globalalpha, eax	
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset smenualpha, offset alphadef, offset configbuf, szconfig2, offset buffilename
		call	DecStrToInt, offset configbuf
		mov		menualpha, eax	
		
		call	GetPrivateProfileStringA, offset ConfigSec, offset Formatkey, offset defaultone, offset configbuf, szconfig2, offset buffilename
		call	StrToInt, offset configbuf
		mov		cFormat, eax	
		mov		cFormat2, eax
		and		cFormat, 1
		
		mov		eax,0
		ret
LoadSettings	endp

	
CreateRegn proc, hwnd:DWORD
		call	GetClientRect, hwnd, offset DlgRect2
		add		DlgRect2.left, 4
		sub		DlgRect2.right, 4
		sub 	DlgRect2.bottom, 4
		add		DlgRect2.top, 1
		call	CreateRoundRectRgn, DlgRect2.left, DlgRect2.top, DlgRect2.right, DlgRect2.bottom, 5, 5
		call	SetWindowRgn,hwnd,eax,TRUE
		mov		eax, DlgRect2.right
		sub		eax, DlgRect2.left
		mov		ecx, DlgRect2.bottom
		sub		ecx, DlgRect2.top 
		call	SetWindowPos,hwnd,0,0,eax,ecx,SWP_NOMOVE
		mov		eax, 1
		ret
CreateRegn endp

CreateButtons proc, hwnd:DWORD
	
		call	RegCreateKeyExA,HKEY_LOCAL_MACHINE, offset KeyText,0,offset regsz,0,KEY_ALL_ACCESS,0,offset hReg,offset lpdwDisposition
		mov		eax, lpdwDisposition
		cmp		eax, REG_CREATED_NEW_KEY
		je		nobuttons
			
		call	RegQueryValueExA,hReg,offset KeyValue,0,offset RegType, offset GetKeyValue, offset ValueSize
		call	_wsprintfA, offset ValueName, offset RegFilter, GetKeyValue
		cmp		GetKeyValue, 0
		je		nobuttons
		mov		countbut, 0
		mov		cbbid, 450
CreateButt:
		mov		ecx, countbut
		mov		eax, cbbid
		mov		dword ptr [ButtonID+ecx*8], eax
		call	CreateWindowExA,0,offset ButtonClass,0, BS_OWNERDRAW OR WS_CHILD or WS_VISIBLE, buttonleft, buttontop, 34, 34, hwnd, dword ptr [ButtonID+ecx*8],hInstance,0
		
		inc		cbbid
		mov		ecx, countbut
		mov		dword ptr [ButtonHandles+ecx*8], eax
		mov		hButt, eax
			
		call	SetWindowLongA, dword ptr [ButtonHandles+ecx*8], GWL_WNDPROC, offset FileButtonSubClassProc
		mov		wpOldMenuProc, eax
		
		mov		ecx, countbut
		
		inc		countbut
		mov		RegType, REG_SZ
		call	_wsprintfA, offset ValueName, offset RegFilter, countbut  
		mov		ValueSize, 512
		call	RegQueryValueExA,hReg,offset ValueName,0,offset RegType, offset PathName, offset ValueSize  
		call	lstrlen, offset PathName
		sub		eax, 4
		cmp		dword ptr [PathName+eax], "lkq."
		jne		notamenu
		
		call	GetPrivateProfileStringA, offset IniSection, offset IniIconSec, offset WindowsPath, offset IniValue, szIniValue, offset PathName
		call	ExtractAssociatedIconA, hInstance, offset IniValue, offset IconIndex
		mov		IconHandle, eax
		call    CopyImage,eax,IMAGE_ICON,32,32,LR_COPYFROMRESOURCE
		mov		hBmp, eax
		mov		ecx, countbut
		dec		ecx
		mov		dword ptr [IconHandles+ecx*8], eax
		mov		eax, dword ptr [ButtonHandles+ecx*8]
		push	eax
		pop		ti.tiuId
		call	GetPrivateProfileStringA, offset IniSection, offset IniCaptionSec, offset Shortcap, offset IniValue, szIniValue, offset PathName
		lea		eax, IniValue	
		mov		ti.tilpszText, eax
		jmp		seticn
		
			
notamenu:
		call	ExtractAssociatedIconA, hInstance, offset PathName, offset IconIndex 
		mov		IconHandle, eax
		call    CopyImage,eax,IMAGE_ICON,32,32,LR_COPYFROMRESOURCE
		mov		hBmp, eax
		mov		ecx, countbut
		dec		ecx
		mov		dword ptr [IconHandles+ecx*8], eax
		mov		eax, dword ptr [ButtonHandles+ecx*8]
		push	eax
		pop		ti.tiuId
		call	ExtractFileName, offset PathName
		mov		ti.tilpszText, eax
seticn:
		call	SendMessage, hTip, TTM_ADDTOOL, 0, offset ti
		.if	cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		mov		ecx, countbut
		cmp		ecx, GetKeyValue
		jl		CreateButt 
		
		mov		eax, GetKeyValue

nobuttons:
		mov		eax, TRUE
		ret

CreateButtons endp

DecStrToInt proc String:DWORD
		push 	esi
		push 	ebx
		push 	String
		pop  	esi
		xor  	eax, eax
		xor  	ebx, ebx
chartoint:
		cmp 	byte ptr [esi], 0
		je  	finchar
		mov 	bl, byte ptr [esi]
		sub 	bl, 30h
		imul 	eax, eax, 10
		add 	eax, ebx
		inc 	esi
		jmp 	chartoint
		finchar:
		pop 	esi
		pop 	ebx
ret
DecStrToInt endp

StrToInt proc String:DWORD
		push	ebx
		push	esi
		push	String
		pop		esi
		xor		eax, eax
		xor		ebx, ebx
		dec		esi
CharToInt_1:
		inc		esi
		cmp		BYTE PTR [esi],0
		je		CharToInt_Fin
		shl		eax, 04h
		mov		bl, BYTE PTR [esi]
		cmp		bl, 40h
		jg		CharToInt_2
		sub		bl, 30h
		jmp		CharToInt_3
CharToInt_2:
		sub		bl, 37h
CharToInt_3:
		add		eax, ebx
		jmp		CharToInt_1
CharToInt_Fin:
		pop		esi
		pop		ebx
		ret
StrToInt endp

CreateAppBar proc, hwnd:DWORD


		call	GetSystemMetrics, SM_CXSCREEN
		mov 	Screen_W, eax
		call	GetSystemMetrics, SM_CYSCREEN
		mov		Screen_H, eax

		.if		cFormat==0
		call	SetWindowPos,hwnd,NULL,0,0,Screen_W,50,SWP_NOZORDER
		.else
		call	SetWindowPos,hwnd,NULL,0,0,50, Screen_H,SWP_NOZORDER
		.endif

		mov		abd.ApcbSize, 20
		mov		eax, hwnd
		mov		abd.Aphwnd, eax
		mov		abd.ApuCallbackMessage, WM_USER+100
		mov		abd2.ApcbSize, 20
		mov		eax, hwnd
		mov		abd2.Aphwnd, eax
		mov		abd2.ApuCallbackMessage, WM_USER+100

		call	SHAppBarMessage, ABM_NEW, offset abd

		.if		cFormat2==0
		mov		abd.ApuEdge, ABE_TOP
		.elseif cFormat2==1
		mov		abd.ApuEdge, ABE_LEFT
		.elseif	cFormat2==2
		mov		abd.ApuEdge, ABE_BOTTOM
		.elseif cFormat2==3
		mov		abd.ApuEdge, ABE_RIGHT
		.endif

		call	SetRect, offset abd.Aprc, 0, 0, Screen_W, Screen_H
		call	SHAppBarMessage, ABM_QUERYPOS, offset abd

		.if		cFormat2==0
		mov		eax, abd.Aprc.top
		add		eax, 2
		mov		originaltop, eax
		mov		abd.Aprc.top, eax
		add		eax, 50
		mov		abd.Aprc.bottom, eax
		mov		originalbot, eax
		.elseif cFormat2==1
		mov		eax, abd.Aprc.left
		add		eax, 1
		mov		abd.Aprc.left, eax
		add		eax, 54
		mov		abd.Aprc.right, eax
		.elseif	cFormat2==2
		mov		eax, abd.Aprc.bottom
		mov		abd.Aprc.bottom, eax
		sub		eax, 53
		mov		abd.Aprc.top, eax
		.elseif	cFormat2==3
		mov		eax, abd.Aprc.right
		sub		eax, 1
		mov		abd.Aprc.right, eax
		sub		eax, 54
		mov		abd.Aprc.left, eax
		.endif

		call	SHAppBarMessage, ABM_SETPOS, offset abd
		.if		cFormat==0
		add		abd.Aprc.left, 2
		.elseif cFormat==1
		add		abd.Aprc.top, 2
		.endif

		mov		eax, abd.Aprc.right
		mov		ecx, abd.Aprc.left
		sub		eax, ecx

		mov		ecx, abd.Aprc.bottom
		.if		cFormat2==0
		sub		ecx, 3
		inc		abd.Aprc.top
		.elseif cFormat2==1
		sub		eax, 2
		.elseif cFormat2==2
		add		abd.Aprc.top, 6
		.elseif cFormat2==3
		sub		eax, 2
		add 	abd.Aprc.left, 4
		.endif
		mov		edx, abd.Aprc.top
		sub		ecx, edx

		call	SetWindowPos,hwnd,NULL,abd.Aprc.left,abd.Aprc.top,eax,ecx,SWP_NOZORDER
		call	GetDlgItem, hwnd, IDC_TIME
		mov		hTimeLabel, eax
		.if		cFormat==0
		mov		ecx, abd.Aprc.right
		sub		ecx, 40
		call	SetWindowPos, hTimeLabel, NULL, ecx, 5, 0, 0, SWP_NOSIZE or SWP_NOZORDER
		.else
		mov		ecx, abd.Aprc.bottom
		sub		ecx, 30
		call	SetWindowPos, hTimeLabel, NULL, 12, ecx, 0, 0, SWP_NOSIZE or SWP_NOZORDER
		.endif

		call	SetTimer, hwnd, IDT_TIMER, 1000, 0
		call	UpdateTime, hTimeLabel, hwnd
		call	GetWindowRect, hTimeLabel, offset ClockRect
		mov		eax, TRUE
		ret

CreateAppBar endp 

UpdateTime proc, hTime: DWORD, hwnd:DWORD
		call	GetLocalTime, offset DATEHOUR
		xor		eax, eax
		mov		ax, DATEHOUR.wMinute
		push	eax
		mov		ax, DATEHOUR.wHour
		push	eax
		call	_wsprintfA, offset timebuffer, offset timestamp 
		call	SetWindowTextA, hTime, offset timebuffer
		mov		eax, TRUE
		ret
UpdateTime endp

CheckMousePos proc, Cleft:DWORD, Cright:DWORD, Ctop:DWORD, Cbottom:DWORD
		call	GetCursorPos, offset CursPos
		mov		eax, CursPos.x
		cmp		eax, Cleft
		jl		notdisplay2
		cmp		eax, Cright
		jg		notdisplay2
		mov		eax, CursPos.y
		cmp		eax, Ctop
		jl		notdisplay2
		cmp		eax, Cbottom
		jg		notdisplay2
		mov		eax, 1
		ret
notdisplay2:
		mov		eax, 0
		ret
	
CheckMousePos endp

ExtractFileName proc    lpstr:DWORD
    call    lstrlen,lpstr
    mov     ecx,eax
BackHere:       
    dec     ecx
    push    ecx
    mov     eax,ecx
    add     eax,lpstr
    mov     al,byte ptr [eax]
    cmp     al,"\"
    pop     ecx
    jz      CutStrng
    cmp     ecx,0
    jnz     BackHere
    jmp     GoFish
CutStrng:
    mov     eax,ecx
    add     eax,lpstr
    inc     eax
    ret
GoFish:
    mov     eax,lpstr
		inc		eax
    ret
ExtractFileName endp

ShowRegions proc, hwnd:DWORD

		call	GetLocalTime, offset DATEHOUR
		xor		eax, eax
		mov		ax, DATEHOUR.wMinute
		push	eax
		mov		ax, DATEHOUR.wHour
		sub		ax, 13
		xor		edx, edx
		mov		ecx, 24
		div		ecx
		push	edx
		mov		ax, DATEHOUR.wMinute
		push	eax
		mov		ax, DATEHOUR.wHour
		sub		ax, 8
		xor		edx, edx
		mov		ecx, 24
		div		ecx
		push	edx
		mov		ax, DATEHOUR.wMinute
		push	eax
		mov		ax, DATEHOUR.wHour
		sub		ax, 1
		xor		edx, edx
		mov		ecx, 24
		div		ecx
		push	edx
		mov		ax, DATEHOUR.wMinute
		push	eax
		mov		ax, DATEHOUR.wHour
		sub		ax, 7
		xor		edx, edx
		mov		ecx, 24
		div		ecx
		push	edx
		call	_wsprintfA, offset timebuffer2, offset timestampzone
		mov		eax, TRUE
		ret

ShowRegions endp

SlideWin proc hwnd:DWORD, plus:DWORD

		cmp		tohideornotto, 0
		je		donthide
		cmp		cMenu, 0
		jne		donthide
		cmp		cContext, 0
		jne		donthide
		xor 	ecx, ecx
		mov 	eax, Dlg2Rect.bottom
		sub 	eax, Dlg2Rect.top
		mov		ecx, Dlg2Rect.right
		sub		ecx, Dlg2Rect.left
		mov		slidewidth, ecx

		.if     ishidden==0
		call	AlphaOut, hwnd, globalalpha
		call	ShowWindow, hwnd, SW_HIDE
		mov		abd.Aprc.top, 0
		mov		abd.Aprc.bottom, 0
		mov		abd.Aprc.left, 0
		mov		abd.Aprc.right, 0

		mov		abd2.Aprc.top, 0
		mov		abd2.Aprc.bottom, 0
		mov		abd2.Aprc.left, 0
		mov		abd2.Aprc.right, 0
		mov		abd2.ApuEdge, ABE_LEFT

		call	SHAppBarMessage, ABM_SETPOS, offset abd2
		.else

		push	DlgRect2.top
		pop		abd.Aprc.top
		push	DlgRect2.left
		pop		abd.Aprc.left
		push	DlgRect2.right
		pop		abd.Aprc.right
		push	DlgRect2.bottom
		pop		abd.Aprc.bottom
		
		call	CreateAppBar, hwnd
		call	ShowWindow, hwnd, SW_SHOW
		call	CreateRegn, hwnd
		
		call	AlphaIn, hwnd, globalalpha
		.endif
		xor		ishidden, 1
donthide:
		mov     eax, 0
		ret
		
SlideWin endp

AlphaIn proc, hwnd:DWORD, reference:DWORD

		push    ebx
		xor		ebx, ebx
redoincalpha:
		call	procalpha, hwnd, 0, ebx, LWA_ALPHA
		call	Sleep, 10
		add		ebx, 10
		cmp		ebx, reference
		jl		redoincalpha
		call	procalpha, hwnd, 0, reference, LWA_ALPHA
		pop		ebx
		ret
AlphaIn	endp

AlphaOut proc, hwnd:DWORD, reference:DWORD
		push    ebx
		mov		ebx, reference
		redodecalpha:
		call	procalpha, hwnd, 0, ebx, LWA_ALPHA
		call	Sleep, 10
		sub		ebx, 10
		cmp		ebx, 0
		ja		redodecalpha
		pop		ebx
		call	procalpha, hwnd, 0, 0, LWA_ALPHA
		ret
AlphaOut endp

MenuSubClassProc   proc, hwnd:DWORD,wmsg:DWORD,wparam:DWORD, lparam:DWORD
		cmp		wmsg, 482
		jne		suivant
		call	GetWindowLongA, hwnd, GWL_EXSTYLE
		or		eax, 00080000h
		call	SetWindowLongA, hwnd, GWL_EXSTYLE, eax
		call	LoadLibraryA, offset userfile
		call	GetProcAddress, eax, offset apistr
		call	eax, hwnd, 0, menualpha, LWA_ALPHA
suivant:
		call	CallWindowProcA,wpOrigMenuProc, hwnd, wmsg, wparam, lparam
		ret
MenuSubClassProc endp 



MoveButtons proc, hwnd:DWORD
		mov		buttonleft, 8
		mov		buttontop, 5
		call	SetWindowPos, hDesktopBut, 0, buttonleft, buttontop, 34, 34, SWP_NOZORDER
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	SetWindowPos, hNote, 0, buttonleft, buttontop, 34, 34, SWP_NOZORDER
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	SetWindowPos, hComp, 0, buttonleft, buttontop, 34, 34, SWP_NOZORDER
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	SetWindowPos, hDocs, 0, buttonleft, buttontop, 34, 34, SWP_NOZORDER
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	SetWindowPos, hWeather, 0, buttonleft, buttontop, 34, 34, SWP_NOZORDER
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		call	SetWindowPos, hRun, 0, buttonleft, buttontop, 34, 34, SWP_NOZORDER
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif
		xor		ecx, ecx
		mov		countermov, ecx
movebuts:
		call	SetWindowPos, dword ptr [ButtonHandles+ecx*8], 0, buttonleft, buttontop, 34, 34, SWP_NOZORDER
		.if		cFormat==0
		add		buttonleft, 35
		.else
		add		buttontop, 35
		.endif

		inc     countermov
		mov		ecx, countermov
		cmp		ecx, countbut
		jl		movebuts

		mov 	eax,1 
		ret

MoveButtons endp

FileButtonSubClassProc proc, hwnd:DWORD,wmsg:DWORD,wparam:DWORD, lparam:DWORD
		cmp		wmsg, WM_RBUTTONDOWN
		je		buttondown
		cmp		wmsg, WM_COMMAND
		je		wmcommandmenu
		

		call	CallWindowProcA, wpOldMenuProc, hwnd, wmsg, wparam, lparam
		ret
		
mousemove:
		call	CallWindowProcA, wpOldMenuProc, hwnd, wmsg, wparam, lparam
		ret
wmcommandmenu:
		call	GetWindowRect, hwnd, offset ButtonSubRect
		mov		eax, ButtonSubRect.left
		xor		edx, edx
		mov		ecx, 35
		idiv	ecx
		sub		eax, 5
		mov		valuenew, eax
		
		call	_wsprintfA, offset ValueName, offset RegFilter, eax
		call	RegCreateKeyExA,HKEY_LOCAL_MACHINE, offset KeyText,0,offset regsz,0,KEY_ALL_ACCESS,0,offset hReg,offset lpdwDisposition
		
		dec     GetKeyValue
		call	RegSetValueExA, hReg, offset KeyValue, 0, REG_DWORD, offset GetKeyValue,4
		dec		valuenew
		mov		ecx, valuenew
movehandles:
		mov		edx, ecx
		inc		edx
		mov		eax, dword ptr [ButtonHandles+edx*8]
		mov		dword ptr [ButtonHandles+ecx*8], eax
		mov		eax, dword ptr [ButtonID+edx*8]
		mov		dword ptr [ButtonID+ecx*8], eax
		mov		eax, dword ptr [IconHandles+edx*8]
		mov		dword ptr [IconHandles+ecx*8], eax
		inc		ecx
		cmp		ecx, GetKeyValue
		jl		movehandles
		mov		dword ptr [IconHandles+ecx*8], 0
		mov		dword ptr [ButtonID+ecx*8], 0
		mov		dword ptr [ButtonHandles+ecx*8], 0
		inc	    valuenew
		push	valuenew
		pop		valuenew2
		mov		ecx, valuenew2
changeregval:
		inc		ecx
		call	_wsprintfA, offset ValueName, offset RegFilter, ecx
		mov		ValueSize, 512
		call	RegQueryValueExA,hReg,offset ValueName,0,offset RegType, offset PathName, offset ValueSize
		mov		ecx, valuenew2
		call	_wsprintfA, offset ValueName, offset RegFilter, ecx
		call    lstrlen, offset PathName
		call	RegSetValueExA, hReg, offset ValueName, 0, REG_SZ, offset PathName, eax
		inc		valuenew2
		mov		ecx, valuenew2
		cmp		ecx, GetKeyValue
		jl		changeregval
		dec		ecx
		call	_wsprintfA, offset ValueName, offset RegFilter, ecx
		call	RegDeleteValueA, hReg, offset ValueName
		call	RegCloseKey, hReg		
		call	DestroyWindow, hwnd
		call	MoveButtons, hwnd21
		call	CreateRegn, hwnd21
		
		.if		cFormat==0
		sub		buttonleft, 35
		.else
		sub		buttontop, 35
		.endif
		
		call	CallWindowProcA, wpOldMenuProc, hwnd, wmsg, wparam, lparam
		ret
		
buttondown:
		call	GetCursorPos, offset CursPos
		call	CreatePopupMenu
		mov		hDelete, eax
		call  AppendMenuA, hDelete, MF_STRING, 3451, offset Deletestr
		call  TrackPopupMenu,hDelete,TPM_LEFTALIGN,CursPos.x,CursPos.y,0,hwnd,0
		call	CallWindowProcA, wpOldMenuProc, hwnd, wmsg, wparam, lparam
		ret
		
FileButtonSubClassProc endp

MenuSuperClassProc   proc, hwnd:DWORD,wmsg:DWORD,wparam:DWORD, lparam:DWORD
		cmp		wmsg, WM_SHOWWINDOW
		jne		destroyis
		call	procUnInstallHook
		jmp		finsuperclass
destroyis:
		cmp		wmsg, WM_CLOSE
		call	procInstallHook, hwnd
		
finsuperclass:
		call	CallWindowProcA, wpOldMenuProc, hwnd, wmsg, wparam, lparam
		ret
MenuSuperClassProc endp

end main