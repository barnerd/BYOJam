extends SubViewportContainer

@export var roll_time: float
@export var dice_color: Color

var random_roll: Vector3i

@onready var dice_gfx: CSGBox3D = $SubViewport/CSGBox3D


func _init() -> void:
	random_roll = Vector3i.ZERO


func _ready() -> void:
	var mat = dice_gfx.material as StandardMaterial3D
	mat = mat.duplicate()
	mat.albedo_color = dice_color
	dice_gfx.material = mat


func roll_dice() -> void:
	random_roll = Vector3i(randi_range(2, 4), randi_range(2, 4), randi_range(2, 4))
	print("Rolling dice with %v" % random_roll)
	
	var tween = get_tree().create_tween()
	tween.tween_property(dice_gfx, "rotation", random_roll * PI, roll_time * randf_range(0.75, 1.25)).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(roll_complete)


func roll_complete() -> void:
	print("Roll complete")
