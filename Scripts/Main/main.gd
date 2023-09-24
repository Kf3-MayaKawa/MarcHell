extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	$ScoreTimer.stop()
	$MousesTimer.stop()
	
func new_game():
	score = 0
	$Player.start($StartPos.position)
	$StartTimer.start()


func _on_start_timer_timeout():
	$MousesTimer.start()
	$ScoreTimer.start()
	$BigPTimer.start()


func _on_score_timer_timeout():
	score +=1
	
	
#func _on_big_p_timer_timeout():
	#var bigP = mob_scene.instantiate()

func _on_mouses_timer_timeout():
	var mouses = mob_scene.instantiate()
	
	var mobSpawnLocation = get_node("MousesPath/MousesSpawnLocation")
	mobSpawnLocation.progress_ratio = randf()
	
	var direction = mobSpawnLocation.rotation + PI /2
	
	mouses.position = mobSpawnLocation.position
	
	var velocity = Vector2(randf_range(150, 250),0)
	
	mouses.linear_velocity = velocity.rotated(direction)
	



