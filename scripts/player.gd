extends CharacterBody2D


var speed = 100

var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y !=0:
		player_state = "walking"
	
	velocity = direction * speed
	move_and_slide()

	play_anim(direction)
	
func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("Idle")
	
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("N-Walk")
		if dir.x == 1:
			$AnimatedSprite2D.play("E-Walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("S-Walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("W-Walk")
		if dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("NE-Walk")
		if dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("SE-Walk")
		if dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("SW-Walk")
		if dir.x < -0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("NW-Walk")
			
func player():
	pass
