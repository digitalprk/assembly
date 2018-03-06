;*************************************************************************
;
;       WIN32.INC - Win32 assembly language structures & constants
;
;
;*************************************************************************
;
; NOTE: this file only implements the structures and constants that
;       wap32.asm uses.  You may extend it for your own applications.
;
;*************************************************************************
;
;
;       C/C++ Run Time Library - Version 6.0
;
;       Copyright (c) 1985, 1993 by Borland International
;       All Rights Reserved.
;

UCHAR   EQU <db>
USHORT  EQU <dw>  ; used only if we really need 16 bits
UINT    EQU <dd>  ; 32 bits for WIN32
ULONG   EQU <dd>

;*******************************************************************
;
;       Window's externals
;
;*******************************************************************
extrn	SHGetFileInfo:PROC
extrn	TrackPopupMenu:PROC
extrn	LoadImageA:PROC
extrn	LoadCursorA:PROC
extrn	RegisterClassExA:PROC
extrn	CreateBrushIndirect:PROC
extrn	lstrcpy:PROC
extrn	CallWindowProcA:PROC
extrn	RoundRect:PROC
extrn	GetSubMenu:PROC
extrn	SetMenuItemBitmaps:PROC
extrn	AppendMenuA:PROC
extrn	SetWindowsHookExA:PROC
extrn	UnhookWindowsHookEx:PROC
extrn	lstrcat:PROC
extrn	GetWindowsDirectoryA:PROC
extrn	ShellExecuteA:PROC
extrn	GetDC:PROC
extrn	DrawEdge:PROC
extrn	lstrlen:PROC
extrn	RedrawWindow:PROC
extrn	DrawIconEx:PROC
extrn	ClipCursor:PROC
extrn	CreateWindowExA:PROC
extrn	CopyImage:PROC
extrn	DragQueryFile:PROC
extrn	GetIconLocation:PROC
extrn	CreatePopupMenu:PROC
extrn	GetPrivateProfileStringA:PROC
extrn	MessageBoxExA:PROC
extrn    RegSetValueExA:PROC
extrn	RegCloseKey:PROC
extrn	RegCreateKeyExA:PROC
extrn	RegQueryValueExA:PROC
extrn	ExtractAssociatedIconA:PROC
extrn	GetWindowDC:PROC
extrn	ExtractIconEx:PROC
extrn	DrawIcon:PROC
extrn    _wsprintfA:PROC
extrn	GetCursorPos:PROC
extrn    wsprintf:PROC
extrn	GetSystemTime:PROC
extrn    SetRect:PROC
extrn   SHAppBarMessage:PROC
extrn    BeginPaint:PROC
extrn	 BeginPath:PROC
extrn	 BitBlt:PROC
extrn    CloseHandle:PROC
extrn	 CreateCompatibleBitmap:PROC
extrn	 CreateCompatibleDC:PROC
extrn	 CreatePen:PROC
extrn	 CreateSolidBrush:PROC
extrn	SetWindowLongA:PROC
extrn	SetLayeredWindowAttributes:PROC
extrn	LoadLibraryA:PROC
extrn	GetProcAddress:PROC
extrn    CreateWindowExA:PROC
extrn	 CreateFileA:PROC
extrn    DefWindowProcA:PROC
extrn    DeleteDC:PROC
extrn	 DeleteObject:PROC
extrn    DialogBoxParamA:PROC
extrn    DispatchMessageA:PROC
extrn	 CreateEllipticRgn:PROC
extrn	 Ellipse:PROC
extrn    EndDialog:PROC
extrn    EndDoc:PROC
extrn    EndPaint:PROC
extrn    EndPage:PROC
extrn	 EndPath:PROC
extrn	 EnableWindow:PROC
extrn    ExitProcess:PROC
extrn	 FillRect:PROC
extrn    FindWindowA:PROC
extrn	 GetCurrentProcess:PROC
extrn    GetDC:PROC
extrn    GetDlgItem:PROC
extrn    GetDlgItemTextA:PROC
extrn	 GetLastError:PROC
extrn    GetLocalTime:PROC
extrn    GetMessageA:PROC
extrn	 GetClientRect:PROC
extrn	 GetFileSize:PROC
extrn    GetModuleHandleA:PROC
extrn    GetOpenFileNameA:PROC
extrn    GetSaveFileNameA:PROC
extrn    GetStockObject:PROC
extrn	 GetSysColor:PROC
extrn    GetSystemMetrics:PROC
extrn    GetTextMetricsA:PROC
extrn	 GetTickCount:PROC
extrn	 GetVolumeInformationA:PROC
extrn	 GetWindowTextA:PROC
extrn    GetWindowRect:PROC
extrn    GlobalAlloc:PROC
extrn    GlobalFree:PROC
extrn	 GlobalLock:PROC
extrn    InitCommonControls:PROC
extrn    InvalidateRect:PROC
extrn	 RegOpenKeyExA:PROC
extrn    KillTimer:PROC
extrn	 LineTo:PROC
extrn    LoadAcceleratorsA:PROC
extrn    LoadCursorA:PROC
extrn    LoadIconA:PROC
extrn    LoadMenuA:PROC
extrn    LoadStringA:PROC
extrn    MessageBeep:PROC
extrn    MessageBoxA:PROC
extrn	 MoveToEx:PROC
extrn    MoveWindow:PROC
extrn	GetStockObject:PROC
extrn	SetTextColor:PROC
extrn    OpenFile:PROC
extrn    PostQuitMessage:PROC
extrn    PrintDlgA:PROC
extrn    ReadFile:PROC
extrn	 Rectangle:PROC
extrn    RegisterClassA:PROC
extrn	 RegOpenKeyA:PROC
extrn	 RegQueryValueA:PROC
extrn	 RegQueryValueExA:PROC
extrn	 ReleaseDC:PROC
extrn	 SendDlgItemMessageA:PROC
extrn    SendMessageA:PROC
extrn	 SelectObject:PROC
extrn	 SelectClipPath:PROC
extrn	 SetBkMode:PROC
extrn	SetBkColor:PROC
extrn	 SetDlgItemTextA:PROC
extrn	 SetFilePointer:PROC
extrn    SetFocus:PROC
extrn	 SetSysColors:PROC
extrn	 SetTextColor:PROC
extrn    SetTimer:PROC
extrn    SetWindowPos:PROC
extrn	 SetWindowTextA:PROC
extrn	 Sleep:PROC
extrn    ShowWindow:PROC
extrn    StartDocA:PROC
extrn    StartPage:PROC
extrn    TextOutA:PROC
extrn    TranslateAcceleratorA:PROC
extrn    TranslateMessage:PROC
extrn    UpdateWindow:PROC
extrn    WinHelpA:PROC
extrn    WriteFile:PROC
extrn	 wvsprintfA:PROC
;extrn	 LoadStringA:PROC

CreateFile		 equ <CreateFileA>
CreateWindowEx   equ <CreateWindowExA>
DefWindowProc    equ <DefWindowProcA>
DialogBoxParam   equ <DialogBoxParamA>
DispatchMessage  equ <DispatchMessageA>
FindWindow       equ <FindWindowA>
GetDlgItemText   equ <GetDlgItemTextA>
GetMessage       equ <GetMessageA>
GetModuleHandle  equ <GetModuleHandleA>
GetOpenFileName  equ <GetOpenFileNameA>
GetSaveFileName  equ <GetSaveFileNameA>
GetTextMetrics   equ <GetTextMetricsA>
LoadAccelerators equ <LoadAcceleratorsA>
LoadCursor       equ <LoadCursorA>
LoadIcon         equ <LoadIconA>
LoadMenu         equ <LoadMenuA>
LoadString       equ <LoadStringA>
MessageBox       equ <MessageBoxA>
PrintDlg         equ <PrintDlgA>
RegisterClass    equ <RegisterClassA>
SendMessage      equ <SendMessageA>
StartDoc         equ <StartDocA>
TextOut          equ <TextOutA>
TranslateAccelerator equ <TranslateAcceleratorA>
WinHelp          equ <WinHelpA>


;
; Commands to pass to WinHelp()
;
HELP_CONTEXT     = 0001h
HELP_QUIT        = 0002h
HELP_INDEX       = 0003h
HELP_CONTENTS    = 0003h
HELP_HELPONHELP  = 0004h
HELP_SETINDEX    = 0005h
HELP_SETCONTENTS = 0005h
HELP_CONTEXTPOPUP = 0008h
HELP_FORCEFILE   = 0009h
HELP_KEY         = 0101h
HELP_COMMAND     = 0102h
HELP_PARTIALKEY  = 0105h
HELP_MULTIKEY    = 0201h
HELP_SETWINPOS   = 0203h
HELP_CONTEXTMENU = 000ah
HELP_FINDER      = 000bh
HELP_WM_HELP     = 000ch
HELP_SETPOPUP_POS = 000dh

