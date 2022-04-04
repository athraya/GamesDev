extends KinematicBody2D

var playerHealth : int = 0
var speed : int = 200
var jumpForce : int = 500
var fallSpeed : int = 325
var gravity : int = 20
var accleration : int = 200
var velocity : Vector2 = Vector2() #can hold (x,y)
var isAttacking = false;
var isGrounded = true;
var isJumping = false;
var hasGun = false

onready var sprite = $P2  #references the sprite node
onready var punch_position = $PunchPosition
onready var gun_position = $GunPosition

var punch = preload("res://PunchPlayer2.tscn")
var bullet = preload("res://Bullet.tscn")

#func _check_is_grounded():
#	for raycast in raycasts.get_children():
#		if raycast.is_colliding():
#			return true

func _physics_process(delta):
	velocity.x = 0

	#this controls the movement left and right
	if Input.is_action_pressed("p2_left"):
		velocity.x -= accleration
		Global.player1_flipped = true
		sprite.play("Running")
	elif Input.is_action_pressed("p2_right"):
		velocity.x += accleration
		Global.player1_flipped = false
		sprite.play("Running")
	else:
		velocity.x = lerp(velocity.x, 0,0.2)
		if isAttacking == false:
			sprite.play("Idle")

	#applies the velocity
	velocity = move_and_slide(velocity, Vector2.UP)
	#changes the direction the sprite is looking
	if velocity.x > 0:
		sprite.flip_h = false
		#$AnimationPlayer.play("Run")
	elif velocity.x < 0:
		sprite.flip_h = true
		#$AnimationPlayer.play("Run")
		
	#controls gravity
	velocity.y += gravity   #* delta
	if velocity.y > fallSpeed:
		velocity.y = fallSpeed 
	velocity.x = clamp(velocity.x, - speed, speed)
	
	#controls jump input
	if Input.is_action_just_pressed("p2_jump") and is_on_floor():
		if Input.is_action_pressed("drop_through"):
			set_collision_mask_bit(1, false)
		else:
			velocity.y -= jumpForce
			isJumping = true;
	if isJumping and velocity.y >= 0:
		isJumping
	if Input.is_action_just_pressed("p2_Attack"):
		if hasGun == false:
			sprite.play("Punch");
			isAttacking = true;
			if Global.player1_flipped == false:
				punch_position.position.x = 16
			else:
				 punch_position.position.x = -16
			var new_punch = punch.instance()
			new_punch.position = punch_position.global_position
			get_tree().current_scene.add_child(new_punch)
		else:
			sprite.play("Shoot");
			isAttacking = true;
			yield(get_tree().create_timer(.2), "timeout")
			var new_bullet = bullet.instance()
			if Global.player1_flipped == false:
				gun_position.position.x = 19
				new_bullet.speed = 420
			else:
				new_bullet.speed = -420
				gun_position.position.x = -19
			#var new_bullet = bullet.instance()
			new_bullet.position = gun_position.global_position
			get_tree().current_scene.add_child(new_bullet)

func _on_P2_animation_finished():
	if sprite.animation == "Punch" || sprite.animation == "Shoot":
		isAttacking = false;
		

func _on_Hitbox_area_entered(area):
	if area.is_in_group("punchPlayer1") || area.is_in_group("bullet"):
		death()
	elif area.is_in_group("gunPickUp"):
		hasGun = true
		
func death():
	yield(get_tree().create_timer(0.01), "timeout")
	queue_free()
	#other things on player death here!!!
	
