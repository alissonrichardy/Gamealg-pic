extends TouchScreenButton


func _ready():
	pass 
	
	
func pressionar_botao():
	get_tree().reload_current_scene()
	pass



func _on_btn_menu_pressed():
	pressionar_botao()
	pass 