HELP_TCARD             = 8000h
HELP_TCARD_DATA        = 0010h
HELP_TCARD_OTHER_CALLER  = 0011h

IDH_NO_HELP                =     28440
IDH_MISSING_CONTEXT        =     28441
IDH_GENERIC_HELP_BUTTON    =     28442
IDH_OK                     =     28443
IDH_CANCEL                 =     28444
IDH_HELP                   =     28445
; =========================
; ternary raster operations
; =========================
;
SRCCOPY				equ	00CC0020h	;dest = src
SRCPAINT			equ	00EE0086h	;dest = src or dest
SRCAND				equ	008800C6h	;dest = src and dest
SRCINVERT			equ	00660046h	;dest = src xor dest
SRCERASE			equ	00440328h	;dest = src and -dest
NOTSRCCOPY			equ	00330008h	;dest = -src
NOTSRCERASE			equ	001100A6h	;dest = -src and -dest
MERGECOPY			equ	00C000CAh	;dest = src and pat
MERGEPAINT			equ	00BB0226h	;dest = -src or dest
PATCOPY				equ	00F00021h	;dest = pat
PATPAINT			equ	00FB0A09h	;dest = DPSnoo
PATINVERT			equ	005A0049h	;dest = pat xor dest
DSTINVERT			equ	00550009h	;dest = -dest
BLACKNESS			equ	00000042h	;dest = black
WHITENESS			equ	00FF0062h	;dest = white

GMEM_FIXED                           equ 0h
GMEM_MOVEABLE                        equ 2h
GMEM_NOCOMPACT                       equ 10h
GMEM_NODISCARD                       equ 20h
GMEM_ZEROINIT                        equ 40h
GMEM_MODIFY                          equ 80h
GMEM_DISCARDABLE                     equ 100h
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
BS_NOTIFY           			  equ 4000h
BS_FLAT             			  equ 8000h
GMEM_NOT_BANKED                      equ 1000h
GMEM_SHARE                           equ 2000h
GMEM_DDESHARE                        equ 2000h
GMEM_NOTIFY                          equ 4000h
GMEM_LOWER                           equ GMEM_NOT_BANKED
GMEM_VALID_FLAGS                     equ 7F72h
GMEM_INVALID_HANDLE                  equ 8000h
GMEM_DISCARDED                       equ 4000h
GMEM_LOCKCOUNT                       equ 0FFh
GHND                                 equ GMEM_MOVEABLE OR GMEM_ZEROINIT
GPTR                                 equ GMEM_FIXED OR GMEM_ZEROINIT


POINT			struct
x			DWORD	  0		;x coordinate
y			DWORD	  0		;y coordinate
POINT			ends

CHARFORMAT STRUCT
  cbSize  DWORD      ?
  dwMask  DWORD      ?
  dwEffects  DWORD      ?
  yHeight  DWORD      ?
  yOffset  DWORD      ?
  crTextColor  DWORD      ?
  bCharSet  BYTE      ?
  bPitchAndFamily  BYTE      ?
  szFaceName  BYTE ?
CHARFORMAT ENDS

CREATE_NEW				equ 1
CREATE_ALWAYS			equ	2
OPEN_EXISTING			equ	3
OPEN_ALWAYS			equ	4

;*******************************************************************
;
;       OFSTRUCT
;
;*******************************************************************
OF_READ             = 00000000h
OF_WRITE            = 00000001h
OF_READWRITE        = 00000002h
OF_SHARE_COMPAT     = 00000000h
OF_SHARE_EXCLUSIVE  = 00000010h
OF_SHARE_DENY_WRITE = 00000020h
OF_SHARE_DENY_READ  = 00000030h
OF_SHARE_DENY_NONE  = 00000040h
OF_PARSE            = 00000100h
OF_DELETE           = 00000200h
OF_VERIFY           = 00000400h
OF_CANCEL           = 00000800h
OF_CREATE           = 00001000h
OF_PROMPT           = 00002000h
OF_EXIST            = 00004000h
OF_REOPEN           = 00008000h
OFS_MAXPATHNAME     = 128

OFSTRUCT struc
    cBytes UCHAR ?
    fFixedDisk UCHAR ?
    nErrCode USHORT ?
    Reserved1 USHORT ?
    Reserved2 USHORT ?
    szPathName db OFS_MAXPATHNAME dup(?)
OFSTRUCT ends

