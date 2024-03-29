extends Node2D

var state = "no apples" # no apples, apples will be the states
var player_in_area = false


func _ready():
	if state == "no apples":
		$growth_timer.start()

func _process(delta):
	if state == "no apples":
		$AnimatedSprite2D.play("no apples")
	if state == "apples":
		$AnimatedSprite2D.play("apples")
		if player_in_area:
			if Input.is_action_just_pressed("e"):
				state = "no apples"
				$growth_timer.start()

