
.data

EditRect		RECT <>
RRect			RECT <>
TMsg			MSG <>

ShortCutSec		db "MyShortcuts",0
IniFileRun		db "shortcuts.ini",0
CancelCap		db "Cancel",0
RunCap			db "Run...",0

FileAppName		db 128 dup (0)
lFileApp		dd 128
FileAppName2	db 128 dup (0)
ShortcutValue	db 512 dup (0)
ShortcutText	db 512 dup (0)
IniValue2		db 512 dup(?)
szIniValue2		dd 512
CapBuffer		db 50 dup (0)

wpOrigEditProc	dd 0
oldPen			dd 0
hwnd2			dd 0
hwndEdit		dd 0
textcol			dd 0
pencol			dd 0

IDC_CANCEL		equ 1002
IDC_RUN			equ 1001
IDT_RUNPATH		equ 1000
VK_RETURN       equ 0Dh

.code

RunProc  proc, hwnd:DWORD,wmsg:DWORD,wparam:DWORD, lparam:DWORD

		cmp		wmsg, WM_CLOSE
		je		close
		cmp		[wmsg], WM_CTLCOLOREDIT
		je		statcol4       
		cmp		[wmsg], WM_CTLCOLORSTATIC
		je		statcol4
		cmp		wmsg, WM_DRAWITEM
		je		ownerd
		cmp		wmsg, WM_COMMAND
		je		wmcom
		cmp		wmsg, WM_ERASEBKGND
		je		wmerz
		cmp		wmsg, WM_INITDIALOG
		je		wminitd
		cmp		wmsg, WM_DESTROY
		je		unreg
		mov		eax, 0
		ret
		
ownerd:
		mov		esi, lparam
		mov		eax, [esi].di_CtlID
		cmp		eax, IDC_CANCEL
		jne		isitrun
		call	lstrcpy, offset CapBuffer, offset CancelCap
		jmp		contdraw
isitrun:
		cmp     eax, IDC_RUN
		jne		contdraw
		call	lstrcpy, offset CapBuffer, offset RunCap
	
contdraw:
		call	GetClientRect, [esi].di_hwndItem, offset EditRect
		call	FillRect, [esi].di_hDC, offset EditRect, hBrush
		mov     eax, [esi].di_itemState
    and     eax, 1
    .if     eax==0
    push 	crunbuttontextcolor
    pop		textcol
    push 	crunbuttonbordercolor
    pop		pencol 
    .else
    mov		textcol, 00ffffffh
    mov		pencol, 00ffffffh
    add		EditRect.left, 2
    add		EditRect.top, 2
    .endif
		call	CreatePen, 0, 1, pencol
		mov		hPen, eax
		call	SelectObject, [esi].di_hDC, hPen
		Call	SetBkColor, [esi].di_hDC, crunbuttonbackcolor
		mov		eax, textcol
		Call	SetTextColor, [esi].di_hDC, eax
		mov		brushy.lbStyle, 0
		push	crunbuttonbackcolor
		pop		brushy.lbColor
		call	CreateBrushIndirect, offset brushy
		mov		hBrush, eax
		call	SelectObject, [esi].di_hDC, hBrush
		call	FillRect, [esi].di_hDC, offset EditRect, hBrush
		call	RoundRect, [esi].di_hDC, EditRect.left, EditRect.top, EditRect.right, EditRect.bottom, 5, 5
		call	DrawTextA, [esi].di_hDC, offset CapBuffer, 11, offset EditRect,  DT_CENTER or DT_VCENTER or DT_SINGLELINE
		mov		eax, TRUE
		ret
	
statcol4:

		Call	SetBkColor, wparam, crunwindowbackcolor
		mov		eax, crunbuttontextcolor
		Call	SetTextColor, wparam, eax
		call	GetStockObject, 5
		ret
wmerz:
		call	CreatePen, 0, 1, crunwindowbordercolor
		mov		hPen, eax
		call	SelectObject, wparam, hPen
		mov		brushy.lbStyle, 0
		push	crunwindowbackcolor
		pop		brushy.lbColor
		call	CreateBrushIndirect, offset brushy
		mov		hBrush, eax
		call	SelectObject, wparam, hBrush
		mov		OldPen, eax
		sub		RRect.right,1
		sub		RRect.bottom,1
		call	RoundRect, wparam, RRect.left, RRect.top, RRect.right, RRect.bottom, 5, 5 	
		call	GetClientRect, hwnd, offset EditRect
		call	RoundRect, wparam, 9, 20, 240, 40, 5, 5 
		mov		eax, TRUE
		ret
	