WSADESCRIPTION_LEN          equ 256
WSASYS_STATUS_LEN           equ 128
IPPROTO_IP          equ             0
IPPROTO_ICMP          equ           1
IPPROTO_GGP          equ            2
IPPROTO_TCP          equ            6
IPPROTO_PUP          equ            12
IPPROTO_UDP          equ            17
IPPROTO_IDP          equ            22
IPPROTO_ND          equ             77
IPPROTO_RAW          equ            255
IPPROTO_MAX          equ            256
IOCPARM_MASK           equ 7Fh
IOC_VOID               equ 20000000h
IOC_OUT                equ 40000000h
IOC_IN equ 80000000h
IOC_INOUT              equ IOC_IN OR IOC_OUT
FIONBIO                equ 8004667Eh
FIONSYNC               equ 8004667Dh
FIONREAD               equ 4004667Fh
IPPORT_ECHO          equ            7
IPPORT_DISCARD          equ         9
IPPORT_SYSTAT          equ          11
IPPORT_DAYTIME          equ         13
IPPORT_NETSTAT          equ         15
IPPORT_FTP          equ             21
IPPORT_TELNET          equ          23
IPPORT_SMTP          equ            25
IPPORT_TIMESERVER          equ      37
IPPORT_NAMESERVER          equ      42
IPPORT_WHOIS          equ           43
IPPORT_MTP          equ             57
IPPORT_TFTP          equ            69
IPPORT_RJE          equ             77
IPPORT_FINGER          equ          79
IPPORT_TTYLINK          equ         87
IPPORT_SUPDUP          equ          95
IPPORT_EXECSERVER          equ      512
IPPORT_LOGINSERVER          equ     513
IPPORT_CMDSERVER          equ       514
IPPORT_EFSSERVER          equ       520
IPPORT_BIFFUDP          equ         512
IPPORT_WHOSERVER          equ       513
IPPORT_ROUTESERVER          equ     520
IPPORT_RESERVED          equ        1024
IMPLINK_IP          equ             155
IMPLINK_LOWEXPER          equ       156
IMPLINK_HIGHEXPER          equ      158
IN_CLASSA_NET          equ          0FF000000h
IN_CLASSA_NSHIFT          equ       24
IN_CLASSA_HOST          equ         000FFFFFFh
IN_CLASSA_MAX          equ          128
IN_CLASSB_NET          equ          0FFFF0000h
IN_CLASSB_NSHIFT          equ       16
IN_CLASSB_HOST          equ         00000FFFFh
IN_CLASSB_MAX          equ          65536
IN_CLASSC_NET          equ          0FFFFFF00h
IN_CLASSC_NSHIFT          equ       8
IN_CLASSC_HOST          equ         0000000FFh
INADDR_ANY          equ             000000000h
INADDR_LOOPBACK          equ        07F000001h
INADDR_BROADCAST          equ       0FFFFFFFFh
INADDR_NONE          equ            0FFFFFFFFh
SOCK_STREAM          equ    1
SOCK_DGRAM          equ     2
SOCK_RAW          equ       3
SOCK_RDM          equ       4
SOCK_SEQPACKET          equ 5
SO_DEBUG          equ       00001h
SO_ACCEPTCONN          equ  00002h
SO_REUSEADDR          equ   00004h
SO_KEEPALIVE          equ   00008h
SO_DONTROUTE          equ   00010h
SO_BROADCAST          equ   00020h
SO_USELOOPBACK          equ 00040h
SO_LINGER          equ      00080h
SO_OOBINLINE          equ   00100h
SOL_SOCKET            equ   0FFFFh
SO_DONTLINGER          equ  NOT SO_LINGER
SO_SNDBUF          equ      01001h
SO_RCVBUF          equ      01002h
SO_SNDLOWAT          equ    01003h
SO_RCVLOWAT          equ    01004h
SO_SNDTIMEO          equ    01005h
SO_RCVTIMEO          equ    01006h
SO_ERROR          equ       01007h
SO_TYPE          equ        01008h
TCP_NODELAY          equ    00001h
AF_UNSPEC          equ      0
AF_UNIX          equ        1
AF_INET          equ        2
AF_IMPLINK          equ     3
AF_PUP          equ         4
AF_CHAOS          equ       5
AF_NS          equ          6
AF_IPX          equ         6
AF_ISO          equ         7
AF_OSI          equ         AF_ISO
AF_ECMA          equ        8
AF_DATAKIT          equ     9
AF_CCITT          equ       10
AF_SNA          equ         11
AF_DECnet          equ      12
AF_DLI          equ         13
AF_LAT          equ         14
AF_HYLINK          equ      15
AF_APPLETALK          equ   16
AF_NETBIOS          equ     17
AF_MAX          equ         18
PF_UNSPEC          equ      AF_UNSPEC
PF_UNIX          equ        AF_UNIX
PF_INET          equ        AF_INET
PF_IMPLINK          equ     AF_IMPLINK
PF_PUP          equ         AF_PUP
PF_CHAOS          equ       AF_CHAOS
PF_NS          equ          AF_NS
PF_IPX          equ         AF_IPX
PF_ISO          equ         AF_ISO
PF_OSI          equ         AF_OSI
PF_ECMA          equ        AF_ECMA
PF_DATAKIT          equ     AF_DATAKIT
PF_CCITT          equ       AF_CCITT
PF_SNA          equ         AF_SNA
PF_DECnet          equ      AF_DECnet
PF_DLI          equ         AF_DLI
PF_LAT          equ         AF_LAT
PF_HYLINK          equ      AF_HYLINK
PF_APPLETALK          equ   AF_APPLETALK
PF_MAX          equ         AF_MAX
SOMAXCONN          equ      5
MSG_OOB          equ        01h
MSG_PEEK          equ   02h
MSG_DONTROUTE          equ  04h
MSG_MAXIOVLEN          equ  16
MAXGETHOSTSTRUCT          equ       1024
FD_READ          equ        001h
FD_WRITE          equ       002h
FD_OOB          equ         004h
FD_ACCEPT          equ      008h
FD_CONNECT          equ     010h
FD_CLOSE          equ       020h
WSABASEERR          equ             10000
WSAEINTR          equ               WSABASEERR+4
WSAEBADF          equ               WSABASEERR+9
WSAEACCES          equ              WSABASEERR+13
WSAEFAULT          equ              WSABASEERR+14
WSAEINVAL          equ              WSABASEERR+22
WSAEMFILE          equ              WSABASEERR+24
WSAEWOULDBLOCK          equ         WSABASEERR + 35
WSAEINPROGRESS          equ         WSABASEERR + 36
WSAEALREADY          equ            WSABASEERR + 37
WSAENOTSOCK          equ            WSABASEERR + 38
WSAEDESTADDRREQ          equ        WSABASEERR + 39
WSAEMSGSIZE          equ            WSABASEERR + 40
WSAEPROTOTYPE          equ          WSABASEERR + 41
WSAENOPROTOOPT          equ         WSABASEERR + 42
WSAEPROTONOSUPPORT          equ     WSABASEERR + 43
WSAESOCKTNOSUPPORT          equ     WSABASEERR + 44
WSAEOPNOTSUPP          equ          WSABASEERR + 45
WSAEPFNOSUPPORT          equ        WSABASEERR + 46
WSAEAFNOSUPPORT          equ        WSABASEERR + 47
WSAEADDRINUSE          equ          WSABASEERR + 48
WSAEADDRNOTAVAIL          equ       WSABASEERR + 49
WSAENETDOWN          equ            WSABASEERR + 50
WSAENETUNREACH          equ         WSABASEERR + 51
WSAENETRESET          equ           WSABASEERR + 52
WSAECONNABORTED          equ        WSABASEERR + 53
WSAECONNRESET          equ          WSABASEERR + 54
WSAENOBUFS          equ             WSABASEERR + 55
WSAEISCONN          equ             WSABASEERR + 56
WSAENOTCONN          equ            WSABASEERR + 57
WSAESHUTDOWN          equ           WSABASEERR + 58
WSAETOOMANYREFS          equ        WSABASEERR + 59
WSAETIMEDOUT          equ           WSABASEERR + 60
WSAECONNREFUSED          equ        WSABASEERR + 61
WSAELOOP          equ               WSABASEERR + 62
WSAENAMETOOLONG          equ        WSABASEERR + 63
WSAEHOSTDOWN          equ           WSABASEERR + 64
WSAEHOSTUNREACH          equ        WSABASEERR + 65
WSAENOTEMPTY          equ           WSABASEERR + 66
WSAEPROCLIM          equ            WSABASEERR + 67
WSAEUSERS          equ              WSABASEERR + 68
WSAEDQUOT          equ              WSABASEERR + 69
WSAESTALE          equ              WSABASEERR + 70
WSAEREMOTE          equ             WSABASEERR + 71
WSASYSNOTREADY          equ         WSABASEERR+91
WSAVERNOTSUPPORTED          equ     WSABASEERR+92
WSANOTINITIALISED          equ      WSABASEERR+93
WSAHOST_NOT_FOUND          equ      WSABASEERR + 1001
HOST_NOT_FOUND          equ         WSAHOST_NOT_FOUND
WSATRY_AGAIN          equ           WSABASEERR + 1002
TRY_AGAIN          equ              WSATRY_AGAIN
WSANO_RECOVERY          equ         WSABASEERR + 1003
NO_RECOVERY          equ            WSANO_RECOVERY
WSANO_DATA          equ             WSABASEERR + 1004
NO_DATA          equ                WSANO_DATA
WSANO_ADDRESS          equ          WSANO_DATA
NO_ADDRESS          equ             WSANO_ADDRESS
EWOULDBLOCK          equ            WSAEWOULDBLOCK
EINPROGRESS          equ            WSAEINPROGRESS
EALREADY          equ               WSAEALREADY
ENOTSOCK          equ               WSAENOTSOCK
EDESTADDRREQ          equ           WSAEDESTADDRREQ
EMSGSIZE          equ               WSAEMSGSIZE
EPROTOTYPE          equ             WSAEPROTOTYPE
ENOPROTOOPT          equ            WSAENOPROTOOPT
EPROTONOSUPPORT          equ        WSAEPROTONOSUPPORT
ESOCKTNOSUPPORT          equ        WSAESOCKTNOSUPPORT
EOPNOTSUPP          equ             WSAEOPNOTSUPP
EPFNOSUPPORT          equ           WSAEPFNOSUPPORT
EAFNOSUPPORT          equ           WSAEAFNOSUPPORT
EADDRINUSE          equ             WSAEADDRINUSE
EADDRNOTAVAIL          equ          WSAEADDRNOTAVAIL
ENETDOWN          equ               WSAENETDOWN
ENETUNREACH          equ            WSAENETUNREACH
ENETRESET          equ              WSAENETRESET
ECONNABORTED          equ           WSAECONNABORTED
ECONNRESET          equ             WSAECONNRESET
ENOBUFS          equ                WSAENOBUFS
EISCONN          equ                WSAEISCONN
ENOTCONN          equ               WSAENOTCONN
ESHUTDOWN          equ              WSAESHUTDOWN
ETOOMANYREFS          equ           WSAETOOMANYREFS
ETIMEDOUT          equ              WSAETIMEDOUT
ECONNREFUSED          equ           WSAECONNREFUSED
ELOOP          equ                  WSAELOOP
ENAMETOOLONG          equ           WSAENAMETOOLONG
EHOSTDOWN          equ              WSAEHOSTDOWN
EHOSTUNREACH          equ           WSAEHOSTUNREACH
ENOTEMPTY          equ              WSAENOTEMPTY
EPROCLIM          equ               WSAEPROCLIM
EUSERS          equ                 WSAEUSERS
EDQUOT          equ                 WSAEDQUOT
ESTALE          equ                 WSAESTALE
EREMOTE          equ                WSAEREMOTE
FD_SETSIZE  equ 64
INVALID_SOCKET              equ NOT 0
SOCKET_ERROR                equ -1
SOCKET_BUFFER_SIZE          equ 512
ICMP_ECHOREPLY          equ   0
ICMP_ECHOREQ            equ   8
; ------------------------ wsock32 structures -----------------------------

fd_setstruc STRUCT
  fd_count  DWORD      ?
  fd_array  DWORD      ?
fd_setstruc ENDS

timeval STRUCT
  tv_sec  DWORD      ?
  tv_usec  DWORD      ?
timeval ENDS

sockaddr_in STRUCT
  sin_family  WORD      ?
  sin_port  WORD      ?
  sin_addr  DWORD      ?
  sin_zero  BYTE 8 dup (0)
sockaddr_in ENDS

sockaddr STRUCT
  sa_family  WORD      ?
  sa_data  WORD      ?
sockaddr ENDS

WSAdata STRUCT
  wVersion  WORD      ?
  wHighVersion  WORD      ?
  szDescription  BYTE WSADESCRIPTION_LEN + 1 dup (?)
  szSystemStatus  BYTE WSASYS_STATUS_LEN + 1 dup (?)
  iMaxSockets  WORD      ?
  iMaxUdpDg  WORD      ?
  lpVendorInfo  DWORD      ?
