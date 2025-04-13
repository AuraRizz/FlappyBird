extends Area2D



func _on_body_entered(body: Node2D) -> void:
	body.acabat()
	


func _on_mur_dalt_body_entered(body: Node2D) -> void:
	body.acabat()
