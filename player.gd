extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const JUMP_VELOCITY_POWERUP = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var stars: int = 0

func add_star():
	stars += 1

func spawn(spawn_point: Marker2D):
	position.x = spawn_point.position.x
	position.y = spawn_point.position.y
	#$Camera2D.limit.right = $Level
	#$Camera2D.limit.bottom = 
	stars = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Sprite.play('jump')

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("player_left", "player_right")
	if direction: # moving anywhere
		velocity.x = direction * SPEED
		if velocity.y == 0:
			$Sprite.play('move')
	else: # slowing until stop
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0: # stop
			$Sprite.play('idle')

	if direction == -1: # left
		$Sprite.flip_h = true
	elif direction == 1: # right
		$Sprite.flip_h = false

	move_and_slide()
