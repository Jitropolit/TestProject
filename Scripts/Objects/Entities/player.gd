class_name Player extends Character

const MOVE_SPEED := 60

var keys: int

func _ready() -> void:
	health = WorldData.player.health
	max_health = WorldData.player.max_health
	keys = WorldData.player.keys
	
func _physics_process(delta: float) -> void:
	var directionY := Input.get_axis("up", "down")
	if directionY != 0:
		if directionY == 1:
			$AnimationPlayer.play("down")
		else:
			$AnimationPlayer.play("up")
		velocity.y = directionY * MOVE_SPEED * 100 * delta
	else:
		velocity.y = move_toward(velocity.y, 0, MOVE_SPEED)

	var directionX := Input.get_axis("left", "right")
	if directionX != 0:
		if !directionY:
			if directionX == 1:
				$AnimationPlayer.play("right")
			else:
				$AnimationPlayer.play("left")
		velocity.x = directionX * MOVE_SPEED * 100 * delta
	else:
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)

	if !directionY and !directionX:
		$AnimationPlayer.stop()

	move_and_slide()

func add_key(value: int):
	keys += value
	WorldData.player.keys = keys
	
