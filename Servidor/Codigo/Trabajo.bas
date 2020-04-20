Attribute VB_Name = "Trabajo"
Option Explicit

Private Const IntervaloOculto As Integer = 5500 ' el tiempo de aca se divide x 40ms = 12 Sec +-

Public Sub DoPermanecerOculto(ByVal Userindex As Integer)

    On Error GoTo errhandler

    With UserList(Userindex)
        .Counters.Ocultando = .Counters.Ocultando - 1
        Call SendData(SendTarget.ToIndex, Userindex, 0, "INVI" & .Counters.Ocultando)

        If .Counters.Ocultando <= 0 Then
        
            .Counters.Ocultando = 0
            .flags.Oculto = 0
            Call SendData(SendTarget.ToIndex, Userindex, 0, "INVI0")

            If .flags.Invisible = 0 Then
                'no hace falta encriptar este (se jode el gil que bypassea esto)
                Call SendData(SendTarget.ToMap, 0, .pos.Map, "NOVER" & .char.CharIndex & ",0," & .PartyIndex)
     
                Call SendData(SendTarget.ToIndex, Userindex, 0, "Z11")

            End If
        
        End If

    End With

    Exit Sub

errhandler:
    Call LogError("Error en Sub DoPermanecerOculto")

End Sub

Public Sub DoOcultarse(ByVal Userindex As Integer)

    On Error GoTo errhandler

    Dim Skill     As Byte
    Dim res       As Integer
    Dim Suerte    As Double
    Dim SegOculto As Double
    Dim Intervalo As Integer
    
    If UCase$(UserList(Userindex).Clase) = "GUERRERO" Or UCase$(UserList(Userindex).Clase) = "ARQUERO" Then
      Else
        Exit Sub
    End If
    
    If UserList(Userindex).pos.Map = 154 Or UserList(Userindex).pos.Map = 96 Then
      Exit Sub
    End If
    
    With UserList(Userindex)
        Intervalo = "61,2"
        Skill = .Stats.UserSkills(eSkill.Ocultarse)

        Suerte = (((0.000002 * Skill - 0.0002) * Skill + 0.0064) * Skill + 0.1124) * 100
        
        If Skill = 0 Then
            SegOculto = 0
        Else
            SegOculto = Intervalo * Skill

        End If
        
        res = RandomNumber(1, Suerte)

        If res <= 5 Then
            .flags.Oculto = 1
            
            'Suerte = (-0.000001 * (100 - Skill) ^ 3)
            'Suerte = Suerte + (0.00009229 * (100 - Skill) ^ 2)
            'Suerte = Suerte + (-0.0088 * (100 - Skill))
            'Suerte = Suerte + (0.9571)
            'Suerte = Suerte * IntervaloOculto
            
            .Counters.Ocultando = SegOculto 'CInt(Suerte)

            Call SendData(SendTarget.ToMap, 0, .pos.Map, "NOVER" & .char.CharIndex & ",1," & .PartyIndex)
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Te has escondido entre las sombras!" & FONTTYPE_INFO)
            
            Call SubirSkill(Userindex, eSkill.Ocultarse)
        Else

            '[CDT 17-02-2004]
            If Not .flags.UltimoMensaje = 4 Then
                Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has logrado esconderte!" & FONTTYPE_INFO)
                .flags.UltimoMensaje = 4

            End If

            '[/CDT]
        End If

    End With

    Exit Sub

errhandler:
    Call LogError("Error en Sub DoOcultarse")

End Sub

Public Sub DoNavega(ByVal Userindex As Integer, ByRef Barco As ObjData, ByVal Slot As Integer)

    Dim ModNave As Long
    Dim ObjIndex As Integer
    
    ObjIndex = UserList(Userindex).Invent.Object(Slot).ObjIndex
    
    If ObjData(ObjIndex).Real = 1 Or ObjData(ObjIndex).Caos = 1 Or ObjData(ObjIndex).Nemes = 1 Or ObjData(ObjIndex).Templ = 1 Then
        If Not FaccionPuedeUsarItem(Userindex, ObjIndex) Then
             Call SendData(SendTarget.ToIndex, Userindex, 0, "||Tu faccion no puede usar este objeto." & FONTTYPE_INFO)
              Exit Sub
        End If
    End If
    
    If Not UseRangeFragata(Userindex, ObjIndex) Then
      Call SendData(SendTarget.ToIndex, Userindex, 0, "||Tu rango a�n no te permite usar ese item." & FONTTYPE_INFO)
      Exit Sub
    End If

    With UserList(Userindex)
        ModNave = ModNavegacion(.Clase)

        If HayAgua(.pos.Map, .pos.X - 1, .pos.Y) And HayAgua(.pos.Map, .pos.X + 1, .pos.Y) And HayAgua(.pos.Map, .pos.X, .pos.Y - 1) And HayAgua( _
                .pos.Map, .pos.X, .pos.Y + 1) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No puedes dejar de navegar en el agua!!" & FONTTYPE_INFO)
            Exit Sub

        End If
       
       If ModNave > 0 Then
        If .Stats.UserSkills(eSkill.Navegacion) / ModNave < Barco.MinSkill Then
            'Call SendData(SendTarget.toindex, UserIndex, 0, "||No tienes suficientes conocimientos para usar este barco." & FONTTYPE_INFO)
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||Para usar este barco necesitas " & Barco.MinSkill * ModNave & _
                    " puntos en navegacion." & FONTTYPE_INFO)
            Exit Sub
        End If
        End If

        .Invent.BarcoObjIndex = .Invent.Object(Slot).ObjIndex
        .Invent.BarcoSlot = Slot

        If .flags.Navegando = 0 Then
    
            .char.Head = 0
    
            If .flags.Muerto = 0 Then
                .char.Body = Barco.Ropaje
            Else
                .char.Body = iFragataFantasmal

            End If
    
            .char.ShieldAnim = NingunEscudo
            .char.WeaponAnim = NingunArma
            .char.CascoAnim = NingunCasco
    
            '[MaTeO 9]
            .char.Alas = NingunAlas
            '[/MaTeO 9]
    
            .flags.Navegando = 1
    
        Else
    
            .flags.Navegando = 0
    
            If .flags.Muerto = 0 Then
                .char.Head = .OrigChar.Head
        
                If .Invent.ArmourEqpObjIndex > 0 Then
                    .char.Body = ObjData(.Invent.ArmourEqpObjIndex).Ropaje
                Else
                    Call DarCuerpoDesnudo(Userindex)

                End If
        
                If .Invent.EscudoEqpObjIndex > 0 Then .char.ShieldAnim = ObjData(.Invent.EscudoEqpObjIndex).ShieldAnim

                If .Invent.WeaponEqpObjIndex > 0 Then .char.WeaponAnim = ObjData(.Invent.WeaponEqpObjIndex).WeaponAnim

                If .Invent.CascoEqpObjIndex > 0 Then .char.CascoAnim = ObjData(.Invent.CascoEqpObjIndex).CascoAnim
                
                If .Invent.AlaEqpObjIndex > 0 Then .char.Alas = ObjData(.Invent.AlaEqpObjIndex).Ropaje
            
            Else
                .char.Body = iCuerpoMuerto
                .char.Head = iCabezaMuerto
                .char.ShieldAnim = NingunEscudo
                .char.WeaponAnim = NingunArma
                .char.CascoAnim = NingunCasco
                '[MaTeO 9]
                .char.Alas = NingunAlas

                '[/MaTeO 9]
            End If

        End If

        '[MaTeO 9]
        Call ChangeUserChar(SendTarget.ToMap, 0, .pos.Map, Userindex, .char.Body, .char.Head, .char.heading, .char.WeaponAnim, .char.ShieldAnim, _
                .char.CascoAnim, .char.Alas)
                
        '[/MaTeO 9]
        Call SendData(SendTarget.ToIndex, Userindex, 0, "NAVEG")

    End With

End Sub

Public Sub FundirMineral(ByVal Userindex As Integer)

    'Call LogTarea("Sub FundirMineral")

    If UserList(Userindex).flags.TargetObjInvIndex > 0 Then
   
        If ObjData(UserList(Userindex).flags.TargetObjInvIndex).ObjType = eOBJType.otMinerales And ObjData(UserList( _
                Userindex).flags.TargetObjInvIndex).MinSkill <= UserList(Userindex).Stats.UserSkills(eSkill.Mineria) / ModFundicion(UserList( _
                Userindex).Clase) Then
            Call DoLingotes(Userindex)
        Else
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes conocimientos de mineria suficientes para trabajar este mineral." & _
                    FONTTYPE_INFO)

        End If

    End If

End Sub

Function TieneObjetos(ByVal ItemIndex As Integer, ByVal cant As Integer, ByVal Userindex As Integer) As Boolean
                      
    'Call LogTarea("Sub TieneObjetos")

    Dim i     As Integer
    Dim Total As Long

    For i = 1 To MAX_INVENTORY_SLOTS

        If UserList(Userindex).Invent.Object(i).ObjIndex = ItemIndex Then
            Total = Total + UserList(Userindex).Invent.Object(i).Amount

        End If

    Next i

    If cant <= Total Then
        TieneObjetos = True
        Exit Function

    End If
        
End Function