WSAdata ENDS

sockproto STRUCT
  sp_family  WORD      ?
  sp_protocol  WORD      ?
sockproto ENDS

linger STRUCT
  l_onoff  WORD      ?
  l_linger  WORD      ?
linger ENDS

hostentStru STRUCT
  h_name      DWORD      ?
  h_alias     DWORD      ?
  h_addr      WORD      ?
  h_len       WORD      ?
  h_list      DWORD    ?
hostentStru ENDS

netent STRUCT
  n_name      DWORD      ?
  n_aliases   DWORD      ?
  n_addrtype  WORD      ?
  n_net       DWORD      ?
netent ENDS

servent STRUCT
  s_name     DWORD      ?
  s_aliases  DWORD      ?
  s_port     WORD      ?
  s_proto    DWORD      ?
servent ENDS

icmp_hdr STRUCT
  icmp_type   BYTE      ?
  icmp_code   BYTE      ?
  icmp_cksum  WORD      ?
  icmp_id     WORD      ?
  icmp_seq    WORD      ?
  icmp_data   BYTE      ?
icmp_hdr ENDS

ip_hdr STRUCT
  ip_hlv    BYTE      ?
  ip_tos    BYTE      ?
  ip_len    WORD      ?
  ip_id     WORD      ?
  ip_off    WORD      ?
  ip_ttl    BYTE      ?
  ip_p      BYTE      ?
  ip_cksum  WORD      ?
  ip_src    DWORD      ?
  ip_dest   DWORD      ?
ip_hdr ENDS

ICMP_OPTIONS STRUCT
  Ttl              BYTE      ?
  Tos              BYTE      ?
  Flags            BYTE      ?
  OptionsSize      BYTE      ?
  OptionsData      DWORD      ?
ICMP_OPTIONS ENDS

ICMP_ECHO_REPLY STRUCT
  Address          DWORD      ?
  Status           DWORD      ?
  RoundTripTime    DWORD      ?
  DataSize         WORD      ?
  Reserved         WORD      ?
  DataPointer      DWORD      ?
  Options          DWORD      ?
  zData            BYTE 250 dup (?)
ICMP_ECHO_REPLY ENDS

OFN_READONLY              =   00000001h
OFN_OVERWRITEPROMPT       =   00000002h
OFN_HIDEREADONLY          =   00000004h
OFN_NOCHANGEDIR           =   00000008h
OFN_SHOWHELP              =   00000010h
OFN_ENABLEHOOK            =   00000020h
OFN_ENABLETEMPLATE        =   00000040h
OFN_ENABLETEMPLATEHANDLE  =   00000080h
OFN_NOVALIDATE            =   00000100h
OFN_ALLOWMULTISELECT      =   00000200h
OFN_EXTENSIONDIFFERENT    =   00000400h
OFN_PATHMUSTEXIST         =   00000800h
OFN_FILEMUSTEXIST         =   00001000h
OFN_CREATEPROMPT          =   00002000h
OFN_SHAREAWARE            =   00004000h
OFN_NOREADONLYRETURN      =   00008000h
OFN_NOTESTFILECREATE      =   00010000h
OFN_NONETWORKBUTTON       =   00020000h
OFN_NOLONGNAMES           =   00040000h
OFN_EXPLORER              =   00080000h
OFN_NODEREFERENCELINKS    =   00100000h
OFN_LONGNAMES             =   00200000h
OFN_SHAREFALLTHROUGH      =   2
OFN_SHARENOWARN           =   1
OFN_SHAREWARN             =   0

; ==================
; combo box messages
; ==================
;
CB_GETEDITSEL			equ	0140h
CB_LIMITTEXT			equ	0141h
CB_SETEDITSEL			equ	0142h
CB_ADDSTRING			equ	0143h
CB_DELETESTRING			equ	0144h
CB_DIR				equ	0145h
CB_GETCOUNT			equ	0146h
CB_GETCURSEL			equ	0147h
CB_GETLBTEXT			equ	0148h
CB_GETLBTEXTLEN			equ	0149h
CB_INSERTSTRING			equ	014Ah
CB_RESETCONTENT			equ	014Bh
CB_FINDSTRING			equ	014Ch
CB_SELECTSTRING			equ	014Dh
CB_SETCURSEL			equ	014Eh
CB_SHOWDROPDOWN			equ	014Fh
CB_GETITEMDATA			equ	0150h
CB_SETITEMDATA			equ	0151h
CB_GETDROPPEDCONTROLRECT	equ	0152h
CB_SETITEMHEIGHT		equ	0153h
CB_GETITEMHEIGHT		equ	0154h
CB_SETEXTENDEDUI		equ	0155h
CB_GETEXTENDEDUI		equ	0156h
CB_GETDROPPEDSTATE		equ	0157h
CB_FINDSTRINGEXACT		equ	0158h
CB_SETLOCALE			equ	0159h
CB_GETLOCALE			equ	015Ah
CB_GETTOPINDEX			equ	015Bh
CB_SETTOPINDEX			equ	015Ch
CB_GETHORIZONTALEXTENT		equ	015Dh
CB_SETHORIZONTALEXTENT		equ	015Eh
CB_GETDROPPEDWIDTH		equ	015Fh
CB_SETDROPPEDWIDTH		equ	0160h
CB_INITSTORAGE			equ	0161h
CB_MSGMAX			equ	0162h
;
;------------------------------------------------------------------------------
;
; =======================
; combo box return values
; =======================
;
CB_OKAY				equ	 0
CB_ERR				equ	-1
CB_ERRSPACE			equ	-2

CBN_ERRSPACE			equ	-1
CBN_SELCHANGE			equ	 1
CBN_DBLCLK				equ	 2
CBN_SETFOCUS			equ	 3
CBN_KILLFOCUS			equ	 4
CBN_EDITCHANGE			equ	 5
CBN_EDITUPDATE			equ	 6
CBN_DROPDOWN			equ	 7
CBN_CLOSEUP				equ	 8
CBN_SELENDOK			equ	 9
CBN_SELENDCANCEL		equ	10


;*******************************************************************
;
;       PRINTDLG
;
;*******************************************************************
PRINTDLG struc
   pdlStructSize ULONG ?
   pdhwndOwner ULONG ?
   pdhDevMode ULONG ?
   pdhDevNames ULONG ?
   pdhDC ULONG ?
   pdFlags ULONG ?
   pdnFromPage USHORT ?
   pdnToPage USHORT ?
   pdnMinPage USHORT ?
   pdnMaxPage USHORT ?
   pdnCopies USHORT ?
   pdhInstance ULONG ?
   pdlCustData ULONG  ?
   pdlpfnPrintHook ULONG ?
   pdlpfnSetupHook ULONG ?
   pdlpPrintTemplateName ULONG ?
   pdlpSetupTemplateName ULONG ?
   pdhPrintTemplate ULONG ?
   pdhSetupTemplate ULONG ?
PRINTDLG ends

PD_ALLPAGES              =    00000000h
PD_SELECTION             =    00000001h
PD_PAGENUMS              =    00000002h
PD_NOSELECTION           =    00000004h
PD_NOPAGENUMS            =    00000008h
PD_COLLATE               =    00000010h
PD_PRINTTOFILE           =    00000020h
PD_PRINTSETUP            =    00000040h
PD_NOWARNING             =    00000080h
PD_RETURNDC              =    00000100h
PD_RETURNIC              =    00000200h
PD_RETURNDEFAULT         =    00000400h
PD_SHOWHELP              =    00000800h
PD_ENABLEPRINTHOOK       =    00001000h
PD_ENABLESETUPHOOK       =    00002000h
PD_ENABLEPRINTTEMPLATE   =    00004000h
PD_ENABLESETUPTEMPLATE   =    00008000h
PD_ENABLEPRINTTEMPLATEHANDLE = 00010000h
PD_ENABLESETUPTEMPLATEHANDLE  = 00020000h
PD_USEDEVMODECOPIES         = 00040000h
PD_USEDEVMODECOPIESANDCOLLATE = 00040000h
PD_DISABLEPRINTTOFILE     =   00080000h
PD_HIDEPRINTTOFILE        =   00100000h
PD_NONETWORKBUTTON        =   00200000h

DOCINFO struc
    cbSize UINT ?
    lpszDocName ULONG ?
    lpszOutput ULONG ?
    lpszDatatype ULONG ?
    fwType ULONG ?
DOCINFO ends


;*******************************************************************
;
;       SYSTEMTIME
;
;*******************************************************************
SYSTEMTIME struc
    wYear USHORT ?
    wMonth USHORT ?
    wDayOfWeek USHORT ?
    wDay USHORT ?
    wHour USHORT ?
    wMinute USHORT ?
    wSecond USHORT ?
    wMilliseconds USHORT ?
