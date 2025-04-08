extends CharacterBody2D

var gravetat := Vector2.DOWN * 988
var SALTS := -500
var velocitat = 0
var punts = 0
@onready var animacio_jugador = $AnimatedSprite2D

func _process(delta: float) -> void:
	velocity.x = velocitat 
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
	$"../Puntuació".text = "PUNTUACIÓ:" + str(punts)