Function QuitarObjetosBov(ByVal ItemIndex As Integer, ByVal cant As Integer, ByVal Userindex As Integer) As Boolean
    Dim i As Integer
    
    For i = 1 To MAX_BANCOINVENTORY_SLOTS
         
       If UserList(Userindex).BancoInvent.Object(i).ObjIndex = ItemIndex Then
            
            UserList(Userindex).BancoInvent.Object(i).Amount = UserList(Userindex).BancoInvent.Object(i).Amount - cant
            
            If (UserList(Userindex).BancoInvent.Object(i).Amount <= 0) Then
                cant = Abs(UserList(Userindex).BancoInvent.Object(i).Amount)
                UserList(Userindex).BancoInvent.Object(i).Amount = 0
                UserList(Userindex).BancoInvent.Object(i).ObjIndex = 0
                UserList(Userindex).BancoInvent.NroItems = UserList(Userindex).BancoInvent.NroItems - 1
                Else
                cant = 0
            End If
            
             If (cant = 0) Then
                QuitarObjetosBov = True
                Exit Function
            End If
       
       End If
         
    Next i
    
End Function
Function QuitarObjetos(ByVal ItemIndex As Integer, ByVal cant As Integer, ByVal Userindex As Integer) As Boolean
    'Call LogTarea("Sub QuitarObjetos")

    Dim i As Integer

    For i = 1 To MAX_INVENTORY_SLOTS

        If UserList(Userindex).Invent.Object(i).ObjIndex = ItemIndex Then
        
            Call Desequipar(Userindex, i)
        
            UserList(Userindex).Invent.Object(i).Amount = UserList(Userindex).Invent.Object(i).Amount - cant

            If (UserList(Userindex).Invent.Object(i).Amount <= 0) Then
                cant = Abs(UserList(Userindex).Invent.Object(i).Amount)
                UserList(Userindex).Invent.Object(i).Amount = 0
                UserList(Userindex).Invent.Object(i).ObjIndex = 0
            Else
                cant = 0

            End If
        
            Call UpdateUserInv(False, Userindex, i)
        
            If (cant = 0) Then
                QuitarObjetos = True
                Exit Function
            End If

        End If

    Next i

End Function

Sub SastreQuitarMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer)
     If ObjData(ItemIndex).Lana > 0 Then Call QuitarObjetos(Lana, ObjData(ItemIndex).Lana, Userindex)
     If ObjData(ItemIndex).Osos > 0 Then Call QuitarObjetos(PielOsos, ObjData(ItemIndex).Osos, Userindex)
     If ObjData(ItemIndex).OsoPolar > 0 Then Call QuitarObjetos(PielOsosPolar, ObjData(ItemIndex).OsoPolar, Userindex)
     If ObjData(ItemIndex).Lobo > 0 Then Call QuitarObjetos(PielLobo, ObjData(ItemIndex).Lobo, Userindex)
     If ObjData(ItemIndex).LoboPolar > 0 Then Call QuitarObjetos(PielLoboPolar, ObjData(ItemIndex).LoboPolar, Userindex)
     If ObjData(ItemIndex).Tigre > 0 Then Call QuitarObjetos(PielTigre, ObjData(ItemIndex).Tigre, Userindex)
     If ObjData(ItemIndex).Vaca > 0 Then Call QuitarObjetos(PielVaca, ObjData(ItemIndex).Vaca, Userindex)
     If ObjData(ItemIndex).Jabali > 0 Then Call QuitarObjetos(PielJabali, ObjData(ItemIndex).Jabali, Userindex)
End Sub

Sub HerreroMagicoQuitarMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer)

   If ObjData(ItemIndex).LingH > 0 Then Call QuitarObjetos(LingoteHierro, ObjData(ItemIndex).LingH, Userindex)
   If ObjData(ItemIndex).LingP > 0 Then Call QuitarObjetos(LingotePlata, ObjData(ItemIndex).LingP, Userindex)
   If ObjData(ItemIndex).LingO > 0 Then Call QuitarObjetos(LingoteOro, ObjData(ItemIndex).LingO, Userindex)
   If ObjData(ItemIndex).LingM > 0 Then Call QuitarObjetos(LingoteMercurio, ObjData(ItemIndex).LingM, Userindex)
   If ObjData(ItemIndex).Gemas > 0 Then Call QuitarObjetos(GemaMagica, ObjData(ItemIndex).Gemas, Userindex)
   If ObjData(ItemIndex).Diamantes > 0 Then Call QuitarObjetos(Diamante, ObjData(ItemIndex).Diamantes, Userindex)
   
End Sub

Sub HerreroQuitarMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer)

    If ObjData(ItemIndex).LingH > 0 Then Call QuitarObjetos(LingoteHierro, ObjData(ItemIndex).LingH, Userindex)
    If ObjData(ItemIndex).LingP > 0 Then Call QuitarObjetos(LingotePlata, ObjData(ItemIndex).LingP, Userindex)
    If ObjData(ItemIndex).LingO > 0 Then Call QuitarObjetos(LingoteOro, ObjData(ItemIndex).LingO, Userindex)

End Sub

Sub HechizeroQuitarMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer, ByVal Cantidad As Long)
   If ObjData(ItemIndex).Hierba > 0 Then Call QuitarObjetos(Hierba, (ObjData(ItemIndex).Hierba * Cantidad), Userindex)
End Sub

Sub CarpinteroQuitarMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer, ByVal Cantidad As Long)

    If ObjData(ItemIndex).Madera > 0 Then Call QuitarObjetos(Le�a, (ObjData(ItemIndex).Madera * Cantidad), Userindex)

End Sub

