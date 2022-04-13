SetBatchLines, -1
#SingleInstance, force
#Persistent
SetWorkingDir %A_ScriptDir%
if not A_IsAdmin
  Run *RunAs "%A_ScriptFullPath%"
CoordMode, Pixel,Screen 
CoordMode, Mouse,Screen 

Interfaz_gui()
global mi_x:=500
global mi_y:=500
PixelGetColor, mix, %mi_x%, %mi_y%,RGB
global mix
migui(mi_x,mi_y)

Mover_a(Px,Py){
  global
  MouseGetPos, Px,Py
  PixelGetColor, mix, %Px%, %Py%,RGB
  mi_x 		:=	Px
  mi_y 		:=	Py
  mix_x_up	:=	Px
  mix_y_up	:= 	Py-6
  mix_x_down 	:=	Px
  mix_y_down 	:= 	Py+1
  mix_x_left 	:= 	Px-6
  mix_y_left 	:= 	Py
  mix_x_right := 	Px+1
  mix_y_right := 	Py	
  WinMove G_Up,,		mix_x_up,mix_y_up
  WinMove G_Down,,	mix_x_down,mix_y_down
  WinMove G_Left,,	mix_x_left,mix_y_left
  WinMove G_Right,,	mix_x_right,mix_y_right
  ToolTip,% mix "`n" Px " x " Py,A_ScreenWidth,A_ScreenHeight
  Return
}

treal(){
  global
  Loop{
    KeyWait,LControl,D T0.1
    if ErrorLevel{
      ;ToolTip, si capturacion
      PixelGetColor, mix, %mi_x%, %mi_y%,RGB
      ToolTip,% mix "`n" mi_x " x " mi_y,A_ScreenWidth,A_ScreenHeight
    }Else{
      ;ToolTip, no capturacion
      Break
    }
  }
  Return
}
migui(mi_x,mi_y){
  global
  Velocidad := 1 
  mix_x_up:=mi_x
  mix_y_up:= mi_y-6
  mix_x_down:=mi_x
  mix_y_down:= mi_y+1
  mix_x_left:= mi_x-6
  mix_y_left:= mi_y
  mix_x_right:= mi_x+1
  mix_y_right := mi_y	

  Gui, G_Up:Show,x%mix_x_up% y%mix_y_up% w-4 h-23,G_Up
  gui, G_Up:Color ,red
  gui, G_Up: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption

  Gui, G_Down:Show,x%mix_x_down% y%mix_y_down% w-4 h-23,G_Down
  gui, G_Down:Color ,blue
  gui, G_Down: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption

  Gui, G_Left:Show,x%mix_x_left% y%mix_y_left% w0 h-27,G_Left
  gui, G_Left:Color ,green
  gui, G_Left: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption

  Gui, G_Right:Show,x%mix_x_right% y%mix_y_right% w0 h-27,G_Right
  gui, G_Right:Color ,green
  gui, G_Right: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption
 ;WinSet, Transparent,1,G_Up
 ;WinSet, Transparent,1,G_Down
 ;WinSet, Transparent,1,G_Left
 ;WinSet, Transparent,1,G_Right
  Return
}
LControl::
  Loop{
    KeyWait,LControl,D T0.1
    if !ErrorLevel{
      Mover_a(Mouse_x,Mouse_y)
      treal()
    }Else{
      Break 
      Return
    }
  }						
Return
w Up::
  Velocidad:=1
  global band :=true
Return
s Up::
  Velocidad:=1
  global band :=true
Return
a Up::
  Velocidad:=1
  global band :=true
Return
d Up::
  Velocidad:=1
  global band :=true
Return

w::
  KeyWait, w ,D T0.1
  if !ErrorLevel{
    if not (band)
      Velocidad 	+=3
    band 		:= False
  }	
  mi_y-=Velocidad
  mix_y_up-=Velocidad
  mix_y_down-=Velocidad
  mix_y_left-=Velocidad
  mix_y_right-=Velocidad

  WinMove, G_Up,,		mix_x_up 		,mix_y_up
  WinMove, G_Down,,	mix_x_down 		,mix_y_down
  WinMove, G_Left,,	mix_x_left 		,mix_y_left
  WinMove, G_Right,,	mix_x_right 	,mix_y_right

  PixelGetColor, mix, %mi_x%, %mi_y%,RGB
  ToolTip,% mix "`n" mi_x " x " mi_y,A_ScreenWidth,A_ScreenHeight
Return

