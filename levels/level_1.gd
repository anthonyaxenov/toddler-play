extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Core.current_level = 1
	$Player.spawn($SpawnPoint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$UI/StarCount.text = str($Player.stars)
	pass

func _input(event):
	if event is InputEventKey:
		var keycode = int(event.as_text())
		if keycode > 0 and keycode < 10:
			Core.change_level(keycode)