Function SastreTieneMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer) As Boolean
      
      If ObjData(ItemIndex).Lana > 0 Then
          If Not TieneObjetos(Lana, ObjData(ItemIndex).Lana, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente lana." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      If ObjData(ItemIndex).Lobo > 0 Then
          If Not TieneObjetos(PielLobo, ObjData(ItemIndex).Lobo, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente pieles de lobo." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      If ObjData(ItemIndex).LoboPolar > 0 Then
          If Not TieneObjetos(PielLoboPolar, ObjData(ItemIndex).LoboPolar, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente pieles de lobo polar." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      If ObjData(ItemIndex).Osos > 0 Then
          If Not TieneObjetos(PielOsos, ObjData(ItemIndex).Osos, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente pieles de oso pardo." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      If ObjData(ItemIndex).OsoPolar > 0 Then
          If Not TieneObjetos(PielOsosPolar, ObjData(ItemIndex).OsoPolar, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente pieles de oso polar." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      If ObjData(ItemIndex).Jabali > 0 Then
          If Not TieneObjetos(PielJabali, ObjData(ItemIndex).Jabali, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente pieles de jabali." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      If ObjData(ItemIndex).Vaca > 0 Then
          If Not TieneObjetos(PielVaca, ObjData(ItemIndex).Vaca, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente pieles de vaca." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      If ObjData(ItemIndex).Tigre > 0 Then
          If Not TieneObjetos(PielTigre, ObjData(ItemIndex).Tigre, Userindex) Then
              Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficiente pieles de tigre." & FONTTYPE_INFO)
              SastreTieneMateriales = False
              Exit Function
          End If
      End If
      
      
      SastreTieneMateriales = True
      
End Function

Function HechizeroTieneMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer, ByVal Cantidad As Long)
     Dim i As Integer
     
     If ObjData(ItemIndex).Hierba > 0 Then
         If Not TieneObjetos(Hierba, (ObjData(ItemIndex).Hierba * Cantidad), Userindex) Then
           Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes hierbas." & FONTTYPE_INFO)
           HechizeroTieneMateriales = False
           Exit Function
          End If
    End If
    HechizeroTieneMateriales = True
End Function

Function CarpinteroTieneMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer, ByVal Cantidad As Long) As Boolean
    
    If ObjData(ItemIndex).Madera > 0 Then
        If Not TieneObjetos(Le�a, (ObjData(ItemIndex).Madera * Cantidad), Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes madera." & FONTTYPE_INFO)
            CarpinteroTieneMateriales = False
            Exit Function

        End If

    End If
    
    CarpinteroTieneMateriales = True
    Call SendData(SendTarget.ToPCArea, Userindex, UserList(Userindex).pos.Map, "TW42")

End Function
 

Function HerreroMagicoTieneMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer) As Boolean
    
    If ObjData(ItemIndex).LingH > 0 Then
        If Not TieneObjetos(LingoteHierro, ObjData(ItemIndex).LingH, Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes lingotes de hierro." & FONTTYPE_INFO)
            HerreroMagicoTieneMateriales = False
            Exit Function
        End If
    End If

    If ObjData(ItemIndex).LingP > 0 Then
        If Not TieneObjetos(LingotePlata, ObjData(ItemIndex).LingP, Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes lingotes de plata." & FONTTYPE_INFO)
            HerreroMagicoTieneMateriales = False
            Exit Function
        End If
    End If

    If ObjData(ItemIndex).LingO > 0 Then
        If Not TieneObjetos(LingoteOro, ObjData(ItemIndex).LingO, Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes lingotes de oro." & FONTTYPE_INFO)
            HerreroMagicoTieneMateriales = False
            Exit Function
        End If
    End If
    
    If ObjData(ItemIndex).LingM > 0 Then
        If Not TieneObjetos(LingoteMercurio, ObjData(ItemIndex).LingM, Userindex) Then
           Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes lingotes de mercurio." & FONTTYPE_INFO)
           HerreroMagicoTieneMateriales = False
           Exit Function
        End If
    End If
    
    If ObjData(ItemIndex).Gemas > 0 Then
        If Not TieneObjetos(GemaMagica, ObjData(ItemIndex).Gemas, Userindex) Then
           Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes gemas." & FONTTYPE_INFO)
           HerreroMagicoTieneMateriales = False
           Exit Function
        End If
    End If
    
    If ObjData(ItemIndex).Diamantes > 0 Then
        If Not TieneObjetos(Diamante, ObjData(ItemIndex).Diamantes, Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes diamantes." & FONTTYPE_INFO)
            HerreroMagicoTieneMateriales = False
            Exit Function
        End If
    End If
    
    HerreroMagicoTieneMateriales = True
End Function

Function HerreroTieneMateriales(ByVal Userindex As Integer, ByVal ItemIndex As Integer) As Boolean

    If ObjData(ItemIndex).LingH > 0 Then
        If Not TieneObjetos(LingoteHierro, ObjData(ItemIndex).LingH, Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes lingotes de hierro." & FONTTYPE_INFO)
            HerreroTieneMateriales = False
            Exit Function
        End If
    End If

    If ObjData(ItemIndex).LingP > 0 Then
        If Not TieneObjetos(LingotePlata, ObjData(ItemIndex).LingP, Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes lingotes de plata." & FONTTYPE_INFO)
            HerreroTieneMateriales = False
            Exit Function
        End If
    End If

    If ObjData(ItemIndex).LingO > 0 Then
        If Not TieneObjetos(LingoteOro, ObjData(ItemIndex).LingO, Userindex) Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes lingotes de oro." & FONTTYPE_INFO)
            HerreroTieneMateriales = False
            Exit Function
        End If
    End If

    HerreroTieneMateriales = True

End Function

Public Function SastrePuedeConstruir(ByVal Userindex As Integer, ByVal ItemIndex As Integer) As Boolean
        SastrePuedeConstruir = SastreTieneMateriales(Userindex, ItemIndex) And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= ObjData( _
            ItemIndex).SkSastreria
End Function

Public Function HerreroMagicoPuedeConstruir(ByVal Userindex As Integer, ByVal ItemIndex As Integer) As Boolean
     
      HerreroMagicoPuedeConstruir = HerreroMagicoTieneMateriales(Userindex, ItemIndex) And UserList(Userindex).Stats.UserSkills(eSkill.Herrero) >= ObjData( _
           ItemIndex).SkHerreria
      
End Function

Public Function PuedeConstruir(ByVal Userindex As Integer, ByVal ItemIndex As Integer) As Boolean

    PuedeConstruir = HerreroTieneMateriales(Userindex, ItemIndex) And UserList(Userindex).Stats.UserSkills(eSkill.Herreria) >= ObjData( _
            ItemIndex).SkHerreria

End Function

Public Function PuedeConstruirSastreria(ByVal ItemIndex As Integer) As Boolean
      
      Dim i As Long
      
      For i = 1 To UBound(ObjSastre)
            If ObjSastre(i) = ItemIndex Then
                PuedeConstruirSastreria = True
                Exit Function
            End If
      Next i
      
      PuedeConstruirSastreria = False
     
End Function

Public Function PuedeConstruirHerreroMagico(ByVal ItemIndex As Integer) As Boolean
      
      Dim i As Integer
      
      For i = 1 To UBound(ObjArmaHerreroMagico)
            If ObjArmaHerreroMagico(i) = ItemIndex Then
                PuedeConstruirHerreroMagico = True
                Exit Function
            End If
      Next i
      
      For i = 1 To UBound(ObjArmaduraHerreroMagico)
            If ObjArmaduraHerreroMagico(i) = ItemIndex Then
                PuedeConstruirHerreroMagico = True
                Exit Function
            End If
      Next i
      
      PuedeConstruirHerreroMagico = False
      
End Function

Public Function PuedeConstruirHerreria(ByVal ItemIndex As Integer) As Boolean

    Dim i As Long

    For i = 1 To UBound(ArmasHerrero)

        If ArmasHerrero(i) = ItemIndex Then
            PuedeConstruirHerreria = True
            Exit Function
        End If

    Next i

    For i = 1 To UBound(ArmadurasHerrero)

        If ArmadurasHerrero(i) = ItemIndex Then
            PuedeConstruirHerreria = True
            Exit Function

        End If

    Next i

    PuedeConstruirHerreria = False

End Function

Public Sub SastreConstruirItem(ByVal Userindex, ByVal ItemIndex As Integer)
    
    Dim Obj As Obj
    
    If SastrePuedeConstruir(Userindex, ItemIndex) And PuedeConstruirSastreria(ItemIndex) Then
        Call SastreQuitarMateriales(Userindex, ItemIndex)
        
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has tejido una ropa!" & FONTTYPE_INFO)
        
        Obj.ObjIndex = ItemIndex
        Obj.Amount = 1
        
        If Not MeterItemEnInventario(Userindex, Obj) Then
            Call TirarItemAlPiso(UserList(Userindex).pos, Obj)
        End If
        
        UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1
        Call SubirSkill(Userindex, eSkill.Sastreria)
        Call UpdateUserInv(True, Userindex, 0)
        
    End If
    
End Sub

Public Sub HerreroMagicoConstruirItem(ByVal Userindex As Integer, ByVal ItemIndex As Integer)
       
       If HerreroMagicoPuedeConstruir(Userindex, ItemIndex) And PuedeConstruirHerreroMagico(ItemIndex) Then
       
       Call HerreroMagicoQuitarMateriales(Userindex, ItemIndex)

        If ObjData(ItemIndex).ObjType = eOBJType.otWeapon Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido el arma!." & FONTTYPE_INFO)
        ElseIf ObjData(ItemIndex).ObjType = eOBJType.otESCUDO Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido el escudo!." & FONTTYPE_INFO)
        ElseIf ObjData(ItemIndex).ObjType = eOBJType.otCASCO Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido el casco!." & FONTTYPE_INFO)
        ElseIf ObjData(ItemIndex).ObjType = eOBJType.otArmadura Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido la armadura!." & FONTTYPE_INFO)
        End If

        Dim MiObj As Obj
        MiObj.Amount = 1
        MiObj.ObjIndex = ItemIndex

        If Not MeterItemEnInventario(Userindex, MiObj) Then
            Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)
        End If

        Call SubirSkill(Userindex, eSkill.Herrero)
        Call UpdateUserInv(True, Userindex, 0)
        Call SendData(SendTarget.ToPCArea, Userindex, UserList(Userindex).pos.Map, "TW" & MARTILLOHERRERO)
    
    End If

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1
       
       
End Sub


Public Sub HerreroConstruirItem(ByVal Userindex As Integer, ByVal ItemIndex As Integer)

    'Call LogTarea("Sub HerreroConstruirItem")
    If PuedeConstruir(Userindex, ItemIndex) And PuedeConstruirHerreria(ItemIndex) Then
        Call HerreroQuitarMateriales(Userindex, ItemIndex)
        
        If ObjData(ItemIndex).ObjType = eOBJType.otWeapon Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido el arma!." & FONTTYPE_INFO)
        ElseIf ObjData(ItemIndex).ObjType = eOBJType.otESCUDO Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido el escudo!." & FONTTYPE_INFO)
        ElseIf ObjData(ItemIndex).ObjType = eOBJType.otCASCO Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido el casco!." & FONTTYPE_INFO)
        ElseIf ObjData(ItemIndex).ObjType = eOBJType.otArmadura Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has construido la armadura!." & FONTTYPE_INFO)
        End If

        Dim MiObj As Obj
        MiObj.Amount = 1
        MiObj.ObjIndex = ItemIndex

        If Not MeterItemEnInventario(Userindex, MiObj) Then
            Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)

        End If

        Call SubirSkill(Userindex, eSkill.Herreria)
        Call UpdateUserInv(True, Userindex, 0)
        Call SendData(SendTarget.ToPCArea, Userindex, UserList(Userindex).pos.Map, "TW" & MARTILLOHERRERO)
    
    End If

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1

End Sub

Public Function PuedeConstruirCarpintero(ByVal ItemIndex As Integer) As Boolean

    Dim i As Long

    For i = 1 To UBound(ObjCarpintero)

        If ObjCarpintero(i) = ItemIndex Then
            PuedeConstruirCarpintero = True
            Exit Function

        End If

    Next i

    PuedeConstruirCarpintero = False

End Function
Public Function PuedeConstruirHechizero(ByVal ItemIndex As Integer) As Boolean
    Dim i As Long
    For i = 1 To UBound(ObjHechizeria)
       If ObjHechizeria(i) = ItemIndex Then
          PuedeConstruirHechizero = True
          Exit Function
       End If
    Next i
    PuedeConstruirHechizero = False
End Function

Public Sub HechizeriaConstruirItem(ByVal Userindex As Integer, ByVal ItemIndex As Integer, ByVal Cantidad As Long)
    Dim Obj As Obj
        
     If HechizeroTieneMateriales(Userindex, ItemIndex, Cantidad) And UserList(Userindex).Stats.UserSkills(eSkill.Hechiceria) >= ObjData( _
     ItemIndex).SkHechiceria And PuedeConstruirHechizero(ItemIndex) And UserList(Userindex).Invent.HerramientaEqpObjIndex = _
     MORTERO Then
       
    Call HechizeroQuitarMateriales(Userindex, ItemIndex, Cantidad)
    Call SendData(SendTarget.ToIndex, Userindex, 0, "||Has hecho una poci�n" & FONTTYPE_INFO)
     
     Obj.ObjIndex = ItemIndex
     Obj.Amount = Cantidad
     
     If Not MeterItemEnInventario(Userindex, Obj) Then
            Call TirarItemAlPiso(UserList(Userindex).pos, Obj)
        End If
        
       Call SubirSkill(Userindex, eSkill.Hechiceria)
       Call UpdateUserInv(True, Userindex, 0)
        
    End If

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1
End Sub


Public Sub CarpinteroConstruirItem(ByVal Userindex As Integer, ByVal ItemIndex As Integer, ByVal Cantidad As Long)

    If CarpinteroTieneMateriales(Userindex, ItemIndex, Cantidad) And UserList(Userindex).Stats.UserSkills(eSkill.Carpinteria) >= ObjData( _
            ItemIndex).SkCarpinteria And PuedeConstruirCarpintero(ItemIndex) And UserList(Userindex).Invent.HerramientaEqpObjIndex = _
            SERRUCHO_CARPINTERO Then

        Call CarpinteroQuitarMateriales(Userindex, ItemIndex, Cantidad)
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||Has construido el objeto!" & FONTTYPE_INFO)
    
        Dim MiObj As Obj
        MiObj.Amount = Cantidad
        MiObj.ObjIndex = ItemIndex
        

        If Not MeterItemEnInventario(Userindex, MiObj) Then
            Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)
        End If
        
       Call SubirSkill(Userindex, eSkill.Carpinteria)
       Call UpdateUserInv(True, Userindex, 0)
        
    End If

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1

End Sub

Private Function MineralesParaLingote(ByVal Lingote As iMinerales) As Integer

    Select Case Lingote

        Case iMinerales.HierroCrudo
            MineralesParaLingote = 5

        Case iMinerales.PlataCruda
            MineralesParaLingote = 5

        Case iMinerales.OroCrudo
            MineralesParaLingote = 5
            
        Case iMinerales.MercurioCrudo
            MineralesParaLingote = 5

        Case Else
            MineralesParaLingote = 10000

    End Select

End Function

Public Sub DoLingotes(ByVal Userindex As Integer)

    '    Call LogTarea("Sub DoLingotes")
    Dim Slot As Integer
    Dim obji As Integer
    Dim Suerte As Byte
    Dim res As Byte

    Slot = UserList(Userindex).flags.TargetObjInvSlot
    obji = UserList(Userindex).Invent.Object(Slot).ObjIndex
    
    If UserList(Userindex).Invent.Object(Slot).Amount < MineralesParaLingote(obji) Or ObjData(obji).ObjType <> eOBJType.otMinerales Then
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||No tienes suficientes minerales para hacer un lingote." & FONTTYPE_INFO)
        Exit Sub
    End If
    
      If UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= -1 Then
        Suerte = 35
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 11 Then
        Suerte = 30
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 21 Then
        Suerte = 28
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 31 Then
        Suerte = 24
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 41 Then
        Suerte = 22
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 51 Then
        Suerte = 20
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 61 Then
        Suerte = 18
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 71 Then
        Suerte = 15
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 81 Then
        Suerte = 10
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Suerte) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 91 Then
        Suerte = 7
    End If
    
    
    res = RandomNumber(1, Suerte)

    If res <= 5 Then
    UserList(Userindex).Invent.Object(Slot).Amount = UserList(Userindex).Invent.Object(Slot).Amount - MineralesParaLingote(obji)

    If UserList(Userindex).Invent.Object(Slot).Amount < 1 Then
        UserList(Userindex).Invent.Object(Slot).Amount = 0
        UserList(Userindex).Invent.Object(Slot).ObjIndex = 0
    End If

    Dim nPos  As WorldPos
    Dim MiObj As Obj
    MiObj.Amount = 1
    MiObj.ObjIndex = ObjData(UserList(Userindex).flags.TargetObjInvIndex).LingoteIndex

    If Not MeterItemEnInventario(Userindex, MiObj) Then
        Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)
    End If

    Call UpdateUserInv(False, Userindex, Slot)
    Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has obtenido un lingote!" & FONTTYPE_INFO)

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1
    
    Else
     UserList(Userindex).Invent.Object(Slot).Amount = UserList(Userindex).Invent.Object(Slot).Amount - MineralesParaLingote(obji)
     Call UpdateUserInv(False, Userindex, Slot)
     
    Call SendData(SendTarget.ToIndex, Userindex, 0, "||Los minerales no eran de buena calidad, no has logrado hacer un lingote." & FONTTYPE_INFO)
    End If
    
    Call SendData(SendTarget.ToPCArea, Userindex, UserList(Userindex).pos.Map, "TW119")
    
End Sub

Function ModNavegacion(ByVal Clase As String) As Integer

    Select Case UCase$(Clase)

        Case "PIRATA"
            ModNavegacion = 0

        Case "TRABAJADOR"
            ModNavegacion = 1

        Case Else
            ModNavegacion = 2

    End Select

End Function

Function ModFundicion(ByVal Clase As String) As Integer

    Select Case UCase$(Clase)

        Case "TRABAJADOR"
            ModFundicion = 1

        Case Else
            ModFundicion = 3

    End Select

End Function

Function ModSastreria(ByVal Clase As String) As Integer

    Select Case UCase$(Clase)
        
        Case "TRABAJADOR"
           ModSastreria = 1
        
        Case Else
           ModSastreria = 1
      
    End Select
    
End Function

Function ModHechizeria(ByVal Clase As String) As Integer
     
     Select Case UCase$(Clase)
        
        Case "TRABAJADOR"
           ModHechizeria = 1
        
        Case Else
           ModHechizeria = 1
      
     End Select
     
End Function

Function ModCarpinteria(ByVal Clase As String) As Integer

    Select Case UCase$(Clase)

        Case "TRABAJADOR"
            ModCarpinteria = 1

        Case Else
            ModCarpinteria = 3

    End Select

End Function

Function ModHerreriA(ByVal Clase As String) As Integer

    Select Case UCase$(Clase)

        Case "TRABAJADOR"
            ModHerreriA = 1

        Case Else
            ModHerreriA = 4

    End Select

End Function

Function ModDomar(ByVal Clase As String) As Integer

    Select Case UCase$(Clase)

        Case "DRUIDA"
            ModDomar = 6

        Case "CAZADOR"
            ModDomar = 6

        Case "CLERIGO"
            ModDomar = 7

        Case Else
            ModDomar = 10

    End Select

End Function

Function CalcularPoderDomador(ByVal Userindex As Integer) As Long

    With UserList(Userindex).Stats
        CalcularPoderDomador = .UserAtributos(eAtributos.Carisma) * (.UserSkills(eSkill.Domar) / ModDomar(UserList(Userindex).Clase)) + _
                RandomNumber(1, .UserAtributos(eAtributos.Carisma) / 3) + RandomNumber(1, .UserAtributos(eAtributos.Carisma) / 3) + RandomNumber(1, _
                .UserAtributos(eAtributos.Carisma) / 3)

    End With

End Function

Function FreeMascotaIndex(ByVal Userindex As Integer) As Integer
    Dim j As Integer

    For j = 1 To MAXMASCOTAS

        If UserList(Userindex).MascotasIndex(j) = 0 Then
            FreeMascotaIndex = j
            Exit Function

        End If

    Next j

End Function

Sub DoDomar(ByVal Userindex As Integer, ByVal NpcIndex As Integer)
    'Call LogTarea("Sub DoDomar")

    If UserList(Userindex).NroMacotas < MAXMASCOTAS Then
    
        If Npclist(NpcIndex).MaestroUser = Userindex Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||Ya eres el amo de esta criatura." & FONTTYPE_INFO)
            Exit Sub

        End If
    
        If Npclist(NpcIndex).MaestroNpc > 0 Or Npclist(NpcIndex).MaestroUser > 0 Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||La criatura ya tiene amo." & FONTTYPE_INFO)
            Exit Sub

        End If
    
        If Npclist(NpcIndex).flags.Domable <= CalcularPoderDomador(Userindex) Then
            Dim Index As Integer
            UserList(Userindex).NroMacotas = UserList(Userindex).NroMacotas + 1
            Index = FreeMascotaIndex(Userindex)
            UserList(Userindex).MascotasIndex(Index) = NpcIndex
            UserList(Userindex).MascotasType(Index) = Npclist(NpcIndex).Numero
        
            Npclist(NpcIndex).MaestroUser = Userindex
        
            Call FollowAmo(NpcIndex)
        
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||La criatura te ha aceptado como su amo." & FONTTYPE_INFO)
            Call SubirSkill(Userindex, Domar)
        Else

   
                Call SendData(SendTarget.ToIndex, Userindex, 0, "||Se resiste!! sigue intent�ndolo." & FONTTYPE_INFO)
     

        End If

    Else
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||No puedes controlar mas criaturas." & FONTTYPE_INFO)

    End If

End Sub

Sub DoAdminInvisible(ByVal Userindex As Integer)

    With UserList(Userindex)

        If .flags.AdminInvisible = 0 Then
        
            ' Sacamos el mimetizmo
            If .flags.Mimetizado = 1 Then
                .char.Body = .CharMimetizado.Body
                .char.Head = .CharMimetizado.Head
                .char.CascoAnim = .CharMimetizado.CascoAnim
                .char.ShieldAnim = .CharMimetizado.ShieldAnim
                .char.WeaponAnim = .CharMimetizado.WeaponAnim
                .char.Alas = .CharMimetizado.Alas
                .Counters.Mimetismo = 0
                .flags.Mimetizado = 0

            End If
        
            .flags.AdminInvisible = 1
            .flags.Invisible = 1
            .flags.Oculto = 1
            .flags.OldBody = .char.Body
            .flags.OldHead = .char.Head
            
            .char.Body = 0
            .char.Head = 0
            .char.ShieldAnim = NingunEscudo
            .char.WeaponAnim = NingunArma
            .char.CascoAnim = NingunCasco
            .char.Alas = NingunAlas
            
        Else
   
            .flags.AdminInvisible = 0
            .flags.Invisible = 0
            .flags.Oculto = 0
            .Counters.Ocultando = 0
            .char.Body = .flags.OldBody
            .char.Head = .flags.OldHead
            
            If .Invent.EscudoEqpObjIndex > 0 Then .char.ShieldAnim = ObjData(.Invent.EscudoEqpObjIndex).ShieldAnim

            If .Invent.WeaponEqpObjIndex > 0 Then .char.WeaponAnim = ObjData(.Invent.WeaponEqpObjIndex).WeaponAnim

            If .Invent.CascoEqpObjIndex > 0 Then .char.CascoAnim = ObjData(.Invent.CascoEqpObjIndex).CascoAnim
            If .Invent.AlaEqpObjIndex > 0 Then .char.Alas = ObjData(.Invent.AlaEqpObjIndex).Ropaje
        
        End If
    
        'vuelve a ser visible por la fuerza
        .showName = Not .showName
        'Call ChangeUserChar(SendTarget.ToPCArea, UserIndex, .pos.Map, UserIndex, .char.Body, .char.Head, _
         .char.Heading, .char.WeaponAnim, .char.ShieldAnim, .char.CascoAnim, .char.Alas)
                
        'Sucio, pero funciona, y siendo un comando administrativo de uso poco frecuente no molesta demasiado...
        Call EraseUserChar(SendTarget.ToMap, 0, .pos.Map, Userindex)
        Call MakeUserChar(SendTarget.ToMap, 0, .pos.Map, Userindex, .pos.Map, .pos.X, .pos.Y)
                    
        Call SendData(SendTarget.ToMap, 0, .pos.Map, "NOVER" & .char.CharIndex & ",0," & .PartyIndex)

    End With

End Sub

Sub TratarDeHacerFogata(ByVal Map As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal Userindex As Integer)

    Dim Suerte    As Byte
    Dim exito     As Byte
    Dim raise     As Byte
    Dim Obj       As Obj
    Dim posMadera As WorldPos

    If Not LegalPos(Map, X, Y) Then Exit Sub

    With posMadera
        .Map = Map
        .X = X
        .Y = Y

    End With

    If Distancia(posMadera, UserList(Userindex).pos) > 2 Then
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||Est�s demasiado lejos para prender la fogata." & FONTTYPE_INFO)
        Exit Sub

    End If

    If UserList(Userindex).flags.Muerto = 1 Then
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||No puedes hacer fogatas estando muerto." & FONTTYPE_INFO)
        Exit Sub

    End If

    If MapData(Map, X, Y).OBJInfo.Amount < 3 Then
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||Necesitas por lo menos tres troncos para hacer una fogata." & FONTTYPE_INFO)
        Exit Sub

    End If

    If UserList(Userindex).Stats.UserSkills(eSkill.Supervivencia) >= 0 And UserList(Userindex).Stats.UserSkills(eSkill.Supervivencia) < 6 Then
        Suerte = 3
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Supervivencia) >= 6 And UserList(Userindex).Stats.UserSkills(eSkill.Supervivencia) <= 34 Then
        Suerte = 2
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Supervivencia) >= 35 Then
        Suerte = 1

    End If

    exito = RandomNumber(1, Suerte)

    If exito = 1 Then
        Obj.ObjIndex = FOGATA_APAG
        Obj.Amount = MapData(Map, X, Y).OBJInfo.Amount \ 3
    
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||Has hecho " & Obj.Amount & " fogatas." & FONTTYPE_INFO)
    
        Call MakeObj(SendTarget.ToMap, 0, Map, Obj, Map, X, Y)
    
        'Seteamos la fogata como el nuevo TargetObj del user
        UserList(Userindex).flags.TargetObj = FOGATA_APAG
    Else

        '[CDT 17-02-2004]
        If Not UserList(Userindex).flags.UltimoMensaje = 10 Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||No has podido hacer la fogata." & FONTTYPE_INFO)
            UserList(Userindex).flags.UltimoMensaje = 10

        End If

        '[/CDT]
    End If

    Call SubirSkill(Userindex, Supervivencia)

End Sub

Public Sub DoPescar(ByVal Userindex As Integer)

    On Error GoTo errhandler

    Dim Suerte As Integer
    Dim res    As Integer
    Dim CtdPesca As Integer


    If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
        Call QuitarSta(Userindex, EsfuerzoPescarPescador)
    Else
        Call QuitarSta(Userindex, EsfuerzoPescarGeneral)
    End If

    If UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= -1 Then
        Suerte = 35
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 11 Then
        Suerte = 30
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 21 Then
        Suerte = 28
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 31 Then
        Suerte = 24
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 41 Then
        Suerte = 22
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 51 Then
        Suerte = 20
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 61 Then
        Suerte = 18
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 71 Then
        Suerte = 15
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 81 Then
        Suerte = 10
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Pesca) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Pesca) >= 91 Then
        Suerte = 7

    End If

    res = RandomNumber(1, Suerte)

    If res < 6 Then
        Dim nPos  As WorldPos
        Dim MiObj As Obj
                   
          CtdPesca = RandomNumber(1, UserList(Userindex).Stats.ELV) + 5
          MiObj.Amount = CtdPesca
          MiObj.ObjIndex = Pescado
    
        If Not MeterItemEnInventario(Userindex, MiObj) Then
            Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)

        End If
    
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has pescado " & MiObj.Amount & ", " & ObjData(MiObj.ObjIndex).Name & ".!" & FONTTYPE_INFO)

    Else
    
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has pescado nada!" & FONTTYPE_INFO)
   
    End If

    Call SubirSkill(Userindex, Pesca)

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1

    Exit Sub

