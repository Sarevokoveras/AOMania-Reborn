VERSION 5.00
Begin VB.Form frmPaneldeGM 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Panel GM"
   ClientHeight    =   6045
   ClientLeft      =   150
   ClientTop       =   495
   ClientWidth     =   6150
   LinkTopic       =   "Panel GM"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MousePointer    =   99  'Custom
   ScaleHeight     =   6045
   ScaleWidth      =   6150
   StartUpPosition =   1  'CenterOwner
   Begin VB.ListBox ListConsultas 
      BackColor       =   &H000040C0&
      Height          =   1815
      Left            =   240
      TabIndex        =   15
      Top             =   1680
      Width           =   5655
   End
   Begin VB.ListBox ListQuest 
      Height          =   1815
      Left            =   240
      TabIndex        =   14
      Top             =   1680
      Width           =   5655
   End
   Begin VB.CommandButton Responder 
      Caption         =   "Responder"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   960
      TabIndex        =   11
      Top             =   5000
      Width           =   4215
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   600
      TabIndex        =   10
      Top             =   3510
      Width           =   4935
   End
   Begin VB.ListBox ListShow 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   240
      TabIndex        =   9
      Top             =   1680
      Width           =   5655
   End
   Begin VB.CommandButton Consultas 
      Caption         =   "Consultas"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4320
      TabIndex        =   8
      Top             =   840
      UseMaskColor    =   -1  'True
      Width           =   990
   End
   Begin VB.CommandButton GMQUEST 
      Caption         =   "GM QUEST"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   2400
      TabIndex        =   7
      Top             =   840
      Width           =   990
   End
   Begin VB.CommandButton SHOWSOS 
      Caption         =   "SHOW SOS"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   600
      TabIndex        =   6
      Top             =   840
      Width           =   990
   End
   Begin VB.CommandButton Buscar 
      Caption         =   " Buscar"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   480
      TabIndex        =   5
      Top             =   5400
      Width           =   990
   End
   Begin VB.CommandButton Baneos 
      Caption         =   "Baneos"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   1680
      TabIndex        =   4
      Top             =   5400
      Width           =   990
   End
   Begin VB.CommandButton invigm 
      Caption         =   " invisible admin"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   2880
      TabIndex        =   3
      Top             =   5400
      Width           =   1695
   End
   Begin VB.CommandButton Cerrar 
      Caption         =   "  Cerrar"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   4800
      TabIndex        =   2
      Top             =   5400
      Width           =   975
   End
   Begin VB.CommandButton Actualizar 
      Caption         =   "Actualizar"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   4080
      TabIndex        =   1
      Top             =   200
      Width           =   1695
   End
   Begin VB.ComboBox ComboNick 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   240
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   240
      Width           =   3735
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   3960
      TabIndex        =   13
      Top             =   1395
      Width           =   465
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   960
      TabIndex        =   12
      Top             =   1395
      Width           =   465
   End
   Begin VB.Line Line2 
      Index           =   0
      X1              =   360
      X2              =   5880
      Y1              =   5280
      Y2              =   5280
   End
   Begin VB.Line Line2 
      Index           =   2
      X1              =   240
      X2              =   5760
      Y1              =   1320
      Y2              =   1320
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   240
      X2              =   5760
      Y1              =   720
      Y2              =   720
   End
   Begin VB.Menu Personaje 
      Caption         =   "Personaje"
      Begin VB.Menu mnuEchar 
         Caption         =   "Echar"
      End
      Begin VB.Menu mnuSumonear 
         Caption         =   "Sumonear"
      End
      Begin VB.Menu mnuIra 
         Caption         =   "Ir a"
      End
      Begin VB.Menu mnuUbicacion 
         Caption         =   "Ubicaci�n"
      End
      Begin VB.Menu mnuRevivir 
         Caption         =   "Revivir"
      End
      Begin VB.Menu mnuLiberar 
         Caption         =   "Liberar"
      End
      Begin VB.Menu mnuIrasrestri 
         Caption         =   "Ir a sin restricci�n"
      End
      Begin VB.Menu Castigos 
         Caption         =   "Castigos"
         Begin VB.Menu Encarcelar 
            Caption         =   "Encarcelar"
            Begin VB.Menu mnuCarcelCinco 
               Caption         =   "5 minutos"
            End
            Begin VB.Menu mnuCarcelQuince 
               Caption         =   "15 minutos"
            End
            Begin VB.Menu mnuCarcelTreinta 
               Caption         =   "30 minutos"
            End
         End
         Begin VB.Menu Silenciar 
            Caption         =   "Silenciar"
            Begin VB.Menu mnuSilenciarCinco 
               Caption         =   "5 minutos"
            End
            Begin VB.Menu mnuSilenciarQuince 
               Caption         =   "15 minutos"
            End
            Begin VB.Menu mnuSilenciarTreinta 
               Caption         =   "30 minutos"
            End
            Begin VB.Menu mnuSilenciarOtro 
               Caption         =   "Definir Otro"
            End
         End
         Begin VB.Menu mnuCastigosPuntos 
            Caption         =   "Castigos Puntos"
            Begin VB.Menu mnuPuntosretos 
               Caption         =   "Puntos retos"
            End
            Begin VB.Menu mnupuntos 
               Caption         =   "Puntos"
            End
            Begin VB.Menu mnupuntostorneos 
               Caption         =   "Puntos Torneos"
            End
            Begin VB.Menu mnupuntosclan 
               Caption         =   "Puntos Clan"
            End
            Begin VB.Menu mnuresetpuntos 
               Caption         =   "Resetear todos"
            End
         End
      End
      Begin VB.Menu Informaci�n 
         Caption         =   "Informaci�n"
         Begin VB.Menu mnuGeneral 
            Caption         =   "General"
         End
         Begin VB.Menu mnuInventario 
            Caption         =   "Inventario"
         End
         Begin VB.Menu mnuSkills 
            Caption         =   "Skills"
         End
         Begin VB.Menu mnuBoveda 
            Caption         =   "B�veda"
         End
         Begin VB.Menu mnuDimeId 
            Caption         =   "DimeID"
         End
         Begin VB.Menu mnuDimeFd 
            Caption         =   "DimeFD"
         End
      End
   End
   Begin VB.Menu Herramientas 
      Caption         =   "Herramientas"
      Begin VB.Menu mnuInsComentario 
         Caption         =   "Insertar comentario"
      End
      Begin VB.Menu mnuenviarhora 
         Caption         =   "Enviar hora"
      End
      Begin VB.Menu mnuenemigoenmapa 
         Caption         =   "Enemigo en mapa"
      End
      Begin VB.Menu mnulimpiarmapa 
         Caption         =   "Limpiar Mapa"
      End
      Begin VB.Menu mnulimpiaroro 
         Caption         =   "Limpiar Oro"
      End
      Begin VB.Menu mnubloqtile 
         Caption         =   "Bloquear Tile"
      End
      Begin VB.Menu mnuUserMap 
         Caption         =   "Usuarios en el mapas"
      End
      Begin VB.Menu Clanes 
         Caption         =   "Clanes"
         Begin VB.Menu mnuUserRajarClan 
            Caption         =   "Usuario Rajar Clan"
         End
         Begin VB.Menu mnuMiembrtoclan 
            Caption         =   "Miembros Clan"
         End
         Begin VB.Menu mnuBanClan 
            Caption         =   "Banear Clan"
         End
      End
      Begin VB.Menu DireccionesdeIp 
         Caption         =   "Direcci�nes de IP"
         Begin VB.Menu mnuIpnick 
            Caption         =   "Busca la Ip del Nick"
         End
         Begin VB.Menu mnubuscaipcoincidentes 
            Caption         =   "Buscar IP's coincidentes"
         End
         Begin VB.Menu mnubanip 
            Caption         =   "Banear una IP"
         End
         Begin VB.Menu mnurecgipban 
            Caption         =   "Recargar IP's baneadas"
         End
         Begin VB.Menu mnulistipban 
            Caption         =   "Lista de IP's baneadas"
         End
      End
   End
   Begin VB.Menu Administracion 
      Caption         =   "Administraci�n"
      Begin VB.Menu mnuoffserv 
         Caption         =   "Apagar el servidor"
      End
      Begin VB.Menu mnusavepjs 
         Caption         =   "Grabar personajes"
      End
      Begin VB.Menu mnuStartWorld 
         Caption         =   "Iniciar WorldSave"
      End
      Begin VB.Menu Procesos 
         Caption         =   "Procesos"
         Begin VB.Menu mnuVerPCarpetas 
            Caption         =   "Ver procesos Carpetas"
         End
         Begin VB.Menu mnuvercaptions 
            Caption         =   "Ver Captions"
         End
         Begin VB.Menu mnuVerprocess 
            Caption         =   "Ver process"
         End
      End
      Begin VB.Menu sActualizar 
         Caption         =   "Actualizar"
         Begin VB.Menu mnuactobj 
            Caption         =   "Objetos"
         End
         Begin VB.Menu mnuactMD5 
            Caption         =   "MD5"
         End
         Begin VB.Menu mnuactspell 
            Caption         =   "Hechizos"
         End
         Begin VB.Menu mnuactNPCs 
            Caption         =   "NPCs"
         End
      End
      Begin VB.Menu Estadoclimatico 
         Caption         =   "Estado climatico"
         Begin VB.Menu mnuiodlluvia 
            Caption         =   "Iniciar o detener una lluvia"
         End
         Begin VB.Menu mnunochoodia 
            Caption         =   "Anochecer o Amenecer"
         End
      End
      Begin VB.Menu Meditaciones 
         Caption         =   "Meditaciones"
      End
      Begin VB.Menu Eventos 
         Caption         =   "Eventos"
         Begin VB.Menu mnuetguerrabandas 
            Caption         =   "E/T Guerra de Bandas"
         End
         Begin VB.Menu mnustartguerra 
            Caption         =   "Comenzar Guerra"
         End
         Begin VB.Menu mnuetguerramedusas 
            Caption         =   "E/T Guerra de Medusas"
         End
         Begin VB.Menu TorneosAutomaticos 
            Caption         =   "Torneos Automaticos"
            Begin VB.Menu mnuround1user2 
               Caption         =   "Rondas 1 usuarios 2"
            End
            Begin VB.Menu mnuround2user4 
               Caption         =   "Rondas 2 usuarios 4"
            End
            Begin VB.Menu mnuround3user8 
               Caption         =   "Rondas 3 usuarios 8"
            End
            Begin VB.Menu mnuround4user16 
               Caption         =   "Rondas 4 usuarios 16"
            End
            Begin VB.Menu mnuround5user32 
               Caption         =   "Rondas 5 usuarios 32"
            End
            Begin VB.Menu mnuround6user64 
               Caption         =   "Rondas 6 usuarios 64"
            End
         End
         Begin VB.Menu mnudamecriatura 
            Caption         =   "Dame Criatura"
         End
         Begin VB.Menu Barcos 
            Caption         =   "Barcos"
            Begin VB.Menu mnubarcozonas 
               Caption         =   "Zonas"
            End
            Begin VB.Menu mnubarcotiempo 
               Caption         =   "Depurar tiempo"
            End
            Begin VB.Menu mnuBarcos 
               Caption         =   "Barcos"
            End
            Begin VB.Menu mnubarcocruceros 
               Caption         =   "Cruceros"
            End
         End
      End
      Begin VB.Menu Centinela 
         Caption         =   "Centinela"
         Begin VB.Menu mnucentitrabajando 
            Caption         =   "Usuarios trabajando"
         End
         Begin VB.Menu mnucentironda 
            Caption         =   "Forzar Ronda"
         End
      End
      Begin VB.Menu SubierPersonajes 
         Caption         =   "Subir Personajes"
         Begin VB.Menu mnuSubirNivel 
            Caption         =   "Nivel"
         End
         Begin VB.Menu mnuSubirSkills 
            Caption         =   "Skills"
         End
         Begin VB.Menu mnuSubiroro 
            Caption         =   "Oro"
         End
         Begin VB.Menu mnusubirciu 
            Caption         =   "Muertes Ciu"
         End
         Begin VB.Menu mnuSubircri 
            Caption         =   "Muertes Cri"
         End
      End
   End
   Begin VB.Menu Transportes 
      Caption         =   "Transportes"
      Begin VB.Menu Castillos 
         Caption         =   "Castillos"
         Begin VB.Menu mnuNorte 
            Caption         =   "Castillo Norte"
         End
         Begin VB.Menu mnuSur 
            Caption         =   "Castillo Sur"
         End
         Begin VB.Menu mnuEste 
            Caption         =   "Castillo Este"
         End
         Begin VB.Menu mnuOeste 
            Caption         =   "Castillo Oeste"
         End
         Begin VB.Menu mnuFuerte 
            Caption         =   "Fuerte"
         End
         Begin VB.Menu mnuFortaleza 
            Caption         =   "Fortaleza"
         End
      End
      Begin VB.Menu Ciudades 
         Caption         =   "Ciudades"
         Begin VB.Menu mnuciugm 
            Caption         =   "Ciudad GM"
         End
         Begin VB.Menu mnuCiuNix 
            Caption         =   "Ciudad NIX"
         End
         Begin VB.Menu mnuciubander 
            Caption         =   "Ciudad Bander"
         End
         Begin VB.Menu mnuciuulla 
            Caption         =   "Ciudad Ulla"
         End
         Begin VB.Menu mnuciucaosbill 
            Caption         =   "Ciudad Caos Bill"
         End
         Begin VB.Menu mnuciutemplaria 
            Caption         =   "Ciudad Templaria"
         End
         Begin VB.Menu mnuciuesperanza 
            Caption         =   "Ciudad Esperanza"
         End
         Begin VB.Menu mnuciuIceBill 
            Caption         =   "Ciudad IceBill"
         End
         Begin VB.Menu mnuciunew 
            Caption         =   "Ciudad Newbie"
         End
         Begin VB.Menu mnuciulindos 
            Caption         =   "Ciudad Lindos"
         End
         Begin VB.Menu mnuciuarghal 
            Caption         =   "Ciudad Arghal"
         End
         Begin VB.Menu mnuciutebas 
            Caption         =   "Ciudad Tebas"
         End
         Begin VB.Menu mnuciuyanhamun 
            Caption         =   "Ciudad Yanhamun"
         End
      End
      Begin VB.Menu Dungeons 
         Caption         =   "Dungeons"
         Begin VB.Menu Piramide 
            Caption         =   "Piramide"
         End
         Begin VB.Menu Faraones 
            Caption         =   "Faraones"
         End
         Begin VB.Menu Dracos 
            Caption         =   "Dracos"
         End
         Begin VB.Menu Ara�as 
            Caption         =   "Ara�as"
         End
         Begin VB.Menu rapajik 
            Caption         =   "Minas rapajik"
         End
         Begin VB.Menu thyr 
            Caption         =   "Minas thyr"
         End
         Begin VB.Menu Marabel 
            Caption         =   "Marabel"
         End
         Begin VB.Menu Miniveril 
            Caption         =   "Miniveril"
         End
         Begin VB.Menu Newbie 
            Caption         =   "Newbie"
         End
         Begin VB.Menu Hadas 
            Caption         =   "Hadas"
         End
         Begin VB.Menu Laberinto 
            Caption         =   "Laberinto"
         End
         Begin VB.Menu Darks 
            Caption         =   "Darks"
         End
         Begin VB.Menu Caos 
            Caption         =   "Caos"
         End
         Begin VB.Menu VerilEntrada 
            Caption         =   "Veril Entrada"
         End
         Begin VB.Menu VerilSala 
            Caption         =   "Veril Sala"
         End
         Begin VB.Menu VerilMinas 
            Caption         =   "Veril Minas"
         End
         Begin VB.Menu VerilFuerte 
            Caption         =   "Veril Fuerte"
         End
         Begin VB.Menu Veril1 
            Caption         =   "Veril 1"
         End
         Begin VB.Menu Veril2 
            Caption         =   "Veril 2"
         End
         Begin VB.Menu Hielo 
            Caption         =   "Hielo"
         End
      End
      Begin VB.Menu CasaEncantada 
         Caption         =   "Casa Encantada"
      End
      Begin VB.Menu GuerradeBandas 
         Caption         =   "Guerra de Bandas"
      End
      Begin VB.Menu GuerradeMedusas 
         Caption         =   "Guerra de Medusas"
      End
      Begin VB.Menu Usuarios 
         Caption         =   "Usuarios"
         Begin VB.Menu mnutransuser 
            Caption         =   "Transportar Usuario"
         End
         Begin VB.Menu mnumvruser 
            Caption         =   "Mover Usuario"
         End
      End
   End
   Begin VB.Menu Mensajes 
      Caption         =   "Mensajes"
      Begin VB.Menu mnumsjserver 
         Caption         =   "Mensaje Servidor"
      End
      Begin VB.Menu mnumsjpriv 
         Caption         =   "Mensaje Privado"
      End
      Begin VB.Menu mnumsjtodos 
         Caption         =   "Mensaje Todos"
      End
      Begin VB.Menu mnumsjgms 
         Caption         =   "Mensajes Gms"
      End
      Begin VB.Menu msjcontadortorneos 
         Caption         =   "Contar en Torneos"
      End
   End
   Begin VB.Menu Menu_Show 
      Caption         =   "Show"
      HelpContextID   =   1
      Visible         =   0   'False
      WindowList      =   -1  'True
      Begin VB.Menu mnushowborrarmensaje 
         Caption         =   "Borrar mensaje"
      End
      Begin VB.Menu mnushowirusuario 
         Caption         =   "Ir al usuario"
      End
      Begin VB.Menu mnushowtraer 
         Caption         =   "Traer al usuario"
      End
      Begin VB.Menu mnushowinvalida 
         Caption         =   "Inv�lida"
      End
      Begin VB.Menu mnushowmanual 
         Caption         =   "Manual/FAQ"
      End
   End
   Begin VB.Menu Menu_Quest 
      Caption         =   "Quest"
      Visible         =   0   'False
      Begin VB.Menu mnuquestborrarmensaje 
         Caption         =   "Borrar mensaje"
      End
      Begin VB.Menu mnuquesttraer 
         Caption         =   "Traer al usuario"
      End
      Begin VB.Menu mnuquestnix 
         Caption         =   "Llevar a Nix"
      End
   End
   Begin VB.Menu Menu_Consultas 
      Caption         =   "Consultas"
      Visible         =   0   'False
      Begin VB.Menu mnuconsuborrarmensaje 
         Caption         =   "Borrar mensaje"
      End
   End
