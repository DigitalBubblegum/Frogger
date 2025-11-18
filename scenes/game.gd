extends Node2D
var car_scene: PackedScene = preload("res://scenes/car.tscn")
var score: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_score_timer_timeout() -> void:
	score+=1
	$HiScore/Label.set_text('SCORE: '+str(score))
	
func _on_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene")
	

func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	Global.score = score
	car.connect("body_entered",go_to_title)

func go_to_title(_body):
	call_deferred("change_scene")
	
func change_scene():
	get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
