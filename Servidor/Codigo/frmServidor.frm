VERSION 5.00
Begin VB.Form frmServidor 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Servidor"
   ClientHeight    =   6540
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4845
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   436
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   323
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command26 
      Caption         =   "Reset Listen"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1920
      TabIndex        =   28
      Top             =   6180
      Width           =   1455
   End
   Begin VB.PictureBox picFuera 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   120
      ScaleHeight     =   287
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   304
      TabIndex        =   6
      Top             =   120
      Width           =   4590
      Begin VB.VScrollBar VS1 
         Height          =   4335
         LargeChange     =   50
         Left            =   4320
         SmallChange     =   17
         TabIndex        =   26
         Top             =   0
         Width           =   255
      End
      Begin VB.PictureBox picCont 
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   0  'None
         Height          =   5055
         Left            =   0
         ScaleHeight     =   337
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   289
         TabIndex        =   7
         Top             =   0
         Width           =   4334
         Begin VB.CommandButton Command27 
            Caption         =   "Debug UserList"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   4680
            Width           =   4095
         End
         Begin VB.CommandButton Command24 
            Caption         =   "Estadisticas"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   25
            Top             =   4440
            Width           =   4095
         End
         Begin VB.CommandButton Command22 
            Caption         =   "Administración"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   8
            Top             =   4200
            Width           =   4095
         End
         Begin VB.CommandButton Command21 
            Caption         =   "Pausar el servidor"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   9
            Top             =   3960
            Width           =   4095
         End
         Begin VB.CommandButton Command17 
            Caption         =   "Actualizar npcs.dat"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   10
            Top             =   3720
            Width           =   4095
         End
         Begin VB.CommandButton Command25 
            Caption         =   "Reload MD5s"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   27
            Top             =   3480
            Width           =   4095
         End
         Begin VB.CommandButton Command16 
            Caption         =   "Reload Server.ini"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   11
            Top             =   3240
            Width           =   4095
         End
         Begin VB.CommandButton Command14 
            Caption         =   "Update MOTD"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   12
            Top             =   3000
            Width           =   4095
         End
         Begin VB.CommandButton Command19 
            Caption         =   "Unban All IPs (PELIGRO!)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   13
            Top             =   2760
            Width           =   4095
         End
         Begin VB.CommandButton Command15 
            Caption         =   "Unban All (PELIGRO!)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   2520
            Width           =   4095
         End
         Begin VB.CommandButton Command13 
            Caption         =   "Debug listening socket"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   15
            Top             =   2280
            Width           =   4095
         End
         Begin VB.CommandButton Command12 
            Caption         =   "Debug Npcs"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   16
            Top             =   2040
            Width           =   4095
         End
         Begin VB.CommandButton Command11 
            Caption         =   "Stats de los slots"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   17
            Top             =   1800
            Width           =   4095
         End
         Begin VB.CommandButton Command10 
            Caption         =   "Trafico"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   18
            Top             =   1560
            Width           =   4095
         End
         Begin VB.CommandButton Command9 
            Caption         =   "Reload Lista Nombres Prohibidos"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   19
            Top             =   1320
            Width           =   4095
         End
         Begin VB.CommandButton Command8 
            Caption         =   "Actualizar hechizos"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   20
            Top             =   1080
            Width           =   4095
         End
         Begin VB.CommandButton Command7 
            Caption         =   "Configurar intervalos"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   21
            Top             =   840
            Width           =   4095
         End
         Begin VB.CommandButton Command3 
            Caption         =   "Recargar Administradores"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   22
            Top             =   600
            Width           =   4095
         End
         Begin VB.CommandButton Command6 
            Caption         =   "ReSpawn Guardias en posiciones originales"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   23
            Top             =   360
            Width           =   4095
         End
         Begin VB.CommandButton Command1 
            Caption         =   "Actualizar objetos.dat"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   120
            TabIndex        =   24
            Top             =   120
            Width           =   4095
         End
      End
   End
   Begin VB.CommandButton Command23 
      Caption         =   "Boton Magico para apagar server"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   5520
      Width           =   4095
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Cargar BackUp del mundo"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   5160
      Width           =   4095
   End
   Begin VB.CommandButton Command18 
      Caption         =   "Guardar todos los personajes"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   4920
      Width           =   4095
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Hacer un Backup del mundo"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   4680
      Width           =   4095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   255
      Left            =   3480
      TabIndex        =   0
      Top             =   6180
      Width           =   945
   End
   Begin VB.CommandButton Command20 
      Caption         =   "Reset sockets"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   6180
      Width           =   1575
   End
   Begin VB.Shape Shape2 
      Height          =   1335
      Left            =   120
      Top             =   4560
      Width           =   4335
   End
End
Attribute VB_Name = "frmServidor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub Command1_Click()

    Call LoadOBJData

End Sub

Private Sub Command10_Click()

    frmTrafic.Show

End Sub

Private Sub Command11_Click()

    frmConID.Show

End Sub

Private Sub Command12_Click()

    frmDebugNpc.Show

End Sub

Private Sub Command13_Click()

    frmDebugSocket.Visible = True

End Sub

Private Sub Command14_Click()

    Call LoadMotd

End Sub

