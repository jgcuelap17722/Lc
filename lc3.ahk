;prosesos Externos

#SingleInstance, force
#Persistent
SetBatchLines, -1
if not A_IsAdmin
    Run *RunAs "%A_ScriptFullPath%"	 
SetWorkingDir 	,%A_ScriptDir%
CoordMode 	 	,Pixel,Screen

#Include %A_ScriptDir%
#include Class_ImageButton.ahk
;Screen : Toda la pantalla
;Relative:Solo la pantalla activa 

ScriptInireadAb()
ScriptInireadItems()
ScriptInireadCombo()
	g_w := 3.5	;3.5
	g_h := -23 ; -23
	Transparencia := 245
	;g_x := 3

gui_it_0(g_w,g_h)	gui_it_1(g_w,g_h)
gui_it_2(g_w,g_h) 	gui_it_3(g_w,g_h)
gui_it_4(g_w,g_h) 	gui_it_5(g_w,g_h)
gui_lin_1(g_w,g_h) 	gui_lin_2(g_w,g_h)
gui_ab_1(g_w,g_h) 	gui_ab_5(g_w,g_h)
gui_rin_0(g_w,g_h)	
Interfas()
variables_globales_MyPc()

;Modulos de Lectura y escritura de archibos ".ini"
	ScriptInireadAb(){
		global
		;IniRead: Lee un valor, sección o lista de nombres de sección de un archivo .ini de formato estándar.
		;IniRead, OutputVar, Filename, Section, Key [, Default]
		IniRead, ab_0 , cfg\teclas_de_habilidades.ini   , Teclas_Acceso_ab, ab_0
		IniRead, ab_1 , cfg\teclas_de_habilidades.ini   , Teclas_Acceso_ab, ab_1
		IniRead, ab_2 , cfg\teclas_de_habilidades.ini   , Teclas_Acceso_ab, ab_2
		IniRead, ab_3 , cfg\teclas_de_habilidades.ini   , Teclas_Acceso_ab, ab_3
		IniRead, ab_4 , cfg\teclas_de_habilidades.ini   , Teclas_Acceso_ab, ab_4
		IniRead, ab_5 , cfg\teclas_de_habilidades.ini   , Teclas_Acceso_ab, ab_5
		}
	ScriptInireadItems(){
		global ; sirve para usar sus variables en todo el codigo
		; lee el archibo ini y directamente a unadirecion y depitkpue itkpdevuelve un valor ejj:"ite_0"
		IniRead, ite_0 , cfg\teclas_de_Items.ini , Teclas_Acceso_it, it_0
		IniRead, ite_1 , cfg\teclas_de_Items.ini , Teclas_Acceso_it, it_1
		IniRead, ite_2 , cfg\teclas_de_Items.ini , Teclas_Acceso_it, it_2
		IniRead, ite_3 , cfg\teclas_de_Items.ini , Teclas_Acceso_it, it_3
		IniRead, ite_4 , cfg\teclas_de_Items.ini , Teclas_Acceso_it, it_4
		IniRead, ite_5 , cfg\teclas_de_Items.ini , Teclas_Acceso_it, it_5
		;auxiliares
		IniRead, lin_1 , cfg\teclas_de_Items.ini , Teclas_aux_item, lin_1
		IniRead, lin_2 , cfg\teclas_de_Items.ini , Teclas_aux_item, lin_2
		IniRead, rin_0 , cfg\teclas_de_Items.ini , Teclas_aux_item, rin_0
		IniRead, t_combo , cfg\teclas_de_Items.ini, Teclas_combo, t_combo
		IniRead, t_chk , cfg\teclas_de_Items.ini, Teclas_combo, t_chk	
		IniRead, t_pausa , cfg\teclas_de_Items.ini, Tecla_pausa, t_pausa
			if (!t_pausa){
				IniWrite,Enter, cfg\teclas_de_Items.ini, Tecla_pausa, t_pausa	
			}

		}	
	ScriptInireadCombo(){
		global
		iniread, c_ab_1       , cfg\configuracion.ini, combo, c_ab_1  , 1
		iniread, c_it_1       , cfg\configuracion.ini, combo, c_it_1  , 1
		iniread, c_it_0       , cfg\configuracion.ini, combo, c_it_0  , 1
		iniread, c_it_2       , cfg\configuracion.ini, combo, c_it_2  , 1
		iniread, c_it_3       , cfg\configuracion.ini, combo, c_it_3  , 1
		iniread, c_it_4       , cfg\configuracion.ini, combo, c_it_4  , 1
		iniread, c_it_5       , cfg\configuracion.ini, combo, c_it_5  , 1
		iniread, c_ab_5       , cfg\configuracion.ini, combo, c_ab_5  , 1
		iniread, c_lin_1      , cfg\configuracion.ini, combo, c_lin_1 , 0
		iniread, c_lin_2      , cfg\configuracion.ini, combo, c_lin_2 , 0
		iniread, c_rin_0      , cfg\configuracion.ini, combo, c_rin_0 , 0
		}

		Iniread_Importar_Coordenadas(){
			global
			iterador := 0
			IniRead, Maximo 		,cfg\Configuracion_Coordenadas.ini, Nro_de_Registro, Registro	
			StringTrimLeft,STL_Maximo,Maximo, 4
			Loop, Expo\*%STL_Maximo%*.ini
    			ShortPathName = %A_LoopFileShortName%	
			While (iterador <= STL_Maximo)
				IniRead, C_lin1_x 		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_lin1_x
				IniRead, C_lin1_y 		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_lin1_y
				IniRead, Color_off_lin1 ,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, Color_off_lin1
				IniRead, C_lin2_x 		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_lin2_x
				IniRead, C_lin2_y 		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_lin2_y
				IniRead, Color_off_lin2 ,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, Color_off_lin2
				IniRead, C_life_x		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_life_x
				IniRead, C_life_y		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_life_y
				IniRead, Color_on_life	,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, Color_on_life
				IniRead, C_Hero_x		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_Hero_x
				IniRead, C_Hero_y		,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, C_Hero_y
				IniRead, Color_on_Hero	,Expo\Reg_013_PCCUELA_1360 x 768.ini, Coordenadas, Color_on_Hero
			Return
			}

		Cargar_datos_a_Combo_Box(){ ;Carga datos de Exportaciones al ComboBox 
			global
			iterador := 1
			IniRead, IRMaximo_Registro 		,cfg\Configuracion_Coordenadas.ini, Nro_de_Registro, Registro	
			Loop, Expo\%IRMaximo_Registro%*.ini
    			Ruta_de_Archibo = %A_LoopFileShortName% ; RECUPERA nombre del archibo mas no la carpeta
    		StringTrimLeft,STL_Maximo, IRMaximo_Registro, 5 ;sale numero de registro
    		StringTrimLeft,STL_Ruta, Ruta_de_Archibo,% StrLen(IRMaximo_Registro) ;sale resto de direccion
    		while (iterador<=STL_Maximo){
    			New_Ruta = % "Expo\Reg_0" iterador "_"
    			Loop,%New_Ruta%*.ini ;busca la nueva ruta 
    				Ruta_Archibo = %A_LoopFileShortPath% ; y te recupera la direccion con la carpeta completa
    			IfExist, % Ruta_Archibo ; verifica si esa direccion de "Ruta-Archibo" existe
    			{
    				IniRead, dato ,%Ruta_Archibo%, Dimenciones_Juego, Ancho_x_Alto ;;lee el ancho_alto
    				IniRead, dato2 ,%Ruta_Archibo%, Nro_de_Registro, Registro ;lee el Nro de registro
    				Datos_CB = % dato2 " (" dato ") " "|" Datos_CB ;Creamos una cadena Para despues usar en el ComboBox
    			}
    			iterador++ ;iteramos dependiendo el numero amximo de Registros.
    		}
    		;MsgBox, % Datos_CB
    		Return
		}
