extends CharacterBody2D

var direction: Vector2 = Vector2(1,0)
var speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	#position += direction * speed
	velocity = direction * speed
	move_and_slide()
	if(Input.is_action_just_pressed("confirm")):
		print("something")
	