SYSTEMTIME ends
;*******************************************************************
;
;       TBBUTTON
;
;*******************************************************************
TBBUTTON struc
    iBitmap UINT ?
    idCommand UINT ?
    fsState UCHAR ?
    fsStyle UCHAR ?
    bReserved db 2 dup(?)
    dwData ULONG ?
    iString UINT ?
TBBUTTON ends

STD_CUT             =    0
STD_COPY            =    1
STD_PASTE           =    2
STD_UNDO            =    3
STD_REDOW           =    4
STD_DELETE          =    5
STD_FILENEW         =    6
STD_FILEOPEN        =    7
STD_FILESAVE        =    8
STD_PRINTPRE        =    9
STD_PROPERTIES      =    10
STD_HELP            =    11
STD_FIND            =    12
STD_REPLACE         =    13
STD_PRINT           =    14

TBSTATE_CHECKED       =  01h
TBSTATE_PRESSED       =  02h
TBSTATE_ENABLED       =  04h
TBSTATE_HIDDEN        =  08h
TBSTATE_INDETERMINATE =  10h
TBSTATE_WRAP          =  20h

TBSTYLE_BUTTON        =  00h
TBSTYLE_SEP           =  01h
TBSTYLE_CHECK         =  02h
TBSTYLE_GROUP         =  04h
TBSTYLE_CHECKGROUP    =  TBSTYLE_GROUP+TBSTYLE_CHECK

TBSTYLE_TOOLTIPS      =  0100h
TBSTYLE_WRAPABLE      =  0200h
TBSTYLE_ALTDRAG       =  0400h

TB_ENABLEBUTTON       =  (WM_USER + 1)
TB_CHECKBUTTON        =  (WM_USER + 2)
TB_PRESSBUTTON        =  (WM_USER + 3)
TB_HIDEBUTTON         =  (WM_USER + 4)
TB_INDETERMINATE      =  (WM_USER + 5)
TB_ISBUTTONENABLED    =  (WM_USER + 9)
TB_ISBUTTONCHECKED    =  (WM_USER + 10)
TB_ISBUTTONPRESSED    =  (WM_USER + 11)
TB_ISBUTTONHIDDEN     =  (WM_USER + 12)
TB_ISBUTTONINDETERMINATE = (WM_USER + 13)
TB_SETSTATE           =  (WM_USER + 17)
TB_GETSTATE           =  (WM_USER + 18)
TB_ADDBITMAP          =  (WM_USER + 19)
TB_SAVERESTOREA       =  (WM_USER + 26)
TB_SAVERESTOREW       =  (WM_USER + 76)
TB_CUSTOMIZE          =  (WM_USER + 27)
TB_ADDSTRINGA         =  (WM_USER + 28)
TB_ADDSTRINGW         =  (WM_USER + 77)
TB_GETITEMRECT        =  (WM_USER + 29)
TB_BUTTONSTRUCTSIZE   =  (WM_USER + 30)
TB_SETBUTTONSIZE      =  (WM_USER + 31)
TB_SETBITMAPSIZE      =  (WM_USER + 32)
TB_AUTOSIZE           =  (WM_USER + 33)
TB_GETTOOLTIPS        =  (WM_USER + 35)
TB_SETTOOLTIPS        =  (WM_USER + 36)
TB_SETPARENT          =  (WM_USER + 37)
TB_SETROWS            =  (WM_USER + 39)
TB_GETROWS            =  (WM_USER + 40)
TB_SETCMDID           =  (WM_USER + 42)
TB_CHANGEBITMAP       =  (WM_USER + 43)
TB_GETBITMAP          =  (WM_USER + 44)
TB_GETBUTTONTEXTA     =  (WM_USER + 45)
TB_GETBUTTONTEXTW     =  (WM_USER + 75)
TB_REPLACEBITMAP      =  (WM_USER + 46)

;====== COMMON CONTROL STYLES =====

CCS_TOP            =     00000001h
CCS_NOMOVEY        =     00000002h
CCS_BOTTOM         =     00000003h
CCS_NORESIZE       =     00000004h
CCS_NOPARENTALIGN  =     00000008h
CCS_ADJUSTABLE     =     00000020h
CCS_NODIVIDER      =     00000040h

;*******************************************************************
;
;       NMHDR
;
;*******************************************************************
NMHDR struc
    hwndFrom UINT ?
    idFrom UINT ?
    code UINT ?
NMHDR ends

;*******************************************************************
;
;       TOOLTIPTEXT
;
;*******************************************************************
TOOLTIPTEXT struc
    hdr NMHDR <?>
    lpszText ULONG ?
    szText db 80 dup(?)
    hinst ULONG ?
    uFlags UINT ?
TOOLTIPTEXT ends

TTN_NEEDTEXT equ 0FFFFFDF8h
;*******************************************************************
;
;       TEXTMETRIC
;
;*******************************************************************
TEXTMETRIC struc
    tmHeight ULONG ?
    tmAscent ULONG ?
    tmDescent ULONG ?
    tmInternalLeading ULONG ?
    tmExternalLeading ULONG ?
    tmAveCharWidth ULONG ?
    tmMaxCharWidth ULONG ?
    tmWeight ULONG ?
    tmOverhang ULONG ?
    tmDigitizedAspectX ULONG ?
    tmDigitizedAspectY ULONG ?
    tmFirstChar UCHAR ?
    tmLastChar UCHAR ?
    tmDefaultChar UCHAR ?
    tmBreakChar UCHAR ?
    tmItalic UCHAR ?
    tmUnderlined UCHAR ?
    tmStruckOut UCHAR ?
    tmPitchAndFamily UCHAR ?
    tmCharSet UCHAR ?
TEXTMETRIC ends
;*******************************************************************
;
;       Rectangle
;
;*******************************************************************

RECT    struc
        left          UINT ?
        top           UINT ?
        right         UINT ?
        bottom        UINT ?
RECT    ends

;*******************************************************************
;
;  Window Class structure
;
;*******************************************************************

WNDCLASS struc
        clsStyle          UINT     ?
        clsLpfnWndProc    ULONG    ?
        clsCbClsExtra     UINT     ?
        clsCbWndExtra     UINT     ?
        clsHInstance      UINT     ?
        clsHIcon          UINT     ?
        clsHCursor        UINT     ?
        clsHbrBackground  UINT     ?
        clsLpszMenuName   ULONG    ?
        clsLpszClassName  ULONG    ?
                hIconSm           UINT     ?
WNDCLASS ends

PAINTSTRUCT STRUC
    PShdc         UINT             ?
    PSfErase      UINT             ?
    PSrcPaint     UCHAR            size RECT dup(?)
    PSfRestore    UINT             ?
    PSfIncUpdate  UINT             ?
    PSrgbReserved UCHAR            32 dup(?)
PAINTSTRUCT ENDS

MSGSTRUCT struc
    msHWND          UINT    ?
    msMESSAGE       UINT    ?
    msWPARAM        UINT    ?
    msLPARAM        ULONG   ?
    msTIME          ULONG   ?
    msPT            ULONG   2 dup(?)
MSGSTRUCT ends

MINMAXINFO struc
  res_x               dd ?
  res_y               dd ?
  maxsize_x           dd ?
  maxsize_y           dd ?
  maxposition_x       dd ?
  maxposition_y       dd ?
  mintrackposition_x  dd ?
  mintrackposition_y  dd ?
  maxtrackposition_x  dd ?
  maxtrackposition_y  dd ?