;Imagenes de Interfas 
 	gui add, picture, x3 y274 w38 h38 ggui_control vab_1_0, img\0\ab_1.png
	gui add, picture, x3 y274 w38 h38 ggui_control vab_1_1, img\1\ab_1.png
	;activar y desactivar la imagen de habilidades 
	key := ""
	if (c_ab_1) { ;si el valor "c_ab_1" es 1 en el archibo cfg\configuracion.ini 
	guicontrol show, ab_1_1 ;mostrar la imagen de la clave "ab_1_1" habilitada
	guicontrol hide, ab_1_0 ;y oculta la imagen de la clave "ab_1_0" deshablilitada
	} else {
	guicontrol hide, ab_1_1
	guicontrol show, ab_1_0
	}
	key := GetKeyName(ab_1) ;Recupera el nombre de una clave.
	StringUpper, key, key ;Convierte una cadena de minúsculas a mayúsculas.

	gui add, picture, x41 y274 w38 h38 ggui_control vit_0_0, img\0\it_0.png
	gui add, picture, x41 y274 w38 h38 ggui_control vit_0_1, img\1\it_0.png
	if (c_it_0) {
	guicontrol show, it_0_1
	guicontrol hide, it_0_0
	} else {
	guicontrol hide, it_0_1
	guicontrol show, it_0_0
	}
	key := GetKeyName(it_0)
	StringUpper, key, key

	gui add, picture, x79 y274 w38 h38 ggui_control_ite1 vit_1_0, img\0\it_1.png
	gui add, picture, x79 y274 w38 h38 ggui_control_ite1 vit_1_1, img\1\it_1.png	
	if (c_it_1) {
	guicontrol show, it_1_1
	guicontrol hide, it_1_0
	} else {
	guicontrol hide, it_1_1
	guicontrol show, it_1_0
	}
	key := GetKeyName(it_1)
	StringUpper, key, key

	gui add, picture, x79 y244 w38 h30 ggui_control_ite1 vrin_0_0, img\0\rin_0.png
	gui add, picture, x79 y244 w38 h30 ggui_control_ite1 vrin_0_1, img\1\rin_0.png	
	if (c_rin_0) {
	guicontrol show, rin_0_1
	guicontrol hide, rin_0_0
	} else {
	guicontrol hide, rin_0_1
	guicontrol show, rin_0_0
	}
	key := GetKeyName(rin_0)
	StringUpper, key, key

	gui add, picture, x117 y274 w38 h38 ggui_control vit_3_0, img\0\it_3.png
	gui add, picture, x117 y274 w38 h38 ggui_control vit_3_1, img\1\it_3.png
	if (c_it_3) {
	guicontrol show, it_3_1
	guicontrol hide, it_3_0
	} else {
	guicontrol hide, it_3_1
	guicontrol show, it_3_0
	}
	key := GetKeyName(it_3)
	StringUpper, key, key

	gui add, picture, x155 y274 w38 h38 ggui_control_links vit_4_0, img\0\it_4.png
	gui add, picture, x155 y274 w38 h38 ggui_control_links vit_4_1, img\1\it_4.png
	if (c_it_4) {
	guicontrol show, it_4_1
	guicontrol hide, it_4_0
	} else {
	guicontrol hide, it_4_1
	guicontrol show, it_4_0
	}
	key := GetKeyName(it_4)
	StringUpper, key, key

	gui add, picture, x193 y274 w38 h38 ggui_control vit_2_0, img\0\it_2.png
	gui add, picture, x193 y274 w38 h38 ggui_control vit_2_1, img\1\it_2.png
	if (c_it_2) {
	guicontrol show, it_2_1
	guicontrol hide, it_2_0
	} else {
	guicontrol hide, it_2_1
	guicontrol show, it_2_0
	}
	key := GetKeyName(it_2)
	StringUpper, key, key

	gui add, picture, x231 y274 w38 h38 ggui_control vab_5_0, img\0\ab_5.png
	gui add, picture, x231 y274 w38 h38 ggui_control vab_5_1, img\1\ab_5.png
	if (c_ab_5) {
	guicontrol show, ab_5_1
	guicontrol hide, ab_5_0
	} else {
	guicontrol hide, ab_5_1
	guicontrol show, ab_5_0
	}
	key := GetKeyName(ab_5)
	StringUpper, key, key

	gui add, picture, x155 y244 w38 h30 ggui_control_links vlin_1_0, img\0\lin_1.png
	gui add, picture, x155 y244 w38 h30 ggui_control_links vlin_1_1, img\1\lin_1.png	
	if (c_lin_1) {
	guicontrol show, lin_1_1
	guicontrol hide, lin_1_0
	} else {
	guicontrol hide, lin_1_1
	guicontrol show, lin_1_0
	}
	key := GetKeyName(lin_1) ;obtiene el nombre de la imagen y la almacena en "Key"
	StringUpper, key, key

	gui add, picture, x269 y244 w38 h30 ggui_control_links vlin_2_0, img\0\lin_2.png
	gui add, picture, x269 y244 w38 h30 ggui_control_links vlin_2_1, img\1\lin_2.png
	if (c_lin_2) {
	guicontrol show, lin_2_1b
	guicontrol hide, lin_2_0
	} else {
	guicontrol hide, lin_2_1
	guicontrol show, lin_2_0
	}
	key := GetKeyName(lin_2) ;obtiene el nombre de la imagen y la almacena en "Key"
	StringUpper, key, key

	gui add, picture, x269 y274 w38 h38 ggui_control_links vit_5_0, img\0\it_5.png
	gui add, picture, x269 y274 w38 h38 ggui_control_links vit_5_1, img\1\it_5.png
	if (c_it_5) {
	guicontrol show, it_5_1
	guicontrol hide, it_5_0
	} else {
	guicontrol hide, it_5_1
	guicontrol show, it_5_0
	}
	key := GetKeyName(it_5)
	StringUpper, key, key
;Imagenes de Guis pequeños
	gui_ab_1(g_w,g_h){
	global
	Gui, gui_ab_1:Show,x641 y715 w%g_w% h%g_h%,gui_ab_1
	gui, gui_ab_1:Color ,green
	gui, gui_ab_1: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_ab_1:add, picture, x0 y0 w40 h40 ggui_control vab_1_0, img\0\ab_1.png
	gui, gui_ab_1:add, picture, x0 y0 w40 h40 ggui_control vab_1_1, img\1\ab_1.png
	
	if (c_ab_1) {
	guicontrol,gui_ab_1: show, ab_1_1
	guicontrol,gui_ab_1: hide, ab_1_0
	} else {
	guicontrol,gui_ab_1: Hide, ab_1_1
	guicontrol,gui_ab_1: Show, ab_1_0
	}
	key := GetKeyName(ab_1)
	StringUpper, key, key
	Return
	}
	
	gui_ab_5(g_w,g_h){
	global
	Gui, gui_ab_5:Show,x733 y715 w%g_w% h%g_h%,gui_ab_5 
	gui, gui_ab_5:Color ,green
	gui, gui_ab_5: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_ab_5:add, picture, x0 y0 w40 h40 ggui_control vab_5_0, img\0\ab_5.png
	gui, gui_ab_5:add, picture, x0 y0 w40 h40 ggui_control vab_5_1, img\1\ab_5.png
	
	if (c_ab_5) {
	guicontrol,gui_ab_5: show, ab_5_1
	guicontrol,gui_ab_5: hide, ab_5_0
	} else {
	guicontrol,gui_ab_5: Hide, ab_5_1
	guicontrol,gui_ab_5: Show, ab_5_0
	}
	key := GetKeyName(ab_5)
	StringUpper, key, key
	Return
	}
	
	gui_it_0(g_w,g_h){
	global
	Gui, gui_it_0:Show,x789 y665 w%g_w% h%g_h%,gui_it_0
	gui, gui_it_0:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_it_0
	gui, gui_it_0: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_it_0:add, picture, x0 y0 w40 h40 ggui_control vit_0_0, img\0\it_0.png
	gui, gui_it_0:add, picture, x0 y0 w40 h40 ggui_control vit_0_1, img\1\it_0.png
	
	if (c_it_0) {
	guicontrol,gui_it_0: show, it_0_1
	guicontrol,gui_it_0: hide, it_0_0
	} else {
	guicontrol,gui_it_0: Hide, it_0_1
	guicontrol,gui_it_0: Show, it_0_0
	}
	key := GetKeyName(it_0)
	StringUpper, key, key
	Return
	}
	
	gui_it_1(g_w,g_h){
	global
	;Gui, gui_it_1:Show,x851 y663 w%g_w% h%g_h%,gui_it_1
	Gui, gui_it_1:Show,x835 y665 w%g_w% h%g_h%,gui_it_1
	gui, gui_it_1:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_it_1
	gui, gui_it_1: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_it_1:add, picture, x0 y0 w40 h40 ggui_control_ite1 vit_1_0, img\0\it_1.png
	gui, gui_it_1:add, picture, x0 y0 w40 h40 ggui_control_ite1 vit_1_1, img\1\it_1.png

	if (c_it_1) {
	guicontrol,gui_it_1: show, it_1_1
	guicontrol,gui_it_1: hide, it_1_0
	} else {
	guicontrol,gui_it_1: Hide, it_1_1
	guicontrol,gui_it_1: Show, it_1_0
	}
	key := GetKeyName(it_1)
	StringUpper, key, key
	Return
	}
	
	gui_rin_0(g_w,g_h){
	global
	;Gui, gui_it_1:Show,x851 y663 w%g_w% h%g_h%,gui_it_1
	Gui, gui_rin_0:Show,x844 y665 w%g_w% h%g_h%,gui_rin_0
	gui, gui_rin_0:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_rin_0
	gui, gui_rin_0: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_rin_0:add, picture, x0 y0 w40 h40 ggui_control_ite1 vrin_0_0, img\0\rin_0.png
	gui, gui_rin_0:add, picture, x0 y0 w40 h40 ggui_control_ite1 vrin_0_1, img\1\rin_0.png
	if (c_rin_0) {
	guicontrol,gui_rin_0: show, rin_0_1
	guicontrol,gui_rin_0: hide, rin_0_0
	} else {
	guicontrol,gui_rin_0: Hide, rin_0_1
	guicontrol,gui_rin_0: Show, rin_0_0
	}
	key := GetKeyName(rin_0)
	StringUpper, key, key
	Return
	}
	
	gui_it_2(g_w,g_h){
	global
	;921 x 665
	Gui, gui_it_2:Show,x881 y665 w%g_w% h%g_h%, gui_it_2
	gui, gui_it_2:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_it_2
	gui, gui_it_2: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_it_2:add, picture, x0 y0 w40 h40 ggui_control vit_2_0, img\0\it_2.png
	gui, gui_it_2:add, picture, x0 y0 w40 h40 ggui_control vit_2_1, img\1\it_2.png
	
	if (c_it_2) {
	guicontrol,gui_it_2: show, it_2_1
	guicontrol,gui_it_2: hide, it_2_0
	} else {
	guicontrol,gui_it_2: Hide, it_2_1
	guicontrol,gui_it_2: Show, it_2_0
	}
	key := GetKeyName(it_2)
	StringUpper, key, key
	Return
	}
	
	gui_it_3(g_w,g_h){
	global 
	Gui, gui_it_3:Show,x790 y736 w%g_w% h%g_h%,gui_it_3
	gui, gui_it_3:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_it_3
	gui, gui_it_3: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_it_3:add, picture, x0 y0 w40 h40 ggui_control vit_3_0, img\0\it_3.png
	gui, gui_it_3:add, picture, x0 y0 w40 h40 ggui_control vit_3_1, img\1\it_3.png
	
	if (c_it_3) {
	guicontrol,gui_it_3: show, it_3_1
	guicontrol,gui_it_3: hide, it_3_0
	} else {
	guicontrol,gui_it_3: Hide, it_3_1
	guicontrol,gui_it_3: Show, it_3_0
	}
	key := GetKeyName(it_3)
	StringUpper, key, key
	Return
	}
	
	gui_it_4(g_w,g_h){
	global 
	Gui, gui_it_4:Show,x860 y736 w%g_w% h%g_h%,gui_it_4
	gui, gui_it_4:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_it_4
	gui, gui_it_4: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_it_4:add, picture, x0 y0 w40 h40 ggui_control_links vit_4_0, img\0\it_4.png
	gui, gui_it_4:add, picture, x0 y0 w40 h40 ggui_control_links vit_4_1, img\1\it_4.png
	
	if (c_it_4) {
	guicontrol,gui_it_4: show, it_4_1
	guicontrol,gui_it_4: hide, it_4_0
	} else {
	guicontrol,gui_it_4: Hide, it_4_1
	guicontrol,gui_it_4: Show, it_4_0
	}
	key := GetKeyName(it_4)
	StringUpper, key, key
	Return
	}
	
	gui_it_5(g_w,g_h){
	global 
	Gui, gui_it_5:Show,x907 y736 w%g_w% h%g_h%,gui_it_5
	gui, gui_it_5:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_it_5
	gui, gui_it_5: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_it_5:add, picture, x0 y0 w40 h40 ggui_control_links vit_5_0, img\0\it_5.png
	gui, gui_it_5:add, picture, x0 y0 w40 h40 ggui_control_links vit_5_1, img\1\it_5.png
	
	if (c_it_5) {
	guicontrol,gui_it_5: show, it_5_1
	guicontrol,gui_it_5: hide, it_5_0
	} else {
	guicontrol,gui_it_5: Hide, it_5_1
	guicontrol,gui_it_5: Show, it_5_0
	}
	key := GetKeyName(it_5)
	StringUpper, key, key
	Return
	}
	
	gui_lin_2(g_w,g_h){
	global 
	Gui, gui_lin_2:Show,x916 y736 w%g_w% h%g_h%,gui_lin_2
	gui, gui_lin_2:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_lin_2 
	gui, gui_lin_2: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_lin_2:add, picture, x0 y0 w40 h40 ggui_control_links vlin_2_0, img\0\lin_2.png
	gui, gui_lin_2:add, picture, x0 y0 w40 h40 ggui_control_links vlin_2_1, img\1\lin_2.png
	
	if (c_lin_2) {
	guicontrol,gui_lin_2: show, lin_2_1
	guicontrol,gui_lin_2: hide, lin_2_0
	} else {
	guicontrol,gui_lin_2: Hide, lin_2_1
	guicontrol,gui_lin_2: Show, lin_2_0
	}
	key := GetKeyName(lin_2)
	StringUpper, key, key
	Return
	}
	
	gui_lin_1(g_w,g_h){
	global 
	Gui, gui_lin_1:Show,x869 y736 w%g_w% h%g_h%,gui_lin_1
	gui, gui_lin_1:Color ,green
	WinSet,	Transparent,%Transparencia%,gui_lin_1
	gui, gui_lin_1: +AlwaysOnTop -Caption -MinimizeBox -MaximizeBox -Caption +ToolWindow
 	gui, gui_lin_1:add, picture, x0 y0 w40 h40 ggui_control_links vlin_1_0, img\0\lin_1.png
	gui, gui_lin_1:add, picture, x0 y0 w40 h40 ggui_control_links vlin_1_1, img\1\lin_1.png
    
	if (c_lin_1) {
	guicontrol,gui_lin_1: show, lin_1_1
	guicontrol,gui_lin_1: hide, lin_1_0
	} else {
	guicontrol,gui_lin_1: Hide, lin_1_1
	guicontrol,gui_lin_1: Show, lin_1_0
	}
	key := GetKeyName(lin_1)
	StringUpper, key, key
	Return
	}	
