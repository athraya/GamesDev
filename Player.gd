extends KinematicBody2D

var playerHealth : int = 0
var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800
var velocity : Vector2 = Vector2() #can hold (x,y)

onready var sprite : Sprite = get_node("GoblinIdle00") #references the sprite node (the goblin)

func _physics_process(delta):
	velocity.x = 0
	#this controls the movement left and right
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		
	#applies the velocity
	velocity = move_and_slide(velocity, Vector2.UP)
	#changes the direction the sprite is looking
	if velocity.x > 0:
		sprite.flip_h = true
	elif velocity.x < 0:
		sprite.flip_h = false
	#controls gravity
	velocity.y += gravity * delta
	#controls jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce
