extends Area2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("hitbox"):
		yield(get_tree().create_timer(0.1), "timeout")
		queue_free()