Private Sub Command15_Click()

    On Error Resume Next

    Dim Fn As String
    Dim cad$
    Dim n As Integer, k As Integer

    Dim sENtrada As String

    sENtrada = InputBox( _
               "Escribe ""estoy DE acuerdo"" entre comillas y con distición de mayusculas minusculas para desbanear a todos los personajes", "UnBan", _
               "hola")

    If sENtrada = "estoy DE acuerdo" Then

        Fn = App.Path & "\logs\GenteBanned.log"

        If FileExist(Fn, vbNormal) Then
            n = FreeFile
            Open Fn For Input Shared As #n

            Do While Not EOF(n)
                k = k + 1
                Input #n, cad$
                Call UnBan(cad$)

            Loop
            Close #n
            MsgBox "Se han habilitado " & k & " personajes."
            Kill Fn

        End If

    End If

End Sub

Private Sub Command16_Click()

    Call LoadSini

End Sub

Private Sub Command17_Click()

    Call CargaNpcsDat

End Sub

Private Sub Command18_Click()

    Me.MousePointer = 11

    Call GuardarUsuarios
    Me.MousePointer = 0
    MsgBox "Grabado de personajes OK!"

End Sub

Private Sub Command19_Click()

    Dim i As Long, n As Long

    Dim sENtrada As String

    sENtrada = InputBox("Escribe ""estoy DE acuerdo"" sin comillas y con distición de mayusculas minusculas para desbanear a todos los personajes", _
                        "UnBan", "hola")

    If sENtrada = "estoy DE acuerdo" Then

        n = BanIps.Count

        For i = 1 To BanIps.Count
            BanIps.Remove 1
        Next i

        MsgBox "Se han habilitado " & n & " ipes"

    End If

End Sub

Private Sub Command2_Click()

    frmServidor.Visible = False

End Sub

Private Sub Command20_Click()

    If MsgBox("Esta seguro que desea reiniciar los sockets ? Se cerrarán todas las conexiones activas.", vbYesNo, "Reiniciar Sockets") = vbYes Then
        Call WSApiReiniciarSockets

    End If

End Sub

'Barrin 29/9/03
Private Sub Command21_Click()

    If EnPausa = False Then
        EnPausa = True
        Call SendData(SendTarget.ToAll, 0, 0, "BKW")
        Command21.caption = "Reanudar el servidor"
    Else
        EnPausa = False
        Call SendData(SendTarget.ToAll, 0, 0, "BKW")
        Command21.caption = "Pausar el servidor"

    End If

End Sub

Private Sub Command22_Click()

    Me.Visible = False
    frmAdmin.Show

End Sub

Private Sub Command23_Click()

    If MsgBox("Esta seguro que desea hacer WorldSave, guardar pjs y cerrar ?", vbYesNo, "Apagar Magicamente") = vbYes Then
        Me.MousePointer = 11

        FrmStat.Show

        'commit experiencia


        'Guardar Pjs
        Call GuardarUsuarios

        'WorldSave
        Call DoBackUp

        'Chauuu
        Unload frmMain

    End If

End Sub

Private Sub Command24_Click()

    frmEstadisticas.Show

End Sub

Private Sub Command26_Click()

'Cierra el socket de escucha
    If SockListen >= 0 Then Call apiclosesocket(SockListen)

    'Inicia el socket de escucha
    SockListen = ListenForConnect(Puerto, hWndMsg, "")

End Sub

Private Sub Command27_Click()

    frmUserList.Show

End Sub

Private Sub Command3_Click()

    Call LoadAdministrativeUsers

End Sub

Private Sub Command4_Click()

    On Error GoTo eh

    Me.MousePointer = 11
    FrmStat.Show
    Call DoBackUp
    Me.MousePointer = 0
    MsgBox "WORLDSAVE OK!!"
    Exit Sub
eh:
    Call LogError("Error en WORLDSAVE")

End Sub

Private Sub Command5_Click()

'Se asegura de que los sockets estan cerrados e ignora cualquier err
    On Error Resume Next

    If frmMain.Visible Then frmMain.txStatus.caption = "Reiniciando."

    FrmStat.Show

    Call apiclosesocket(SockListen)

    Dim LoopC As Integer

    For LoopC = 1 To MaxUsers
        Call CloseSocket(LoopC)
    Next

    LastUser = 0
    NumUsers = 0

    ReDim Npclist(1 To MAXNPCS) As npc    'NPCS
    ReDim CharList(1 To MAXCHARS) As Integer

    Call LoadSini
    'Call CargarBackUp
    Call LoadOBJData

    SockListen = ListenForConnect(Puerto, hWndMsg, "")

    If frmMain.Visible Then frmMain.txStatus.caption = "Escuchando conexiones entrantes ..."

End Sub

Private Sub Command6_Click()

    Call ReSpawnOrigPosNpcs

End Sub

Private Sub Command7_Click()

    FrmInterv.Show

End Sub

Private Sub Command8_Click()

    Call CargarHechizos

End Sub

Private Sub Command9_Click()

    Call CargarForbidenWords

End Sub

Private Sub Form_Deactivate()

    frmServidor.Visible = False

End Sub

Private Sub Form_Load()

    Command20.Visible = True
    Command26.Visible = True

    VS1.min = 0

    If picCont.Height > picFuera.ScaleHeight Then
        VS1.max = picCont.Height - picFuera.ScaleHeight
    Else
        VS1.max = 0

    End If

    picCont.Top = -VS1.value

End Sub

Private Sub VS1_Change()

    picCont.Top = -VS1.value

End Sub

Private Sub VS1_Scroll()

    picCont.Top = -VS1.value

End Sub
