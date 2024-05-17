extends Node2D

func _process(delta):
	$ParallaxBackground.scroll_offset.x -= delta * 100

# play button pressed
func _on_play_btn_pressed():
	Core.change_level(1)

# exit button pressed
func _on_exit_btn_pressed():
	get_tree().quit()

func _ready():
	$Version.text = 'v' + Core.VERSION