End
Attribute VB_Name = "frmPaneldeGM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private tmp    As String
Private tmp1   As String
Private tmp2   As String
Private tmp3   As String
Private tmp4   As String

Public fParent As frmPaneldeGM
Public fChild  As New frmBuscar

Private Declare Function SetParent Lib "user32" (ByVal hWndChild As Long, ByVal hWndParent As Long) As Long

Private Function OpenChildInParent(Parent As Form, Child As Form)
    SetParent Child.HWnd, Parent.HWnd

End Function

Public Sub Actualizar_Click()
    Call SendData("LISTUSU")

End Sub

Private Sub Ara�as_Click()
    Call SendData("/telep PaneldeGM 141 50 50")

End Sub

Private Sub Baneos_Click()
    Unload Me
    Unload frmPaneldeGM
    frmBaneos.Show vbModal, frmMain

End Sub

Private Sub Buscar_Click()

    Set fParent = frmPaneldeGM
    OpenChildInParent fParent, fChild
 
    fChild.Show vbModeless, frmPaneldeGM

End Sub

Private Sub Caos_Click()
    Call SendData("/telep PaneldeGM 168 48 47")

End Sub

Private Sub CasaEncantada_Click()
    Call SendData("/telep PaneldeGM 85 55 49")

End Sub

