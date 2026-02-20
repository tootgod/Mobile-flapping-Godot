extends Node2D

@export var move_speed = 20
var velocity = Vector2.ZERO
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	#position.x = screen_size.x + 100
	
func _process(delta: float) -> void:
	velocity.x = move_speed * -1
		
	position += velocity * delta
	
	#if position.y < 0:
	#	position = position.clamp(Vector2.ZERO, screen_size)
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