unreg:
		call	SetWindowLongA, hwndEdit, GWL_WNDPROC, wpOrigEditProc
		jmp		wmclose
		mov		eax, TRUE
		ret
	
keyd:
		cmp		wparam, VK_RETURN
		je		run
		stopss:
		mov		eax, TRUE
		ret
	
wminitd:
		push  	hwnd
		pop		hwnd2
		call	SetWindowLongA, hwnd, GWL_EXSTYLE, WS_EX_TOPMOST or 00080000h or WS_EX_TOOLWINDOW
		
		call	LoadLibraryA, offset userfile
		call	GetProcAddress, eax, offset apistr
		call	eax, hwnd, 0, 200, LWA_ALPHA
		
		call	GetClientRect, hwnd, offset RRect
		sub		RRect.right, 5
		call	CreateRoundRectRgn, RRect.left, RRect.top, RRect.right, RRect.bottom, 5, 5
		call	SetWindowRgn,hwnd,eax,TRUE
	
		call	GetDlgItem, hwnd, IDT_RUNPATH
		mov		hwndEdit, eax
		call	SetWindowLongA, hwndEdit, GWL_WNDPROC, offset EditSubClassProc
		mov		wpOrigEditProc, eax
	
	
		.if	cFormat2==0	
		mov		eax, abd.Aprc.bottom
		sub		eax, 4
		call	SetWindowPos, hwnd, HWND_TOPMOST, 140,eax,  0, 0, SWP_NOSIZE
		.elseif cFormat2==1
		mov		eax, abd.Aprc.right
		add		eax, 4
		call	SetWindowPos, hwnd, HWND_TOPMOST, eax, 140,  0, 0, SWP_NOSIZE
		.elseif cFormat2==3
		mov		eax, abd.Aprc.left
		sub		eax, 246
		call	SetWindowPos, hwnd, HWND_TOPMOST, eax, 140,  0, 0, SWP_NOSIZE
		.elseif cFormat2==2
		mov		eax, abd.Aprc.top
		sub		eax, 82
		call	SetWindowPos, hwnd, HWND_TOPMOST, 140,eax,  0, 0, SWP_NOSIZE
		.endif

		call	lstrcpy, offset FileAppName2, offset FileAppName
		call	lstrcat, offset FileAppName2, offset IniFileRun
		mov		eax, TRUE
		ret
	
wmcom:
		cmp	wparam, IDC_CANCEL
		je	close
		cmp	wparam, IDC_RUN
		je	run
		mov	eax, TRUE
		ret
		
run:
		call	GetDlgItemTextA, hwnd, IDT_RUNPATH, offset ShortcutText, 512
		call	GetPrivateProfileStringA, offset ShortCutSec, offset ShortcutText, offset ShortcutText, offset IniValue2, szIniValue2, offset FileAppName2
		call    ShellExecuteA,0,offset ShellOpen, offset IniValue2,0,0,SW_SHOWNORMAL
		
close:
		mov		ishidden, 0
		call	EndDialog, hwnd, 1
		mov		eax, TRUE
		ret
RunProc   endp

EditSubClassProc  proc, hwnd:DWORD,wmsg:DWORD,wparam:DWORD, lparam:DWORD

		cmp	  	wmsg, WM_KEYDOWN
		je		keyds
		call	CallWindowProcA,wpOrigEditProc, hwnd, wmsg, wparam, lparam
		ret
		
keyds:
		cmp		wparam, VK_RETURN
		jne		stopss2
		call	PeekMessageA, offset TMsg, 0, WM_CHAR, WM_CHAR, PM_REMOVE
		call	GetWindowTextA, hwnd, offset ShortcutText, 512
		call	GetPrivateProfileStringA, offset ShortCutSec, offset ShortcutText, offset ShortcutText, offset IniValue2, szIniValue2, offset FileAppName2
		call    ShellExecuteA,0,offset ShellOpen, offset IniValue2,0,0,SW_SHOWNORMAL
		call	SetWindowTextA, hwnd, 0, 0
		mov		ishidden, 0
		call	EndDialog, hwnd2, 0
		ret
		
stopss2:
		cmp		wparam, VK_ESCAPE
		jne		stopss3
		call	SetWindowTextA, hwnd, 0, 0
		mov		ishidden, 0
		call	EndDialog, hwnd2, 0
		
stopss3:
		call	CallWindowProcA,wpOrigEditProc, hwnd, wmsg, wparam, lparam
		ret
	
EditSubClassProc  endp