;Gui Controls XD
	gui_control:		
		;Esta funcion se activa cada vez que haces clic en una imagen con codigo "gui_control" 
		;y guarda la configuracion de activada o deisactivada
		StringTrimRight, key, a_guicontrol, 2 ;Elimina una serie de caracteres del lado izquierdo o derecho de una cadena. 
		;sirve para solo tomar una sierta parte del nombre d ela variable y usarlo añadiendo"c_" y completar con la parte faltante ejm: "c_" +  "it_4" - "_1"
		iniread, value , cfg\configuracion.ini, combo, % "c_" key,1 ; leer el archibo ini segun donde haya hecho clic y dar valor que anteriormente estaba
		;MsgBox, key  es %value%
		;si value es 1 = es por que ya fue activado y se esta desactivando ahora
		;si value es 0 = es por que esta desactivado y se esta activando
		if (key != ""){
		if (value) { ;aca llega 1 y bota 0
			SoundPlay, Audio\gui_off.wav
			GuiControl, hide , % key "_1" ;ocultando la imagen activada
			GuiControl, show , % key "_0" ;mostrando la imagen desactivada
			IniWrite, 0, cfg\configuracion.ini, combo, % "c_" key ; Escribe 0 el archibo ini segun donde haya hecho clic
			c_%key% := 0 ;guarda en memoria el nuevo valorvalor
			;MsgBox, %key% desactivado
		} else { ;aca llega cero y bota 1
			SoundPlay, Audio\gui_on.wav
			GuiControl, show , % key "_1"
			GuiControl, hide , % key "_0"
			IniWrite, 1, cfg\configuracion.ini, combo, % "c_" key
			c_%key% := 1
			;MsgBox, %key% activado
			}	
		}
		Return
	gui_control_ite1:
		StringTrimRight, key, a_guicontrol, 2
		iniread, value , cfg\configuracion.ini, combo, % "c_" key
		r_it = % "c_" key
		if (key != ""){
			if (r_it = "c_it_1"){
				if (value){
					Desactivar_links(key)
					Funcion_de_la_tecla("w","off")
					Funcion_de_la_tecla("q","off")
				}else if(c_rin_0){
					Desactivar_links(key)
					ToolTip, Solo uno puede estar activo
					SetTimer, removertooltip, 1490
					Funcion_de_la_tecla("w","off")
					Funcion_de_la_tecla("q","off")
				}Else{
					Activar_links(key)
					Funcion_de_la_tecla("w","on")
					Funcion_de_la_tecla("q","on")
				}
			}Else if(value){
				Desactivar_links(key)
					Funcion_de_la_tecla("w","off")
					Funcion_de_la_tecla("q","off")				
			}Else if(c_it_1){
				Desactivar_links(key)
				ToolTip, Solo uno puede estar activo
				SetTimer, removertooltip, 1490
					Funcion_de_la_tecla("w","off")
					Funcion_de_la_tecla("q","off")
			}else{
				Activar_links(key)
					Funcion_de_la_tecla("w","on")
					Funcion_de_la_tecla("q","on")
			}
		}
		Return	
	gui_control_links: ;especialmete para que it_4 y lin_1 esten unidos	
		StringTrimRight, key, a_guicontrol, 2
		iniread, value , cfg\configuracion.ini, combo, % "c_" key
		lin = % "c_" key
			if (key != ""){
				if (key = "lin_1" || key = "lin_2"){	
					if (lin = "c_lin_1"){
						lin_it_temporal := c_it_4
						name_it = c_it_4
					}Else{
						lin_it_temporal := c_it_5
						name_it = c_it_5
					}
					if (value){	
						Desactivar_links(key)
					}else if (lin_it_temporal){
						Activar_links(key)
						}Else{ 
							Desactivar_links(key)
							StringTrimLeft, Nitem, name_it, 5
							ToolTip, No esta activo el item %Nitem%	
							SetTimer, removertooltip, 1490
						}
				}else{
				if (lin = "c_it_4"){
					it_temporal := c_it_4
					lin_temporal := c_lin_1
					lin_nro := 1
					gui_nro := 4
					name_link =  % "c_lin_" lin_nro
				}Else{
					it_temporal := c_it_5
					lin_temporal := c_lin_2
					lin_nro := 2
					gui_nro := 5
					name_link =  % "c_lin_" lin_nro			
				}
				if (it_temporal){
					Desactivar_links(key)
					if (lin_temporal) {
						SoundPlay, Audio\gui_off.wav
						guicontrol hide, lin_%lin_nro%_1
						guicontrol show, lin_%lin_nro%_0
						guicontrol, gui_lin_%lin_nro%: hide, lin_%lin_nro%_1
						guicontrol, gui_lin_%lin_nro%: show, lin_%lin_nro%_0
						} else {
						SoundPlay, Audio\gui_off.wav
						guicontrol, gui_lin_%lin_nro%: hide, lin_%lin_nro%_1
						guicontrol, gui_lin_%lin_nro%: show, lin_%lin_nro%_0
						guicontrol hide, lin_%lin_nro%_1
						guicontrol show, lin_%lin_nro%_0
						}
					IniWrite, 0, cfg\configuracion.ini, combo,% "c_lin_" lin_nro
					if (name_link = "c_lin_1"){
						c_lin_1 = 0
					}Else{
						c_lin_2 = 0
					}
					;MsgBox, c_lin_1 es %c_lin_1% `n c_lin_2 es %c_lin_2% `n name_link es %name_link%
				}Else{
					Activar_links(key)
				}
			} 					
		}
 		Return