MINMAXINFO ends
;
;   System Metrics
;
SM_CXSCREEN         =    0
SM_CYSCREEN         =    1
SM_CXVSCROLL        =    2
SM_CYHSCROLL        =    3
SM_CYCAPTION        =    4
SM_CXBORDER         =    5
SM_CYBORDER         =    6
SM_CXDLGFRAME       =    7
SM_CYDLGFRAME       =    8
SM_CYVTHUMB         =    9
SM_CXHTHUMB         =    10
SM_CXICON           =    11
SM_CYICON           =    12
SM_CXCURSOR         =    13
SM_CYCURSOR         =    14
SM_CYMENU           =    15
SM_CXFULLSCREEN     =    16
SM_CYFULLSCREEN     =    17
SM_CYKANJIWINDOW    =    18
SM_MOUSEPRESENT     =    19
SM_CYVSCROLL        =    20
SM_CXHSCROLL        =    21
SM_DEBUG            =    22
SM_SWAPBUTTON       =    23
SM_RESERVED1        =    24
SM_RESERVED2        =    25
SM_RESERVED3        =    26
SM_RESERVED4        =    27
SM_CXMIN            =    28
SM_CYMIN            =    29
SM_CXSIZE           =    30
SM_CYSIZE           =    31
SM_CXFRAME          =    32
SM_CYFRAME          =    33
SM_CXMINTRACK       =    34
SM_CYMINTRACK       =    35
SM_CXDOUBLECLK      =    36
SM_CYDOUBLECLK      =    37
SM_CXICONSPACING    =    38
SM_CYICONSPACING    =    39
SM_MENUDROPALIGNMENT =    40
SM_PENWINDOWS       =    41
SM_DBCSENABLED      =    42
SM_CMOUSEBUTTONS    =    43
SM_CXFIXEDFRAME     equ      <SM_CXDLGFRAME>
SM_CYFIXEDFRAME     equ      <SM_CYDLGFRAME>
SM_CXSIZEFRAME      equ      <SM_CXFRAME>
SM_CYSIZEFRAME      equ      <SM_CYFRAME>
SM_SECURE           =    44
SM_CXEDGE           =    45
SM_CYEDGE           =    46
SM_CXMINSPACING     =    47
SM_CYMINSPACING     =    48
SM_CXSMICON         =    49
SM_CYSMICON         =    50
SM_CYSMCAPTION      =    51
SM_CXSMSIZE         =    52
SM_CYSMSIZE         =    53
SM_CXMENUSIZE       =    54
SM_CYMENUSIZE       =    55
SM_ARRANGE          =    56
SM_CXMINIMIZED      =    57
SM_CYMINIMIZED      =    58
SM_CXMAXTRACK       =    59
SM_CYMAXTRACK       =    60
SM_CXMAXIMIZED      =    61
SM_CYMAXIMIZED      =    62
SM_NETWORK          =    63
SM_CLEANBOOT        =    67
SM_CXDRAG           =    68
SM_CYDRAG           =    69
SM_SHOWSOUNDS       =    70
SM_CXMENUCHECK      =    71
SM_CYMENUCHECK      =    72
SM_SLOWMACHINE      =    73
SM_MIDEASTENABLED   =    74
SM_CMETRICS         =    75
;
;  Stock Logical Objects
;
WHITE_BRUSH         =  0
LTGRAY_BRUSH        =  1
GRAY_BRUSH          =  2
DKGRAY_BRUSH        =  3
BLACK_BRUSH         =  4
NULL_BRUSH          =  5
HOLLOW_BRUSH        =  5
WHITE_PEN           =  6
BLACK_PEN           =  7
NULL_PEN            =  8
DOT_MARKER          =  9
OEM_FIXED_FONT      = 10
ANSI_FIXED_FONT     = 11
ANSI_VAR_FONT       = 12
SYSTEM_FONT         = 13
DEVICE_DEFAULT_FONT = 14
DEFAULT_PALETTE     = 15
SYSTEM_FIXED_FONT   = 16

; ===================
; edit control styles
; ===================
;
ES_LEFT				equ	0000h
ES_CENTER			equ	0001h
ES_RIGHT			equ	0002h
ES_MULTILINE			equ	0004h
ES_UPPERCASE			equ	0008h
ES_LOWERCASE			equ	0010h
ES_PASSWORD			equ	0020h
ES_AUTOVSCROLL			equ	0040h
ES_AUTOHSCROLL			equ	0080h
ES_NOHIDESEL			equ	0100h
ES_OEMCONVERT			equ	0400h
ES_READONLY			equ	0800h
ES_WANTRETURN			equ	1000h
ES_NUMBER			equ	2000h
;

;
; =============
; dialog styles
; =============
;
DS_ABSALIGN			equ	0001h
DS_SYSMODAL			equ	0002h
DS_3DLOOK			equ	0004h
DS_FIXEDSYS			equ	0008h
DS_NOFAILCREATE			equ	0010h
DS_LOCALEDIT			equ	0020h	;edit items get local storage
DS_SETFONT			equ	0040h	;user specified font
DS_MODALFRAME			equ	0080h	;combinable with WS_CAPTION
DS_NOIDLEMSG			equ	0100h	;don't send WM_ENTERIDLE
DS_SETFOREGROUND		equ	0200h
DS_CONTROL			equ	0400h
DS_CENTER			equ	0800h
DS_CENTERMOUSE			equ	1000h
DS_CONTEXTHELP			equ	2000h
;
DS_MODAL			equ	DS_ABSALIGN+DS_MODALFRAME
DS_MODELESS			equ	DS_ABSALIGN
;
;------------------------------------------------------------------------------

;
; Brush Styles
;
BS_SOLID        =   0
BS_NULL         =   1
BS_HATCHED      =   2
BS_PATTERN      =   3
BS_INDEXED      =   4
BS_DIBPATTERN   =   5
;
; Hatch Styles
;
HS_HORIZONTAL   =   0       ; -----
HS_VERTICAL     =   1       ; |||||
HS_FDIAGONAL    =   2       ; \\\\\
HS_BDIAGONAL    =   3       ; /////
HS_CROSS        =   4       ; +++++
HS_DIAGCROSS    =   5       ; xxxxx
;
; Pen Styles
;
PS_SOLID        =   0
PS_DASH         =   1       ; -------
PS_DOT          =   2       ; .......
PS_DASHDOT      =   3       ; _._._._
PS_DASHDOTDOT   =   4       ; _.._.._
PS_NULL         =   5
PS_INSIDEFRAME  =   6

;
;  Window State Messages
;
IFNDEF  NOWM
WM_STATE            = 0000H

WM_NULL             = 0000h
WM_CREATE           = 0001h
WM_DESTROY          = 0002h
WM_MOVE             = 0003h
WM_SIZE             = 0005h
WM_ACTIVATE         = 0006h
WM_SETFOCUS         = 0007h
WM_KILLFOCUS        = 0008h
WM_ENABLE           = 000Ah
WM_SETREDRAW        = 000Bh
WM_SETTEXT          = 000Ch
WM_GETTEXT          = 000Dh
WM_GETTEXTLENGTH    = 000Eh
WM_PAINT            = 000Fh
WM_CLOSE            = 0010h
WM_QUERYENDSESSION  = 0011h
WM_QUIT             = 0012h
WM_QUERYOPEN        = 0013h
WM_ERASEBKGND       = 0014h
WM_SYSCOLORCHANGE   = 0015h
WM_ENDSESSION       = 0016h
WM_SYSTEMERROR      = 0017h
WM_SHOWWINDOW       = 0018h
WM_CTLCOLORMSGBOX		equ	0132h
WM_CTLCOLOREDIT			equ	0133h
WM_CTLCOLORLISTBOX		equ	0134h
WM_CTLCOLORBTN			equ	0135h
WM_CTLCOLORDLG			equ	0136h
WM_CTLCOLORSCROLLBAR		equ	0137h
WM_CTLCOLORSTATIC		equ	0138h
WM_CTLCOLOR         = 0019h
WM_WININICHANGE     = 001Ah
WM_DEVMODECHANGE    = 001Bh
WM_ACTIVATEAPP      = 001Ch
WM_FONTCHANGE       = 001Dh
WM_TIMECHANGE       = 001Eh
WM_CANCELMODE       = 001Fh
WM_SETCURSOR        = 0020h
WM_MOUSEACTIVATE    = 0021h
WM_CHILDACTIVATE    = 0022h
WM_QUEUESYNC        = 0023h
WM_GETMINMAXINFO    = 0024h
WM_PAINTICON        = 0026h
WM_ICONERASEBKGND   = 0027h
WM_NEXTDLGCTL       = 0028h
WM_SPOOLERSTATUS    = 002Ah
WM_DRAWITEM         = 002Bh
WM_MEASUREITEM      = 002Ch
WM_DELETEITEM       = 002Dh
WM_VKEYTOITEM       = 002Eh
WM_CHARTOITEM       = 002Fh
WM_SETFONT          = 0030h
WM_GETFONT          = 0031h
WM_QUERYDRAGICON    = 0037h
WM_COMPAREITEM      = 0039h
WM_COMPACTING       = 0041h
WM_COMMNOTIFY       = 0044h
WM_WINDOWPOSCHANGING= 0046h
WM_WINDOWPOSCHANGED = 0047h
WM_POWER            = 0048h
WM_NOTIFY           = 004eh

WM_NCCREATE         = 0081h
WM_NCDESTROY        = 0082h
WM_NCCALCSIZE       = 0083h
WM_NCHITTEST        = 0084h
WM_NCPAINT          = 0085h
WM_NCACTIVATE       = 0086h
WM_GETDLGCODE       = 0087h
WM_NCMOUSEMOVE      = 00A0h
WM_NCLBUTTONDOWN    = 00A1h
WM_NCLBUTTONUP      = 00A2h
WM_NCLBUTTONDBLCLK  = 00A3h
WM_NCRBUTTONDOWN    = 00A4h
WM_NCRBUTTONUP      = 00A5h
WM_NCRBUTTONDBLCLK  = 00A6h
WM_NCMBUTTONDOWN    = 00A7h
WM_NCMBUTTONUP      = 00A8h
WM_NCMBUTTONDBLCLK  = 00A9h

