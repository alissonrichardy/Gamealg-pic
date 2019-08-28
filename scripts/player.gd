extends Area2D

onready var tempo = $tempo # controla a animacao de passos
onready var tempo_final_game = $tempo_final # tempo que é acionado no final do jogo
onready var label = $"../".get_node("la_ganhou")
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

const tempo_wait = 1 # tempo definido para que o player se movimente
var indice = 0 #indice das instruções que serao seguidas
var procedimentos= [Vector2(0,0)] # Variavel que guarda a fila de instruções --Valores do X e Y
var tentativas = 4 # Variavel que determina a quantidade de tentativas maximas permitidas
var ativo = true
var botao_play = false
var passos = 0 # conta quantos passos foi feito até o momento
var pre_posicao = Vector2() # utilizado para calcular a proxima posicao e assim fazer as condições
var chamar_pop_up = false


""" ####coisas que tenho que fazer erros/bugs###

    arrumar botao play; ele está dando play mas nao está fazendo a interacao correta no vetorr posicao


"""

func _process(delta):
	#if tentativas_atual != 0 && !botao_play:
	if !botao_play:
		controles()
	else:
		set_process(false)
		rodar_instrucoes()
	pass
	
func rodar_instrucoes(): # Função responsavel para dar start no timer
	if ativo:
		tempo.start()
	else:
		pass
	pass

func controle_instrucoes(valor:int): # Função responsavel por realizar o movimento do player
	move(procedimentos[valor])
	pass

func controles(): # Função que controla os Controles e atribuições de valores do player
	if !botao_play:
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
		botao_play = true

func move(posicao:Vector2): # Função que move o player
	position += posicao
	pass

func _on_tempo_timeout(): # Função de timer_walt que tem responsabilidade de chamar o conntrole de instruções e 
                          # faz interacao no indice das instruções
	if ativo:
		print(indice)
		controle_instrucoes(indice)
		indice += 1
		tempo.wait_time = tempo_wait
	if indice > passos || ativo == false:
		tempo_final_game.start()
		ativo = false
 


func _on_player_area_entered(area):
	if area.is_in_group("objetivo"):
		print("Você conseguiu, parabens")
		label.show()
		ativo = false

func _on_tempo_final_timeout():
	#chama a tela de menu, criar uma chamada simples para o menu
	print("aparecer popup para repetir ou voltar ao menu")
	chamar_pop_up = true

func _ready():
	pre_posicao = position
	add_to_group("player")
 