;Modulos de Interaccion o Apariencia
	Interfas(){
		global
		gui, 	show,		x100 	y200	w275 	h41 											 , lc3
		WinGetPos,,,Width,Height,lc3
		My_w:= A_ScreenWidth-Width
		My_h:= A_ScreenHeight-Height
		WinMove,lc3,,My_w,My_h
		WinSet,	Transparent,100,lc3
		gui, 	color, 0x1C1D20		
		;gui, 	+AlwaysOnTop 
		Gui, 	Submit, NoHide 

		gui, 	Font,c0xffffff s11.2	
		gui, add,hotkey, 	x3   	y203 	w50 	h19 		vab0,		%ab_0%
		gui, add,hotkey, 	x54  	y203 	w50 	h19 		vab1,		%ab_1% 
		gui, add,hotkey, 	x105 	y203 	w50 	h19 		vab2,		%ab_2% 
		gui, add,hotkey, 	x156 	y203 	w50 	h19 		vab3,		%ab_3% 
		gui, add,hotkey, 	x207 	y203 	w50 	h19 		vab4,		%ab_4% 
		gui, add,hotkey, 	x258 	y203 	w50 	h19 		vab5,		%ab_5% 
		gui, add,hotkey, 	x3   	y223  	w50 	h19  		vit0, 		%ite_0% 
		gui, add,hotkey, 	x54  	y223 	w50 	h19  		vit1, 		%ite_1%  
		gui, add,hotkey, 	x105 	y223 	w50 	h19  		vit2, 		%ite_2%  
		gui, add,hotkey, 	x156 	y223 	w50 	h19  		vit3, 		%ite_3% 
		gui, add,hotkey, 	x207 	y223 	w50 	h19  		vit4, 		%ite_4%  
		gui, add,hotkey, 	x258 	y223 	w50 	h19  		vit5, 		%ite_5%  
		gui, add,hotkey, 	x3  	y116 	w70 	h19 		vcombo Disabled%t_chk%,%t_combo%
		;gui, add,hotkey, 	x370 	y52  	w50 	h19  		vlin1, %lin_1% 
		gui, add,hotkey, 	x3  	y141 	w70 	h19 		vpausa,%t_pausa%  
		gui, add,Button,	x190  	y8		w50  	h25 					gGuardar_Cambios 	hwndBTN1 , GO!
		gui, add,Button,	x160 	y8 		w25 	h25  		vsuspend_  	gdesabilitar 		hwndBTN2 , 0
		gui, add,Button,	x245  	y8		w25  	h25 					gOcultar_gui 		hwndBTN3 , v 	
		gui, add,Checkbox, 	x79 	y116 	vt_chk  Checked%t_chk% 			gCheck_Box	 			 	 , Ctrl+Click
		Cargar_datos_a_Combo_Box()
		Gui, Add, ComboBox, x3 		y8 		w150 				vItem_Seleccionado gseleccion , % Datos_CB
		Animacion_de_Cursores()
		ImageButton.SetGuiColor("0x1C1D20")
		;Color  %degradado 0-9 	fondo   		degradado  	 	letra			redondeado 	atras  	Borde		grosor de borde
		Normal := [0				,0x171719	,"green"	,"0xE9E9E9"		,"H"		,		,"0x393E3F", 3]  
		Pasar := [ 		,0x393E3F,,,,,"0x171719"]	 
		;tambien se puede ir a los indices de propiedades  del boton
		Presionado := {4:"0xFCAF14"} 
		; Button states:
		; PBS_NORMAL    = 1
		; PBS_HOT       = 2
		; PBS_PRESSED   = 3
		; PBS_DISABLED  = 4
		; PBS_DEFAULTED = 5
		;H_1 := [0,0x171719]  
		;							1		2	 	3			
		ImageButton.Create(BTN1, Normal, Pasar,Presionado)
		ImageButton.Create(BTN2, Normal, Pasar,Presionado)
		ImageButton.Create(BTN3, Normal, Pasar,Presionado)
		Agregar_Ventanas_Grupo()
		Bandera := False
		INICIO()
		WinHide ahk_group ventanitas
		Return
		}

	Ocultar_gui:
		WinGetPos, lc3_x,lc3_y,lc3_w,lc3_h,lc3
		Altura := lc3_h
		if (Altura < 329){
			WinMove, lc3,,lc3_x,lc3_y,400,440
		}Else{
			WinMove, lc3,,lc3_x,lc3_y,400,80
		}
	Return

	;Actualizar_Posision_OCR(ocr_a1,ocr_a2,ocr_b1,ocr_b2){
	;	IfWinExist, O_C_R
	;	{
	;		;MsgBox, % ocr_a1 " Actualizar_Posision_OCR"
	;		WinClose, O_C_R.exe
	;		IniWrite,%ocr_a1%,Tecnologia_OCR\cfg\cfg.ini, Coordenadas,Coordenada_1_a
	;		IniWrite,%ocr_a2%,Tecnologia_OCR\cfg\cfg.ini, Coordenadas,Coordenada_1_b
	;		IniWrite,%ocr_b1%,Tecnologia_OCR\cfg\cfg.ini, Coordenadas,Coordenada_2_a
	;		IniWrite,%ocr_b2%,Tecnologia_OCR\cfg\cfg.ini, Coordenadas,Coordenada_2_b
	;		Run,Tecnologia_OCR\Area_OCR\O_C_R.exe		
	;	}Else{
	;		MsgBox, No esta activo
	;	}
	;}

