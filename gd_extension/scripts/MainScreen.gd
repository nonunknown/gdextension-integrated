@tool
extends Control

@onready var wizard_sequence = [$Panel/Start,
	$Panel/Git,
	$Panel/Binding
]

var target:int = 0:
	set(v):
		print("target: ", target, "v: ", v)
		wizard_sequence[target].visible = false
		target = v
		wizard_sequence[target].visible = true
		
	
func _ready():
	$Panel/Git.keep_going.connect(_update_target)
	for control in wizard_sequence:
		control.visible = false
	wizard_sequence[0].visible = true
	pass

func _on_bt_start_pressed():
	target += 1
#	var tween = get_tree().create_tween()
#	tween.parallel()
#	tween.set_ease(Tween.EASE_IN)
#	tween.tween_property($Panel/Start,"rect_position",rect_position + Vector2(0,1000),.5)
#	tween.tween_property($Panel/Start,"modulate",Color(0,0,0,0),.3)
	
	print("pressed")
	pass # Replace with function body.


func _update_target():
	target += 1
	pass # Replace with function body.

