Attribute VB_Name = "ModUpdate"
Option Explicit

Public Const GWL_EXSTYLE = -20
Public Const WS_EX_LAYERED = &H80000
Public Const WS_EX_TRANSPARENT As Long = &H20&
Public Directory As String
Public bDone As Boolean
Public dError As Boolean
Public F As Integer
'Rem Programado por Shedark

Public SetUpdateChange As Long
Public SetUpdate As Long
Public TimerOn As Byte

Public Sub Analizar()

    Dim i As Integer, iX As Integer, tX As Integer, DifX As Integer, dNum As String
    
    'lEstado.Caption = "Obteniendo datos..."
    
  If Not Comprobar_Conexi�n(Url_Path & "VEREXE.TXT") Then
     MsgBox "�Error! Comprueba tu conexi�n de internet."
     Exit Sub
  End If
  
    If InStr(frmMain.Inet1.OpenURL(Url_Path & "VEREXE.TXT"), "<title>404 Not Found</title>") Then
        MsgBox "�Error! No se ha podido ver archivo binario."
        Exit Sub
    End If
    
    iX = frmMain.Inet1.OpenURL(Url_Path & "VEREXE.TXT") 'Host
    tX = Launcher.Update
    
    DifX = iX - tX
    
    If Not (DifX = 0) Then
       frmMain.ProgressBar1.Visible = True

       For i = 1 To DifX
            frmMain.Inet1.AccessType = icUseDefault
            dNum = i + tX
            
            #If BuscarLinks Then 'Buscamos el link en el host (1)
                Inet1.Url = Inet1.OpenURL(Url_Path & "Parche" & dNum & ".zip") 'Host
            #Else                'Generamos Link por defecto (0)
                frmMain.Inet1.Url = Url_Path & "Parche" & dNum & ".zip" 'Host
            #End If
            
            Directory = DirConf & "Parche" & dNum & ".zip"
            bDone = False
            dError = False
            
            'lURL.Caption = Inet1.URL
            'lName.Caption = "Parche" & dNum & ".rar"
            'lDirectorio.Caption = App.Path & "\"
                
            frmMain.Inet1.Execute , "GET"
            
            Do While bDone = False
            DoEvents
            Loop
            
            If dError Then Exit Sub
            
            UnZip Directory, App.Path & "\Descargado\"
            Kill Directory
        Next i
    End If
    
    Launcher.Play = 1
    Launcher.Update = iX
    
    Call SaveConfig

    frmMain.ProgressBar1.Value = 0

   frmMain.ProgressBar1.Visible = False
   
   frmMain.txtUpdate.Visible = True
   TimerOn = 1
   SetUpdate = "1"
   frmMain.Ejecutador.Enabled = True
   frmMain.txtUpdate.Caption = "Actualizaci�n OK"
   SetUpdateChange = "1"

End Sub