Mover_Las_Guis_de(Resolucion_Juego){
	global
IfWinExist, ahk_group ventanitas	
	;MsgBox, % "Resolucion_Juego  es  "  Resolucion_Juego
	if (Resolucion_Juego = "1360 x 768"){
		WinMove, gui_ab_1,, 	641, 715
		WinMove, gui_ab_5,, 	733, 715
		WinMove, gui_it_0,, 	789, 665
		WinMove, gui_it_1,, 	835, 665
		WinMove, gui_it_2,, 	881, 665
		WinMove, gui_it_3,, 	790, 736
		WinMove, gui_it_4,, 	860, 736
		WinMove, gui_it_5,, 	907, 736
		WinMove, gui_lin_1,, 	869, 736
		WinMove, gui_lin_2,, 	916, 736
		WinMove, gui_rin_0,, 	844, 665
		;Actualizar_Posision_OCR("660","16","701","27")
	}else If (Resolucion_Juego = "1680 x 1050"){
		WinMove, gui_ab_1,, 	902,  992
		WinMove, gui_ab_5,, 	1031, 992	
		WinMove, gui_it_0,, 	1105, 925
		WinMove, gui_it_1,, 	1168, 925
		WinMove, gui_it_2,, 	1231, 925 
		WinMove, gui_it_3,, 	1108, 1023
		WinMove, gui_it_4,, 	1211, 1023
		WinMove, gui_it_5,, 	1272, 1023
		WinMove, gui_lin_1,, 	1220, 1023
		WinMove, gui_lin_2,, 	1281, 1023
		WinMove, gui_rin_0,, 	1177, 925
	}else If (Resolucion_Juego = "1768 x 992"){
		WinMove, gui_ab_1,, 	906,  967
		WinMove, gui_ab_5,, 	1028, 967	
		WinMove, gui_it_0,, 	1097, 904
		WinMove, gui_it_1,, 	1157, 904
		WinMove, gui_it_2,, 	1217, 904 
		WinMove, gui_it_3,, 	1100, 995
		WinMove, gui_it_4,, 	1196, 995
		WinMove, gui_it_5,, 	1255, 995
		WinMove, gui_lin_1,, 	1205, 995
		WinMove, gui_lin_2,, 	1264, 995
		WinMove, gui_rin_0,, 	1166, 904
		;Actualizar_Posision_OCR("936","66","982","79")
	}
	Return
}

	seleccion:
		Gui, 	Submit,NoHide 
		Buscar_Codigo_de_Registro(Item_Seleccionado)
		Return

	Variables_globales_de_Busqueda(PColor_off_l1,PColor_off_l2,PColor_on_vida,PColor_on_Heroe,PC_life_x,PC_life_y,PC_Hero_x,PC_Hero_y,PC_lin1_x,PC_lin1_y,PC_lin2_x,PC_lin2_y){
		global Color_lc 	:= PColor_on_Heroe ;Color de letra "q que solo aparece en LC"
		;global negro 		:= 0x1E2911 ; Color de barra d vida cuando esta bajo
		global verde		:= PColor_on_vida ;color vida 
		global desactivo 	:= PColor_off_l1 ;lin1
		global desactivo2 	:= PColor_off_l2 ;lin2 
		global desactivo3 	:= PColor_off_l2 ;lin2

		global CestadoVidaX := PC_life_x
		global CestadoVidaY := PC_life_y
		global CselectHeroX := PC_Hero_x
		global CselectHeroY := PC_Hero_y
		global CpixColorX 	:= PC_lin1_x 
		global CpixColorY 	:= PC_lin1_y	
		global CpixColor2X  := PC_lin2_x 
		global CpixColor2Y  := PC_lin2_y
		;Estados := "CestadoVidaX es: " CestadoVidaX "`n CestadoVidaY es:" CestadoVidaY "`n CselectHeroX es:" CselectHeroX "`n CselectHeroY es:" CselectHeroY 
		;Estados_lin :="CpixColorX es: "  CpixColorX "`n CpixColorY es:" CpixColorY "`n CpixColor2X es:" CpixColor2X "`n CpixColor2Y es:" CpixColor2Y 
		;Colores := "Color_lc es: " Color_lc "`n verde es:" verde "`n desactivo es:" desactivo "`n desactivo2 es:" desactivo2 "`n desactivo3 es:" desactivo3 
		;MsgBox, % Estados "`n" Estados_lin "`n" Colores
		Return	
		}	
	Buscar_Codigo_de_Registro(Seleccionado){
		global
		StringLeft,Busqueda,Seleccionado,% InStr(Seleccionado," ")-1
		;MsgBox, % StrLen(Busqueda) "es " Busqueda
		Busqueda = % "Expo\" Busqueda "_"
		Loop,%Busqueda%*.ini" ;busca la nueva ruta 
    		Ruta_Archibo_Buscado = %A_LoopFileShortPath% ; y te recupera la direccion con la carpeta completa
    		;MsgBox, % Ruta_Archibo_Buscado
    		IfExist, % Ruta_Archibo_Buscado ; verifica si esa direccion de "Ruta-Archibo" existe
    		{
    			Leer_Coordenadas_de_Busqueda(Ruta_Archibo_Buscado)
    			Variables_globales_de_Busqueda(Bus_Color_off_lin1,Bus_Color_off_lin2,Bus_Color_on_life,Bus_Color_on_Hero,Bus_C_life_x,Bus_C_life_y,Bus_C_Hero_x,Bus_C_Hero_y,Bus_C_lin1_x,Bus_C_lin1_y,Bus_C_lin2_x,Bus_C_lin2_y)
    			Mover_Las_Guis_de(Bus_Resolucion_Juego)
    		}Else{
    			MsgBox, no existe El Archibo
    		}
		return
		}	

	Leer_Coordenadas_de_Busqueda(Ruta_de_Busqueda){
		global
		IniRead, Bus_C_lin1_x 		,%Ruta_de_Busqueda%, Coordenadas, C_lin1_x
		IniRead, Bus_C_lin1_y 		,%Ruta_de_Busqueda%, Coordenadas, C_lin1_y
		IniRead, Bus_Color_off_lin1 ,%Ruta_de_Busqueda%, Coordenadas, Color_off_lin1
		IniRead, Bus_C_lin2_x 		,%Ruta_de_Busqueda%, Coordenadas, C_lin2_x
		IniRead, Bus_C_lin2_y 		,%Ruta_de_Busqueda%, Coordenadas, C_lin2_y
		IniRead, Bus_Color_off_lin2 ,%Ruta_de_Busqueda%, Coordenadas, Color_off_lin2
		IniRead, Bus_C_life_x		,%Ruta_de_Busqueda%, Coordenadas, C_life_x
		IniRead, Bus_C_life_y		,%Ruta_de_Busqueda%, Coordenadas, C_life_y
		IniRead, Bus_Color_on_life	,%Ruta_de_Busqueda%, Coordenadas, Color_on_life
		IniRead, Bus_C_Hero_x		,%Ruta_de_Busqueda%, Coordenadas, C_Hero_x
		IniRead, Bus_C_Hero_y		,%Ruta_de_Busqueda%, Coordenadas, C_Hero_y
		IniRead, Bus_Color_on_Hero	,%Ruta_de_Busqueda%, Coordenadas, Color_on_Hero
		IniRead, Bus_Resolucion_Juego	,%Ruta_de_Busqueda%, Dimenciones_Juego, Ancho_x_Alto
		
		Return
		}

	removertooltip:
		ToolTip
		Return
	INICIO(){
		global
		Suspend
			guicontrol	, text, suspend_,0
			Normal := [0	,"0x171719"		,		,"0xE9E9E9"		,"H"		,		,"0xF70010", 3]
		ImageButton.Create(BTN2, Normal)
		Return
		}
	Animacion_de_Cursores(){
		OnMessage(0x200,"Forma_de_Cursor") 
		OnMessage(0x201,"Forma_de_Cursor")
		OnMessage(0x202,"Forma_de_Cursor")
		Return
		}
	Forma_de_Cursor(){ ;seria bueno bloquear si un hotkey esta bloqueado :)
		Mano 	:=DllCall( "LoadCursor","UInt","","Int",32649)
		Editar	:=DllCall( "LoadCursor","UInt","","Int",32513) ; "I"
		MouseGetPos,,,,control 							;Capturamos el nombre del controlador
			;ToolTip, % control
			Botones:= InStr(control, "Button") 			;Buscamos una palabra en especifica
			Hotkeys:= InStr(control, "msctls_hotkey")
			Statics:= InStr(control, "Static")
			if (Botones || Statics){
				DllCall("SetCursor","UInt",Mano)
			}Else if (Hotkeys){
				DllCall("SetCursor","UInt",Editar)
			}	
		Return																	
		}
	Mostrar_Ocultar_Guis(C_skill,KeyName){
		if (!%C_skill% || %C_skill% )
		guicontrol,gui_%KeyName%: Hide, % KeyName "_1"
		guicontrol,gui_%KeyName%: Show, % KeyName "_0"
		IniWrite, 0, cfg\configuracion.ini, combo, % "c_" KeyName 
		Return
		}
	Reinicio_de_Skills(){
		global
		Mostrar_Ocultar_Guis(c_it_0,"it_0")
		c_it_0 := 0
		Mostrar_Ocultar_Guis(c_it_1,"it_1")
		c_it_1 := 
		Mostrar_Ocultar_Guis(c_it_2,"it_2")
		c_it_2 := 0
		Mostrar_Ocultar_Guis(c_it_3,"it_3")
		c_it_3 := 0
		Mostrar_Ocultar_Guis(c_it_4,"it_4")
		c_it_4 := 0
		Mostrar_Ocultar_Guis(c_it_5,"it_5")
		c_it_5 := 0
		Mostrar_Ocultar_Guis(c_ab_1,"ab_1")
		c_ab_1 := 0
		Mostrar_Ocultar_Guis(c_ab_5,"ab_5")
		c_ab_5 := 0
		Mostrar_Ocultar_Guis(c_lin_1,"lin_1")
		c_lin_1 := 0
		Mostrar_Ocultar_Guis(c_lin_2,"lin_2")
		c_lin_2 := 0
		Mostrar_Ocultar_Guis(c_rin_0,"rin_0")
		c_rin_0 := 0
		Return
		}
	Gui_Hotkeys_Rin(Pnombre_ite_1){ ;Activa o desactiva Rin-it1
		global
		StringTrimLeft,STL_nombre_spell,Pnombre_ite_1, 2
		iniread, IR_valor_ini , cfg\configuracion.ini, combo,% Pnombre_ite_1
		iniread, IR_leer_rin , cfg\configuracion.ini, combo,c_rin_0
		;MsgBox, % "rin es " leer_rin
		if (IR_valor_ini){
			guicontrol,gui_%STL_nombre_spell%:Hide,%STL_nombre_spell%_1
			guicontrol,gui_%STL_nombre_spell%:Show,%STL_nombre_spell%_0
			guicontrol,gui_rin_0		 :Hide,rin_0_0
			guicontrol,gui_rin_0		 :Show,rin_0_1
			IniWrite,0,cfg\configuracion.ini, combo,% "c_" STL_nombre_spell
			IniWrite,1,cfg\configuracion.ini, combo,c_rin_0
			c_%STL_nombre_spell% := 0
			c_rin_0 := 1
			Funcion_de_la_tecla("w","on")
			Funcion_de_la_tecla("q","on")
			SoundPlay, Audio\gui_rin.wav
			;Sleep, 300
			;SoundPlay, Audio\gui_on.wav			
		}Else if(IR_leer_rin){
			;MsgBox, % "entre" leer_rin
			guicontrol,gui_%STL_nombre_spell%:Hide,%STL_nombre_spell%_1
			guicontrol,gui_%STL_nombre_spell%:Show,%STL_nombre_spell%_0
			guicontrol,gui_rin_0		 :Hide,rin_0_1
			guicontrol,gui_rin_0		 :Show,rin_0_0
			IniWrite,0,cfg\configuracion.ini, combo,% "c_" STL_nombre_spell
			IniWrite,0,cfg\configuracion.ini, combo,c_rin_0
			c_%STL_nombre_spell% := 0
			c_rin_0 := 0
			Funcion_de_la_tecla("w","off")
			Funcion_de_la_tecla("q","off")
			SoundPlay, Audio\gui_off_all.wav
		}Else{
			guicontrol,gui_%STL_nombre_spell%:Hide,%STL_nombre_spell%_0
			guicontrol,gui_%STL_nombre_spell%:Show,%STL_nombre_spell%_1
			guicontrol,gui_rin_0		 :Hide,rin_0_1
			guicontrol,gui_rin_0		 :Show,rin_0_0
			IniWrite,1,cfg\configuracion.ini, combo,% "c_" STL_nombre_spell
			IniWrite,0,cfg\configuracion.ini, combo,c_rin_0
			c_%STL_nombre_spell% := 1
			c_rin_0 := 0
			Funcion_de_la_tecla("w","off")
			Funcion_de_la_tecla("q","off")
			SoundPlay, Audio\gui_on.wav
		}
		Return
		}
	Gui_Hotkeys(Pnombre){ ;Activa o desactiva ab_1 y 5,ite_0,ite_2,ite_3,ite
		global
		StringTrimLeft,nombre_spell,Pnombre, 2
		iniread, valor_ini , cfg\configuracion.ini, combo,% Pnombre
			if (valor_ini){
				guicontrol,gui_%nombre_spell%:Hide,%nombre_spell%_1
				guicontrol,gui_%nombre_spell%:Show,%nombre_spell%_0
				IniWrite,0,cfg\configuracion.ini, combo,% "c_" nombre_spell
				c_%nombre_spell% := 0
				if(Pnombre="c_it_0"){
					SoundPlay, Audio\gui_off_all.wav
				}Else if(Pnombre="c_it_2"){
					SoundPlay, Audio\gui_off_all.wav
				}Else if(Pnombre="c_it_3"){
					SoundPlay, Audio\gui_off_all.wav
				}Else{
					SoundPlay, Audio\gui_off.wav
				}
				

			}Else{
				guicontrol,gui_%nombre_spell%:Hide,%nombre_spell%_0
				guicontrol,gui_%nombre_spell%:Show,%nombre_spell%_1
				IniWrite,1,cfg\configuracion.ini, combo,% "c_" nombre_spell
				c_%nombre_spell% := 1
				if(Pnombre="c_it_0"){
					SoundPlay, Audio\gui_blade_on.wav
				}Else if(Pnombre="c_it_2"){
					SoundPlay, Audio\gui_blink_on.wav
				}Else if(Pnombre="c_it_3"){
					SoundPlay, Audio\gui_bkb_on.wav
				}Else{
					SoundPlay, Audio\gui_on.wav
				}
				
			}	
		Return
		}
	Modulo_Lin_General(Nombre_Ite,Nombre_Lin,Ite_Si,Ite_No,Lin_Si,Lin_No){ ;ayuda a Gui_Hotkeys_Lin
		global
		;MsgBox, % Nombre_Ite " " c_it_4 " " c_lin_1
		guicontrol,gui_%Nombre_Ite%:show,% Nombre_Ite "_" Ite_Si
		guicontrol,gui_%Nombre_Ite%:Hide,% Nombre_Ite "_" Ite_No
		guicontrol,gui_%Nombre_Lin%:show,% Nombre_Lin "_" Lin_Si
		guicontrol,gui_%Nombre_Lin%:Hide,% Nombre_Lin "_" Lin_No
		IniWrite,%Ite_Si%,cfg\configuracion.ini, combo,% "c_" Nombre_Ite
		IniWrite,%Lin_Si%,cfg\configuracion.ini, combo,% "c_" Nombre_Lin
		c_%Nombre_Ite% := Ite_Si
		c_%Nombre_Lin% := Lin_Si
		;MsgBox, % Nombre_Ite " " c_it_4 " " c_lin_1
		Return
		}
	Gui_Hotkeys_Lin(PNombre_Ite,PNombre_Lin){ ;Activa o desactiva ite_4-lin1,ite_5-lin2
		global
		;MsgBox,% PNombre_Ite
		StringTrimLeft,STL_Nombre_Ite,PNombre_Ite, 2
		StringTrimLeft,STL_Nombre_Lin1,PNombre_Lin, 2
		IniRead, IR_it4 	, cfg\configuracion.ini, combo,% PNombre_Ite
		IniRead, IR_lin1 	, cfg\configuracion.ini, combo,% PNombre_Lin
		
		if (IR_it4){
			if (IR_lin1){
				Accion := False
				Modulo_Lin_General(STL_Nombre_Ite,STL_Nombre_Lin1,1,0,0,1) 	; 2) usara item
				SoundPlay, Audio\gui_alt.wav
				;Sleep, 300
				;SoundPlay, Audio\gui_off.wav
			}Else if not (Accion){
				Modulo_Lin_General(STL_Nombre_Ite,STL_Nombre_Lin1,0,1,0,1)	; 1) no usara nada
				SoundPlay, Audio\gui_off_all.wav
			}Else{
				Modulo_Lin_General(STL_Nombre_Ite,STL_Nombre_Lin1,1,0,1,0) 	; 3) usara link 1 o 2
				SoundPlay, Audio\gui_link.wav
			}
		}Else if not (IR_lin1){
			Accion := true
			Modulo_Lin_General(STL_Nombre_Ite,STL_Nombre_Lin1,1,0,0,1)		; 2) usara item 4 o 5
			SoundPlay, Audio\gui_alt.wav
			;Sleep, 300
			;SoundPlay, Audio\gui_off.wav
		}
		Return
		}
