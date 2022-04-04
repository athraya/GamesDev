extends Area2D

var speed

func _ready():
	if speed > 0:
		$Sprite.flip_v = false
	elif Global.player1_flipped == true:
		$Sprite.flip_v = true

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_area_entered(area):
	if area.is_in_group("hitbox") || area.is_in_group("tile"):
		yield(get_tree().create_timer(0.01), "timeout")
		queue_free()

#func remove():
	#yield(get_tree().create_timer(0.01), "timeout")
	#queue_free()


func _on_BulletP1_body_entered(body):
	if body.is_in_group("tile"):
		yield(get_tree().create_timer(0.01), "timeout")
		queue_free()
