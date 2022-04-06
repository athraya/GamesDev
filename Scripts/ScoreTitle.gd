extends Sprite

var words = Sprite.new()
var text = preload("res://Assets/Score Sprites/score.png")

func _ready():
	add_child(words, true)
	words.texture = text
	remove_child(words)
	

func _on_MainScene_score():
	add_child(words)




func _on_MainScene_reset():
	remove_child(words)