Private Sub Cerrar_Click()
    Unload Me

End Sub

Private Sub Consultas_Click()
    ListConsultas.Clear
  
    If ListShow.Visible = True Then
        ListShow.Visible = False
        ListConsultas.Visible = True

    End If
    
    If ListQuest.Visible = True Then
        ListQuest.Visible = False
        ListConsultas.Visible = True

    End If
    
    Label1.Caption = "Mensajes"
    Label2.Caption = "Hay " & NumUsers & " Usuarios Online."

    Call SendData("/PANELCONSULTA")

End Sub

Private Sub Darks_Click()
    Call SendData("/telep PaneldeGM 158 43 51")

End Sub

Private Sub Dracos_Click()
    Call SendData("/telep PaneldeGM 82 52 32")

End Sub

Private Sub Faraones_Click()
    Call SendData("/telep PaneldeGM 153 43 77")

End Sub

Private Sub Form_Load()

    ListShow.Clear
    Call SendData("/PANELSOS")
 
    Label1.Caption = "Usuarios"
    Label2.Caption = "Hay " & NumUsers & " Usuarios Online."
    ListQuest.Visible = False
    ListConsultas.Visible = False
     
End Sub

Private Sub GMQUEST_Click()

    If ListShow.Visible = True Then
        ListShow.Visible = False
        ListQuest.Visible = True

    End If
    
    If ListConsultas.Visible = True Then
        ListConsultas.Visible = False
        ListQuest.Visible = True

    End If

    ListQuest.Clear
    Call SendData("LISTQST")
    Label1.Caption = "Quest"
    Label2.Caption = "Hay " & NumUsers & " Usuarios Online."