errhandler:
    Call LogError("Error en DoPescar")

End Sub

Public Sub DoPescarRed(ByVal Userindex As Integer)

    On Error GoTo errhandler

    Dim iSkill     As Integer
    Dim Suerte     As Integer
    Dim res        As Integer
    Dim EsPescador As Boolean
    Dim CtdPesca
                  
    If UCase(UserList(Userindex).Clase) = "TRABAJADOR" Then
        Call QuitarSta(Userindex, EsfuerzoPescarPescador)
        EsPescador = True
    Else
        Call QuitarSta(Userindex, EsfuerzoPescarGeneral)
        EsPescador = False

    End If

    iSkill = UserList(Userindex).Stats.UserSkills(eSkill.Pesca)

    ' m = (60-11)/(1-10)
    ' y = mx - m*10 + 11

    Select Case iSkill

        Case 0
            Suerte = 40

        Case 1 To 10
            Suerte = 35

        Case 11 To 20
            Suerte = 30

        Case 21 To 30
            Suerte = 28

        Case 31 To 40
            Suerte = 24

        Case 41 To 50
            Suerte = 22

        Case 51 To 60
            Suerte = 20

        Case 61 To 70
            Suerte = 18

        Case 71 To 80
            Suerte = 15

        Case 81 To 90
            Suerte = 10

        Case 91 To 100
            Suerte = 7

        Case Else
            Suerte = 0

    End Select

    If Suerte > 0 Then
        res = RandomNumber(1, Suerte)
    
        If res < 6 Then
            Dim nPos                  As WorldPos
            Dim MiObj                 As Obj
            Dim PecesPosibles(1 To 4) As Integer
            Dim ProbItem As Integer
            
            ProbItem = RandomNumber(1, 1000)
            
            PecesPosibles(1) = PESCADO1
            PecesPosibles(2) = PESCADO2
            PecesPosibles(3) = PESCADO3
            PecesPosibles(4) = PESCADO4
        
            
               If ProbItem > 1 Then
                  CtdPesca = RandomNumber(1, UserList(Userindex).Stats.ELV) + 5
               Else
                  CtdPesca = 1
               End If
               
                MiObj.Amount = CtdPesca

            
              If ProbItem > 1 Then
               MiObj.ObjIndex = PecesPosibles(RandomNumber(LBound(PecesPosibles), UBound(PecesPosibles)))
               Else
               MiObj.ObjIndex = PescadoCofre
             End If
             
            If Not MeterItemEnInventario(Userindex, MiObj) Then
                Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)

            End If
        
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has pescado " & MiObj.Amount & ", " & ObjData(MiObj.ObjIndex).Name & ".!" & FONTTYPE_INFO)
    
        Else
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has pescado nada!" & FONTTYPE_INFO)

        End If
    
        Call SubirSkill(Userindex, Pesca)

    End If

    Exit Sub

