extends Area2D

const SPRING_FORCE = -460

func _on_body_entered(body):
	if body.name == 'Player':
		$AnimationPlayer.play('push')
		body.velocity.y = SPRING_FORCE
		body.get_node('Sprite').play('jump')
	else:
		$AnimationPlayer.play('idle')
	
