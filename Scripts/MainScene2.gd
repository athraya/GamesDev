extends Node2D
var scoreOnesP1 : int = 0
var scoreOnesP2 : int = 0
var scoreTensP1 : int = 0
var scoreTensP2 : int = 0
var currentDeath : int = 0
signal reset
signal score

onready var player1 = get_node("Player")
onready var player2 = get_node("Player2")
onready var p1Tens = get_node("p1ScoreTens")
onready var p1Ones = get_node("p1ScoreOnes")
onready var p2Tens = get_node("p2ScoreTens")
onready var p2Ones = get_node("p2ScoreOnes")


func show_Score():
	yield(get_tree().create_timer(1), "timeout")
	p1Tens.score = scoreTensP1
	p1Ones.score = scoreOnesP1
	p2Tens.score = scoreTensP2
	p2Ones.score = scoreOnesP2
	emit_signal("score")
	
	

func _physics_process(delta):
	if Input.is_action_pressed("restart") && currentDeath != 0:
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
	yield(get_tree().create_timer(0.10), "timeout")
	scoreOnesP2 += 1
	currentDeath += 1
	
	if scoreOnesP2 == 10:
		scoreOnesP2 = 0
		scoreTensP2 += 1
	
	if currentDeath != 3:
		show_Score()


func _on_Player2_death2():
	remove_child(player2)
	scoreOnesP1 += 1
	currentDeath += 2
	
	if scoreOnesP1 == 10:
		scoreOnesP1 = 0
		scoreTensP1 += 1
	
	if currentDeath != 3:
		show_Score()