errhandler:
    Call LogError("Error en DoPescarRed")

End Sub

Public Sub DoRobar(ByVal LadrOnIndex As Integer, ByVal VictimaIndex As Integer)

    If Not MapInfo(UserList(VictimaIndex).pos.Map).Pk Then Exit Sub

    If UserList(LadrOnIndex).flags.Seguro Then
        Call SendData(SendTarget.ToIndex, LadrOnIndex, 0, "||Debes quitar el seguro para robar" & FONTTYPE_FIGHT)
        Exit Sub

    End If

    If TriggerZonaPelea(LadrOnIndex, VictimaIndex) <> TRIGGER6_AUSENTE Then Exit Sub

    'If UserList(VictimaIndex).Faccion.FuerzasCaos = 1 And UserList(LadrOnIndex).Faccion.FuerzasCaos = 1 Then
    '    Call SendData(SendTarget.toindex, LadrOnIndex, 0, "||No puedes robar a otros miembros de las fuerzas del caos" & FONTTYPE_FIGHT)
    '    Exit Sub
    'End If

    If UserList(VictimaIndex).flags.Privilegios = PlayerType.User Then
        Dim Suerte As Integer
        Dim res    As Integer
    
        If UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 10 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= -1 Then
            Suerte = 35
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 20 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 11 Then
            Suerte = 30
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 30 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 21 Then
            Suerte = 28
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 40 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 31 Then
            Suerte = 24
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 50 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 41 Then
            Suerte = 22
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 60 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 51 Then
            Suerte = 20
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 70 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 61 Then
            Suerte = 18
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 80 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 71 Then
            Suerte = 15
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 90 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 81 Then
            Suerte = 10
        ElseIf UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) <= 100 And UserList(LadrOnIndex).Stats.UserSkills(eSkill.Robar) >= 91 Then
            Suerte = 5

        End If

        res = RandomNumber(1, Suerte)
    
        If res < 6 Then 'Exito robo
       
            If (RandomNumber(1, 50) < 25) Then
                If TieneObjetosRobables(VictimaIndex) Then
                    Call RobarObjeto(LadrOnIndex, VictimaIndex)
                Else
                    Call SendData(SendTarget.ToIndex, LadrOnIndex, 0, "||" & UserList(VictimaIndex).Name & " no tiene objetos." & FONTTYPE_INFO)

                End If

            Else 'Roba oro

                If UserList(VictimaIndex).Stats.GLD > 0 Then
                    Dim n As Integer
                    
                    n = RandomNumber(1, 100)

                    If n > UserList(VictimaIndex).Stats.GLD Then n = UserList(VictimaIndex).Stats.GLD
                    UserList(VictimaIndex).Stats.GLD = UserList(VictimaIndex).Stats.GLD - n
                
                    UserList(LadrOnIndex).Stats.GLD = UserList(LadrOnIndex).Stats.GLD + n

                    If UserList(LadrOnIndex).Stats.GLD > MaxOro Then UserList(LadrOnIndex).Stats.GLD = MaxOro
                
                    Call SendData(SendTarget.ToIndex, LadrOnIndex, 0, "||Le has robado " & n & " monedas de oro a " & UserList(VictimaIndex).Name & _
                            FONTTYPE_INFO)
                Else
                    Call SendData(SendTarget.ToIndex, LadrOnIndex, 0, "||" & UserList(VictimaIndex).Name & " no tiene oro." & FONTTYPE_INFO)

                End If

            End If

        Else
            Call SendData(SendTarget.ToIndex, LadrOnIndex, 0, "||�No has logrado robar nada!" & FONTTYPE_INFO)
            Call SendData(SendTarget.ToIndex, VictimaIndex, 0, "||�" & UserList(LadrOnIndex).Name & " ha intentado robarte!" & FONTTYPE_INFO)
            Call SendData(SendTarget.ToIndex, VictimaIndex, 0, "||�" & UserList(LadrOnIndex).Name & " es un criminal!" & FONTTYPE_INFO)

        End If

        If Not Criminal(LadrOnIndex) Then
            Call VolverCriminal(LadrOnIndex)
        End If

        UserList(LadrOnIndex).Reputacion.LadronesRep = UserList(LadrOnIndex).Reputacion.LadronesRep + vlLadron

        If UserList(LadrOnIndex).Reputacion.LadronesRep > MAXREP Then UserList(LadrOnIndex).Reputacion.LadronesRep = MAXREP
        Call SubirSkill(LadrOnIndex, Robar)

    End If