;Modulos Con Inportante Dependencia
	Activar_links(clave){
		SoundPlay, Audio\gui_on.wav
		GuiControl, show , % clave "_1" ;ocultando la imagen activada
		GuiControl, Hide , % clave "_0" ;mostrando la imagen desactivada
		IniWrite, 1, cfg\configuracion.ini, combo, % "c_" clave ; Escribe 0 el archibo ini segun donde haya hecho clic
		c_%clave% := 1 ;guarda en memoria el nuevo valorvalor
		Return
		}
	Desactivar_links(clave){
		SoundPlay, Audio\gui_off.wav
		GuiControl, hide , % clave "_1" ;ocultando la imagen activada
		GuiControl, show , % clave "_0" ;mostrando la imagen desactivada
		IniWrite, 0, cfg\configuracion.ini, combo, % "c_" clave ; Escribe 0 el archibo ini segun donde haya hecho clic
		c_%clave% := 0
		Return
		}
	Funcion_de_la_tecla(tecla,Estado_hotkey){
		;if(Estado_hotkey != "on"){
		;	hotkey,%tecla%,On
		;	hotkey,%tecla%,Off
		;}Else{
		;	hotkey,%tecla%,On
		;}
		;Return
	}	
	Agregar_Ventanas_Grupo(){
		GroupAdd , ventanitas , gui_ab_1
		GroupAdd , ventanitas , gui_ab_5
		GroupAdd , ventanitas , gui_it_0
		GroupAdd , ventanitas , gui_it_1
		GroupAdd , ventanitas , gui_it_3
		GroupAdd , ventanitas , gui_it_2
		GroupAdd , ventanitas , gui_it_4
		GroupAdd , ventanitas , gui_it_5
		GroupAdd , ventanitas , gui_lin_1
		GroupAdd , ventanitas , gui_lin_2
		GroupAdd , ventanitas , gui_rin_0
		Return
		}
	Capturar_Vida(){
		global
		;MsgBox, %CselectHeroX% %CselectHeroY%
		PixelGetColor, estado_vida, %CestadoVidaX%,%CestadoVidaY% ,RGB
		PixelGetColor, selct_hero, %CselectHeroX%,%CselectHeroY% ,RGB	
		PgcVida :=  estado_vida
		PgcHero := selct_hero
		Return
		}
	Elegir_Tecla_Combo(){ ;que hace?
		global 									;primero se ejecuta al presionar guardar
		if (t_chk){ 							;verifica si es 1 o 0 de acuerdo al .ini
			HotKey, %combo%, Off, UseErrorLevel ;1 desactiva la tecla
		}Else{
			HotKey, %combo%, On, UseErrorLevel  ;0 activa la tecla
		}
		Return 									;si sale 0 = ejecutara y 1 = no ejecutara  
		}
	guardar_letras(){
		global
		i = 0
		while (i < 6){ ; guardar letras de items
			tecla_it := GetKeyName(it%i%) ; recuperar letra de item en un indice especifico
			tecla_ab := GetKeyName(ab%i%) ; recuperar letra de abilidad en un indice especifico
			;despues recuperaremos en una variable la letra en ese mismo indice
			IniRead, lector_it, cfg\teclas_de_Items.ini, Teclas_Acceso_it, % "it_" i
			IniRead, lector_ab, cfg\teclas_de_habilidades.ini, Teclas_Acceso_ab, % "ab_" i
			;despues compararemos si es diferente el indice
			if (lector_it != tecla_it){ ;la letra  es diferente a la tecla obtenida ?
					IniWrite, %tecla_it%, cfg\teclas_de_Items.ini, Teclas_Acceso_it, % "it_" i ; sobre escribimos ltra
			}
			;MsgBox, % lector_ab "!=" tecla_ab
			if (lector_ab != tecla_ab){ ;la letra  es diferente a la tecla obtenida ?
					;MsgBox, % "Si " lector_ab "!=" tecla_ab
					IniWrite, %tecla_ab%, cfg\teclas_de_habilidades.ini, Teclas_Acceso_ab, % "ab_" i ; sobre escribimos ltra
			} ;Else{
				;MsgBox, % "no " lector_ab "!=" tecla_ab
			;}
			i++
		}
			tecla_aux := GetKeyName(it4)
			IniRead, lector_aux, cfg\teclas_de_Items.ini, Teclas_aux_item, % "lin_" 1
			if (tecla_aux != lector_aux){
				IniWrite, %tecla_aux%, cfg\teclas_de_Items.ini, Teclas_aux_item, % "lin_" 1
			}
			tecla_aux2 := GetKeyName(it5)
			IniRead, lector_aux2, cfg\teclas_de_Items.ini, Teclas_aux_item, % "lin_" 2
			if (tecla_aux2 != lector_aux2){
				IniWrite, %tecla_aux2%, cfg\teclas_de_Items.ini, Teclas_aux_item, % "lin_" 2
			}
			tecla_aux3 := GetKeyName(it1)
			IniRead, lector_aux3, cfg\teclas_de_Items.ini, Teclas_aux_item, % "rin_" 0
			if (tecla_aux3 != lector_aux3){
				IniWrite, %tecla_aux3%, cfg\teclas_de_Items.ini, Teclas_aux_item, % "lin_" 0
			}
			tecla_com := GetKeyName(combo)
			if !(tecla_com = ""){
				IniRead, lector_com, cfg\teclas_de_Items.ini, Teclas_combo, t_combo
				if (tecla_com != lector_com){
					IniWrite, %tecla_com%, cfg\teclas_de_Items.ini, Teclas_combo, t_combo
				}
			}Else{
				IniWrite,VKA2VK1, cfg\teclas_de_Items.ini, Teclas_combo, t_combo
			}
			;t_pausastr := Format("VK{:x}", GetKeyVK(pausa))
			;MsgBox, %t_pausastr%
			tecla_pausa := GetKeyName(pausa)
			if !(tecla_pausa = ""){
				IniRead, lector_pausa, cfg\teclas_de_Items.ini, Tecla_pausa, t_pausa
				if (tecla_pausa != lector_pausa){
					IniWrite, %tecla_pausa%, cfg\teclas_de_Items.ini, Tecla_pausa, t_pausa
				}
			}Else{
				IniWrite,Enter, cfg\teclas_de_Items.ini, Tecla_pausa, t_pausa
			}
			Return
		}
;Modulos con variables especificas
	variables_globales_MyPc(){
		global Color_lc 	:= 0x555857 ;Color de letra "q que solo aparece en LC"
		;global negro 		:= 0x1E2911 ; Color de barra d vida cuando esta bajo
		global verde		:= 0x4E9130 ;color vida 
		global Lin1_Activo  := 0x969696
		global desactivo 	:= 0x0C0D0E ;lin 854, 705
		global desactivo2 	:= 0x949494 ;lin2 902, 705
		global desactivo3 	:= 0x0D0E0F  ;lin2 902, 705
		Return
		}	
;Modulos de Herraminetas de Interfas 
	Guardar_Cambios:
		HotKey, %combo%, 		Off, UseErrorLevel
		HotKey, %pausa%,  		Off, UseErrorLevel
		;HotKey, %lin1%, 		Off, UseErrorLevel
		HotKey, %ab0%, 		Off, UseErrorLevel
		HotKey, %ab1%, 		Off, UseErrorLevel
		HotKey, %ab2%, 		Off, UseErrorLevel
		HotKey, %ab3%, 		Off, UseErrorLevel
		HotKey, %ab4%, 		Off, UseErrorLevel
		HotKey, %ab5%, 		Off, UseErrorLevel
		HotKey, %it0%, 		Off, UseErrorLevel
		HotKey, %it1%, 		Off, UseErrorLevel
		HotKey, %it2%, 		Off, UseErrorLevel
		HotKey, %it3%, 		Off, UseErrorLevel
		HotKey, %it4%, 		Off, UseErrorLevel
		HotKey, %it5%, 		Off, UseErrorLevel
		Gui, Submit, NoHide
		HotKey, $%combo%, combo, 	On, UseErrorLevel
		HotKey, $%pausa%, pausa, 	ON, UseErrorLevel
		;HotKey, %lin1%, 			On, UseErrorLevel
		HotKey, %ab0%,		On, UseErrorLevel
		HotKey, %ab1%, 		On, UseErrorLevel
		HotKey, %ab2%, 		On, UseErrorLevel
		HotKey, %ab3%, 		On, UseErrorLevel
		HotKey, %ab4%, 		On, UseErrorLevel
		HotKey, %ab5%, 		On, UseErrorLevel
		HotKey, %it0%, 		On, UseErrorLevel
		HotKey, %it1%, 		On, UseErrorLevel
		HotKey, %it2%, 		On, UseErrorLevel
		HotKey, %it3%, 		On, UseErrorLevel
		HotKey, %it4%, 		On, UseErrorLevel
		HotKey, %it5%, 		On, UseErrorLevel
		SoundPlay, Audio\Guardar.wav
		;msgbox, se guardo %ab0% %ab1% %it0% %it1% %it3% %it4% %it2% %ab5% %lin1% %pausa%   %combo%
		guardar_letras()
		Elegir_Tecla_Combo() ;Para elegir tecla combo
		if(c_rin_0){
			Funcion_de_la_tecla("w","on")
			Funcion_de_la_tecla("q","on")
		}Else{
			Funcion_de_la_tecla("w","off")
			Funcion_de_la_tecla("q","off")
		}
		;Run,Tecnologia_OCR\Area_OCR\O_C_R.exe
		Return
	pausa:
		Suspend
		if A_IsSuspended {
			SoundPlay, Audio\Desactivar.wav
			guicontrol	, text, suspend_,0
			Normal := [0	,"0x171719"		,		,"0xE9E9E9"		,"H"		,		,"0xF70010", 3]
		}else {
			SoundPlay, Audio\Activar.wav
			guicontrol ,Text , suspend_,1
			Normal := [0	,0x171719	,		,"0xFCAF14"		,"H"		,		,"0x393E3F", 3] 
		}
		ImageButton.Create(BTN2, Normal)	
		Return
	desabilitar:
		Suspend
		if A_IsSuspended {		
			SoundPlay, Audio\Desactivar.wav
			guicontrol	, text, suspend_,0
			Normal := [0	,"0x171719"		,		,"0xE9E9E9"		,"H"		,		,"0xF70010", 3]
		}else {
			SoundPlay, Audio\Activar.wav
			guicontrol ,Text , suspend_,1
			Normal := [0	,0x171719	,		,"0xFCAF14"		,"H"		,		,"0x393E3F", 3] 	 
		}
		ImageButton.Create(BTN2, Normal)
		Return	
	Test(){
		global
		PixelGetColor, test_estado_vida,	CestadoVidaX,	CestadoVidaY ,RGB
		PixelGetColor, test_selct_hero, 	CselectHeroX,	CselectHeroY ,RGB
		PixelGetColor, test_pix_color, 		CpixColorX, 	CpixColorY,RGB
		PixelGetColor, test_pix_color2, 	CpixColor2X, 	CpixColor2Y,RGB
	
		if (test_estado_vida = 0x4E9130 || test_estado_vida = 0x4D902F  ){
			1_msm := "si"
		}Else{
			1_msm := "no"
		}
		if (test_selct_hero = 0x555857 || test_selct_hero = 0x656767 ){
			2_msm := "si"
		}Else{
			2_msm := "no"
		}
		if (test_pix_color = 0x969696 || test_pix_color = 0x7B7C7D ){
			3_msm := "si"
		}Else{
			3_msm := "no"
		}
		if (test_pix_color2 = 0x969696 || test_pix_color2 = 0x7E7E7E ){
			4_msm := "si"
		}Else{
			4_msm := "no"
		}
		Return
		}
	Reintentar(){
		global
		contador := 1
		mensage := %contador%_msm
		arreglo :=[]
		Error := 0
		NoError := 0
		While (contador <= 4){
			StringUpper, mensage, mensage	
			arreglo[contador] := mensage
			if (arreglo[contador] = "NO"){
				Error++
			}Else{
				NoError++
			}
			contador++
			mensage := %contador%_msm
		}
		if (Error){
			MsgBox,4114,Un color o varios no es correcto,% "1) Life`t " arreglo.1 "`t"test_estado_vida "`t RGB`n2) SHero`t " arreglo.2 "`t"test_selct_hero "`t RGB`n3) Ite_4`t " arreglo.3 "`t"test_pix_color "`n4) Ite_5`t " arreglo.4 "`t"test_pix_color2
		}else if (NoError = 4) {
			MsgBox,4160,Todos Coinciden :),% "1) Life`t " arreglo.1 "`t"test_estado_vida "`t RGB`n2) SHero`t " arreglo.2 "`t"test_selct_hero "`t RGB`n3) Ite_4`t " arreglo.3 "`t"test_pix_color "`n4) Ite_5`t " arreglo.4 "`t"test_pix_color2
		}
		IfMsgBox, Retry
		if ErrorLevel
			Return
		Else{
			test()
			reintentar()
		}
		}
	Check_Box(){ ;que hace?
		global 							;Son las acciones de la etiqueta "G" de un Checkbox
		GuiControlGet, t_chk 			;Analiza el estado actual de el Checkbox
		if (t_chk){ 					;Siempre llegara 1 si se esta ACTIVANDO
			GuiControl, disable, combo 	;Bloquea el campo Especificado
			IniWrite, 1, cfg\teclas_de_Items.ini, Teclas_combo, t_chk ;Guarda valor 1 en el archibo.ini
			t_chk:= 1 					;Escribe en "t_chk" el valor de 1
		}Else{ 							;Siempre llegara 0 si se esta DESACTIVANDO
			GuiControl, enable, combo 	;Desbloquea el campo Especificado
			IniWrite, 0, cfg\teclas_de_Items.ini, Teclas_combo, t_chk ;Guarda valor 0 en el archibo.ini
			t_chk:= 0 					;Escribe en "t_chk" el valor de 0
		}
		Elegir_Tecla_Combo() 	;Al finalizar Ejecutara este Modulo ¿para que?
		Return 					;Por que al presionar "guardar" todos los comandos se apagaran y encenderan
								;pero queremos que la tecla "combo" permanezca PRENDIDA y/o APAGADA 
		
		}

