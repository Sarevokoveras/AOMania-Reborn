VERSION 5.00
Begin VB.Form frmMusica 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Musica"
   ClientHeight    =   1935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5430
   Icon            =   "frmMusica.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1935
   ScaleWidth      =   5430
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lstMusic 
      Height          =   1620
      ItemData        =   "frmMusica.frx":628A
      Left            =   120
      List            =   "frmMusica.frx":628C
      TabIndex        =   4
      Top             =   120
      Width           =   2655
   End
   Begin WorldEditor.lvButtons_H cmdCerrar 
      Height          =   495
      Left            =   2880
      TabIndex        =   3
      Top             =   1320
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   873
      Caption         =   "&Cerrar"
      CapAlign        =   2
      BackStyle       =   2
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      cGradient       =   0
      Mode            =   0
      Value           =   0   'False
      cBack           =   -2147483633
   End
   Begin WorldEditor.lvButtons_H cmdAplicarYCerrar 
      Height          =   495
      Left            =   2880
      TabIndex        =   2
      Top             =   720
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   873
      Caption         =   "&Aplicar y Cerrar"
      CapAlign        =   2
      BackStyle       =   2
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      cGradient       =   0
      Mode            =   0
      Value           =   0   'False
      Enabled         =   0   'False
      cBack           =   12648447
   End
   Begin WorldEditor.lvButtons_H cmdDetener 
      Height          =   495
      Left            =   4080
      TabIndex        =   1
      Top             =   120
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   873
      Caption         =   "&Detener"
      CapAlign        =   2
      BackStyle       =   2
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      cGradient       =   0
      Mode            =   0
      Value           =   0   'False
      Enabled         =   0   'False
      cBack           =   12632319
   End
   Begin WorldEditor.lvButtons_H cmdEscuchar 
      Height          =   495
      Left            =   2880
      TabIndex        =   0
      Top             =   120
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   873
      Caption         =   "&Escuchar"
      CapAlign        =   2
      BackStyle       =   2
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      cGradient       =   0
      Mode            =   0
      Value           =   0   'False
      cBack           =   12648384
   End
End
Attribute VB_Name = "frmMusica"
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

Private CurrentMusic As String

Private Function isMidi(ByRef Path As String) As Boolean
    isMidi = (Right$(UCase$(Path), 4) = ".MID")

End Function

Private Function isMp3(ByRef Path As String) As Boolean
    isMp3 = (Right$(UCase$(Path), 4) = ".MP3")

End Function

''
' Aplica la Musica seleccionada y oculta la ventana
'

Private Sub cmdAplicarYCerrar_Click()

    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    On Error Resume Next

    MapInfo.Music = Val(CurrentMusic) 'El val saca la extension
    frmMapInfo.txtMapMusica.Text = MapInfo.Music
    frmMain.lblMapMusica = MapInfo.Music

    Me.Hide

End Sub

''
' Oculta la ventana
'

Private Sub cmdCerrar_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Me.Hide

End Sub

''
' Detiene la Musica que se encuentra Reproduciendo
'

Private Sub cmdDetener_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Call StopMusic
    cmdDetener.Enabled = False

End Sub

''
' Inicia la reproduccion de la Musica Seleccionada
'

Private Sub cmdEscuchar_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    Dim Path As String

    If isMp3(CurrentMusic) Then
        Path = DirMp3
    Else
        Path = DirMidi

    End If

    Path = Path & CurrentMusic

    Call PlayMusic(Path)

    cmdDetener.Enabled = True

End Sub

''
' Selecciona una nueva Musica del listado
'

Private Sub lstMusic_Click()
    '*************************************************
    'Author: ^[GS]^
    'Last modified: 20/05/06
    '*************************************************
    CurrentMusic = lstMusic.Text

    cmdAplicarYCerrar.Enabled = True

End Sub

Private Sub lstMusic_DblClick()
    Call cmdEscuchar_Click

End Sub

Private Sub Form_Load()
    Dim Path As String

    If FileExist(DirMp3, vbDirectory) Then
        Path = Dir$(DirMp3 & "*.MP3")

        Do While LenB(Path) > 0
            lstMusic.AddItem Path
            Path = Dir$
        Loop

    End If

    If FileExist(DirMidi, vbDirectory) Then
        Path = Dir$(DirMidi & "*.MID")

        Do While LenB(Path) > 0
            lstMusic.AddItem Path
            Path = Dir$
        Loop

    End If

End Sub
