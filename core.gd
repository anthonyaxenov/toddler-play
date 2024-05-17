extends Node

var current_level: int = 1

const VERSION = '1.0.0'
const MAX_Y = 650 #TODO: make separate for each level

func restart_level():
	change_level(current_level)

func next_level():
	change_level(current_level + 1)

func prev_level():
	change_level(current_level - 1)

func change_level(number: int):
	var path = "res://levels/level_" + str(number) + ".tscn"
	get_tree().change_scene_to_file(path)

func game_over():
	#TODO: show screen with buttons?
	pass