;Modulo Combo Y Hotkeys Relacionados
	combo:
		;MsgBox, Entrada,daga es %c_it_2% `n it4 es %c_it_4% `n it5 es %c_it_5% `n lin1 es %c_lin_1% `n lin2 es %c_lin_2% `n duelo es %c_ab_5%
		;Sleep, 500   
		PixelGetColor, pix_color, CpixColorX, CpixColorY,RGB
		PixelGetColor, pix_color2, CpixColor2X, CpixColor2Y,RGB
		;codigo un solotoque sin bkb 2 toques con bkb
		iniread, vc_it_3  , cfg\configuracion.ini, combo, c_it_3 ;verificamos si en archibo esta 1 o 0
		if (vc_it_3){
			KeyWait,LButton
			KeyWait,LButton,D T0.2
				If ErrorLevel
					c_it_3 = 0
				else	
					c_it_3 = 1
		}Else{
			c_it_3 = 0
		}	
		if (c_rin_0){
			SendInput, {%it1%}
			Sleep, 50
		}
		if (c_ab_1){
			SendInput, !{%ab1%}
			Sleep, 350
		}
		if (c_it_0){
			SendInput, {%it0%}
			Sleep, 50
		}	
		if (c_it_1){
			SendInput, {%it1%}
			Sleep, 50
		}
		if (c_it_3){
			SendInput, {%it3%}
			Sleep, 50
		}
		if (c_it_4){ 
			if (!c_lin_1){ ;esta desactivado link?
				SendInput, !{%it4%} ;enviamos mionir
				Sleep, 50
				;SI(MIO) & NO(LINK)= SI(MIO) no(link)
			}
				;SI(MIO) & SI(LINK)= no(mio) SI(LINK)-----------↓
				;NO(MIO) & NO(LINK)= no(mio) no(link)
		}
				;NO(MIO) & SI(LINK)= no(mio) no(link)
		IF (c_it_5){
			if (!c_lin_2){
				SendInput, !{%it5%}
				Sleep, 50
			}
		}
		if (c_it_2){
			if (c_lin_1){ ;it4
				if (c_lin_2){ ;it5
					if (c_ab_5){
						SendInput, {%it2%}
						While (pix_color != desactivo){
							 SendInput, {%it4%}
							 Sleep, 25
							 PixelGetColor, pix_color, CpixColorX, CpixColorY,RGB
							 Sleep, 25
							 ;ToolTip, % "_____________"pix_color "=" desactivo
							if (pix_color = desactivo){
								While (pix_color2 != desactivo3 ){
									SendInput, {%it5%}
									PixelGetColor, pix_color2, CpixColor2X, CpixColor2Y,RGB
									Sleep, 25
									if (pix_color2 = desactivo3){
										SendInput, {%ab5%}
										Break
										Return ;1) SI(DAG) & SI(LINK) & SI(LINK2) SI(DUEL) = SI(DAG) SI(LINK) SI(LINK2) SI(DUEL)

									}
								}		
							}
						}	
				 	}Else{
				 		SendInput, {%it2%}
				 		Sleep, 70 
				 		SendInput, {%it4%}
				 		Sleep, 70 
				 		SendInput, {%it5%}
				 		;2) SI(DAG) & SI(LINK) & SI(LINK2) NO(DUEL) = SI(DAG) SI(LINK) SI(LINK2) no(duel)
				 	}
				}Else if(c_ab_5){
					SendInput, {%it2%}
						While (pix_color != desactivo){
							 SendInput, {%it4%}
							 Sleep, 2
							 PixelGetColor, pix_color, CpixColorX, CpixColorY,RGB
							 Sleep, 2
							if (pix_color = desactivo){
								SendInput, {%ab5%}
								;MsgBox, salida
								Break
								Return ;3) SI(DAG) & SI(LINK) & NO(LINK2) SI(DUEL) = SI(DAG) SI(LINK) no(link2) SI(DUEL)
							}
						}	
				}Else{
					SendInput, {%it2%}
					Sleep, 50
					SendInput, {%it4%}
					;4) SI(DAG) & SI(LINK) & NO(LINK2) NO(DUEL) = SI(DAG) SI(LINK) no(link2) no(duel)
				}		
			}Else if(c_lin_2){
				if (c_ab_5){
					Sleep, 95
					SendInput, {%it2%}
					Sleep, 95
					SendInput, {%it5%}
					Sleep, 85
					SendInput, {%ab5%}
					;5) SI(DAG) & NO(LINK) & SI(LINK2) SI(DUEL) = SI(DAG) no(link2) SI(LINK2) SI(DUEL)
				}Else{
					SendInput, {%it2%}
					Sleep, 50
					SendInput, {%it5%}
					;6) SI(DAG) & NO(LINK) & SI(LINK2) NO(DUEL) = SI(DAG) no(link2) SI(LINK2) no(duel)		
				}
			}Else if(c_ab_5){
				SendInput, {%it2%}
				Sleep, 50
				SendInput, {%ab5%}
				;7) SI(DAG) & NO(LINK) & NO(LINK2) SI(DUEL) = SI(DAG) no(link2) no(link2) SI(DUEL)
			}Else{
				SendInput, {%it2%}
				Sleep, 50
				;8) SI(DAG) & NO(LINK) & NO(LINK2) NO(DUEL) = SI(DAG) no(link2) no(link2) no(duel)	
			}	
		}Else if(c_lin_1){
			if (c_lin_2){
				if (c_ab_5){
					While (pix_color != desactivo){
						SendInput, {%it4%}
						Sleep, 55
						PixelGetColor, pix_color, CpixColorX, CpixColorY,RGB
						;MsgBox, if %pix_color% = %desactivo2% || %pix_color% = %desactivo%
						if (pix_color = desactivo2 || pix_color = desactivo){
							;MsgBox, si
							;MsgBox, wuile %pix_color2% != %desactivo2% || %pix_color2% != %desactivo3%
							While (pix_color2 != desactivo2 || pix_color2 != desactivo3 ){
								;ToolTip, si while
								SendInput, {%it5%}
								Sleep, 50
								PixelGetColor, pix_color2, CpixColor2X, CpixColor2Y,RGB
								Sleep, 50
								;MsgBox, if2 %pix_color2% = %desactivo2% || %pix_color2% = %desactivo3%
								if (pix_color2 = desactivo2 || pix_color2 = desactivo3){
									;MsgBox, si
									SendInput, {%ab5%}
									Sleep, 50
									;ToolTip, rompee
									Break
									Return ;9) NO(DAG) & SI(LINK) & SI(LINK2) SI(DUEL) = no(dag) SI(LINK) SI(LINK2) SI(DUEL)
								}
							}		
						}																				
					}
				}Else{
					While (pix_color != desactivo2){
						SendInput, {%it4%}
						Sleep, 55 
						PixelGetColor, pix_color, CpixColorX, CpixColorY,RGB
						;ToolTip, hahaha
						if (pix_color = desactivo2 || pix_color = desactivo){
							SendInput, {%it5%}
							Sleep, 50
							;ToolTip, hahaha
							Break ;10) NO(DAG) & SI(LINK) & SI(LINK2) NO(DUEL) = no(dag) SI(LINK) SI(LINK2) no(duel)
							Return
						}																				
					}		
				}
			}else if(c_ab_5){
				While (pix_color != desactivo2){
					SendInput, {%it4%}
					Sleep, 50
					PixelGetColor, pix_color, CpixColorX, CpixColorY,RGB
					Sleep, 50
					if (pix_color = desactivo2 || pix_color = desactivo){
						SendInput, {%ab5%}
						Sleep, 50
						Break ;11) NO(DAG) & SI(LINK) & NO(LINK2) SI(DUEL) = no(dag) SI(LINK) no(link2) SI(DUEL)
					}																				
				}
			}Else{
				SendInput, {%it4%}
				Sleep, 50 		;12) NO(DAG) & SI(LINK) & NO(LINK2) NO(DUEL) = no(dag) SI(LINK) no(link2) no(duel)																			
			}
		}Else if(c_lin_2){
			if (c_ab_5){
				While (pix_color2 != desactivo2 || pix_color2 != desactivo3 ){
					SendInput, {%it5%}
					Sleep, 50
					PixelGetColor, pix_color2, CpixColor2X, CpixColor2Y,RGB
					Sleep, 50
					if (pix_color2 = desactivo2 || pix_color2 = desactivo3){
						SendInput, {%ab5%}
						Sleep, 50
						Break ;13) NO(DAG) & NO(LINK) & SI(LINK2) SI(DUEL) = no(dag) no(link) SI(LINK2) SI(DUEL)				
					}
				}
			}else{
				SendInput, {%it5%}
				Sleep, 50		
				;14) NO(DAG) & NO(LINK) & SI(LINK2) NO(DUEL) = no(dag) no(link) SI(LINK2) SI(DUEL)
			}
		}Else if(c_ab_5){
			SendInput, {%ab5%}
			Sleep, 50
			;15) NO(DAG) & NO(LINK) & NO(LINK2) SI(DUEL) = no(dag) no(link) no(link2) SI(DUEL)
		}
		;16) NO(DAG) & NO(LINK) & NO(LINK2) NO(DUEL) = no(dag) no(link) no(link2) no(duel)
		Return
	~w::
  if (A_PriorHotkey <> "~w" or A_TimeSincePriorHotkey > 200){
    ; Too much time between presses, so this isn't a double-press.
    KeyWait, w
    return
  }
	;w::
	;	;solo funciona si esta acticvada la funcion ( lanzamiento rapido al mantener tecla )
	;	Capturar_Vida() ;detecta la vida de lc si esta bajo y SI esta luchando co baja  vida
	;	;no activa ring
	;	KeyWait,w
	;	KeyWait,w,D T0.25 
	;	If not ErrorLevel{
	;		;MsgBox, % "verde = " verde " PgcVida = " PgcVida
	;		if (PgcHero = Color_lc){ ;esta seleccionado?
	;			if (c_rin_0){ ;tienes el item? 1 si 0 no
	;				if (PgcVida = verde){ ;tienes buena vida? 1 si 0 no
	;					SendInput, {%it1%}!{%ab1%}
	;				}Else{
	;					SendInput, !{%ab1%}
	;				}						
	;			}Else if(PgcVida = verde){ 
	;				SendInput, !{%ab1%}
	;			}else{
	;				SendInput, !{%ab1%}
	;			}
	;		}else{
	;			;ToolTip, %PgcHero% != %Color_lc%
	;			SendInput, !{%ab1%}
	;		}
	;	}Else{
	;		;SendInput, {%ab1% Down}
	;		SendInput, {LShift Down}{w Down}{w up}{LShift Up}
	;		Loop {
	;			KeyWait, LButton, D T0.2
	;			;ToolTip, el el loop
	;			If not ErrorLevel{
	;				 SendInput,{%ab1%}	    		
	;				  Break
	;				    return
	;			} 
	;			KeyWait, RButton, D T0.1
	;			If not ErrorLevel{
	;				; ToolTip, cancelado
	;				SendInput,{RButton}
	;				Sleep, 1
	;					Break
	;					return
	;			}
	;		}
	;	}
	;Return	

	;q:: ;Sirbe para Ahorrar mana al ejecutar skills
	;	Capturar_Vida()
	;	KeyWait,LButton,D T0.1 
	;	If not ErrorLevel{
	;		;ToolTip,  no tardo
	;		if (PgcHero = Color_lc ){
	;			if (c_rin_0){
	;				if (PgcVida = verde){
	;					;KeyWait,LButton,D T0.1 ; esperar boton mouse izquierdo durante 100ms
	;					;If not ErrorLevel ; si no hay errores 
	;					SendInput, {%it1%}{%ab0%}
	;				}Else{
	;					SendInput, {%ab0%}
	;				}
	;			}else if(PgcVida = verde){
	;				SendInput, {%ab0%}
	;			}Else{
	;				SendInput, {%ab0%}
	;			}
	;		}Else{
	;			SendInput, {%ab0%}
	;		}
	;	}Else{	
	;		;ToolTip, tardoooo
	;		SendInput, {LShift Down}{q Down}{q up}{LShift Up}
	;		if (PgcHero = Color_lc ){
	;			if (c_rin_0){
	;				if (PgcVida = verde){
	;					Loop {
	;						KeyWait, LButton, D T0.2
	;						;ToolTip, el el loop
	;				    	If not ErrorLevel{
	;				    		SendInput,{%it1%}	    		
	;				    		Break
	;				    		return
	;				    	} 
	;					    KeyWait, RButton, D T0
	;					    If not ErrorLevel{
	;					   ; ToolTip, cancelado
	;					    	Break
	;					    	return
	;					    }
	;					}
	;				}
	;			}
	;		}
	;	}
	;	Return
;Modulo de Acciones en el Juego
	;s:: ;selecciona burro 1-s y 2-s lo envia a ala tienda central
	;	KeyWait, s
	;	KeyWait, s,D,T0.2
	;	if not ErrorLevel{
	;		KeyWait, s
	;		KeyWait, s,D,T0.3
	;		if Not ErrorLevel{
	;				SendInput, {NumpadAdd}
	;				SendInput, {NumpadMult}
	;				SendInput, {f1}
	;		}Else{
	;				SendInput, {NumpadAdd}
	;				SendInput, {NumpadDiv}
	;				SendInput, {f1}
	;		}
	;	}Else{
	;		SendInput, {NumpadAdd}
	;	}
	;	Return
	
	;c up:: ;compra item y da al currier
	;	SendInput, {NumpadEnter} ;compra
	;	Sleep, 50
	;	SendInput, {NumpadAdd} ;selecciona currier
	;	SendInput, {NumpadSub} ;currier recoje de reserva
	;	SendInput, {F1} ;selecionar hero
	;	Return
	
	;^XButton2:: ; sirbe para preparar compra al inicio o despues 
	;	SendInput, {Ctrl Down}
	;	SendInput, {Shift Down}
	;	Sleep, 50
	;	SendInput, {LButton}
	;	Sleep, 50
	;	SendInput, {Ctrl up}
	;	SendInput, {Shift up}
	;Return

;bind f8 "dota_shop_force_hotkeys 1;toggleshoppanel;shop_nav_to_tab 3;shop_select_itemrow 15;toggleshoppanel;dota_shop_force_hotkeys 0"
	;^w::
	;	if(!c_ab_1){
	;		SendInput, {y}
	;		Sleep, 50
	;		SendInput, {w}
	;		Sleep, 50
	;		SendInput, {y}
	;		Gui_Hotkeys("c_ab_1")
	;	}Else{
	;		SendInput, {y}
	;		Sleep, 50
	;		SendInput, {w}
	;		Sleep, 50
	;		SendInput, {y}
	;	}
	;	Return
;
	;^r::
	;	if(!c_ab_5){
	;		SendInput, {y}
	;		Sleep, 50
	;		SendInput, {r}
	;		Sleep, 50
	;		SendInput, {y}
	;		Gui_Hotkeys("c_ab_5")
	;	}Else{
	;		SendInput, {y}
	;		Sleep, 50
	;		SendInput, {r}
	;		Sleep, 50
	;		SendInput, {y}
	;	}
	;Return

	^F5:: ;Reinicia skills y guis a 0
		Reinicio_de_Skills()
		Return
	;^Home:: ;Abre un Testeador para verificar Colores
	;	Test()
	;	Reintentar()
	;	Return
	<^LButton:: ;Una de las los accesos rapidos al Combo
		if (t_chk){ 		;verifica los cambios hechos por "Modificador_T_combo()"
			Gosub, combo 	;1 ejecutara el combo con esta combinacion de teclas
			Return
		}else{
			Return ;0 NO ejecutara el combo
		}
		SendInput, {LControl}					
			Return
	<^WheelDown:: ;Mostrar y Ocultar Gui-spell
		;IfWinActive, Dota 2
	 	if (!Bandera){
	 		SoundPlay,Audio\Ocultar.wav
	 		WinHide ahk_group ventanitas
	 		Bandera := True
	 	}else if (Bandera){
	 		SoundPlay,Audio\Mostrar.wav
	 		WinShow ahk_group ventanitas
	 		Bandera := False
	 	}
		Return
;teclas que no se utiliza pero esta al alcanze
	capslock::
	    SendInput, {h}
	Return
	LShift::
		SendInput, {b}
	Return

	lWin::
		SendInput, {NumpadDot}
	Return
;Funciones de Gui´s para activar y desactivar skills  
;Teclas Rapidas de Gui´s para activar y desactivar skills 
	F5::
		Gui_Hotkeys("c_ab_1")
	Return
	7::
		Gui_Hotkeys("c_ab_5")
	Return
	F6::
		Gui_Hotkeys("c_it_0")
	Return
	F7::
		Gui_Hotkeys_Rin("c_it_1")
	Return
	F8::
		Gui_Hotkeys("c_it_2")
		hotkey,f8,off
		SendInput,{f8} ;ejecuta la configuracion de consola 
		hotkey,f8,on
	Return
	8::
		Gui_Hotkeys("c_it_3")
	Return
	9::
		Gui_Hotkeys_Lin("c_it_4","c_lin_1")
	Return
	0::
		Gui_Hotkeys_Lin("c_it_5","c_lin_2")
	Return
GuiClose:
ExitApp ;843
Escape:: 
ExitApp