End Sub

Public Function ObjEsRobable(ByVal VictimaIndex As Integer, ByVal Slot As Integer) As Boolean

    ' Agregu� los barcos
    ' Esta funcion determina qu� objetos son robables.

    Dim OI As Integer

    OI = UserList(VictimaIndex).Invent.Object(Slot).ObjIndex

    ObjEsRobable = ObjData(OI).ObjType <> eOBJType.otLlaves And ObjData(OI).Real = 0 _
            And ObjData(OI).Caos = 0 And ObjData(OI).Nemes = 0 And ObjData(OI).Templ = 0 _
            And ObjData(OI).NoRobable = 0

End Function

Public Sub RobarObjeto(ByVal LadrOnIndex As Integer, ByVal VictimaIndex As Integer)

    'Call LogTarea("Sub RobarObjeto")
    Dim flag As Boolean
    Dim i    As Integer
    flag = False

    If RandomNumber(1, 12) < 6 Then 'Comenzamos por el principio o el final?
        i = 1

        Do While Not flag And i <= MAX_INVENTORY_SLOTS

            'Hay objeto en este slot?
            If UserList(VictimaIndex).Invent.Object(i).ObjIndex > 0 Then
                If ObjEsRobable(VictimaIndex, i) Then
                    If RandomNumber(1, 10) < 4 Then flag = True

                End If

            End If

            If Not flag Then i = i + 1
        Loop
    Else
        i = 20

        Do While Not flag And i > 0

            'Hay objeto en este slot?
            If UserList(VictimaIndex).Invent.Object(i).ObjIndex > 0 Then
                If ObjEsRobable(VictimaIndex, i) Then
                    If RandomNumber(1, 10) < 4 Then flag = True

                End If

            End If

            If Not flag Then i = i - 1
        Loop

    End If

    If flag Then
        Dim MiObj As Obj
        Dim num   As Byte
        'Cantidad al azar
        num = RandomNumber(1, 5)
                
        If num > UserList(VictimaIndex).Invent.Object(i).Amount Then
            num = UserList(VictimaIndex).Invent.Object(i).Amount

        End If
                
        MiObj.Amount = num
        MiObj.ObjIndex = UserList(VictimaIndex).Invent.Object(i).ObjIndex
    
        UserList(VictimaIndex).Invent.Object(i).Amount = UserList(VictimaIndex).Invent.Object(i).Amount - num
                
        If UserList(VictimaIndex).Invent.Object(i).Amount <= 0 Then
            Call QuitarUserInvItem(VictimaIndex, CByte(i), 1)

        End If
            
        Call UpdateUserInv(False, VictimaIndex, CByte(i))
                
        If Not MeterItemEnInventario(LadrOnIndex, MiObj) Then
            Call TirarItemAlPiso(UserList(LadrOnIndex).pos, MiObj)

        End If
    
        Call SendData(SendTarget.ToIndex, LadrOnIndex, 0, "||Has robado " & MiObj.Amount & " " & ObjData(MiObj.ObjIndex).Name & FONTTYPE_INFO)
    Else
        Call SendData(SendTarget.ToIndex, LadrOnIndex, 0, "||No has logrado robar un objetos." & FONTTYPE_INFO)

    End If

End Sub

Public Sub DoApu�alar(ByVal Userindex As Integer, ByVal VictimNpcIndex As Integer, ByVal VictimUserIndex As Integer, ByVal Da�o As Integer)

    Dim Suerte As Integer
    Dim res    As Integer
    Dim Skill  As Byte
    
    With UserList(Userindex)
    
        Skill = .Stats.UserSkills(eSkill.Apu�alar)
 
        If Skill <= 10 And Skill >= -1 Then
            Suerte = 200
        ElseIf Skill <= 20 And Skill >= 11 Then
            Suerte = 190
        ElseIf Skill <= 30 And Skill >= 21 Then
            Suerte = 180
        ElseIf Skill <= 40 And Skill >= 31 Then
            Suerte = 170
        ElseIf Skill <= 50 And Skill >= 41 Then
            Suerte = 160
        ElseIf Skill <= 60 And Skill >= 51 Then
            Suerte = 150
        ElseIf Skill <= 70 And Skill >= 61 Then
            Suerte = 140
        ElseIf Skill <= 80 And Skill >= 71 Then
            Suerte = 130
        ElseIf Skill <= 90 And Skill >= 81 Then
            Suerte = 120
        ElseIf Skill < 100 And Skill >= 91 Then
            Suerte = 110
        ElseIf Skill = 100 Then
            Suerte = 100

        End If

        If UCase$(.Clase) = "ASESINO" Then
            res = RandomNumber(1, Suerte)

            If res < 25 Then res = 0
        Else
            res = RandomNumber(1, Suerte * 1.2)

        End If

        If res < 15 Then
            Dim Da�oApu�alar As Integer, Da�oTotal As Integer
            Dim heading As eHeading, tHeading As eHeading
            heading = .char.heading
            
            Da�oApu�alar = ((.Stats.ELV * 2.4) + (Da�o - 30))
            'FORMULA APU : ((.NivelUser * 2.4) + (Da�o - 30)) x %PosicionGolpeo
        
            If VictimUserIndex <> 0 Then
                tHeading = UserList(VictimUserIndex).char.heading
                
                Da�oApu�alar = CInt(Da�oApu�alar * BonoApu�alar(Userindex, heading, tHeading))
                Da�oTotal = Da�oApu�alar + Da�o
                
                UserList(VictimUserIndex).Stats.MinHP = UserList(VictimUserIndex).Stats.MinHP - Da�oTotal
                
                If Not Da�oApu�alar = 0 Then
                
                Call SendData(SendTarget.ToIndex, Userindex, 0, "||Has apu�alado a " & UserList(VictimUserIndex).Name & " por " & Da�oApu�alar & _
                        FONTTYPE_APU)
                
                Call SendData(SendTarget.ToIndex, VictimUserIndex, 0, "||Te ha apu�alado " & .Name & " por " & Da�oApu�alar & FONTTYPE_APU)
                        
                Call SendData(SendTarget.ToPCArea, Userindex, .pos.Map, "TW10")
                        
                Call SendData(SendTarget.ToPCArea, VictimUserIndex, UserList(VictimUserIndex).pos.Map, "CFX" & UserList( _
                        VictimUserIndex).char.CharIndex & "," & 17 & "," & 1)
                        
                Call SendData(ToPCArea, Userindex, .pos.Map, "||" & vbCyan & "�Apu! + " & Da�oApu�alar & "!�" & CStr(.char.CharIndex))
                Else
                Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has logrado apu�alar a tu enemigo!" & FONTTYPE_FIGHT)
                End If
            Else
                tHeading = Npclist(VictimNpcIndex).char.heading
                
                Da�oApu�alar = CInt(Da�oApu�alar * BonoApu�alar(Userindex, heading, tHeading))
                Da�oTotal = Da�oApu�alar + Da�o
            
                Npclist(VictimNpcIndex).Stats.MinHP = Npclist(VictimNpcIndex).Stats.MinHP - Da�oTotal
                
                If Not Da�oApu�alar = 0 Then
                
                Call SendData(SendTarget.ToIndex, Userindex, 0, "||Has apu�alado la criatura por " & Da�oApu�alar & FONTTYPE_APU)
                        
                Call SendData(SendTarget.ToPCArea, Userindex, .pos.Map, "TW12")
                
               ' Call SendData(SendTarget.ToNPCArea, VictimNpcIndex, Npclist(VictimNpcIndex).pos.Map, "CFX" & Npclist(VictimNpcIndex).char.CharIndex _
                        & "," & 17 & "," & 1)
                
                Call SendData(SendTarget.ToPCArea, Userindex, .pos.Map, "||" & vbCyan & "�Apu! + " & Da�oApu�alar & "!�" & CStr(.char.CharIndex))
                        
                '[Alejo]
                Call CalcularDarExp(Userindex, VictimNpcIndex, Da�oTotal)
                
                Else
                Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has logrado apu�alar a tu enemigo!" & FONTTYPE_FIGHT)
                End If

            End If

            Call SubirSkill(Userindex, Apu�alar)
        Else
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has logrado apu�alar a tu enemigo!" & FONTTYPE_FIGHT)

        End If

    End With

