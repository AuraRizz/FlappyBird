extends CharacterBody2D

var gravetat := Vector2.DOWN * 988
var SALTS := -400
var velocitat = 0
var punts = 0
@onready var game_over = $"../Game Over"
@onready var animacio_jugador = $AnimatedSprite2D
@onready var puntuacio_final = $"../PuntuacióFinal"


func _ready() -> void:
	game_over.visible = false
	puntuacio_final.visible = false
func _process(delta: float) -> void:
	animacio()
	
	if Input.is_action_just_pressed("SALTAR"):
		velocity.y = SALTS
	velocity += gravetat * delta
	move_and_slide()
	
func animacio():
	if velocity.y < 0:
		animacio_jugador.play("Volar")
	else:
		animacio_jugador.play("default")

func has_passat():
	print("He passat")
	punts += 1
	$"Puntuació".text = "PUNTUACIO:" + str(punts)
	
func acabat():
	SALTS = 454
	var gravetat := Vector2.DOWN * 988
	game_over.visible = true
	puntuacio_final.text = "PUNTUACIO FINAL:" + str(punts)
	puntuacio_final.visible = true
	
	var main = get_parent()
	main.velocitat_scroll = 0