s::
  KeyWait, s ,D T0.1
  if !ErrorLevel{
    if not (band)
      Velocidad 	+=3
    band 		:= False
  }
  mi_y:=mi_y+Velocidad
  mix_y_up:= mix_y_up + Velocidad
  mix_y_down:=mix_y_down+Velocidad
  mix_y_left:=mix_y_left+Velocidad
  mix_y_right:=mix_y_right+Velocidad
  WinMove, G_Up,,		mix_x_up 		,mix_y_up
  WinMove, G_Down,,	mix_x_down 		,mix_y_down

  WinMove, G_Left,,	mix_x_left 		,mix_y_left
  WinMove, G_Right,,	mix_x_right 	,mix_y_right

  PixelGetColor, mix, %mi_x%, %mi_y%,RGB
  ToolTip,% mix "`n" mi_x " x " mi_y,A_ScreenWidth,A_ScreenHeight
Return

a::
  KeyWait, a ,D T0.1
  if !ErrorLevel{
    if not (band)
      Velocidad 	+=3
    band 		:= False
  }
  mi_x:=mi_x-Velocidad
  mix_x_up:= mix_x_up - Velocidad
  mix_x_down:=mix_x_down-Velocidad
  mix_x_left:=mix_x_left-Velocidad
  mix_x_right:=mix_x_right-Velocidad
  WinMove, G_Up,,		mix_x_up 		,mix_y_up
  WinMove, G_Down,,	mix_x_down 	,mix_y_down
  WinMove, G_Left,,	mix_x_left 	,mix_y_left
  WinMove, G_Right,,	mix_x_right 	,mix_y_right
  PixelGetColor, mix, %mi_x%, %mi_y%,RGB
  ToolTip,% mix "`n" mi_x " x " mi_y,A_ScreenWidth,A_ScreenHeight
Return

d::
  KeyWait, d ,D T0.1
  if !ErrorLevel{
    if not (band)
      Velocidad 	+=3
    band 		:= False
  }
  mi_x:=mi_x+Velocidad
  mix_x_up:= mix_x_up + Velocidad
  mix_x_down:=mix_x_down+Velocidad
  mix_x_left:=mix_x_left+Velocidad
  mix_x_right:=mix_x_right+Velocidad
  WinMove, G_Up,,		mix_x_up 		,mix_y_up
  WinMove, G_Down,,	mix_x_down 		,mix_y_down
  WinMove, G_Left,,	mix_x_left 		,mix_y_left
  WinMove, G_Right,,	mix_x_right 	,mix_y_right

  PixelGetColor, mix, %mi_x%, %mi_y%,RGB
  ToolTip,% mix "`n" mi_x " x " mi_y,A_ScreenWidth,A_ScreenHeight
Return
Interfaz_gui(){
  global band:= False	
  gui, principal:Show, x0 w80 h28,principal
  WinGetPos,,,,lc3_h,principal
  alto:= A_ScreenHeight-lc3_h
  WinMove, principal,,,alto
  gui, principal:color, 0x1C1D20	
  ;gui, principal:Add,Button,gLin_off_1,L1
  ;gui, principal:Add,Button,x35 y6  gLin_off_2,L2
  ;gui, principal:Add,Button,x6 y35  gLife_on,Life
  ;gui, principal:Add,Button,x40 y35 gHero_on,Hero
  gui, principal:Add,Button,x12 y3 gExportar,Exportar
  gui, principal: +AlwaysOnTop -MinimizeBox -Caption
  winset,TransColor,0x1C1D20,principal
Return
}

Numpad1::
  IniWrite,%mi_x%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin1_x
  IniWrite,%mi_y%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin1_y
  IniWrite,%mix%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	Color_off_lin1
Return

Numpad2::
  IniWrite,%mi_x%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin2_x
  IniWrite,%mi_y%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin2_y
  IniWrite,%mix%, 	cfg\Configuracion_Coordenadas.ini, 	Coordenadas, 	Color_off_lin2
Return

Numpad3::
  IniWrite,%mi_x%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_life_x
  IniWrite,%mi_y%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_life_y
  IniWrite,%mix%, 	cfg\Configuracion_Coordenadas.ini, 	Coordenadas, 	Color_on_life
Return

Numpad0::
  IniWrite,%mi_x%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_Hero_x
  IniWrite,%mi_y%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_Hero_y
  IniWrite,%mix%, 	cfg\Configuracion_Coordenadas.ini, 	Coordenadas, 	Color_on_Hero
Return

Obtener_Datos_del_Ordenador(){ ;Encerio le decia antes ordenador a una pc? HAHAHAH
  global
  Nombre_de_Pc := A_ComputerName
  Resultado_pantalla := % A_ScreenWidth " x " A_ScreenHeight

  IfWinExist, Dota 2
    WinGetPos, Dx, Dy, Dw, Dh, Dota 2
  Coordenadas_Juego	:= % Dx " x " Dy
  Ancho_x_Alto		:= % Dw " x " Dh
Return
}

