extends Node2D
var scoreP1 : int = 0
var scoreP2 : int = 0
var currentDeath : int = 0
signal reset

onready var player1 = get_node("Player")
onready var player2 = get_node("Player2")


func show_Score():
	if currentDeath == 1:
		pass
		#p2 win
	elif currentDeath == 2:
		pass
		#p1 win
	elif currentDeath == 3:
		pass
		#draw
	

func _physics_process(delta):
	if Input.is_action_pressed("restart") && currentDeath != 0:
		print("p1 score:",  scoreP1)
		print("p2 score:",  scoreP2)
		if currentDeath == 1:
			add_child(player1)
		elif currentDeath == 2:
			add_child(player2)
		
		emit_signal("reset")
		player1.position = Vector2(172, 430)
		player2.position = Vector2(820, 430)
		player1.hasGun = false
		player2.hasGun = false
		currentDeath = 0


func _on_Player_death1():
	remove_child(player1)
	scoreP2 += 1
	currentDeath += 1
	
	if currentDeath != 0:
		show_Score()


func _on_Player2_death2():
	remove_child(player2)
	scoreP1 += 1
	currentDeath += 2
	
	if currentDeath != 0:
		show_Score()