End Sub

Private Sub GuerradeBandas_Click()
    Call SendData("/telep PaneldeGM 162 40 49")

End Sub

Private Sub GuerradeMedusas_Click()
    Call SendData("/telep PaneldeGM 163 40 49")

End Sub

Private Sub Hadas_Click()
    Call SendData("/telep PaneldeGM 55 31 83")

End Sub

Private Sub Hielo_Click()
    Call SendData("/telep PaneldeGM 151 50 50")

End Sub

Private Sub invigm_Click()
    Call SendData("/INVISIBLE")

End Sub

Private Sub Laberinto_Click()
    Call SendData("/telep PaneldeGM 81 14 15")

End Sub

Private Sub ListShow_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Button = vbRightButton Then
      
        'Mostramos el men� popup
        PopupMenu frmPanelGm.Menu_Show
  
    End If

End Sub

Private Sub ListQuest_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Button = vbRightButton Then
      
        'Mostramos el men� popup
        PopupMenu frmPanelGm.Menu_Quest
  
    End If

End Sub

Private Sub ListConsultas_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Button = vbRightButton Then
      
        'Mostramos el men� popup
        PopupMenu frmPanelGm.Menu_Consultas
  
    End If

End Sub

Private Sub Marabel_Click()
    Call SendData("/telep PaneldeGM 142 50 50")