End Sub

Private Function BonoApu�alar(ByVal Userindex As Integer, ByVal heading As eHeading, ByVal tHeading As eHeading) As Single
'GOLPE POR ESPALDA: %PosicionGolpe = 100%
'GOLPE POR LATERAL: %PosicionGolpe = 50%
'GOLPE POR DELANTE: %PosicionGolpe = 0%

'CRaW; 22/01/2020 --> Si no se cumple probabilidad acertar o est�n cara a cara, no causa extra da�o.

    Dim prob As Integer
    Dim Skill As Byte
    Dim Suerte As Byte
    
    With UserList(Userindex)
       Skill = .Stats.UserSkills(eSkill.Suerte)

        If Skill <= 10 And Skill >= 1 Then
            Suerte = 1
        ElseIf Skill <= 20 And Skill >= 11 Then
            Suerte = 2
        ElseIf Skill <= 30 And Skill >= 21 Then
            Suerte = 3
        ElseIf Skill <= 40 And Skill >= 31 Then
            Suerte = 4
        ElseIf Skill <= 50 And Skill >= 41 Then
            Suerte = 5
        ElseIf Skill <= 60 And Skill >= 51 Then
            Suerte = 6
        ElseIf Skill <= 70 And Skill >= 61 Then
            Suerte = 7
        ElseIf Skill <= 80 And Skill >= 71 Then
            Suerte = 8
        ElseIf Skill <= 90 And Skill >= 81 Then
            Suerte = 9
        ElseIf Skill < 99 And Skill >= 91 Then
            Suerte = 10
        ElseIf Skill = 100 Then
            Suerte = 11

        End If
     End With

    prob = RandomNumber(1, 100)

    '  Mirando para el mismo lado, siempre va a ser apu�alada por la espalda.
    If heading = tHeading Then
        If (prob >= CInt(80 - Suerte)) Then BonoApu�alar = 1    ' Si no entendi mal al poner 1000%, quisieron poner el doble no ?
        Exit Function

        ' Yo mirando al Sur o al norte.
        ' El otr BonoDa�o = 1o mirando al Este o Oeste, golpe de lateral.
    ElseIf (heading = eHeading.SOUTH Or heading = eHeading.NORTH And tHeading = eHeading.EAST Or tHeading = eHeading.WEST) Or (heading = eHeading.WEST Or heading = eHeading.EAST And tHeading = eHeading.NORTH Or tHeading = eHeading.SOUTH) Then
        If (prob >= CInt(65 - Suerte)) Then BonoApu�alar = 0.5
        Exit Function

    End If
    
    BonoApu�alar = 0

End Function

Public Sub QuitarSta(ByVal Userindex As Integer, ByVal Cantidad As Integer)
       
       If UserList(Userindex).flags.Privilegios >= Consejero Then Exit Sub

    UserList(Userindex).Stats.MinSta = UserList(Userindex).Stats.MinSta - Cantidad

    If UserList(Userindex).Stats.MinSta < 0 Then UserList(Userindex).Stats.MinSta = 0

End Sub

Public Sub DoTalar(ByVal Userindex As Integer)

    On Error GoTo errhandler

    Dim Suerte As Integer
    Dim res    As Integer
    Dim CtdLe�a As Integer

    If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
        Call QuitarSta(Userindex, EsfuerzoTalarLe�ador)
    Else
        Call QuitarSta(Userindex, EsfuerzoTalarGeneral)

    End If

    If UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= -1 Then
        Suerte = 35
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 11 Then
        Suerte = 30
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 21 Then
        Suerte = 28
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 31 Then
        Suerte = 24
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 41 Then
        Suerte = 22
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 51 Then
        Suerte = 20
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 61 Then
        Suerte = 18
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 71 Then
        Suerte = 15
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 81 Then
        Suerte = 10
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.talar) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.talar) >= 91 Then
        Suerte = 7

    End If

    res = RandomNumber(1, Suerte)

    If res < 6 Then
        Dim nPos  As WorldPos
        Dim MiObj As Obj
    
        If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
            CtdLe�a = RandomNumber(1, UserList(Userindex).Stats.ELV) + 10
            MiObj.Amount = CtdLe�a
        Else
            MiObj.Amount = 1

        End If
    
        MiObj.ObjIndex = Le�a
    
        If Not MeterItemEnInventario(Userindex, MiObj) Then
        
            Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)
        
        End If
    
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has conseguido " & CtdLe�a & " de le�a!" & FONTTYPE_INFO)
        
        If UserList(Userindex).Stats.ELV < STAT_MAXELV Then
            UserList(Userindex).Stats.Exp = UserList(Userindex).Stats.Exp + CtdLe�a
            Call EnviarExp(Userindex)
            Call CheckUserLevel(Userindex)
        End If
        
    Else

       Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has obtenido le�a!" & FONTTYPE_INFO)
  
    End If

    Call SubirSkill(Userindex, eSkill.talar)

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1

    Exit Sub

errhandler:
    Call LogError("Error en DoTalar")

End Sub

Public Sub DoTalarHierba(ByVal Userindex As Integer)

    On Error GoTo errhandler

    Dim Suerte As Integer
    Dim res    As Integer
    Dim CtdHierba As Integer

    If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
        Call QuitarSta(Userindex, EsfuerzoTalarLe�ador)
    Else
        Call QuitarSta(Userindex, EsfuerzoTalarGeneral)

    End If

    If UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= -1 Then
        Suerte = 35
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 11 Then
        Suerte = 30
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 21 Then
        Suerte = 28
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 31 Then
        Suerte = 24
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 41 Then
        Suerte = 22
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 51 Then
        Suerte = 20
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 61 Then
        Suerte = 18
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 71 Then
        Suerte = 15
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 81 Then
        Suerte = 10
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Recolectar) >= 91 Then
        Suerte = 7
    End If

    res = RandomNumber(1, Suerte)

    If res < 6 Then
        Dim nPos  As WorldPos
        Dim MiObj As Obj
    
        If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
            CtdHierba = RandomNumber(1, UserList(Userindex).Stats.ELV) + 10
            MiObj.Amount = CtdHierba
        Else
            MiObj.Amount = 1

        End If
    
        MiObj.ObjIndex = Hierba
    
        If Not MeterItemEnInventario(Userindex, MiObj) Then
        
            Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)
        
        End If
    
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has conseguido algunas hierbas!" & FONTTYPE_INFO)
        
        If UserList(Userindex).Stats.ELV < STAT_MAXELV Then
            UserList(Userindex).Stats.Exp = UserList(Userindex).Stats.Exp + CtdHierba
            Call EnviarExp(Userindex)
            Call CheckUserLevel(Userindex)
        End If
        
    End If

    Call SubirSkill(Userindex, eSkill.Recolectar)

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1

    Exit Sub

errhandler:
    Call LogError("Error en DoTalarHierba")

End Sub

Sub VolverCriminal(ByVal Userindex As Integer)
     
     If UserList(Userindex).pos.Map = "154" Then
         Exit Sub
     End If
     
     If UserList(Userindex).Faccion.Templario = "1" Or UserList(Userindex).Faccion.ArmadaReal = "1" Then
         Exit Sub
      End If
     
    If MapData(UserList(Userindex).pos.Map, UserList(Userindex).pos.X, UserList(Userindex).pos.Y).Trigger = 6 Then Exit Sub

    If UserList(Userindex).flags.Privilegios < PlayerType.SemiDios Then
        UserList(Userindex).Reputacion.BurguesRep = 0
        UserList(Userindex).Reputacion.NobleRep = 0
        UserList(Userindex).Reputacion.PlebeRep = 0
        UserList(Userindex).Reputacion.BandidoRep = UserList(Userindex).Reputacion.BandidoRep + vlASALTO

        If UserList(Userindex).Reputacion.BandidoRep > MAXREP Then UserList(Userindex).Reputacion.BandidoRep = MAXREP

        'If UserList(UserIndex).Faccion.ArmadaReal = 1 Then
        '    Call ExpulsarFaccionReal(UserIndex)
        'End If
    
        'If UserList(UserIndex).Faccion.Templario = 1 Then
        '    Call ExpulsarFaccionTemplario(UserIndex)
        'End If
    
    End If
    
    OnlineCriminal = OnlineCriminal + 1
    OnlineCiudadano = OnlineCiudadano - 1
    
    #If MYSQL = 1 Then
         DoEvents
         Call Add_DataBase(Userindex, "Ranking")
   #End If

End Sub

