VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "WorldEditor"
   ClientHeight    =   10740
   ClientLeft      =   390
   ClientTop       =   840
   ClientWidth     =   15270
   Icon            =   "frmMain.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   716
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1018
   StartUpPosition =   1  'CenterOwner
   Visible         =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.PictureBox picRadar 
      BackColor       =   &H00400040&
      BorderStyle     =   0  'None
      Height          =   1590
      Left            =   120
      ScaleHeight     =   106
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   107
      TabIndex        =   97
      Top             =   120
      Width           =   1605
      Begin VB.Label FPS 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "FPS: ??"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0FFFF&
         Height          =   150
         Left            =   1065
         TabIndex        =   99
         Top             =   1440
         Width           =   450
      End
      Begin VB.Label POSX 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "X: ?? - Y:??"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   150
         Left            =   120
         TabIndex        =   98
         Top             =   1440
         Width           =   675
      End
      Begin VB.Shape ApuntadorRadar 
         BackColor       =   &H00FFFFFF&
         BorderColor     =   &H00FFFFFF&
         BorderStyle     =   6  'Inside Solid
         DrawMode        =   6  'Mask Pen Not
         FillColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   600
         Top             =   600
         Width           =   375
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H00000000&
         Height          =   1365
         Left            =   120
         Top             =   105
         Width           =   1365
      End
   End
   Begin WorldEditor.lvButtons_H SelectPanel 
      Height          =   1035
      Index           =   6
      Left            =   13320
      TabIndex        =   46
      Top             =   30
      Width           =   1815
      _extentx        =   3201
      _extenty        =   1826
      caption         =   "Tri&gger's (F12)"
      capalign        =   2
      backstyle       =   2
      shape           =   1
      cgradient       =   8421631
      font            =   "frmMain.frx":628A
      mode            =   1
      value           =   0   'False
      customclick     =   1
      image           =   "frmMain.frx":62AE
      imgsize         =   24
      imgalign        =   5
      cback           =   -2147483633
      lockhover       =   1
   End
   Begin WorldEditor.lvButtons_H SelectPanel 
      Height          =   1035
      Index           =   5
      Left            =   11805
      TabIndex        =   45
      Top             =   30
      Width           =   2565
      _extentx        =   4524
      _extenty        =   1826
      caption         =   "&Objetos (F11)"
      capalign        =   2
      backstyle       =   2
      shape           =   3
      cgradient       =   8421631
      font            =   "frmMain.frx":6874
      mode            =   1
      value           =   0   'False
      customclick     =   1
      image           =   "frmMain.frx":6898
      imgsize         =   24
      imgalign        =   5
      cback           =   -2147483633
      lockhover       =   1
   End
   Begin WorldEditor.lvButtons_H SelectPanel 
      Height          =   1035
      Index           =   4
      Left            =   10320
      TabIndex        =   44
      Top             =   30
      Width           =   2535
      _extentx        =   4471
      _extenty        =   1826
      caption         =   "NPC's &Hostiles (F9)"
      capalign        =   2
      backstyle       =   2
      shape           =   3
      cgradient       =   8421631
      font            =   "frmMain.frx":6D9A
      mode            =   1
      value           =   0   'False
      customclick     =   1
      image           =   "frmMain.frx":6DBE
      imgsize         =   24
      imgalign        =   5
      cback           =   -2147483633
      lockhover       =   1
   End
   Begin WorldEditor.lvButtons_H SelectPanel 
      Height          =   1035
      Index           =   3
      Left            =   8955
      TabIndex        =   43
      Top             =   30
      Width           =   2415
      _extentx        =   4260
      _extenty        =   1826
      caption         =   "&NPC's (F8)"
      capalign        =   2
      backstyle       =   2
      shape           =   3
      cgradient       =   8421631
      font            =   "frmMain.frx":7198
      mode            =   1
      value           =   0   'False
      customclick     =   1
      image           =   "frmMain.frx":71BC
      imgsize         =   24
      imgalign        =   5
      cback           =   -2147483633
      lockhover       =   1
   End
   Begin WorldEditor.lvButtons_H SelectPanel 
      Height          =   1035
      Index           =   2
      Left            =   7440
      TabIndex        =   42
      Top             =   30
      Width           =   2565
      _extentx        =   4524
      _extenty        =   1826
      caption         =   "&Bloqueos (F7)"
      capalign        =   2
      backstyle       =   2
      shape           =   3
      cgradient       =   8421631
      font            =   "frmMain.frx":7572
      mode            =   1
      value           =   0   'False
      customclick     =   1
      image           =   "frmMain.frx":759E
      imgsize         =   24
      imgalign        =   5
      cback           =   -2147483633
      lockhover       =   1
   End
   Begin WorldEditor.lvButtons_H SelectPanel 
      Height          =   1035
      Index           =   1
      Left            =   5925
      TabIndex        =   41
      Top             =   30
      Width           =   2565
      _extentx        =   4524
      _extenty        =   1826
      caption         =   "&Translados (F6)"
      capalign        =   2
      backstyle       =   2
      shape           =   3
      cgradient       =   8421631
      font            =   "frmMain.frx":7920
      mode            =   1
      value           =   0   'False
      image           =   "frmMain.frx":7944
      imgsize         =   24
      imgalign        =   5
      cback           =   -2147483633
      lockhover       =   1
   End
   Begin WorldEditor.lvButtons_H SelectPanel 
      Height          =   1035
      Index           =   0
      Left            =   5160
      TabIndex        =   40
      Top             =   30
      Width           =   1815
      _extentx        =   3201
      _extenty        =   1826
      caption         =   "&Superficie (F5)"
      capalign        =   2
      backstyle       =   2
      shape           =   2
      cgradient       =   8421631
      cfore           =   0
      font            =   "frmMain.frx":AFA6
      mode            =   1
      value           =   0   'False
      image           =   "frmMain.frx":AFCA
      imgsize         =   24
      imgalign        =   5
      cfhover         =   0
      cback           =   -2147483633
   End
   Begin WorldEditor.lvButtons_H cmdQuitarFunciones 
      Height          =   435
      Left            =   1800
      TabIndex        =   39
      ToolTipText     =   "Quitar Todas las Funciones Activadas"
      Top             =   1320
      Width           =   2655
      _extentx        =   4683
      _extenty        =   767
      caption         =   "&Quitar Funciones (F4)"
      capalign        =   2
      backstyle       =   2
      cgradient       =   0
      font            =   "frmMain.frx":E510
      mode            =   0
      value           =   0   'False
      cback           =   12632319
   End
   Begin VB.Timer TimAutoGuardarMapa 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   3960
      Top             =   1920
   End
   Begin VB.TextBox StatTxt 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000012&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   4275
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      TabStop         =   0   'False
      Text            =   "frmMain.frx":E53C
      Top             =   6360
      Width           =   4320
   End
   Begin VB.PictureBox pPaneles 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4395
      Left            =   120
      Picture         =   "frmMain.frx":E57E
      ScaleHeight     =   4365
      ScaleWidth      =   4365
      TabIndex        =   6
      Top             =   1800
      Width           =   4395
      Begin VB.TextBox tTY 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   315
         Left            =   1200
         TabIndex        =   87
         Text            =   "1"
         Top             =   960
         Visible         =   0   'False
         Width           =   2900
      End
      Begin VB.TextBox tTX 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   315
         Left            =   1200
         TabIndex        =   86
         Text            =   "1"
         Top             =   600
         Visible         =   0   'False
         Width           =   2900
      End
      Begin VB.TextBox tTMapa 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   315
         Left            =   1200
         TabIndex        =   85
         Text            =   "1"
         Top             =   240
         Visible         =   0   'False
         Width           =   2900
      End
      Begin WorldEditor.lvButtons_H cInsertarTrans 
         Height          =   375
         Left            =   240
         TabIndex        =   88
         Top             =   1320
         Visible         =   0   'False
         Width           =   3855
         _extentx        =   6800
         _extenty        =   661
         caption         =   "&Insertar Translado"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20BE2
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cInsertarTransOBJ 
         Height          =   375
         Left            =   240
         TabIndex        =   89
         Top             =   1680
         Visible         =   0   'False
         Width           =   3855
         _extentx        =   6800
         _extenty        =   661
         caption         =   "Colocar automaticamente &Objeto"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20C06
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cUnionManual 
         Height          =   375
         Left            =   240
         TabIndex        =   90
         Top             =   2160
         Visible         =   0   'False
         Width           =   3855
         _extentx        =   6800
         _extenty        =   661
         caption         =   "&Union con Mapa Adyacente (manual)"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20C2A
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cUnionAuto 
         Height          =   375
         Left            =   240
         TabIndex        =   91
         Top             =   2520
         Visible         =   0   'False
         Width           =   3855
         _extentx        =   6800
         _extenty        =   661
         caption         =   "Union con Mapas &Adyacentes (auto)"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20C4E
         mode            =   0
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cQuitarTrans 
         Height          =   375
         Left            =   240
         TabIndex        =   92
         Top             =   3000
         Visible         =   0   'False
         Width           =   3855
         _extentx        =   6800
         _extenty        =   661
         caption         =   "&Quitar Translados"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20C72
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin VB.ComboBox cCapas 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         ItemData        =   "frmMain.frx":20C96
         Left            =   1080
         List            =   "frmMain.frx":20CA6
         TabIndex        =   74
         Text            =   "1"
         Top             =   3120
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.ComboBox cGrh 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Left            =   2880
         TabIndex        =   73
         Text            =   "1"
         Top             =   3120
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.ComboBox cFiltro 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   0
         Left            =   600
         TabIndex        =   72
         Top             =   2760
         Visible         =   0   'False
         Width           =   3615
      End
      Begin VB.ListBox lListado 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   2580
         Index           =   0
         ItemData        =   "frmMain.frx":20CB6
         Left            =   120
         List            =   "frmMain.frx":20CB8
         Sorted          =   -1  'True
         TabIndex        =   71
         Tag             =   "-1"
         Top             =   120
         Visible         =   0   'False
         Width           =   4095
      End
      Begin WorldEditor.lvButtons_H cQuitarEnTodasLasCapas 
         Height          =   375
         Left            =   120
         TabIndex        =   75
         Top             =   3840
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "Quitar en &Capas 2 y 3"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20CBA
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cQuitarEnEstaCapa 
         Height          =   375
         Left            =   120
         TabIndex        =   76
         Top             =   3480
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "&Quitar en esta Capa"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20CDE
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cSeleccionarSuperficie 
         Height          =   735
         Left            =   2400
         TabIndex        =   77
         Top             =   3480
         Visible         =   0   'False
         Width           =   1815
         _extentx        =   3201
         _extenty        =   1296
         caption         =   "&Insertar Superficie"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20D02
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin VB.ComboBox cNumFunc 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   2
         ItemData        =   "frmMain.frx":20D26
         Left            =   3360
         List            =   "frmMain.frx":20D28
         TabIndex        =   67
         Text            =   "1"
         Top             =   3120
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.ComboBox cCantFunc 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   2
         ItemData        =   "frmMain.frx":20D2A
         Left            =   840
         List            =   "frmMain.frx":20D2C
         TabIndex        =   66
         Text            =   "1"
         Top             =   3120
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.ListBox lListado 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   2580
         Index           =   3
         ItemData        =   "frmMain.frx":20D2E
         Left            =   120
         List            =   "frmMain.frx":20D30
         TabIndex        =   65
         Tag             =   "-1"
         Top             =   120
         Visible         =   0   'False
         Width           =   4095
      End
      Begin VB.ComboBox cFiltro 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   3
         Left            =   600
         TabIndex        =   64
         Top             =   2760
         Visible         =   0   'False
         Width           =   3615
      End
      Begin VB.ComboBox cCantFunc 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   0
         ItemData        =   "frmMain.frx":20D32
         Left            =   840
         List            =   "frmMain.frx":20D34
         TabIndex        =   57
         Text            =   "1"
         Top             =   3120
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.ComboBox cNumFunc 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   0
         ItemData        =   "frmMain.frx":20D36
         Left            =   3360
         List            =   "frmMain.frx":20D38
         TabIndex        =   56
         Text            =   "1"
         Top             =   3120
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.ComboBox cFiltro 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   1
         Left            =   600
         TabIndex        =   55
         Top             =   2760
         Visible         =   0   'False
         Width           =   3615
      End
      Begin VB.ListBox lListado 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   2580
         Index           =   1
         ItemData        =   "frmMain.frx":20D3A
         Left            =   120
         List            =   "frmMain.frx":20D3C
         TabIndex        =   54
         Tag             =   "-1"
         Top             =   120
         Visible         =   0   'False
         Width           =   4095
      End
      Begin VB.ListBox lListado 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   3210
         Index           =   4
         ItemData        =   "frmMain.frx":20D3E
         Left            =   120
         List            =   "frmMain.frx":20D40
         TabIndex        =   53
         Tag             =   "-1"
         Top             =   120
         Visible         =   0   'False
         Width           =   4095
      End
      Begin VB.PictureBox Picture5 
         Height          =   0
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   0
         TabIndex        =   8
         Top             =   0
         Width           =   0
      End
      Begin VB.PictureBox Picture6 
         Height          =   0
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   0
         TabIndex        =   9
         Top             =   0
         Width           =   0
      End
      Begin VB.PictureBox Picture7 
         Height          =   0
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   0
         TabIndex        =   10
         Top             =   0
         Width           =   0
      End
      Begin VB.PictureBox Picture8 
         Height          =   0
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   0
         TabIndex        =   11
         Top             =   0
         Width           =   0
      End
      Begin VB.PictureBox Picture9 
         Height          =   0
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   0
         TabIndex        =   12
         Top             =   0
         Width           =   0
      End
      Begin VB.PictureBox Picture11 
         Height          =   0
         Left            =   0
         ScaleHeight     =   0
         ScaleWidth      =   0
         TabIndex        =   49
         Top             =   0
         Width           =   0
      End
      Begin WorldEditor.lvButtons_H cQuitarTrigger 
         Height          =   375
         Left            =   120
         TabIndex        =   50
         Top             =   3840
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "&Quitar Trigger's"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20D42
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cVerTriggers 
         Height          =   375
         Left            =   120
         TabIndex        =   51
         Top             =   3480
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "&Mostrar Trigger's"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20D66
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cInsertarTrigger 
         Height          =   735
         Left            =   2400
         TabIndex        =   52
         Top             =   3480
         Visible         =   0   'False
         Width           =   1815
         _extentx        =   3201
         _extenty        =   1296
         caption         =   "&Insertar Trigger"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20D8A
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cAgregarFuncalAzar 
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   58
         Top             =   3480
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "Insetar NPC's al &Azar"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20DAE
         mode            =   0
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cQuitarFunc 
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   59
         Top             =   3840
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "&Quitar NPC's"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20DD2
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cInsertarFunc 
         Height          =   735
         Index           =   0
         Left            =   2400
         TabIndex        =   60
         Top             =   3480
         Visible         =   0   'False
         Width           =   1815
         _extentx        =   3201
         _extenty        =   1296
         caption         =   "&Insertar NPC's"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20DF6
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cVerBloqueos 
         Height          =   495
         Left            =   120
         TabIndex        =   61
         Top             =   120
         Visible         =   0   'False
         Width           =   4095
         _extentx        =   7223
         _extenty        =   873
         caption         =   "&Mostrar Bloqueos"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20E1A
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cInsertarBloqueo 
         Height          =   735
         Left            =   120
         TabIndex        =   62
         Top             =   720
         Visible         =   0   'False
         Width           =   4095
         _extentx        =   7223
         _extenty        =   1296
         caption         =   "&Insertar Bloqueos"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20E3E
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cQuitarBloqueo 
         Height          =   735
         Left            =   120
         TabIndex        =   63
         Top             =   1560
         Visible         =   0   'False
         Width           =   4095
         _extentx        =   7223
         _extenty        =   1296
         caption         =   "&Quitar Bloqueos"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20E62
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cAgregarFuncalAzar 
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   68
         Top             =   3480
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "Insetar OBJ's al &Azar"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20E86
         mode            =   0
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cQuitarFunc 
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   69
         Top             =   3840
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "&Quitar OBJ's"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20EAA
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cInsertarFunc 
         Height          =   735
         Index           =   2
         Left            =   2400
         TabIndex        =   70
         Top             =   3480
         Visible         =   0   'False
         Width           =   1815
         _extentx        =   3201
         _extenty        =   1296
         caption         =   "&Insertar Objetos"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20ECE
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cInsertarFunc 
         Height          =   735
         Index           =   1
         Left            =   2400
         TabIndex        =   84
         Top             =   3480
         Visible         =   0   'False
         Width           =   1815
         _extentx        =   3201
         _extenty        =   1296
         caption         =   "&Insertar NPC's"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20EF2
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cQuitarFunc 
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   83
         Top             =   3840
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "&Quitar NPC's"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20F16
         mode            =   1
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin WorldEditor.lvButtons_H cAgregarFuncalAzar 
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   82
         Top             =   3480
         Visible         =   0   'False
         Width           =   2175
         _extentx        =   3836
         _extenty        =   661
         caption         =   "Insetar NPC's al &Azar"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20F3A
         mode            =   0
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin VB.ComboBox cCantFunc 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   1
         ItemData        =   "frmMain.frx":20F5E
         Left            =   840
         List            =   "frmMain.frx":20F60
         TabIndex        =   78
         Text            =   "1"
         Top             =   3120
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.ComboBox cFiltro 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   2
         Left            =   600
         TabIndex        =   79
         Top             =   2760
         Visible         =   0   'False
         Width           =   3615
      End
      Begin VB.ListBox lListado 
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   2580
         Index           =   2
         ItemData        =   "frmMain.frx":20F62
         Left            =   120
         List            =   "frmMain.frx":20F64
         TabIndex        =   80
         Tag             =   "-1"
         Top             =   120
         Visible         =   0   'False
         Width           =   4095
      End
      Begin VB.ComboBox cNumFunc 
         Appearance      =   0  'Flat
         BackColor       =   &H80000012&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   330
         Index           =   1
         ItemData        =   "frmMain.frx":20F66
         Left            =   3360
         List            =   "frmMain.frx":20F68
         TabIndex        =   81
         Text            =   "500"
         Top             =   3120
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.Label lYver 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Y vertical:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Left            =   240
         TabIndex        =   95
         Top             =   1005
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.Label lXhor 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "X horizontal:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Left            =   240
         TabIndex        =   94
         Top             =   645
         Visible         =   0   'False
         Width           =   900
      End
      Begin VB.Label lMapN 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Mapa:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Left            =   240
         TabIndex        =   93
         Top             =   285
         Visible         =   0   'False
         Width           =   435
      End
      Begin VB.Label lbFiltrar 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Filtrar:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   0
         Left            =   120
         TabIndex        =   24
         Top             =   2820
         Visible         =   0   'False
         Width           =   450
      End
      Begin VB.Label lbCapas 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Capa Actual:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Left            =   120
         TabIndex        =   23
         Top             =   3195
         Visible         =   0   'False
         Width           =   930
      End
      Begin VB.Label lbGrh 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Sup Actual:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Left            =   2040
         TabIndex        =   22
         Top             =   3195
         Visible         =   0   'False
         Width           =   840
      End
      Begin VB.Label lNumFunc 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Numero de NPC:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   1
         Left            =   2160
         TabIndex        =   21
         Top             =   3195
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.Label lCantFunc 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Cantidad:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   1
         Left            =   120
         TabIndex        =   20
         Top             =   3195
         Visible         =   0   'False
         Width           =   675
      End
      Begin VB.Label lbFiltrar 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Filtrar:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   2
         Left            =   120
         TabIndex        =   19
         Top             =   2820
         Visible         =   0   'False
         Width           =   450
      End
      Begin VB.Label lNumFunc 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Numero de OBJ:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   2
         Left            =   2160
         TabIndex        =   18
         Top             =   3195
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.Label lCantFunc 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Cantidad:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   2
         Left            =   120
         TabIndex        =   17
         Top             =   3195
         Visible         =   0   'False
         Width           =   675
      End
      Begin VB.Label lbFiltrar 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Filtrar:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   3
         Left            =   120
         TabIndex        =   16
         Top             =   2820
         Visible         =   0   'False
         Width           =   450
      End
      Begin VB.Label lCantFunc 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Cantidad:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   0
         Left            =   120
         TabIndex        =   15
         Top             =   3195
         Visible         =   0   'False
         Width           =   675
      End
      Begin VB.Label lNumFunc 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Numero de NPC:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   0
         Left            =   2160
         TabIndex        =   14
         Top             =   3195
         Visible         =   0   'False
         Width           =   1170
      End
      Begin VB.Label lbFiltrar 
         AutoSize        =   -1  'True
         BackColor       =   &H80000012&
         Caption         =   "Filtrar:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000014&
         Height          =   210
         Index           =   1
         Left            =   120
         TabIndex        =   13
         Top             =   2820
         Visible         =   0   'False
         Width           =   450
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      ForeColor       =   &H00FFFFFF&
      Height          =   5460
      Left            =   60
      ScaleHeight     =   364
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   297
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   6270
      Width           =   4455
      Begin VB.PictureBox PreviewGrh 
         BackColor       =   &H00004000&
         FillColor       =   &H00C0C0C0&
         Height          =   3780
         Left            =   45
         ScaleHeight     =   3720
         ScaleWidth      =   4305
         TabIndex        =   3
         Top             =   0
         Visible         =   0   'False
         Width           =   4365
      End
   End
   Begin MSComDlg.CommonDialog Dialog 
      Left            =   2565
      Top             =   2025
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1290
      Left            =   1680
      TabIndex        =   0
      Top             =   30
      Width           =   3225
      Begin WorldEditor.lvButtons_H cmdInformacionDelMapa 
         Height          =   375
         Left            =   100
         TabIndex        =   96
         Top             =   600
         Width           =   3015
         _extentx        =   5318
         _extenty        =   661
         caption         =   "&Información del Mapa"
         capalign        =   2
         backstyle       =   2
         cgradient       =   0
         font            =   "frmMain.frx":20F6A
         mode            =   0
         value           =   0   'False
         cback           =   -2147483633
      End
      Begin VB.Label lblMapVersion 
         AutoSize        =   -1  'True
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   1440
         TabIndex        =   27
         Top             =   1010
         Width           =   105
      End
      Begin VB.Label lblMapMusica 
         AutoSize        =   -1  'True
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   210
         Left            =   1440
         TabIndex        =   26
         Top             =   352
         Width           =   90
      End
      Begin VB.Label lblMapNombre 
         AutoSize        =   -1  'True
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         Caption         =   "Nuevo Mapa"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   210
         Left            =   1440
         TabIndex        =   25
         Top             =   90
         Width           =   900
      End
      Begin VB.Label lblFMusica 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Musica:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00004000&
         Height          =   270
         Left            =   105
         TabIndex        =   5
         Top             =   320
         Width           =   3015
      End
      Begin VB.Label lblFVersion 
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Versión:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00004000&
         Height          =   285
         Left            =   105
         TabIndex        =   4
         Top             =   970
         Width           =   3015
      End
      Begin VB.Label lblFNombreMapa 
         BackColor       =   &H8000000D&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Nombre del Mapa:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00004000&
         Height          =   270
         Left            =   105
         TabIndex        =   1
         Top             =   60
         Width           =   3015
      End
   End
   Begin VB.Line Separacion1 
      BorderColor     =   &H00FFFFFF&
      Index           =   1
      X1              =   329
      X2              =   329
      Y1              =   8
      Y2              =   88
   End
   Begin VB.Line Separacion2 
      BorderColor     =   &H00FFFFFF&
      Index           =   1
      X1              =   337
      X2              =   337
      Y1              =   8
      Y2              =   88
   End
   Begin VB.Line Separacion2 
      BorderColor     =   &H00808080&
      Index           =   0
      X1              =   336
      X2              =   336
      Y1              =   8
      Y2              =   88
   End
   Begin VB.Line Separacion1 
      BorderColor     =   &H00808080&
      Index           =   0
      X1              =   328
      X2              =   328
      Y1              =   8
      Y2              =   88
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   12
      Left            =   14340
      TabIndex        =   48
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   11
      Left            =   13575
      TabIndex        =   47
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   5925
      TabIndex        =   38
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   6690
      TabIndex        =   37
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   7455
      TabIndex        =   36
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFC0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   8220
      TabIndex        =   35
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   5
      Left            =   8985
      TabIndex        =   34
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   6
      Left            =   9750
      TabIndex        =   33
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   7
      Left            =   10515
      TabIndex        =   32
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   8
      Left            =   11280
      TabIndex        =   31
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   9
      Left            =   12045
      TabIndex        =   30
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   5160
      TabIndex        =   29
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Label MapPest 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Mapa1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   10
      Left            =   12810
      TabIndex        =   28
      Top             =   1080
      Visible         =   0   'False
      Width           =   750
   End
   Begin VB.Shape MainViewShp 
      BackColor       =   &H000000FF&
      BorderColor     =   &H00C0C0C0&
      FillColor       =   &H00C0E0FF&
      Height          =   9120
      Left            =   4560
      Top             =   1440
      Width           =   10080
   End
   Begin VB.Menu FileMnu 
      Caption         =   "&Archivo"
      Begin VB.Menu mnuArchivoLine1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuNuevoMapa 
         Caption         =   "&Nuevo Mapa"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuAbrirMapa 
         Caption         =   "&Abrir Mapa"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuArchivoLine2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuReAbrirMapa 
         Caption         =   "&Re-Abrir Mapa"
      End
      Begin VB.Menu mnuArchivoLine3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuUtirialNuevoFormato 
         Caption         =   "Utilizar &Nuevo Formato al Guardar"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuArchivoLine4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGuardarMapa 
         Caption         =   "&Guardar Mapa"
         Shortcut        =   ^G
      End
      Begin VB.Menu mnuGuardarMapaComo 
         Caption         =   "Guardar Mapa &como..."
      End
      Begin VB.Menu mnuExportar 
         Caption         =   "&Exportar"
         Begin VB.Menu mnuBmp 
            Caption         =   "Bmp"
         End
         Begin VB.Menu mnuPng 
            Caption         =   "Png"
         End
         Begin VB.Menu mnuJpg 
            Caption         =   "Jpg"
         End
      End
      Begin VB.Menu mnuArchivoLine5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSalir 
         Caption         =   "&Salir"
      End
      Begin VB.Menu mnuArchivoLine6 
         Caption         =   "-"
      End
   End
   Begin VB.Menu mnuEdicion 
      Caption         =   "&Edición"
      Begin VB.Menu mnuDeshacer 
         Caption         =   "&Deshacer"
         Shortcut        =   ^Z
      End
      Begin VB.Menu mnuUtilizarDeshacer 
         Caption         =   "&Utilizar Deshacer"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuInfoMap 
         Caption         =   "&Información del Mapa"
      End
      Begin VB.Menu mnuLineEdicion1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuInsertar 
         Caption         =   "&Insertar"
         Begin VB.Menu mnuInsertarTransladosAdyasentes 
            Caption         =   "&Translados a Mapas Adyasentes"
         End
         Begin VB.Menu mnuInsertarSuperficieAlAzar 
            Caption         =   "Superficie al &Azar"
         End
         Begin VB.Menu mnuInsertarSuperficieEnBordes 
            Caption         =   "Superficie en los &Bordes del Mapa"
         End
         Begin VB.Menu mnuInsertarSuperficieEnTodo 
            Caption         =   "Superficie en Todo el Mapa"
         End
         Begin VB.Menu mnuBloquearBordes 
            Caption         =   "Bloqueo en &Bordes del Mapa"
         End
         Begin VB.Menu mnuBloquearMapa 
            Caption         =   "Bloqueo en &Todo el Mapa"
         End
      End
      Begin VB.Menu mnuQuitar 
         Caption         =   "&Quitar"
         Begin VB.Menu mnuQuitarTranslados 
            Caption         =   "Todos los &Translados"
         End
         Begin VB.Menu mnuQuitarBloqueos 
            Caption         =   "Todos los &Bloqueos"
         End
         Begin VB.Menu mnuQuitarNPCs 
            Caption         =   "Todos los &NPC's"
         End
         Begin VB.Menu mnuQuitarNPCsHostiles 
            Caption         =   "Todos los NPC's &Hostiles"
         End
         Begin VB.Menu mnuQuitarObjetos 
            Caption         =   "Todos los &Objetos"
         End
         Begin VB.Menu mnuQuitarTriggers 
            Caption         =   "Todos los Tri&gger's"
         End
         Begin VB.Menu mnuQuitarSuperficieBordes 
            Caption         =   "Superficie de los B&ordes"
         End
         Begin VB.Menu mnuQuitarSuperficieDeCapa 
            Caption         =   "Superficie de la &Capa Seleccionada"
         End
         Begin VB.Menu mnuLineEdicion2 
            Caption         =   "-"
         End
         Begin VB.Menu mnuQuitarTODO 
            Caption         =   "TODO"
         End
      End
      Begin VB.Menu mnuAplicar 
         Caption         =   "Aplicar"
         Begin VB.Menu mnuApliBloq 
            Caption         =   "Aplicar bloqueos"
            Shortcut        =   ^B
         End
         Begin VB.Menu mnuApliSelec 
            Caption         =   "Aplicar seleccionado"
            Shortcut        =   ^D
         End
      End
      Begin VB.Menu mnuLineEdicion3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFunciones 
         Caption         =   "&Funciones"
         Begin VB.Menu mnuQuitarFunciones 
            Caption         =   "&Quitar Funciones"
            Shortcut        =   {F4}
         End
         Begin VB.Menu mnuAutoQuitarFunciones 
            Caption         =   "Auto-&Quitar Funciones"
            Checked         =   -1  'True
         End
      End
      Begin VB.Menu mnuConfigAvanzada 
         Caption         =   "Configuracion A&vanzada de Superficie"
      End
      Begin VB.Menu mnuLineEdicion4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAutoCompletarSuperficies 
         Caption         =   "Auto-Completar &Superficies"
      End
      Begin VB.Menu mnuAutoCapturarSuperficie 
         Caption         =   "Auto-C&apturar información de la Superficie"
      End
      Begin VB.Menu mnuAutoCapturarTranslados 
         Caption         =   "Auto-&Capturar información de los Translados"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuAutoGuardarMapas 
         Caption         =   "Configuración de Auto-&Guardar Mapas"
      End
   End
   Begin VB.Menu mnuVer 
      Caption         =   "&Ver"
      Begin VB.Menu mnuCapas 
         Caption         =   "...&Capas"
         Begin VB.Menu mnuVerCapa 
            Caption         =   "Capa &2 (costas, etc)"
            Checked         =   -1  'True
            Index           =   2
         End
         Begin VB.Menu mnuVerCapa 
            Caption         =   "Capa &3 (arboles, etc)"
            Checked         =   -1  'True
            Index           =   3
         End
         Begin VB.Menu mnuVerCapa 
            Caption         =   "Capa &4 (techos, etc)"
            Index           =   4
         End
      End
      Begin VB.Menu mnuVerTranslados 
         Caption         =   "...&Translados"
      End
      Begin VB.Menu mnuVerBloqueos 
         Caption         =   "...&Bloqueos"
      End
      Begin VB.Menu mnuVerNPCs 
         Caption         =   "...&NPC's"
      End
      Begin VB.Menu mnuVerObjetos 
         Caption         =   "...&Objetos"
      End
      Begin VB.Menu mnuVerTriggers 
         Caption         =   "...Tri&gger's"
      End
      Begin VB.Menu mnuLinMostrar 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVerAutomatico 
         Caption         =   "Control &Automaticamente"
         Checked         =   -1  'True
      End
   End
   Begin VB.Menu mnuPaneles 
      Caption         =   "&Paneles"
      Begin VB.Menu mnuSuperficie 
         Caption         =   "&Superficie"
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuTranslados 
         Caption         =   "&Translados"
         Shortcut        =   {F6}
      End
      Begin VB.Menu mnuBloquear 
         Caption         =   "&Bloquear"
         Shortcut        =   {F7}
      End
      Begin VB.Menu mnuNPCs 
         Caption         =   "&NPC's"
         Shortcut        =   {F8}
      End
      Begin VB.Menu mnuNPCsHostiles 
         Caption         =   "NPC's &Hostiles"
         Shortcut        =   {F9}
      End
      Begin VB.Menu mnuObjetos 
         Caption         =   "&Objetos"
         Shortcut        =   {F11}
      End
      Begin VB.Menu mnuTriggers 
         Caption         =   "Tri&gger's"
         Shortcut        =   {F12}
      End
      Begin VB.Menu mnuPanelesLine1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuQSuperficie 
         Caption         =   "Ocultar Superficie"
         Shortcut        =   +{F5}
      End
      Begin VB.Menu mnuQTranslados 
         Caption         =   "Ocultar Translados"
         Shortcut        =   +{F6}
      End
      Begin VB.Menu mnuQBloquear 
         Caption         =   "Ocultar Bloquear"
         Shortcut        =   +{F7}
      End
      Begin VB.Menu mnuQNPCs 
         Caption         =   "Ocultar NPC's"
         Shortcut        =   +{F8}
      End
      Begin VB.Menu mnuQNPCsHostiles 
         Caption         =   "Ocultar NPC's Hostiles"
         Shortcut        =   +{F9}
      End
      Begin VB.Menu mnuQObjetos 
         Caption         =   "Ocultar Objetos"
         Shortcut        =   +{F11}
      End
      Begin VB.Menu mnuQTriggers 
         Caption         =   "Ocultar Trigger's"
         Shortcut        =   +{F12}
      End
      Begin VB.Menu mnuFuncionesLine1 
         Caption         =   "-"
      End
   End
   Begin VB.Menu mnuOpciones 
      Caption         =   "&Opciones"
      Begin VB.Menu mnuInformes 
         Caption         =   "&Informes"
      End
      Begin VB.Menu mnuActualizarIndices 
         Caption         =   "&Actualizar Indices de..."
         Begin VB.Menu mnuActualizarSuperficies 
            Caption         =   "&Superficies"
         End
         Begin VB.Menu mnuActualizarNPCs 
            Caption         =   "&NPC's"
         End
         Begin VB.Menu mnuActualizarObjs 
            Caption         =   "&Objetos"
         End
         Begin VB.Menu mnuActualizarTriggers 
            Caption         =   "&Trigger's"
         End
         Begin VB.Menu mnuActualizarCabezas 
            Caption         =   "C&abezas"
         End
         Begin VB.Menu mnuActualizarCuerpos 
            Caption         =   "C&uerpos"
         End
         Begin VB.Menu mnuActualizarGraficos 
            Caption         =   "&Graficos"
         End
      End
      Begin VB.Menu mnuModoCaminata 
         Caption         =   "Modalidad &Caminata"
      End
      Begin VB.Menu mnuLine1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOptimizar 
         Caption         =   "Optimi&zar Mapa"
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuLine2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGuardarUltimaConfig 
         Caption         =   "&Guardar Ultima Configuración"
      End
   End
   Begin VB.Menu mnuAyuda 
      Caption         =   "Ay&uda"
      Begin VB.Menu mnuManual 
         Caption         =   "&Manual (no implementado)"
         Enabled         =   0   'False
         Shortcut        =   {F1}
      End
      Begin VB.Menu mnuLineAyuda1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAcercaDe 
         Caption         =   "&Acerca de..."
      End
   End
   Begin VB.Menu mnuObjSc 
      Caption         =   "mnuObjSc"
      Visible         =   0   'False
      Begin VB.Menu mnuConfigObjTrans 
         Caption         =   "&Utilizar como Objeto de Translados"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'**************************************************************