End Sub

Private Sub Miniveril_Click()
    Call SendData("/telep PaneldeGM 139 49 49")

End Sub

Private Sub mnuactNPCs_Click()
    Call SendData("/RELOADNPCS")

End Sub

Private Sub mnuactobj_Click()
    Call SendData("/RELOADOBJ")

End Sub

Private Sub mnuactspell_Click()
    Call SendData("/RELOADHECHIZOS")

End Sub

Private Sub mnuBoveda_Click()
    tmp = ComboNick.Text
    Call SendData("/BOV " & tmp)

End Sub

Private Sub mnuCarcelCinco_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("�Cual es el motivo?", "")
    Call SendData("/CARCEL " & tmp & "@" & tmp1 & "@" & "5")

End Sub

Private Sub mnuCarcelQuince_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("�Cual es el motivo?", "")
    Call SendData("/CARCEL " & tmp & "@" & tmp1 & "@" & "15")

End Sub

Private Sub mnuCarcelTreinta_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("�Cual es el motivo?", "")
    Call SendData("/CARCEL " & tmp & "@" & tmp1 & "@" & "30")

End Sub

Private Sub mnuciuarghal_Click()
    Call SendData("/telep PaneldeGM 132 85 22")

End Sub

Private Sub mnuciubander_Click()
    Call SendData("/telep PaneldeGM 59 41 46")

