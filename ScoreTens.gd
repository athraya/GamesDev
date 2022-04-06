extends Sprite

var tens = Sprite.new()
var zero = preload("res://Assets/Score Sprites/0.png")
var one = preload("res://Assets/Score Sprites/1.png")
var two = preload("res://Assets/Score Sprites/2.png")
var three = preload("res://Assets/Score Sprites/3.png")
var four = preload("res://Assets/Score Sprites/4.png")
var five = preload("res://Assets/Score Sprites/5.png")
var six = preload("res://Assets/Score Sprites/6.png")
var seven = preload("res://Assets/Score Sprites/7.png")
var eight = preload("res://Assets/Score Sprites/8.png")
var nine = preload("res://Assets/Score Sprites/9.png")
var score : int = 0

func _ready():
	add_child(tens, true)
	tens.texture = one
	remove_child(tens)
	

func _on_MainScene_score():
	add_child(tens)
	
	match (score):
		(0):
			tens.texture = zero
		(1):
			tens.texture = one
		(2):
			tens.texture = two
		(3):
			tens.texture = three
		(4):
			tens.texture = four
		(5):
			tens.texture = five
		(6):
			tens.texture = six
		(7):
			tens.texture = seven
		(8):
			tens.texture = eight
		(9):
			tens.texture = nine




func _on_MainScene_reset():
	remove_child(tens)