'This program is free software; you can redistribute it and/or modify
'it under the terms of the GNU General Public License as published by
'the Free Software Foundation; either version 2 of the License, or
'any later version.
'
'This program is distributed in the hope that it will be useful,
'but WITHOUT ANY WARRANTY; without even the implied warranty of
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'GNU General Public License for more details.
'
'You should have received a copy of the GNU General Public License
'along with this program; if not, write to the Free Software
'Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
'
'Argentum Online is based on Baronsoft's VB6 Online RPG
'You can contact the original creator of ORE at aaron@baronsoft.com
'for more information about ORE please visit http://www.baronsoft.com/
'**************************************************************
Option Explicit

Public MouseX As Long
Public MouseY As Long

Private Sub PonerAlAzar(ByVal n As Integer, ByVal T As Byte)
    '*************************************************
    'Author: Unkwown
    'Last modified: 20/05/06 by GS
    '*************************************************
    Dim objindex As Long
    Dim NPCIndex As Long
    Dim X, y, i
    Dim Head    As Integer
    Dim Body    As Integer
    Dim Heading As Byte
    Dim Leer    As New clsIniReader

    i = n

    modEdicion.Deshacer_Add "Aplicar " & IIf(T = 0, "Objetos", "NPCs") & " al Azar" ' Hago deshacer

    Do While i > 0
        X = CInt(RandomNumber(XMinMapSize, XMaxMapSize - 1))
        y = CInt(RandomNumber(YMinMapSize, YMaxMapSize - 1))
    
        Select Case T

            Case 0

                If MapData(X, y).OBJInfo.objindex = 0 Then
                    i = i - 1
                  
                    If cInsertarBloqueo.Value = True Then
                        MapData(X, y).Blocked = 1
                    Else
                        MapData(X, y).Blocked = 0

                    End If
                  
                    If cNumFunc(2).Text > 0 Then
                        objindex = cNumFunc(2).Text
                        InitGrh MapData(X, y).ObjGrh, ObjData(objindex).GrhIndex
                        MapData(X, y).OBJInfo.objindex = objindex
                        MapData(X, y).OBJInfo.Amount = Val(cCantFunc(2).Text)
                    
                        Select Case ObjData(objindex).ObjType ' GS

                            Case 4, 8, 10, 22 ' Arboles, Carteles, Foros, Yacimientos
                                MapData(X, y).Graphic(3) = MapData(X, y).ObjGrh

                        End Select

                    End If

                End If
            
            Case 1, 2

                If MapData(X, y).Blocked = 0 Then
                    i = i - 1
                
                    If cNumFunc(T - 1).Text > 0 Then
                        NPCIndex = cNumFunc(T - 1).Text
                        Body = NpcData(NPCIndex).Body
                        Head = NpcData(NPCIndex).Head
                        Heading = NpcData(NPCIndex).Heading
                        
                        Call MakeChar(NextOpenChar(), Body, Head, Heading, CInt(X), CInt(y))
                        MapData(X, y).NPCIndex = NPCIndex

                    End If

                End If

        End Select

    Loop

