extends Area2D




func _on_objetivo_area_entered(area):
	if area.is_in_group(script_principal.GRUPO_PLAYER):
		if area.has_method("is_objetivo"):
			area.is_objetivo(true)
			#print("colidiu com player")
