extends Area2D
onready var postion = self.get_position()

func _on_Area2D_area_entered(area):
	if area.is_in_group("hitbox"):
		yield(get_tree().create_timer(0.1), "timeout")
		self.position = Vector2(2000, 0)


func _on_MainScene_reset():
	self.position = Vector2(postion)