End Sub

Private Sub mnuciucaosbill_Click()
    Call SendData("/telep PaneldeGM 84 52 54")

End Sub

Private Sub mnuciuesperanza_Click()
    Call SendData("/telep PaneldeGM 137 50 50")

End Sub

Private Sub mnuciugm_Click()
    Call SendData("/telep PaneldeGM 47 49 50")

End Sub

Private Sub mnuciuIceBill_Click()
    Call SendData("/telep PaneldeGM 149 50 54")

End Sub

Private Sub mnuciulindos_Click()
    Call SendData("/telep PaneldeGM 62 55 89")

End Sub

Private Sub mnuciunew_Click()
    Call SendData("/telep PaneldeGM 37 50 50")

End Sub

Private Sub mnuCiuNix_Click()
    Call SendData("/telep PaneldeGM 34 29 66")

End Sub

Private Sub mnuciutebas_Click()
    Call SendData("/telep PaneldeGM 86 50 50")

End Sub

Private Sub mnuciutemplaria_Click()
    Call SendData("/telep PaneldeGM 95 51 51")

End Sub

Private Sub mnuciuulla_Click()
    Call SendData("/telep PaneldeGM 1 52 53")

End Sub

Private Sub mnuciuyanhamun_Click()
    Call SendData("/telep PaneldeGM 20 51 44")

