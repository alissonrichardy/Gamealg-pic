extends Area2D

#Controle do game
var is_jogando = true
#Controle do game
# Valores que controlam o movimento do player
const esquerda = Vector2(-36, 0)
const direita  = Vector2(36, 0)
const subir    = Vector2(0, -38)
const descer   = Vector2(0, 38)
# Valores que controlam o movimento do player
# Limites da tela usados para não serem ultrapassados
const limite_esquerda = 0
const limite_direita  = 180
const limite_superior = 0
const limite_inferior = 190
# Limites da tela usados para não serem ultrapassados

var pre_posicao = Vector2() # utilizado para calcular a proxima posicao e assim fazer as condições
var procedimentos= [Vector2(0,0)] # Variavel que guarda a fila de instruções --Valores do X e Y
var passos = 0
var indice = 0 #indice das instruções que serao seguidas
var chamar_menu = false
var is_objetivo = false

var agora = 0
const tempo = 1

func _process(delta):
	if is_jogando:
		controle()
	elif indice <= passos:
		animacao(delta)
	else:
		chamar_menu = true
		pass
	
	pass

func animacao(delta):
	
	#meu timer
	if agora > 0: 
		agora -= delta
	else: # toca a animacao do player
		agora = tempo
		#print("animacao")
		move(procedimentos[indice])
		indice += 1
	pass


func move(posicao:Vector2): # Função que move o player
	position += posicao
	pass

func is_objetivo(expressao):
	self.is_objetivo = expressao

func controle():
	if is_jogando:
		if Input.is_action_just_pressed("ui_right") && (pre_posicao.x +36 < limite_direita):
			#move(direita)
			procedimentos.append(direita)
			pre_posicao += direita
			passos += 1
		if Input.is_action_just_pressed("ui_left")  && (pre_posicao.x -36 > limite_esquerda):
			#move(esquerda)
			procedimentos.append(esquerda)
			pre_posicao += esquerda
			passos += 1
		if Input.is_action_just_pressed("ui_up")    && (pre_posicao.y- 38 > limite_superior):
			#move(subir)
			procedimentos.append(subir)
			pre_posicao += subir
			passos += 1
		if Input.is_action_just_pressed("ui_down")  && (pre_posicao.y+ 38 < limite_inferior):
			#move(descer)
			procedimentos.append(descer)
			pre_posicao += descer
			passos += 1
	if Input.is_action_just_pressed("ui_play"):
		is_jogando = false

func _ready():
	add_to_group(script_principal.GRUPO_PLAYER)
