
.data

NRect			RECT <>
filebuffer		db 512 dup (0)
notefile		db "notes.nt",0
SizeRead		dd ?
c1esi			dd 0
tempn			dd 0
c2ebx			dd 0
c3edi			dd 0
hwndnote		dd 0
wpOrigNoteProc	dd 0
hwnd3			dd 0

IDT_NOTE		equ 3232
MAXSIZE 		equ 260
MEMSIZE 		equ 65535

.code

NoteProc  proc, hwnd:DWORD,wmsg:DWORD,wparam:DWORD, lparam:DWORD

		cmp		wmsg, WM_INITDIALOG
		je		wminitdn
		cmp		wmsg, WM_CLOSE
		je		wmclosen
		cmp		[wmsg], WM_CTLCOLOREDIT
		je		statcol6
		cmp		wmsg, WM_CTLCOLORSTATIC
		je		statcol5
		cmp		wmsg, WM_ERASEBKGND
		je		wmerzn
		cmp		wmsg, WM_LBUTTONDOWN
		je		movewindn
		mov		eax, 0
		ret
		
wmerzn:
		call	CreatePen, 0, 1, cnotewindowbordercolor
		mov	 	hPen, eax
		call	SelectObject, wparam, hPen
		mov		brushy.lbStyle, 0
		push	cnotewindowbackcolor
		pop		brushy.lbColor
		
		call	CreateBrushIndirect, offset brushy
		mov		hBrush, eax
		call	SelectObject, wparam, hBrush
		mov		OldPen, eax
		sub		NRect.right,1
		sub		NRect.bottom,1
		call	RoundRect, wparam, NRect.left, NRect.top, NRect.right, NRect.bottom, 5, 5	
		mov		eax, TRUE
		ret

statcol6:

		Call	SetBkColor, wparam, cnotewindowbackcolor
		mov		eax, cnotewindowtextcolor 
		Call	SetTextColor, wparam, eax
		call	CreateSolidBrush, cnotewindowbackcolor
		ret

statcol5:

		Call	SetBkColor, wparam, cnotewindowbackcolor
		mov		eax, cnotewindowtextcolor
		Call	SetTextColor, wparam, eax
		call	GetStockObject, 5
		call	CreateSolidBrush, cnotewindowbackcolor
		ret
	
wmclosen:

		call	CreateFile,offset filebuffer, GENERIC_READ or GENERIC_WRITE ,\
				FILE_SHARE_READ , 0,CREATE_ALWAYS,FILE_ATTRIBUTE_ARCHIVE, 0
		mov		c2ebx,eax
		call	GlobalAlloc,GMEM_MOVEABLE or GMEM_ZEROINIT,MEMSIZE
		push	eax
		call	GlobalLock, eax
		mov	c1esi,eax
		push	eax
		call	GetDlgItemText, hwnd, IDT_NOTE, eax,MEMSIZE-1
		call	WriteFile, c2ebx, c1esi, eax, offset SizeRead, 0
		call	CloseHandle, c2ebx
		call	GlobalUnlock
		call	GlobalFree
		mov		ishidden, 0
		call	EndDialog, hwnd, 1
		mov	eax, 1
		ret
	
	
wminitdn:
	
		push  	hwnd
		pop		hwnd3
		call	SetWindowLongA, hwnd, GWL_EXSTYLE, WS_EX_TOPMOST or 00080000h or WS_EX_TOOLWINDOW
		call	LoadLibraryA, offset userfile
		call	GetProcAddress, eax, offset apistr
		call	eax, hwnd, 0, 200, LWA_ALPHA
		call	GetClientRect, hwnd, offset NRect
		sub		RRect.right, 5
		call	CreateRoundRectRgn, NRect.left, NRect.top, NRect.right, NRect.bottom, 5, 5
		call	SetWindowRgn,hwnd,eax,TRUE
		call	GetDlgItem, hwnd, IDT_RUNPATH
		mov		hwndnote, eax
		.if		cFormat2==0	
		mov		eax, abd.Aprc.bottom
		sub		eax, 4
		call	SetWindowPos, hwnd, HWND_TOPMOST, 40,eax,  0, 0, SWP_NOSIZE
		.elseif cFormat2==1
		mov		eax, abd.Aprc.right
		add		eax, 4
		call	SetWindowPos, hwnd, HWND_TOPMOST, eax, 40,  0, 0, SWP_NOSIZE
		.elseif cFormat2==3
		mov		eax, abd.Aprc.left
		sub		eax, 286
		call	SetWindowPos, hwnd, HWND_TOPMOST, eax, 40,  0, 0, SWP_NOSIZE
		.elseif cFormat2==2
		mov		eax, abd.Aprc.top
		sub		eax, 178
		call	SetWindowPos, hwnd, HWND_TOPMOST, 40,eax,  0, 0, SWP_NOSIZE
		.endif
		call 	lstrcpy, offset filebuffer, offset FileAppName
		call	lstrcat, offset filebuffer, offset notefile
		call	CreateFile,offset filebuffer, GENERIC_READ or GENERIC_WRITE ,\
					FILE_SHARE_READ, 0,OPEN_EXISTING,FILE_ATTRIBUTE_ARCHIVE, 0
		cmp		eax, -1
		je		finitive
		mov		c2ebx,eax
		call	GetFileSize, eax, 0
		cmp		eax, 65535
		jb		size_ok
		call	CloseHandle, c2ebx
		jmp		finitive
		size_ok:		
		call	GlobalAlloc,GMEM_MOVEABLE or GMEM_ZEROINIT,MEMSIZE
		push	eax
		call	GlobalLock, eax
		push	eax
		mov		tempn, eax
		call	ReadFile, c2ebx, eax, MEMSIZE-1,offset SizeRead, 0
		call	SetDlgItemTextA, hwnd, IDT_NOTE, tempn
		call	CloseHandle, c2ebx
		call	GlobalUnlock
		call	GlobalFree
		call	SetWindowLongA, hwndnote, GWL_WNDPROC, offset NoteSubClassProc
		mov		wpOrigNoteProc, eax
		call	PostMessageA, hwndnote, EM_SETSEL, 1, 3
		call	GetLastError
		finitive:
		mov		eax, TRUE
		ret
	
movewindn:
		mov     eax, lparam
		call    PostMessageA,hwnd,WM_NCLBUTTONDOWN,HTCAPTION,eax
		mov		eax, 0
		ret	
NoteProc  endp


NoteSubClassProc  proc, hwnd:DWORD,wmsg:DWORD,wparam:DWORD, lparam:DWORD

		cmp		wmsg, WM_KEYDOWN
		je		keydsn
		call	CallWindowProcA,wpOrigNoteProc, hwnd, wmsg, wparam, lparam
		ret
		
keydsn:
		cmp		wparam, VK_ESCAPE
		jne		stopss4
		mov		ishidden, 0
		call	EndDialog, hwnd3, 0
		
stopss4:
		call	CallWindowProcA,wpOrigNoteProc, hwnd, wmsg, wparam, lparam
		ret
	
NoteSubClassProc  endp