End Sub

Private Sub mnuEchar_Click()
    tmp = ComboNick.Text
    Call SendData("/ECHAR " & tmp)

End Sub

Private Sub mnuenviarhora_Click()
    tmp = ComboNick.Text
    Call SendData("/HORA " & tmp)
End Sub

Private Sub mnuEste_Click()
    Call SendData("/telep PaneldeGM 100 61 83")

End Sub

Private Sub mnuFortaleza_Click()
    Call SendData("/telep PaneldeGM 102 62 50")

End Sub

Private Sub mnuFuerte_Click()
    Call SendData("/telep PaneldeGM 164 50 40")

End Sub

Private Sub mnuGeneral_Click()
    tmp = ComboNick.Text
    Call SendData("/INFO " & tmp)

End Sub

Private Sub mnuInsComentario_Click()
    tmp = InputBox("Inserta el comentario", "")
    Call SendData("/REM " & tmp)

End Sub

Private Sub mnuInventario_Click()
    tmp = ComboNick.Text
    Call SendData("/INV " & tmp)

End Sub

Private Sub mnuiodlluvia_Click()
    Call SendData("/Lluvia")

End Sub

Private Sub mnuIra_Click()
    tmp = ComboNick.Text
    Call SendData("/IRA " & tmp)

End Sub

Private Sub mnuIrasrestri_Click()
   tmp = ComboNick.Text
   Call SendData("/IRCERCA " & tmp)
End Sub

Private Sub mnuLiberar_Click()
  tmp = ComboNick.Text
  Call SendData("/LIBERAR " & tmp)
End Sub

Private Sub mnumsjgms_Click()
    tmp = InputBox("Texto Para Enviar", "")
    Call SendData("/G " & tmp)

End Sub

Private Sub mnumsjpriv_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("Texto Para Enviar", "")
    Call SendData("/UMSG " & tmp & " " & tmp1)

End Sub

Private Sub mnumsjserver_Click()
    tmp = InputBox("Texto Para Enviar", "")
    Call SendData("/RSERVER " & tmp)

End Sub

Private Sub mnumsjtodos_Click()
    tmp = InputBox("Texto Para Enviar", "")
    Call SendData("/RMSG " & tmp)

End Sub

Private Sub mnumvruser_Click()
    tmp = InputBox("Nombre del Personaje", "")
    Call SendData("/MOVER " & tmp)

End Sub

Private Sub mnuNorte_Click()
    Call SendData("/telep PaneldeGM 98 61 83")

End Sub

