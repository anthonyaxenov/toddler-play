extends Area2D

func _on_body_entered(body):
	if body.name == 'Player':
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, 25), 0.3)

		var tween1 = get_tree().create_tween()
		tween1.tween_property(self, "modulate:a", 0, 0.3)
		tween1.tween_callback(queue_free)
		#tween1.tween_callback(Core.next_level)

		if Core.current_level == 1:
			tween1.tween_callback(Core.next_level)
		elif Core.current_level == 2:
			tween1.tween_callback(Core.prev_level)
