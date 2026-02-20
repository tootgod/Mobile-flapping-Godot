extends Node2D

@export var pipes_scene: PackedScene
var score

func _ready() -> void:
	new_game()

func _on_pipe_timer_timeout() -> void:
	var pipe = pipes_scene.instantiate()
	
	var pipe_spawn_location = $PipesPath/PipeSpawnLocation
	pipe_spawn_location.progress_ratio = randf()
	
	pipe.position = pipe_spawn_location.position
	print(pipe.position)
	#pipe.position = $pipePoint.position
	
	add_child(pipe)
	 
func new_game():
	$Bird.start($StartLocation.position)
	$"Pipe Timer".start()