Private Sub mnuOeste_Click()
    Call SendData("/telep PaneldeGM 101 61 83")

End Sub

Private Sub mnuoffserv_Click()
    Call SendData("/OFFE")

End Sub

Private Sub mnuRevivir_Click()
    tmp = ComboNick.Text
    Call SendData("/REVIVIR " & tmp)

End Sub

Private Sub mnusavepjs_Click()
    Call SendData("/Grabar")

End Sub

Private Sub mnuSilenciarCinco_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("�Cual es el motivo?", "")
    Call SendData("/SILENCIAR " & tmp & "@" & tmp1 & "@" & "5")

End Sub

Private Sub mnuSilenciarOtro_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("�Cual es el motivo?", "")
    tmp2 = InputBox("�Minutos a silenciar? (Hasta 60)", "")
    Call SendData("/SILENCIAR " & tmp & "@" & tmp1 & "@" & "5")

End Sub

Private Sub mnuSilenciarQuince_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("�Cual es el motivo?", "")
    Call SendData("/SILENCIAR " & tmp & "@" & tmp1 & "@" & "15")

End Sub

Private Sub mnuSilenciarTreinta_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("�Cual es el motivo?", "")
    Call SendData("/SILENCIAR " & tmp & "@" & tmp1 & "@" & "30")

End Sub

Private Sub mnuSkills_Click()
    tmp = ComboNick.Text
    Call SendData("/SKILLS " & tmp)

End Sub

Private Sub mnuStartWorld_Click()
    Call SendData("/DOBACKUP")

End Sub

Private Sub mnuSumonear_Click()
    tmp = ComboNick.Text
    Call SendData("/SUM " & tmp)

End Sub

Private Sub mnuSur_Click()
    Call SendData("/telep PaneldeGM 99 61 83")

End Sub

Private Sub mnutransuser_Click()
    tmp = ComboNick.Text
    tmp1 = InputBox("Mapa", "")
    tmp2 = InputBox("Mapa X", "")
    tmp3 = InputBox("Mapa Y", "")
    Call SendData("/TELEP " & tmp & " " & tmp1 & " " & tmp2 & " " & tmp3)

End Sub

Private Sub mnuUbicacion_Click()
    tmp = ComboNick.Text
    Call SendData("/DONDE " & tmp)

End Sub

Private Sub msjcontadortorneos_Click()
    Call SendData("/CR 3")

End Sub

Private Sub Newbie_Click()
    Call SendData("/telep PaneldeGM 156 22 78")

End Sub

Private Sub Piramide_Click()
    Call SendData("/telep PaneldeGM 152 57 48")

End Sub

Private Sub rapajik_Click()
    Call SendData("/telep PaneldeGM 51 82 78")

End Sub

Private Sub SHOWSOS_Click()

    If ListQuest.Visible = True Then
        ListQuest.Visible = False
        ListShow.Visible = True

    End If
    
    If ListConsultas.Visible = True Then
        ListConsultas.Visible = False
        ListShow.Visible = True

    End If
    
    ListShow.Clear
    Call SendData("/PANELSOS")
    
    Label1.Caption = "Usuarios"
    Label2.Caption = "Hay " & NumUsers & " Usuarios Online."

End Sub

Private Sub thyr_Click()
    Call SendData("/telep PaneldeGM 31 46 45")

End Sub

Private Sub Veril1_Click()
    Call SendData("/telep PaneldeGM 121 53 72")

End Sub

Private Sub Veril2_Click()
    Call SendData("/telep PaneldeGM 122 64 74")

End Sub

Private Sub VerilEntrada_Click()
    Call SendData("/telep PaneldeGM 119 52 56")

End Sub

Private Sub VerilFuerte_Click()
    Call SendData("/telep PaneldeGM 126 64 82")

End Sub

Private Sub VerilMinas_Click()
    Call SendData("/telep PaneldeGM 125 52 53")

End Sub

Private Sub VerilSala_Click()
    Call SendData("/telep PaneldeGM 127 49 54")

End Sub

'A�adir cuando regrese los codigos de Miqueas.
