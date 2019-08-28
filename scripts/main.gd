extends Node

onready var tentativas = $la_tentativas
onready var passos = $la_passos
onready var popup = $pop_menu
onready var player = $PA_GAME/player

var tempo_menu = 2

func _ready():
	
	pass 

func _process(delta):
	tentativas.text = (str ($PA_GAME/player.passos))
	if $PA_GAME/player.indice > 0:
		passos.show()
		
	if player.chamar_menu:
		popup.show()

	passos.text = (str ($PA_GAME/player.indice-1))


