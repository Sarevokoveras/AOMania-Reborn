Attribute VB_Name = "AoDefenderAntiSh"
Private Declare Function GetTickCount Lib "kernel32" () As Long
Public AoDefTime As Long
Public AoDefCount As Integer
Public Sub AoDefAntiShInitialize()
AoDefTime = GetTickCount()
End Sub
Public Function AoDefAntiSh(ByVal FramesPerSec) As Boolean
If GetTickCount - AoDefTime > 350 Or GetTickCount - AoDefTime < 250 Then
        AoDefCount = AoDefCount + 1
    Else
        AoDefCount = 0
    End If
    
    If FramesPerSec < 5 Then
    AoDefCount = AoDefCount + 1
    End If
    
    If AoDefCount > 30 Then
       AoDefAntiSh = True
       Exit Function
    End If

AoDefTime = GetTickCount()
AoDefAntiSh = False
End Function
Public Sub AoDefAntiShOn()
MsgBox "Se ha detectado uso de SpeedHack, el cliente ser� cerrado!.", vbCritical, "AoDefender"
End Sub

