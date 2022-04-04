extends Area2D

var speed

#func _ready():
	#if Global.player1_flipped == false:
		#speed = 200
	#elif Global.player1_flipped == true:
		#speed = -200

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_area_entered(area):
	if area.is_in_group("hitbox"):
		yield(get_tree().create_timer(0.01), "timeout")
		queue_free()

#func remove():
	#yield(get_tree().create_timer(0.01), "timeout")
	#queue_free()
