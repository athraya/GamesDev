extends Sprite
var ones = Sprite.new()
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
	add_child(ones, true)
	ones.texture = one
	remove_child(ones)
	

func _on_MainScene_score():
	add_child(ones)
	
	match (score):
		(0):
			ones.texture = zero
		(1):
			ones.texture = one
		(2):
			ones.texture = two
		(3):
			ones.texture = three
		(4):
			ones.texture = four
		(5):
			ones.texture = five
		(6):
			ones.texture = six
		(7):
			ones.texture = seven
		(8):
			ones.texture = eight
		(9):
			ones.texture = nine




func _on_MainScene_reset():
	remove_child(ones)
