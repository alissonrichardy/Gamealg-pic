extends Node

onready var tentativas = $la_tentativas
onready var passos = $la_passos
onready var popup = $pop_menu
onready var player = $PA_GAME/player

func _ready():
	
	pass 

func _process(delta):
	tentativas.text = (str ($PA_GAME/player.passos))
	if $PA_GAME/player.indice > 0:
		passos.show()
		
	if player.chamar_pop_up:
		popup.show()

	passos.text = (str ($PA_GAME/player.indice-1))