End Sub

Private Sub cAgregarFuncalAzar_Click(Index As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error Resume Next

    If IsNumeric(cCantFunc(Index).Text) = False Or cCantFunc(Index).Text > 200 Then
        MsgBox "El Valor de Cantidad introducido no es soportado!" & vbCrLf & "El valor maximo es 200.", vbCritical
        Exit Sub

    End If

    cAgregarFuncalAzar(Index).Enabled = False
    Call PonerAlAzar(CInt(cCantFunc(Index).Text), 1 + (IIf(Index = 2, -1, Index)))
    cAgregarFuncalAzar(Index).Enabled = True

End Sub

Private Sub cCantFunc_Change(Index As Integer)
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim Cant As Long
    
    Cant = Val(cCantFunc(Index))
    
    If Cant < 1 Then
        cCantFunc(Index).Text = 1
    ElseIf Cant > 10000 Then
        cCantFunc(Index).Text = 10000
    Else
        cCantFunc(Index).Text = Cant

    End If

End Sub

Private Sub cCapas_Change()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 31/05/06
    '*************************************************
    cCapas.Text = Val(cCapas.Text)
    
    If (Val(cCapas.Text) >= 1) And (Val(cCapas.Text) <= 4) Then
        CurLayer = Val(frmMain.cCapas.Text)
    Else
        CurLayer = 1
        cCapas.Text = CurLayer

    End If
    
    cCapas.Tag = vbNullString

End Sub

Private Sub cCapas_Click()
    cCapas.Text = Val(cCapas.Text)
    
    If (Val(cCapas.Text) >= 1) And (Val(cCapas.Text) <= 4) Then
        CurLayer = Val(frmMain.cCapas.Text)
    Else
        CurLayer = 1
        cCapas.Text = CurLayer

    End If
    
    cCapas.Tag = vbNullString

End Sub

Private Sub cCapas_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCode = 0

End Sub

Private Sub cCapas_KeyPress(KeyAscii As Integer)

    If IsNumeric(Chr$(KeyAscii)) Then cCapas.Text = Chr$(KeyAscii)
    KeyAscii = 0

End Sub

Private Sub cFiltro_GotFocus(Index As Integer)
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    HotKeysAllow = False

End Sub

Private Sub cFiltro_KeyPress(Index As Integer, KeyAscii As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If KeyAscii = 13 Then
        Call Filtrar(Index)

    End If

End Sub

Private Sub cFiltro_LostFocus(Index As Integer)
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    HotKeysAllow = True

End Sub

Private Sub cGrh_KeyPress(KeyAscii As Integer)
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************

    On Error GoTo Fallo

    If KeyAscii = 13 Then
        Call fPreviewGrh(cGrh.Text)
    
        If frmMain.cGrh.ListCount > 5 Then
            frmMain.cGrh.RemoveItem 0

        End If
    
        frmMain.cGrh.AddItem frmMain.cGrh.Text

    End If

    Exit Sub
Fallo:
    cGrh.Text = 1

End Sub

Private Sub cInsertarFunc_Click(Index As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cInsertarFunc(Index).Value Then
        cQuitarFunc(Index).Enabled = False
        cAgregarFuncalAzar(Index).Enabled = False

        If Index <> 2 Then cCantFunc(Index).Enabled = False
        Call modPaneles.EstSelectPanel((Index) + 3, True)
    Else
        cQuitarFunc(Index).Enabled = True
        cAgregarFuncalAzar(Index).Enabled = True

        If Index <> 2 Then cCantFunc(Index).Enabled = True
        Call modPaneles.EstSelectPanel((Index) + 3, False)

    End If

End Sub

Private Sub cInsertarTrans_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 22/05/06
    '*************************************************
    If cInsertarTrans.Value Then
        cQuitarTrans.Enabled = False
        Call modPaneles.EstSelectPanel(1, True)
    Else
        cQuitarTrans.Enabled = True
        Call modPaneles.EstSelectPanel(1, False)

    End If

End Sub

Private Sub cInsertarTrigger_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cInsertarTrigger.Value Then
        cQuitarTrigger.Enabled = False
        Call modPaneles.EstSelectPanel(6, True)
    Else
        cQuitarTrigger.Enabled = True
        Call modPaneles.EstSelectPanel(6, False)

    End If

End Sub

Private Sub cmdInformacionDelMapa_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmMapInfo.Show
    frmMapInfo.Visible = True

End Sub

Private Sub cmdQuitarFunciones_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call mnuQuitarFunciones_Click

End Sub

Private Sub cUnionManual_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    cUnionManual.Value = (cUnionManual.Value = True)

    If cUnionManual.Value Then cInsertarTrans.Value = True

    Call cInsertarTrans_Click

End Sub

Private Sub cverBloqueos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    mnuVerBloqueos.Checked = cVerBloqueos.Value

    bBloqs = mnuVerBloqueos.Checked

End Sub

Private Sub cverTriggers_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    mnuVerTriggers.Checked = cVerTriggers.Value

    bTriggers = mnuVerTriggers.Checked

End Sub

Private Sub cNumFunc_KeyPress(Index As Integer, KeyAscii As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error Resume Next

    If KeyAscii = 13 Then
        Dim Cont As String
    
        Cont = frmMain.cNumFunc(Index).Text
        Call cNumFunc_LostFocus(Index)
    
        If Cont <> frmMain.cNumFunc(Index).Text Then Exit Sub
    
        If frmMain.cNumFunc(Index).ListCount > 5 Then
            frmMain.cNumFunc(Index).RemoveItem 0

        End If
    
        frmMain.cNumFunc(Index).AddItem frmMain.cNumFunc(Index).Text
    ElseIf (Not IsNumeric(Chr$(KeyAscii))) And (KeyAscii <> 8) Then
        KeyAscii = 0

    End If

End Sub

Private Sub cNumFunc_KeyUp(Index As Integer, KeyCode As Integer, Shift As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error Resume Next

    If LenB(cNumFunc(Index).Text) > 0 Then
        frmMain.cNumFunc(Index).Text = IIf(Index = 1, 500, 1)

    End If

End Sub

Private Sub cNumFunc_LostFocus(Index As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error Resume Next

    If Index = 0 Then
        If frmMain.cNumFunc(Index).Text > 499 Or frmMain.cNumFunc(Index).Text < 1 Then
            frmMain.cNumFunc(Index).Text = 1

        End If

    ElseIf Index = 1 Then

        If frmMain.cNumFunc(Index).Text < 500 Or frmMain.cNumFunc(Index).Text > 32000 Then
            frmMain.cNumFunc(Index).Text = 500

        End If

    ElseIf Index = 2 Then

        If frmMain.cNumFunc(Index).Text < 1 Or frmMain.cNumFunc(Index).Text > 32000 Then
            frmMain.cNumFunc(Index).Text = 1

        End If

    End If

End Sub

Private Sub cInsertarBloqueo_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    cInsertarBloqueo.Tag = vbNullString

    If cInsertarBloqueo.Value Then
        cQuitarBloqueo.Enabled = False
        Call modPaneles.EstSelectPanel(2, True)
    Else
        cQuitarBloqueo.Enabled = True
        Call modPaneles.EstSelectPanel(2, False)

    End If

End Sub

Private Sub cQuitarBloqueo_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    cInsertarBloqueo.Tag = vbNullString

    If cQuitarBloqueo.Value Then
        cInsertarBloqueo.Enabled = False
        Call modPaneles.EstSelectPanel(2, True)
    Else
        cInsertarBloqueo.Enabled = True
        Call modPaneles.EstSelectPanel(2, False)

    End If

End Sub

Private Sub cQuitarEnEstaCapa_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cQuitarEnEstaCapa.Value Then
        lListado(0).Enabled = False
        cFiltro(0).Enabled = False
        cGrh.Enabled = False
        cSeleccionarSuperficie.Enabled = False
        cQuitarEnTodasLasCapas.Enabled = False
        Call modPaneles.EstSelectPanel(0, True)
    Else
        lListado(0).Enabled = True
        cFiltro(0).Enabled = True
        cGrh.Enabled = True
        cSeleccionarSuperficie.Enabled = True
        cQuitarEnTodasLasCapas.Enabled = True
        Call modPaneles.EstSelectPanel(0, False)

    End If

End Sub

Private Sub cQuitarEnTodasLasCapas_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cQuitarEnTodasLasCapas.Value Then
        cCapas.Enabled = False
        lListado(0).Enabled = False
        cFiltro(0).Enabled = False
        cGrh.Enabled = False
        cSeleccionarSuperficie.Enabled = False
        cQuitarEnEstaCapa.Enabled = False
        Call modPaneles.EstSelectPanel(0, True)
    Else
        cCapas.Enabled = True
        lListado(0).Enabled = True
        cFiltro(0).Enabled = True
        cGrh.Enabled = True
        cSeleccionarSuperficie.Enabled = True
        cQuitarEnEstaCapa.Enabled = True
        Call modPaneles.EstSelectPanel(0, False)

    End If

End Sub

Private Sub cQuitarFunc_Click(Index As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cQuitarFunc(Index).Value Then
        cInsertarFunc(Index).Enabled = False
        cAgregarFuncalAzar(Index).Enabled = False
        cCantFunc(Index).Enabled = False
        cNumFunc(Index).Enabled = False
        cFiltro((Index) + 1).Enabled = False
        lListado((Index) + 1).Enabled = False
        Call modPaneles.EstSelectPanel((Index) + 3, True)
    Else
        cInsertarFunc(Index).Enabled = True
        cAgregarFuncalAzar(Index).Enabled = True
        cCantFunc(Index).Enabled = True
        cNumFunc(Index).Enabled = True
        cFiltro((Index) + 1).Enabled = True
        lListado((Index) + 1).Enabled = True
        Call modPaneles.EstSelectPanel((Index) + 3, False)

    End If

End Sub

Private Sub cQuitarTrans_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cQuitarTrans.Value = True Then
        cInsertarTransOBJ.Enabled = False
        cInsertarTrans.Enabled = False
        cUnionManual.Enabled = False
        cUnionAuto.Enabled = False
        tTMapa.Enabled = False
        tTX.Enabled = False
        tTY.Enabled = False
        mnuInsertarTransladosAdyasentes.Enabled = False
        Call modPaneles.EstSelectPanel(1, True)
    Else
        tTMapa.Enabled = True
        tTX.Enabled = True
        tTY.Enabled = True
        cUnionAuto.Enabled = True
        cUnionManual.Enabled = True
        cInsertarTrans.Enabled = True
        cInsertarTransOBJ.Enabled = True
        mnuInsertarTransladosAdyasentes.Enabled = True
        Call modPaneles.EstSelectPanel(1, False)

    End If

End Sub

Private Sub cQuitarTrigger_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cQuitarTrigger.Value Then
        lListado(4).Enabled = False
        cInsertarTrigger.Enabled = False
        Call modPaneles.EstSelectPanel(6, True)
    Else
        lListado(4).Enabled = True
        cInsertarTrigger.Enabled = True
        Call modPaneles.EstSelectPanel(6, False)

    End If

End Sub

Private Sub cSeleccionarSuperficie_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If cSeleccionarSuperficie.Value Then
        cQuitarEnTodasLasCapas.Enabled = False
        cQuitarEnEstaCapa.Enabled = False
        Call modPaneles.EstSelectPanel(0, True)
    Else
        cQuitarEnTodasLasCapas.Enabled = True
        cQuitarEnEstaCapa.Enabled = True
        Call modPaneles.EstSelectPanel(0, False)

    End If

    bSelectSup = cSeleccionarSuperficie.Value

End Sub

Private Sub cUnionAuto_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmUnionAdyacente.Show

End Sub

Private Sub Form_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Me.SetFocus

End Sub

Private Sub Form_DblClick()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 28/05/06
    '*************************************************
    Dim tx As Integer
    Dim tY As Integer

    If Not MapaCargado Then Exit Sub

    If SobreX > 0 And SobreY > 0 Then
        DobleClick Val(SobreX), Val(SobreY)

    End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    ' HotKeys
    If Not HotKeysAllow Then Exit Sub

    Select Case UCase$(Chr$(KeyAscii))

        Case "S" ' Activa/Desactiva Insertar Superficie
            cSeleccionarSuperficie.Value = (cSeleccionarSuperficie.Value = False)
            Call cSeleccionarSuperficie_Click

        Case "T" ' Activa/Desactiva Insertar Translados
            cInsertarTrans.Value = (cInsertarTrans.Value = False)
            Call cInsertarTrans_Click

        Case "B" ' Activa/Desactiva Insertar Bloqueos
            cInsertarBloqueo.Value = (cInsertarBloqueo.Value = False)
            Call cInsertarBloqueo_Click

        Case "N" ' Activa/Desactiva Insertar NPCs
            cInsertarFunc(0).Value = (cInsertarFunc(0).Value = False)
            Call cInsertarFunc_Click(0)

        Case "H" ' Activa/Desactiva Insertar NPCs Hostiles
            cInsertarFunc(1).Value = (cInsertarFunc(1).Value = False)
            Call cInsertarFunc_Click(1)

        Case "O" ' Activa/Desactiva Insertar Objetos
            cInsertarFunc(2).Value = (cInsertarFunc(2).Value = False)
            Call cInsertarFunc_Click(2)

        Case "G" ' Activa/Desactiva Insertar Triggers
            cInsertarTrigger.Value = (cInsertarTrigger.Value = False)
            Call cInsertarTrigger_Click

        Case "Q" ' Quitar Funciones
            Call mnuQuitarFunciones_Click

    End Select

End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, y As Single)
    Dim tx As Integer
    Dim tY As Integer

    MouseX = X - MainViewShp.Left
    MouseY = y - MainViewShp.Top

    'Trim to fit screen
    If MouseX < 0 Then
        MouseX = 0
    ElseIf MouseX > MainViewShp.Width Then
        MouseX = MainViewShp.Width

    End If

    'Trim to fit screen
    If MouseY < 0 Then
        MouseY = 0
    ElseIf MouseY > MainViewShp.Height Then
        MouseY = MainViewShp.Height

    End If
    
    'Make sure click is in view window
    If X <= MainViewShp.Left Or X >= MainViewShp.Left + MainViewWidth Or y <= MainViewShp.Top Or y >= MainViewShp.Top _
            + MainViewHeight Then
        Exit Sub

    End If

    ConvertCPtoTP MouseX, MouseY, tx, tY

    If Button = vbLeftButton Then Call SelectTiles(True, tx, tY)

End Sub

Private Sub lListado_Click(Index As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    On Error Resume Next

    If HotKeysAllow = False Then
        lListado(Index).Tag = lListado(Index).listIndex

        Select Case Index

            Case 0
                cGrh.Text = DameGrhIndex(ReadField(2, lListado(Index).Text, Asc("#")))

                If SupData(ReadField(2, lListado(Index).Text, Asc("#"))).Capa <> 0 Then
                    If LenB(ReadField(2, lListado(Index).Text, Asc("#"))) = 0 Then cCapas.Tag = cCapas.Text
                    cCapas.Text = SupData(ReadField(2, lListado(Index).Text, Asc("#"))).Capa
                Else

                    If LenB(cCapas.Tag) <> 0 Then
                        cCapas.Text = cCapas.Tag
                        cCapas.Tag = vbNullString

                    End If

                End If

                If SupData(ReadField(2, lListado(Index).Text, Asc("#"))).Block = True Then
                    If LenB(cInsertarBloqueo.Tag) = 0 Then cInsertarBloqueo.Tag = IIf(cInsertarBloqueo.Value = True, _
                            1, 0)
                    cInsertarBloqueo.Value = True
                    Call cInsertarBloqueo_Click
                Else

                    If LenB(cInsertarBloqueo.Tag) <> 0 Then
                        cInsertarBloqueo.Value = IIf(Val(cInsertarBloqueo.Tag) = 1, True, False)
                        cInsertarBloqueo.Tag = vbNullString
                        Call cInsertarBloqueo_Click

                    End If

                End If

                Call fPreviewGrh(cGrh.Text)

            Case 1
                cNumFunc(0).Text = ReadField(2, lListado(Index).Text, Asc("#"))

            Case 2
                cNumFunc(1).Text = ReadField(2, lListado(Index).Text, Asc("#"))

            Case 3
                cNumFunc(2).Text = ReadField(2, lListado(Index).Text, Asc("#"))

        End Select

    Else
        lListado(Index).listIndex = lListado(Index).Tag

    End If

End Sub

Private Sub lListado_MouseDown(Index As Integer, _
                               Button As Integer, _
                               Shift As Integer, _
                               X As Single, _
                               y As Single)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    If Index = 3 And Button = 2 Then
        If lListado(3).listIndex > -1 Then Me.PopupMenu mnuObjSc

    End If

End Sub

Private Sub lListado_MouseMove(Index As Integer, _
                               Button As Integer, _
                               Shift As Integer, _
                               X As Single, _
                               y As Single)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 22/05/06
    '*************************************************
    On Error Resume Next

    HotKeysAllow = False

End Sub

Private Sub MapPest_Click(Index As Integer)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If (Index + NumMap_Save - 4) <> NumMap_Save Then
        Dialog.CancelError = True

        On Error GoTo ErrHandler

        Dialog.FileName = PATH_Save & NameMap_Save & (Index + NumMap_Save - 4) & ".map"
    
        If MapInfo.Changed = 1 Then
            If MsgBox(MSGMod, vbExclamation + vbYesNo) = vbYes Then
                modMapIO.GuardarMapa Dialog.FileName

            End If

        End If

        Call modMapIO.NuevoMapa
        modMapIO.AbrirMapa Dialog.FileName, MapData
        Exit Sub
    
ErrHandler:
        MsgBox Err.Description

    End If

End Sub

Private Sub mnuActualizarCabezas_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    Call modIndices.CargarIndicesDeCabezas

End Sub

Private Sub mnuActualizarCuerpos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    Call modIndices.CargarIndicesDeCuerpos

End Sub

Private Sub mnuActualizarGraficos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    Call modIndices.CargarIndicesDeGraficos

End Sub

Private Sub mnuActualizarSuperficies_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modIndices.CargarIndicesSuperficie

End Sub

Private Sub mnuAbrirMapa_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error GoTo ErrHandler

    DeseaGuardarMapa Dialog.FileName
    
    ObtenerNombreArchivo False
    
    If Len(Dialog.FileName) < 3 Then Exit Sub

    If WalkMode Then Call modGeneral.ToggleWalkMode
    
    Call modMapIO.NuevoMapa
    modMapIO.AbrirMapa Dialog.FileName, MapData
    mnuReAbrirMapa.Enabled = True
    Exit Sub
ErrHandler:

End Sub

Private Sub mnuacercade_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmAbout.Show

End Sub

Private Sub mnuActualizarNPCs_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modIndices.CargarIndicesNPC

End Sub

Private Sub mnuActualizarObjs_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modIndices.CargarIndicesOBJ

End Sub

Private Sub mnuActualizarTriggers_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modIndices.CargarIndicesTriggers

End Sub

Private Sub mnuApliBloq_Click()
    Call AplicarBloqueos

End Sub

Private Sub mnuApliSelec_Click()
    Call AplicarSeleccionado

End Sub

Private Sub mnuAutoCapturarTranslados_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 28/05/06
    '*************************************************
    mnuAutoCapturarTranslados.Checked = (mnuAutoCapturarTranslados.Checked = False)

End Sub

Private Sub mnuAutoCapturarSuperficie_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 28/05/06
    '*************************************************
    mnuAutoCapturarSuperficie.Checked = (mnuAutoCapturarSuperficie.Checked = False)

End Sub

Private Sub mnuAutoCompletarSuperficies_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    mnuAutoCompletarSuperficies.Checked = (mnuAutoCompletarSuperficies.Checked = False)

    bAutoCompletarSuperficies = mnuAutoCompletarSuperficies.Checked

End Sub

Private Sub mnuAutoGuardarMapas_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmAutoGuardarMapa.Show

End Sub

Private Sub mnuAutoQuitarFunciones_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    mnuAutoQuitarFunciones.Checked = (mnuAutoQuitarFunciones.Checked = False)

End Sub

Private Sub mnuBloquear_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 0 To 6

        If i <> 2 Then
            frmMain.SelectPanel(i).Value = False
            Call VerFuncion(i, False)

        End If

    Next i

    modPaneles.VerFuncion 2, True

End Sub

Private Sub mnuBloquearBordes_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Bloquear_Bordes

End Sub

Private Sub mnuBloquearMapa_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Bloqueo_Todo(1)

End Sub

Private Sub mnuBmp_Click()
    frmRender.formatPic = eFormatPic.bmp
    Call frmRender.Show(vbModal)

End Sub

Private Sub mnuConfigAvanzada_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmConfigSup.Show

End Sub

Private Sub mnuConfigObjTrans_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    Cfg_TrOBJ = cNumFunc(2).Text

End Sub

Private Sub mnuDeshacer_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 15/10/06
    '*************************************************
    Call modEdicion.Deshacer_Recover

End Sub

Private Sub mnuGuardarMapa_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modMapIO.GuardarMapa Dialog.FileName

End Sub

Private Sub mnuGuardarMapaComo_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modMapIO.GuardarMapa

End Sub

Private Sub mnuGuardarUltimaConfig_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 23/05/06
    '*************************************************
    mnuGuardarUltimaConfig.Checked = (mnuGuardarUltimaConfig.Checked = False)

End Sub

Private Sub mnuInfoMap_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmMapInfo.Show
    frmMapInfo.Visible = True

End Sub

Private Sub mnuInformes_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmInformes.Show

End Sub

Private Sub mnuInsertarSuperficieAlAzar_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Superficie_Azar

End Sub

Private Sub mnuInsertarSuperficieEnBordes_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Superficie_Bordes

End Sub

Private Sub mnuInsertarSuperficieEnTodo_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Superficie_Todo

End Sub

Private Sub mnuInsertarTransladosAdyasentes_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    frmUnionAdyacente.Show

End Sub

Private Sub mnuJpg_Click()
    frmRender.formatPic = eFormatPic.jpg
    Call frmRender.Show(vbModal)

End Sub

Private Sub mnuModoCaminata_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 28/05/06
    '*************************************************
    ToggleWalkMode

End Sub

Private Sub mnuNPCs_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 0 To 6

        If i <> 3 Then
            frmMain.SelectPanel(i).Value = False
            Call VerFuncion(i, False)

        End If

    Next i

    modPaneles.VerFuncion 3, True

End Sub

Private Sub mnuNPCsHostiles_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 0 To 6

        If i <> 4 Then
            frmMain.SelectPanel(i).Value = False
            Call VerFuncion(i, False)

        End If

    Next i

    modPaneles.VerFuncion 4, True

End Sub

Private Sub mnuNuevoMapa_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error Resume Next

    Dim loopc As Integer

    DeseaGuardarMapa Dialog.FileName

    For loopc = 0 To frmMain.MapPest.Count - 1
        frmMain.MapPest(loopc).Visible = False
    Next

    frmMain.Dialog.FileName = Empty

    If WalkMode Then Call modGeneral.ToggleWalkMode

    Call modMapIO.NuevoMapa

    Call cmdInformacionDelMapa_Click

End Sub

Private Sub mnuObjetos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 0 To 6

        If i <> 5 Then
            frmMain.SelectPanel(i).Value = False
            Call VerFuncion(i, False)

        End If

    Next i

    modPaneles.VerFuncion 5, True

End Sub

Private Sub mnuOptimizar_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 22/09/06
    '*************************************************
    frmOptimizar.Show

End Sub

Private Sub mnuPng_Click()
    frmRender.formatPic = eFormatPic.png
    Call frmRender.Show(vbModal)

End Sub

Private Sub mnuQBloquear_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modPaneles.VerFuncion 2, False

End Sub

Private Sub mnuQNPCs_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modPaneles.VerFuncion 3, False

End Sub

Private Sub mnuQNPCsHostiles_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modPaneles.VerFuncion 4, False

End Sub

Private Sub mnuQObjetos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modPaneles.VerFuncion 5, False

End Sub

Private Sub mnuQSuperficie_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modPaneles.VerFuncion 0, False

End Sub

Private Sub mnuQTranslados_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modPaneles.VerFuncion 1, False

End Sub

Private Sub mnuQTriggers_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    modPaneles.VerFuncion 6, False

End Sub

Private Sub mnuQuitarBloqueos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Bloqueo_Todo(0)

End Sub

Private Sub mnuQuitarFunciones_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    ' Superficies
    cSeleccionarSuperficie.Value = False
    Call cSeleccionarSuperficie_Click
    cQuitarEnEstaCapa.Value = False
    Call cQuitarEnEstaCapa_Click
    cQuitarEnTodasLasCapas.Value = False
    Call cQuitarEnTodasLasCapas_Click
    ' Translados
    cQuitarTrans.Value = False
    Call cQuitarTrans_Click
    cInsertarTrans.Value = False
    Call cInsertarTrans_Click
    ' Bloqueos
    cQuitarBloqueo.Value = False
    Call cQuitarBloqueo_Click
    cInsertarBloqueo.Value = False
    Call cInsertarBloqueo_Click
    ' Otras funciones
    cInsertarFunc(0).Value = False
    Call cInsertarFunc_Click(0)
    cInsertarFunc(1).Value = False
    Call cInsertarFunc_Click(1)
    cInsertarFunc(2).Value = False
    Call cInsertarFunc_Click(2)
    cQuitarFunc(0).Value = False
    Call cQuitarFunc_Click(0)
    cQuitarFunc(1).Value = False
    Call cQuitarFunc_Click(1)
    cQuitarFunc(2).Value = False
    Call cQuitarFunc_Click(2)
    ' Triggers
    cInsertarTrigger.Value = False
    Call cInsertarTrigger_Click
    cQuitarTrigger.Value = False
    Call cQuitarTrigger_Click

End Sub

Private Sub mnuQuitarNPCs_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Quitar_NPCs(False)

End Sub

Private Sub mnuQuitarNPCsHostiles_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Quitar_NPCs(True)

End Sub

Private Sub mnuQuitarObjetos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Quitar_Objetos

End Sub

Private Sub mnuQuitarSuperficieBordes_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Quitar_Bordes

End Sub

Private Sub mnuQuitarSuperficieDeCapa_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Quitar_Capa(cCapas.Text)

End Sub

Private Sub mnuQuitarTODO_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Borrar_Mapa

End Sub

Private Sub mnuQuitarTranslados_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 16/10/06
    '*************************************************
    Call modEdicion.Quitar_Translados

End Sub

Private Sub mnuQuitarTriggers_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call modEdicion.Quitar_Triggers

End Sub

Private Sub mnuReAbrirMapa_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error GoTo ErrHandler

    If Not FileExist(Dialog.FileName, vbArchive) Then Exit Sub
    
    If MapInfo.Changed = 1 Then
        If MsgBox(MSGMod, vbExclamation + vbYesNo) = vbYes Then
            modMapIO.GuardarMapa Dialog.FileName

        End If

    End If
    
    Call modMapIO.NuevoMapa
    modMapIO.AbrirMapa Dialog.FileName, MapData
    mnuReAbrirMapa.Enabled = True
    
    Exit Sub
ErrHandler:

End Sub

Private Sub mnuSalir_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Unload Me

End Sub

Private Sub mnuSuperficie_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 1 To 6
        frmMain.SelectPanel(i).Value = False
        Call VerFuncion(i, False)
    Next i

    modPaneles.VerFuncion 0, True

End Sub

Private Sub mnuTranslados_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 0 To 6

        If i <> 1 Then
            frmMain.SelectPanel(i).Value = False
            Call VerFuncion(i, False)

        End If

    Next i

    modPaneles.VerFuncion 1, True

End Sub

Private Sub mnuTriggers_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 0 To 5
        frmMain.SelectPanel(i).Value = False
        Call VerFuncion(i, False)
    Next i

    modPaneles.VerFuncion 6, True

End Sub

Private Sub mnuUtilizarDeshacer_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 16/10/06
    '*************************************************
    mnuUtilizarDeshacer.Checked = (mnuUtilizarDeshacer.Checked = False)

End Sub

Private Sub mnuUtirialNuevoFormato_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    mnuUtirialNuevoFormato.Checked = (mnuUtirialNuevoFormato.Checked = False)

End Sub

Private Sub mnuVerAutomatico_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    mnuVerAutomatico.Checked = (mnuVerAutomatico.Checked = False)

End Sub

Private Sub mnuVerBloqueos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    cVerBloqueos.Value = (cVerBloqueos.Value = False)
    mnuVerBloqueos.Checked = cVerBloqueos.Value

    bBloqs = mnuVerBloqueos.Checked

End Sub

Private Sub mnuVerCapa_Click(Index As Integer)
    mnuVerCapa(Index).Checked = (mnuVerCapa(Index).Checked = False)

    bVerCapa(Index) = mnuVerCapa(Index).Checked

End Sub

Private Sub mnuVerNPCs_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 26/05/06
    '*************************************************
    mnuVerNPCs.Checked = (mnuVerNPCs.Checked = False)

    bVerNpcs = mnuVerNPCs.Checked

End Sub

Private Sub mnuVerObjetos_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 26/05/06
    '*************************************************
    mnuVerObjetos.Checked = (mnuVerObjetos.Checked = False)

    bVerObjetos = mnuVerObjetos.Checked

End Sub

Private Sub mnuVerTranslados_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 26/05/06
    '*************************************************
    mnuVerTranslados.Checked = (mnuVerTranslados.Checked = False)
    bTranslados = mnuVerTranslados.Checked

End Sub

Private Sub mnuVerTriggers_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    cVerTriggers.Value = (cVerTriggers.Value = False)
    mnuVerTriggers.Checked = cVerTriggers.Value

    bTriggers = mnuVerTriggers.Checked

End Sub

Private Sub picRadar_MouseDown(Button As Integer, _
                               Shift As Integer, _
                               X As Single, _
                               y As Single)

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 29/05/06
    '*************************************************
    If X < MinXBorder Then X = 11
    If X > MaxXBorder Then X = 89
    If y < MinYBorder Then y = 10
    If y > MaxYBorder Then y = 92

    UserPos.X = X
    UserPos.y = y
    bRefreshRadar = True

End Sub

Private Sub picRadar_MouseMove(Button As Integer, _
                               Shift As Integer, _
                               X As Single, _
                               y As Single)
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 28/05/06
    '*************************************************
    MiRadarX = X
    MiRadarY = y

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, y As Single)
    '*************************************************
    'Author: Unkwown
    'Last modified: 20/05/06 - GS
    '*************************************************

    Dim tx As Integer
    Dim tY As Integer

    If Not MapaCargado Then Exit Sub

    If X <= MainViewShp.Left Or X >= MainViewShp.Left + MainViewWidth Or y <= MainViewShp.Top Or y >= MainViewShp.Top _
            + MainViewHeight Then
        Exit Sub

    End If

    ConvertCPtoTP MouseX, MouseY, tx, tY

    ClickEdit Button, tx, tY

    MouseDownX = tx
    MouseDownY = tY

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    '*************************************************
    'Author: Unkwown
    'Last modified: 20/05/06 - GS
    '*************************************************

    Dim tx As Integer
    Dim tY As Integer

    'Make sure map is loaded
    If Not MapaCargado Then Exit Sub
    HotKeysAllow = True

    MouseX = X - MainViewShp.Left
    MouseY = y - MainViewShp.Top

    'Trim to fit screen
    If MouseX < 0 Then
        MouseX = 0
    ElseIf MouseX > MainViewShp.Width Then
        MouseX = MainViewShp.Width

    End If

    'Trim to fit screen
    If MouseY < 0 Then
        MouseY = 0
    ElseIf MouseY > MainViewShp.Height Then
        MouseY = MainViewShp.Height

    End If
    
    'Make sure click is in view window
    If X <= MainViewShp.Left Or X >= MainViewShp.Left + MainViewWidth Or y <= MainViewShp.Top Or y >= MainViewShp.Top _
            + MainViewHeight Then
        Exit Sub

    End If

    ConvertCPtoTP MouseX, MouseY, tx, tY

    POSX.Caption = "X: " & tx & " - Y: " & tY

    If (tx < MinXBorder) Or (tY < MinYBorder) Or (tx > MaxXBorder) Or (tY > MaxYBorder) Then
        POSX.ForeColor = vbRed
    Else
        POSX.ForeColor = vbWhite

    End If

    ClickEdit Button, tx, tY

    If Button = vbLeftButton Then Call SelectTiles(False, tx, tY)

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 16/10/06
    '*************************************************
    Dim i As Long

    ' Guardar configuración
    WriteVar IniPath & "WorldEditor.ini", "CONFIGURACION", "GuardarConfig", IIf( _
            frmMain.mnuGuardarUltimaConfig.Checked = True, "1", "0")

    If frmMain.mnuGuardarUltimaConfig.Checked Then
        WriteVar IniPath & "WorldEditor.ini", "PATH", "UltimoMapa", Dialog.FileName
        WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "ControlAutomatico", IIf(frmMain.mnuVerAutomatico.Checked = _
                True, "1", "0")
    
        For i = 2 To 4
            WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "Capa" & i, IIf(bVerCapa(i), "1", "0")
        Next i
    
        WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "Translados", IIf(bTranslados, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "Objetos", IIf(bVerObjetos, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "NPCs", IIf(bVerNpcs, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "Triggers", IIf(bTriggers, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "Bloqueos", IIf(bBloqs, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "MOSTRAR", "LastPos", UserPos.X & "-" & UserPos.y
    
        WriteVar IniPath & "WorldEditor.ini", "CONFIGURACION", "UtilizarDeshacer", IIf( _
                frmMain.mnuUtilizarDeshacer.Checked = True, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "CONFIGURACION", "AutoCapturarTrans", IIf( _
                frmMain.mnuAutoCapturarTranslados.Checked = True, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "CONFIGURACION", "AutoCapturarSup", IIf( _
                frmMain.mnuAutoCapturarSuperficie.Checked = True, "1", "0")
        WriteVar IniPath & "WorldEditor.ini", "CONFIGURACION", "ObjTranslado", Val(Cfg_TrOBJ)

    End If

    'Allow MainLoop to close program
    prgRun = False

End Sub

Private Sub SelectPanel_Click(Index As Integer)
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim i As Byte

    For i = 0 To 6

        If i <> Index Then
            SelectPanel(i).Value = False
            Call VerFuncion(i, False)

        End If

    Next i

    If mnuAutoQuitarFunciones.Checked = True Then Call mnuQuitarFunciones_Click
    Call VerFuncion(Index, SelectPanel(Index).Value)

End Sub

Private Sub TimAutoGuardarMapa_Timer()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    If mnuAutoGuardarMapas.Checked = True Then
        bAutoGuardarMapaCount = bAutoGuardarMapaCount + 1

        If bAutoGuardarMapaCount >= bAutoGuardarMapa Then
            If MapInfo.Changed = 1 Then ' Solo guardo si el mapa esta modificado
                modMapIO.GuardarMapa Dialog.FileName

            End If

            bAutoGuardarMapaCount = 0

        End If

    End If

End Sub

Public Sub ObtenerNombreArchivo(ByVal Guardar As Boolean)
    '*************************************************
    'Author: Unkwown
    'Last modified: 20/05/06
    '*************************************************

    With Dialog
        .Filter = "Mapas de Argentum Online (*.map)|*.map"
    
        If Guardar Then
            .DialogTitle = "Guardar"
            .DefaultExt = ".txt"
            .FileName = vbNullString
            .Flags = cdlOFNPathMustExist
            .ShowSave
        Else
            .CancelError = False
            .DialogTitle = "Cargar"
            .FileName = vbNullString
            .Flags = cdlOFNFileMustExist
            .ShowOpen

        End If

    End With

End Sub
