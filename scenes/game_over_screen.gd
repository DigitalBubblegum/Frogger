extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Global.score)
	$Label2.set_text("HIGH SCORE "+str(Global.score))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("select")):
		call_deferred("start_game")
func start_game():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
