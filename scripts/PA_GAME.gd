extends Panel

onready var player = $player
onready var objetivo = $objetivo

const posicoes_objetivo = [
	Vector2(3, 3.2), Vector2(39, 3.2), Vector2(75, 3.2), Vector2(111, 3.2), Vector2(147, 3.2),
	Vector2(3, 41.2), Vector2(39, 41.2), Vector2(75, 41.2), Vector2(111, 41.2), Vector2(147, 41.2),
	Vector2(3, 79.2), Vector2(39, 79.2), Vector2(75, 79.2), Vector2(111, 79.2), Vector2(147, 79.2),
	Vector2(3, 117.2), Vector2(39, 117.2), Vector2(75, 117.2), Vector2(111, 117.2), Vector2(147, 117.2),
	Vector2(3, 155.2), Vector2(39, 155.2), Vector2(75, 155.2), Vector2(111, 155.2), Vector2(147, 155.2)
]

func _ready():
	randomize()
	var rand_pos = (int(rand_range(1, 24)))
	
	objetivo.position = posicoes_objetivo[rand_pos]
	print(rand_pos)
	