Sub VolverCiudadano(ByVal Userindex As Integer)

    If MapData(UserList(Userindex).pos.Map, UserList(Userindex).pos.X, UserList(Userindex).pos.Y).Trigger = 6 Then Exit Sub

    UserList(Userindex).Reputacion.LadronesRep = 0
    UserList(Userindex).Reputacion.BandidoRep = 0
    UserList(Userindex).Reputacion.AsesinoRep = 0
    UserList(Userindex).Reputacion.PlebeRep = UserList(Userindex).Reputacion.PlebeRep + vlASALTO

    If UserList(Userindex).Reputacion.PlebeRep > MAXREP Then UserList(Userindex).Reputacion.PlebeRep = MAXREP

    'If UserList(UserIndex).Faccion.FuerzasCaos = 1 Then
    '    Call ExpulsarFaccionCaos(UserIndex)
    'End If
    
    'If UserList(UserIndex).Faccion.Nemesis = 1 Then
    '    Call ExpulsarFaccionNemesis(UserIndex)
    'End If
     
    OnlineCiudadano = OnlineCiudadano + 1
    OnlineCriminal = OnlineCriminal - 1
    
    #If MYSQL = 1 Then
         DoEvents
         Call Add_DataBase(Userindex, "Ranking")
   #End If

End Sub

Public Sub DoMineria(ByVal Userindex As Integer)

    On Error GoTo errhandler

    Dim Suerte As Integer
    Dim res    As Integer
    Dim metal  As Integer
    Dim CtdMineria As Integer

    If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
        Call QuitarSta(Userindex, EsfuerzoExcavarMinero)
    Else
        Call QuitarSta(Userindex, EsfuerzoExcavarGeneral)

    End If

    If UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= -1 Then
        Suerte = 35
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 11 Then
        Suerte = 30
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 21 Then
        Suerte = 28
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 31 Then
        Suerte = 24
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 41 Then
        Suerte = 22
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 51 Then
        Suerte = 20
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 61 Then
        Suerte = 18
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 71 Then
        Suerte = 15
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 81 Then
        Suerte = 10
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Mineria) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Mineria) >= 91 Then
        Suerte = 7
    End If

    res = RandomNumber(1, Suerte)

    If res <= 5 Then
        Dim MiObj As Obj
        Dim nPos  As WorldPos
    
        If UserList(Userindex).flags.TargetObj = 0 Then Exit Sub
    
        MiObj.ObjIndex = ObjData(UserList(Userindex).flags.TargetObj).MineralIndex
    
        If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
            CtdMineria = RandomNumber(1, UserList(Userindex).Stats.ELV) + 10
            MiObj.Amount = CtdMineria
        Else
            MiObj.Amount = 1

        End If
    
        If Not MeterItemEnInventario(Userindex, MiObj) Then Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)
    
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has extraido " & CtdMineria & " minerales!" & FONTTYPE_INFO)
        
        If UserList(Userindex).Stats.ELV < STAT_MAXELV Then
            UserList(Userindex).Stats.Exp = UserList(Userindex).Stats.Exp + CtdMineria
            Call EnviarExp(Userindex)
            Call CheckUserLevel(Userindex)
        End If
        
        If RandomNumber(1, 100) <= 10 Then
              
              MiObj.ObjIndex = Diamante
              MiObj.Amount = 1
              If Not MeterItemEnInventario(Userindex, MiObj) Then Call TirarItemAlPiso(UserList(Userindex).pos, MiObj)
           
        End If
        
    Else
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�No has conseguido nada!" & FONTTYPE_INFO)
  

        '[/CDT]
    End If

    Call SubirSkill(Userindex, eSkill.Mineria)

    UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1

    Exit Sub

errhandler:
    Call LogError("Error en Sub DoMineria")

End Sub

Public Sub DoOveja(ByVal Userindex As Integer)

    Dim Suerte As Integer
    Dim Rs As Integer
    Dim Obj As Obj
    Dim CtdSastre As Integer
    
    
    If UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= -1 Then
        Suerte = 35
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 11 Then
        Suerte = 30
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 21 Then
        Suerte = 28
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 31 Then
        Suerte = 24
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 41 Then
        Suerte = 22
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 51 Then
        Suerte = 20
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 61 Then
        Suerte = 18
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 71 Then
        Suerte = 15
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 81 Then
        Suerte = 10
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Sastreria) >= 91 Then
        Suerte = 7
    End If
    
    Rs = RandomNumber(1, Suerte)
    
    Obj.ObjIndex = Lana
    
    If UCase$(UserList(Userindex).Clase) = "TRABAJADOR" Then
         CtdSastre = RandomNumber(1, UserList(Userindex).Stats.ELV) + 10
         Obj.Amount = CtdSastre
      Else
       Obj.Amount = 1
    End If
    
    If Rs <= 5 Then
        
        If Not MeterItemEnInventario(Userindex, Obj) Then Call TirarItemAlPiso(UserList(Userindex).pos, Obj)
        
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has conseguido de lana!" & FONTTYPE_INFO)
        
        If UserList(Userindex).Stats.ELV < STAT_MAXELV Then
            UserList(Userindex).Stats.Exp = UserList(Userindex).Stats.Exp + CtdSastre
            Call EnviarExp(Userindex)
            Call CheckUserLevel(Userindex)
        End If
        
    End If
   
   Call SubirSkill(Userindex, eSkill.Sastreria)
   UserList(Userindex).Counters.Trabajando = UserList(Userindex).Counters.Trabajando + 1
   Call SendData(SendTarget.ToPCArea, Userindex, UserList(Userindex).pos.Map, "TW61")
   
End Sub

Public Sub DoMeditar(ByVal Userindex As Integer)

    UserList(Userindex).Counters.IdleCount = 0

    Dim Suerte  As Integer
    Dim res     As Integer
    Dim cant    As Integer

    'Barrin 3/10/03
    'Esperamos a que se termine de concentrar
    Dim TActual As Long
    TActual = GetTickCount() And &H7FFFFFFF

    If TActual - UserList(Userindex).Counters.tInicioMeditar < TIEMPO_INICIOMEDITAR Then
        Exit Sub

    End If

    If UserList(Userindex).Counters.bPuedeMeditar = False Then
        UserList(Userindex).Counters.bPuedeMeditar = True

    End If

    If UserList(Userindex).Stats.MinMAN >= UserList(Userindex).Stats.MaxMAN Then
        Call SendData(SendTarget.ToIndex, Userindex, 0, "Z16")
        Call SendData(SendTarget.ToIndex, Userindex, 0, "MEDOK")
        UserList(Userindex).flags.Meditando = False
        UserList(Userindex).char.FX = 0
        UserList(Userindex).char.loops = 0
        Call SendData(SendTarget.ToPCArea, Userindex, UserList(Userindex).pos.Map, "CFX" & UserList(Userindex).char.CharIndex & "," & 0 & "," & 0)
        Exit Sub

    End If
    
    If UserList(Userindex).flags.Privilegios = PlayerType.User Then
        If UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= -1 Then
            Suerte = 35
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 11 Then
            Suerte = 30
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 21 Then
            Suerte = 28
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 31 Then
            Suerte = 24
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 41 Then
            Suerte = 22
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 51 Then
            Suerte = 20
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 61 Then
            Suerte = 18
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 71 Then
            Suerte = 15
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 81 Then
            Suerte = 10
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 91 Then
            Suerte = 5

        End If
   
    Else
   
        If UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 10 Then
            Suerte = 35
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 110 Then
            Suerte = 30
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 210 Then
            Suerte = 28
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 310 Then
            Suerte = 24
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 410 Then
            Suerte = 22
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 510 Then
            Suerte = 20
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 610 Then
            Suerte = 18
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 710 Then
            Suerte = 15
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 810 Then
            Suerte = 10
        ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Meditar) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Meditar) >= 910 Then
            Suerte = 5

        End If
    
    End If
   
    res = RandomNumber(1, Suerte)

    If res = 1 Then
        cant = Porcentaje(UserList(Userindex).Stats.MaxMAN, 3)
        UserList(Userindex).Stats.MinMAN = UserList(Userindex).Stats.MinMAN + cant

        If UserList(Userindex).Stats.MinMAN > UserList(Userindex).Stats.MaxMAN Then UserList(Userindex).Stats.MinMAN = UserList( _
                Userindex).Stats.MaxMAN
    
        If Not UserList(Userindex).flags.UltimoMensaje = 22 Then
            Call SendData(SendTarget.ToIndex, Userindex, 0, "||�Has recuperado " & cant & " puntos de mana!" & FONTTYPE_INFO)
            UserList(Userindex).flags.UltimoMensaje = 22

        End If
    
        Call SendData(SendTarget.ToIndex, Userindex, 0, "ASM" & UserList(Userindex).Stats.MinMAN)
        Call SubirSkill(Userindex, Meditar)

    End If

End Sub

Public Sub Desarmar(ByVal Userindex As Integer, ByVal VictimIndex As Integer)

    Dim Suerte As Integer
    Dim res    As Integer

    If UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 10 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= -1 Then
        Suerte = 35
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 20 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 11 Then
        Suerte = 30
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 30 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 21 Then
        Suerte = 28
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 40 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 31 Then
        Suerte = 24
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 50 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 41 Then
        Suerte = 22
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 60 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 51 Then
        Suerte = 20
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 70 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 61 Then
        Suerte = 18
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 80 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 71 Then
        Suerte = 15
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 90 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 81 Then
        Suerte = 10
    ElseIf UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) <= 100 And UserList(Userindex).Stats.UserSkills(eSkill.Wresterling) >= 91 Then
        Suerte = 5

    End If

    res = RandomNumber(1, Suerte)

    If res <= 2 Then
        Call Desequipar(VictimIndex, UserList(VictimIndex).Invent.WeaponEqpSlot)
        Call SendData(SendTarget.ToIndex, Userindex, 0, "||Has logrado desarmar a tu oponente!" & FONTTYPE_FIGHT)

        If UserList(VictimIndex).Stats.ELV < 20 Then Call SendData(SendTarget.ToIndex, VictimIndex, 0, "||Tu oponente te ha desarmado!" & _
                FONTTYPE_FIGHT)

    End If

End Sub
