extends Node


@export var mob_scene = PackedScene
var score	

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_hit():
	pass # Replace with function body.

func game_ver():
	$ScoreTimer.stop()
	$MobTimer.stop()
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer


func _on_score_timer_timeout():
	score += 1
	pass # Replace with function body.


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	pass # Replace with function body.


func _on_mob_timer_timeout():
	#Criar Nova instancia mob
	var mob = mob_scene.instantiete()
	
	# Localização aleatória Path
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	# Direação do mob perpendicular a diretação do path
	var direction = mob_spawn_location + PI / 2
	
	#Localização Aleatória mob
	mob.position = mob_spawn_location.position
	
	# Adicionar aleatóridade a posição
	direction += randf_range(-PI / 4, PI/ 4)
	mob.rotation  = direction
	
	# Escolha velocidade do mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity  = velocity.rotated(direction)
	
	#Spawn the mob by adding it to the Main scene.
	
	add_child(mob)
	
	pass # Replace with function body.
