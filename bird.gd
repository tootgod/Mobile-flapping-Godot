extends Node2D

@export var fall_speed = -10
@export var jump_strength = 50
var velocity = Vector2.ZERO
var screen_size

signal hit

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func _process(delta: float) -> void:
	velocity.y += fall_speed * -1
	if Input.is_action_just_pressed("Jump"):
		velocity.y = jump_strength * -1
		
	if velocity.y < 0 and rad_to_deg(rotation) >= -45:
		rotation -= .2
	if velocity.y >= 0 and rad_to_deg(rotation) < 70:
		rotation += .1
	
	
	position += velocity * delta
	
	if position.y < 0:
		position = position.clamp(Vector2.ZERO, screen_size)
		
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func start(pos):
	position = pos


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
