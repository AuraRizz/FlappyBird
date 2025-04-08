extends Node2D

@onready var flappy = $CharacterBody2D
@onready var nous_murs = $Nous_Murs
@export var escena_mur = preload("res://Escenes/mur.tscn")

var velocitat_scroll = 250
var distancia_entre_murs = 300
var num_murs_inicials = 5

func _ready():
	print("ready")
	var mur = escena_mur.instantiate()
	for i in num_murs_inicials:
		crea_mur()

func _process(delta):
	for mur in nous_murs.get_children():
		mur.position.x -= velocitat_scroll * delta
		if mur.position.x + 600 < flappy.position.x:
			mur.queue_free()
			crea_mur()

func crea_mur():
	var mur_mes_dreta_x = 0
	for mur in nous_murs.get_children():
		if mur.position.x > mur_mes_dreta_x:
			mur_mes_dreta_x = mur.position.x

	var nova_posicio_x = mur_mes_dreta_x + distancia_entre_murs
	var mur = escena_mur.instantiate()
	mur.position = Vector2(nova_posicio_x, randf_range(100, 500))  
	nous_murs.add_child(mur)
	