Generar_Nro_de_Exportacion(){
  global
  IniRead,Registro,cfg\Configuracion_Coordenadas.ini,Nro_de_Registro, Registro
  StringTrimLeft,Nro_Registro,Registro, 5
  ;MsgBox,% "Nro_Registro " Nro_Registro
  Nro_Registro++
  Registro_Salida := % "Reg_0" Nro_Registro
  IniWrite,%Registro_Salida%		,cfg\Configuracion_Coordenadas.ini 	,Nro_de_Registro, Registro	
  ;MsgBox,% "salida Nro_Registro " Nro_Registro
Return
}

Limpiar_Archibo_ini(){
  Vacio :=" "
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin1_x
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin1_y
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	Color_off_lin1
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin2_x
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_lin2_y
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, 	Coordenadas, 	Color_off_lin2
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_life_x
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_life_y
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, 	Coordenadas, 	Color_on_life
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_Hero_x
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, Coordenadas, 	C_Hero_y
  IniWrite,%Vacio%, 	cfg\Configuracion_Coordenadas.ini, 	Coordenadas, 	Color_on_Hero
Return
}

IniRead_Export(){ ;jaja yo usando ingles XD
  global	
  IniRead,Ex_C_lin1_x			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_lin1_x
  IniRead,Ex_C_lin1_y			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_lin1_y
  IniRead,Ex_Color_off_lin1	,cfg\Configuracion_Coordenadas.ini, Coordenadas, Color_off_lin1
  IniRead,Ex_C_lin2_x			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_lin2_x
  IniRead,Ex_C_lin2_y			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_lin2_y
  IniRead,Ex_Color_off_lin2	,cfg\Configuracion_Coordenadas.ini, Coordenadas, Color_off_lin2
  IniRead,Ex_C_life_x			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_life_x
  IniRead,Ex_C_life_y			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_life_y
  IniRead,Ex_Color_on_life	,cfg\Configuracion_Coordenadas.ini, Coordenadas, Color_on_life
  IniRead,Ex_C_Hero_x			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_Hero_x
  IniRead,Ex_C_Hero_y			,cfg\Configuracion_Coordenadas.ini, Coordenadas, C_Hero_y
  IniRead,Ex_Color_on_Hero	,cfg\Configuracion_Coordenadas.ini, Coordenadas, Color_on_Hero
Return
}	

Exportar:
  IniRead_Export()
  Generar_Nro_de_Exportacion()
  Obtener_Datos_del_Ordenador()
  IniWrite,% "`t`t`t" 	Registro_Salida 	"`n"	,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Nro_de_Registro, 		Registro	
  IniWrite,% "`t`t`t" 	Nombre_de_Pc 		"`n"	,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Nombre_del_Equipo, 	Nombre
  IniWrite,% "`t`t" 		Resultado_pantalla 	"`n"	,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Dimenciones_Pc,		Ancho_x_Alto 
  IniWrite,% "`t`t" 		Coordenadas_Juego			,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Dimenciones_Juego, 	Coordenadas
  IniWrite,% "`t`t" 		Ancho_x_Alto 		"`n"	,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Dimenciones_Juego, 	Ancho_x_Alto
  IniWrite,% "`t`t`t" 	Ex_C_lin1_x					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_lin1_x
  IniWrite,% "`t`t`t" 	Ex_C_lin1_y					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_lin1_y
  IniWrite,% "`t`t" 		Ex_Color_off_lin1 	"`n"	,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			Color_off_lin1 
  IniWrite,% "`t`t`t" 	Ex_C_lin2_x					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_lin2_x
  IniWrite,% "`t`t`t" 	Ex_C_lin2_y					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_lin2_y
  IniWrite,% "`t`t" 		Ex_Color_off_lin2 	"`n"	,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			Color_off_lin2 
  IniWrite,% "`t`t`t" 	Ex_C_life_x					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_life_x
  IniWrite,% "`t`t`t" 	Ex_C_life_y					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_life_y
  IniWrite,% "`t`t" 		Ex_Color_on_life 	"`n"	,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			Color_on_life 
  IniWrite,% "`t`t" 		Ex_C_Hero_x					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_Hero_x
  IniWrite,% "`t`t" 		Ex_C_Hero_y					,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			C_Hero_y
  IniWrite,% "`t`t" 		Ex_Color_on_Hero			,% "Expo\" Registro_Salida "_" Nombre_de_Pc "_" Ancho_x_Alto ".ini" , Coordenadas, 			Color_on_Hero	
  Limpiar_Archibo_ini()
ExitApp	 
Return

GuiClose:
ExitApp ;843
Escape:: 
ExitApp
