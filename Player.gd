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

onready var sprite = $P1  #references the sprite node

#func _check_is_grounded():
#	for raycast in raycasts.get_children():
#		if raycast.is_colliding():
#			return true

func _physics_process(delta):
	velocity.x = 0

	#this controls the movement left and right
	if Input.is_action_pressed("move_left"):
		velocity.x -= accleration
	elif Input.is_action_pressed("move_right"):
		velocity.x += accleration
	else:
		velocity.x = lerp(velocity.x, 0,0.2)
		if isAttacking == false:
			sprite.play("Idle")
		
	#applies the velocity
	velocity = move_and_slide(velocity, Vector2.UP)
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
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if Input.is_action_pressed("drop_through"):
			set_collision_mask_bit(1, false)

		else:
			velocity.y -= jumpForce
			isJumping = true;
	if isJumping and velocity.y >= 0:
		isJumping
	if Input.is_action_just_pressed("P1_Attack"):
		sprite.play("Punch");
		isAttacking = true;
	
#	if !is_on_floor():
	#	if velocity.y < 0:
	#		#$AnimationPlayer.play("Jump")
	#	elif velocity.y > 0 :
	#		#$AnimationPlayer.play("Fall")


func _on_P1_animation_finished():
	if sprite.animation == "Punch":
		isAttacking = false;