WM_KEYFIRST         = 0100h
WM_KEYDOWN          = 0100h
WM_KEYUP            = 0101h
WM_CHAR             = 0102h
WM_DEADCHAR         = 0103h
WM_SYSKEYDOWN       = 0104h
WM_SYSKEYUP         = 0105h
WM_SYSCHAR          = 0106h
WM_SYSDEADCHAR      = 0107h
WM_KEYLAST          = 0108h

WM_INITDIALOG       = 0110h
WM_COMMAND          = 0111h
WM_SYSCOMMAND       = 0112h
WM_TIMER            = 0113h
WM_HSCROLL          = 0114h
WM_VSCROLL          = 0115h
WM_INITMENU         = 0116h
WM_INITMENUPOPUP    = 0117h
WM_MENUSELECT       = 011Fh
WM_MENUCHAR         = 0120h
WM_ENTERIDLE        = 0121h


WM_MOUSEFIRST       = 0200h
WM_MOUSEMOVE        = 0200h
WM_LBUTTONDOWN      = 0201h
WM_LBUTTONUP        = 0202h
WM_LBUTTONDBLCLK    = 0203h
WM_RBUTTONDOWN      = 0204h
WM_RBUTTONUP        = 0205h
WM_RBUTTONDBLCLK    = 0206h
WM_MBUTTONDOWN      = 0207h
WM_MBUTTONUP        = 0208h
WM_MBUTTONDBLCLK    = 0209h
WM_MOUSELAST        = 0209h

WM_PARENTNOTIFY     = 0210h
WM_MDICREATE        = 0220h
WM_MDIDESTROY       = 0221h
WM_MDIACTIVATE      = 0222h
WM_MDIRESTORE       = 0223h
WM_MDINEXT          = 0224h
WM_MDIMAXIMIZE      = 0225h
WM_MDITILE          = 0226h
WM_MDICASCADE       = 0227h
WM_MDIICONARRANGE   = 0228h
WM_MDIGETACTIVE     = 0229h
WM_MDISETMENU       = 0230h
WM_DROPFILES        = 0233h


WM_CUT              = 0300h
WM_COPY             = 0301h
WM_PASTE            = 0302h
WM_CLEAR            = 0303h
WM_UNDO             = 0304h
WM_RENDERFORMAT     = 0305h
WM_RENDERALLFORMATS = 0306h
WM_DESTROYCLIPBOARD = 0307h
WM_DRAWCLIPBOARD    = 0308h
WM_PAINTCLIPBOARD   = 0309h
WM_VSCROLLCLIPBOARD = 030Ah
WM_SIZECLIPBOARD    = 030Bh
WM_ASKCBFORMATNAME  = 030Ch
WM_CHANGECBCHAIN    = 030Dh
WM_HSCROLLCLIPBOARD = 030Eh
WM_QUERYNEWPALETTE  = 030Fh
WM_PALETTEISCHANGING = 0310h
WM_PALETTECHANGED   = 0311h

WM_PENWINFIRST      equ 0380h
WM_PENWINLAST       equ 038Fh

WM_COALESCE_FIRST  equ 0390h
WM_COALESCE_LAST   equ 039Fh

;  private window messages start here
WM_USER             = 0400H
ENDIF           ; NOWM

; WM_MOUSEACTIVATE Return Codes
MA_ACTIVATE       =  1
MA_ACTIVATEANDEAT =  2
MA_NOACTIVATE     =  3

; Size message commands
SIZENORMAL       = 0
SIZEICONIC       = 1
SIZEFULLSCREEN   = 2
SIZEZOOMSHOW     = 3
SIZEZOOMHIDE     = 4

; =====================
; static control styles
; =====================
;
SS_LEFT				equ	0000h
SS_CENTER			equ	0001h
SS_RIGHT			equ	0002h
SS_ICON				equ	0003h
SS_BLACKRECT			equ	0004h
SS_GRAYRECT			equ	0005h
SS_WHITERECT			equ	0006h
SS_BLACKFRAME			equ	0007h
SS_GRAYFRAME			equ	0008h
SS_WHITEFRAME			equ	0009h
SS_USERITEM			equ	000Ah
SS_SIMPLE			equ	000Bh
SS_LEFTNOWORDWRAP		equ	000Ch
SS_BITMAP			equ	000Eh
SS_OWNERDRAW			equ	000Dh
SS_ENHMETAFILE			equ	000Fh
SS_ETCHEDHORZ			equ	0010h
SS_ETCHEDVERT			equ	0011h
SS_ETCHEDFRAME			equ	0012h
SS_TYPEMASK			equ	001Fh
SS_NOPREFIX			equ	0080h
SS_NOTIFY			equ	0100h
SS_CENTERIMAGE			equ	0200h
SS_RIGHTJUST			equ	0400h
SS_REALSIZEIMAGE		equ	0800h
SS_SUNKEN			equ	1000h
;

; ShowWindow() Commands
SW_HIDE            = 0
SW_SHOWNORMAL      = 1
SW_NORMAL          = 1
SW_SHOWMINIMIZED   = 2
SW_SHOWMAXIMIZED   = 3
SW_MAXIMIZE        = 3
SW_SHOWNOACTIVATE  = 4
SW_SHOW            = 5
SW_MINIMIZE        = 6
SW_SHOWMINNOACTIVE = 7
SW_SHOWNA          = 8
SW_RESTORE         = 9

; Old ShowWindow() Commands
HIDE_WINDOW        = 0
SHOW_OPENWINDOW    = 1
SHOW_ICONWINDOW    = 2
SHOW_FULLSCREEN    = 3
SHOW_OPENNOACTIVATE= 4

;  identifiers for the WM_SHOWWINDOW message
SW_PARENTCLOSING =  1
SW_OTHERZOOM     =  2
SW_PARENTOPENING =  3
SW_OTHERUNZOOM   =  4
;
; Key state masks for mouse messages
;
MK_LBUTTON       = 0001h
MK_RBUTTON       = 0002h
MK_SHIFT         = 0004h
MK_CONTROL       = 0008h
MK_MBUTTON       = 0010h
;
; Class styles
;
CS_VREDRAW         = 0001h
CS_HREDRAW         = 0002h
CS_KEYCVTWINDOW    = 0004H
CS_DBLCLKS         = 0008h
SBS_SIZEGRIP       = 0010h
CS_OWNDC           = 0020h
CS_CLASSDC         = 0040h
CS_PARENTDC        = 0080h
CS_NOKEYCVT        = 0100h
CS_SAVEBITS        = 0800h
CS_NOCLOSE         = 0200h
CS_BYTEALIGNCLIENT = 1000h
CS_BYTEALIGNWINDOW = 2000h
CS_GLOBALCLASS     = 4000h    ; Global window class

;
; Special CreateWindow position value
;
CW_USEDEFAULT   EQU    80000000h

;
; Windows styles
;
WS_OVERLAPPED   = 000000000h
WS_ICONICPOPUP  = 0C0000000h
WS_POPUP        = 080000000h
WS_CHILD        = 040000000h
WS_MINIMIZE     = 020000000h
WS_VISIBLE      = 010000000h
WS_DISABLED     = 008000000h
WS_CLIPSIBLINGS = 004000000h
WS_CLIPCHILDREN = 002000000h
WS_MAXIMIZE     = 001000000h
WS_CAPTION      = 000C00000h     ; WS_BORDER | WS_DLGFRAME
WS_BORDER       = 000800000h
WS_DLGFRAME     = 000400000h
WS_VSCROLL      = 000200000h
WS_HSCROLL      = 000100000h
WS_SYSMENU      = 000080000h
WS_THICKFRAME   = 000040000h
WS_HREDRAW      = 000020000h
WS_VREDRAW      = 000010000h
WS_GROUP        = 000020000h
WS_TABSTOP      = 000010000h
WS_MINIMIZEBOX  = 000020000h
WS_MAXIMIZEBOX  = 000010000h

;
; ======================
; extended window styles
; ======================
;
WS_EX_NONE			equ	00000000h
WS_EX_DLGMODALFRAME		equ	00000001h
WS_EX_NOPARENTNOTIFY		equ	00000004h
WS_EX_TOPMOST			equ	00000008h
WS_EX_ACCEPTFILES		equ	00000010h
WS_EX_TRANSPARENT		equ	00000020h
WS_EX_MDICHILD			equ	00000040h
WS_EX_TOOLWINDOW		equ	00000080h
WS_EX_WINDOWEDGE		equ	00000100h
WS_EX_CLIENTEDGE		equ	00000200h
WS_EX_CONTEXTHELP		equ	00000400h
WS_EX_RIGHT			equ	00001000h
WS_EX_LEFT			equ	00000000h
WS_EX_RTLREADING		equ	00002000h
WS_EX_LTRREADING		equ	00000000h
WS_EX_LEFTSCROLLBAR		equ	00004000h
WS_EX_RIGHTSCROLLBAR		equ	00000000h
WS_EX_CONTROLPARENT		equ	00010000h
WS_EX_STATICEDGE		equ	00020000h
WS_EX_APPWINDOW			equ	00040000h
;
WS_EX_OVERLAPPEDWINDOW		equ	00000300h
WS_EX_PALETTEWINDOW		equ	00000188h

; Common Window Styles

WS_OVERLAPPEDWINDOW = WS_OVERLAPPED OR WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX
WS_POPUPWINDOW  = WS_POPUP OR WS_BORDER OR WS_SYSMENU
WS_CHILDWINDOW  = WS_CHILD
WS_TILEDWINDOW  = WS_OVERLAPPEDWINDOW

WS_TILED        = WS_OVERLAPPED
WS_ICONIC       = WS_MINIMIZE
WS_SIZEBOX      = WS_THICKFRAME

; Extended Window Styles (low words)
WS_EX_DLGMODALFRAME  = 0001
WS_EX_DRAGOBJECT     = 0002
WS_EX_NOPARENTNOTIFY = 0004
WS_EX_TOPMOST        = 0008


; PeekMessage() Options
PM_NOREMOVE    = 0000h
PM_REMOVE      = 0001h
PM_NOYIELD     = 0002h

; SetWindowPos Flags
SWP_NOSIZE       =  0001h
SWP_NOMOVE       =  0002h
SWP_NOZORDER     =  0004h
SWP_NOREDRAW     =  0008h
SWP_NOACTIVATE   =  0010h
SWP_DRAWFRAME    =  0020h
SWP_SHOWWINDOW   =  0040h
SWP_HIDEWINDOW   =  0080h
SWP_NOCOPYBITS   =  0100h
SWP_NOREPOSITION =  0200h
;
;  Predefined cursor & icon IDs
;
IDC_ARROW       = 32512
IDC_IBEAM       = 32513
IDC_WAIT        = 32514
IDC_CROSS       = 32515
IDC_UPARROW     = 32516
IDC_SIZE        = 32640
IDC_ICON        = 32641
IDC_SIZENWSE    = 32642
IDC_SIZENESW    = 32643
IDC_SIZEWE      = 32644
IDC_SIZENS      = 32645

IDI_APPLICATION = 32512
IDI_HAND        = 32513
IDI_QUESTION    = 32514
IDI_EXCLAMATION = 32515
IDI_ASTERISK    = 32516

COLOR_SCROLLBAR           = 0
COLOR_BACKGROUND          = 1
COLOR_ACTIVECAPTION       = 2
COLOR_INACTIVECAPTION     = 3
COLOR_MENU                = 4
COLOR_WINDOW              = 5
COLOR_WINDOWFRAME         = 6
COLOR_MENUTEXT            = 7
COLOR_WINDOWTEXT          = 8
COLOR_CAPTIONTEXT         = 9
COLOR_ACTIVEBORDER        = 10
COLOR_INACTIVEBORDER      = 11
COLOR_APPWORKSPACE        = 12
COLOR_HIGHLIGHT           = 13
COLOR_HIGHLIGHTTEXT       = 14
COLOR_BTNFACE             = 15
COLOR_BTNSHADOW           = 16
COLOR_GRAYTEXT            = 17
COLOR_BTNTEXT             = 18
COLOR_INACTIVECAPTIONTEXT            equ 19
COLOR_BTNHIGHLIGHT                   equ 20
COLOR_3DDKSHADOW                     equ 21
COLOR_3DLIGHT                        equ 22
COLOR_INFOTEXT                       equ 23
COLOR_INFOBK                         equ 24
COLOR_DESKTOP                        equ COLOR_BACKGROUND
COLOR_3DFACE                         equ COLOR_BTNFACE
COLOR_3DSHADOW                       equ COLOR_BTNSHADOW
COLOR_3DHIGHLIGHT                    equ COLOR_BTNHIGHLIGHT
COLOR_3DHILIGHT                      equ COLOR_BTNHIGHLIGHT
COLOR_BTNHILIGHT                     equ COLOR_BTNHIGHLIGHT
;
;  MessageBox type flags
;
MB_OK                   = 0000H
MB_OKCANCEL             = 0001H
MB_ABORTRETRYIGNORE     = 0002H
MB_YESNOCANCEL          = 0003H
MB_YESNO                = 0004H
MB_RETRYCANCEL          = 0005H

MB_ICONHAND             = 0010H
MB_ICONQUESTION         = 0020H
MB_ICONEXCLAMATION      = 0030H
MB_ICONASTERISK         = 0040H

MB_DEFBUTTON1           = 0000H
MB_DEFBUTTON2           = 0100H
MB_DEFBUTTON3           = 0200H

MB_APPLMODAL            = 0000H
MB_SYSTEMMODAL          = 1000H
MB_TASKMODAL            = 2000H

MB_NOFOCUS              = 8000H

;
;  Conventional dialog box and message box command IDs
;
IDOK     =   1
IDCANCEL =   2
IDABORT  =   3
IDRETRY  =   4
IDIGNORE =   5
IDYES    =   6
IDNO     =   7
;
;  Button Control Styles 
;
BS_PUSHBUTTON		EQU		000000000h
BS_DEFPUSHBUTTON		EQU		000000001h
BS_CHECKBOX		EQU		000000002h
BS_AUTOCHECKBOX		EQU		000000003h
BS_RADIOBUTTON		EQU		000000004h
BS_3STATE		EQU		000000005h
BS_AUTO3STATE		EQU		000000006h
BS_GROUPBOX		EQU		000000007h
BS_USERBUTTON		EQU		000000008h
BS_AUTORADIOBUTTON	EQU		000000009h
BS_PUSHBOX		EQU		00000000ah
BS_OWNERDRAW		EQU		00000000bh
BS_LEFTTEXT		EQU		000000020h
;
;  User Button Notification Codes 
;
BN_CLICKED		EQU		0t
BN_PAINT		EQU		1t
BN_HILITE		EQU		2t
BN_UNHILITE		EQU		3t
BN_DISABLE		EQU		4t
BN_DOUBLECLICKED	EQU		5t
;
;  Button Control Messages
;
BM_GETCHECK		EQU		000000400h
BM_SETCHECK		EQU		000000401h
BM_GETSTATE		EQU		000000402h
BM_SETSTATE		EQU		000000403h
BM_SETSTYLE		EQU		000000404h
;
;  Edit Control Messages
;
EM_GETSEL             =  00B0h
EM_SETSEL             =  00B1h
EM_GETRECT            =  00B2h
EM_SETRECT            =  00B3h
EM_SETRECTNP          =  00B4h
EM_SCROLL             =  00B5h
EM_LINESCROLL         =  00B6h
EM_SCROLLCARET        =  00B7h
EM_GETMODIFY          =  00B8h
EM_SETMODIFY          =  00B9h
EM_GETLINECOUNT       =  00BAh
EM_LINEINDEX          =  00BBh
EM_SETHANDLE          =  00BCh
EM_GETHANDLE          =  00BDh
EM_GETTHUMB           =  00BEh
EM_LINELENGTH         =  00C1h
EM_REPLACESEL         =  00C2h
EM_GETLINE            =  00C4h
EM_LIMITTEXT          =  00C5h
EM_CANUNDO            =  00C6h
EM_UNDO               =  00C7h
EM_FMTLINES           =  00C8h
EM_LINEFROMCHAR       =  00C9h
EM_SETTABSTOPS        =  00CBh
EM_SETPASSWORDCHAR    =  00CCh
EM_EMPTYUNDOBUFFER    =  00CDh
EM_GETFIRSTVISIBLELINE=  00CEh
EM_SETREADONLY        =  00CFh
EM_SETWORDBREAKPROC   =  00D0h
EM_GETWORDBREAKPROC   =  00D1h
EM_GETPASSWORDCHAR    =  00D2h
EM_SETMARGINS         =  00D3h
EM_GETMARGINS         =  00D4h
EM_SETLIMITTEXT       equ  <EM_LIMITTEXT>
EM_GETLIMITTEXT       =  00D5h
EM_POSFROMCHAR        =  00D6h
EM_CHARFROMPOS        =  00D7h

EM_GETCHARFORMAT	  =  0458h
EM_SETCHARFORMAT	  =  0468h
