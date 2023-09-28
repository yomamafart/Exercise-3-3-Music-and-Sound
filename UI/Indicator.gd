extends Node2D

var modulate_target = 0.5
var mod = 0
var scale_target = Vector2(0.75,0.75)
var sca = Vector2(0.5,0.5)

var tween

func _ready():
	breathe()


func breathe():
	mod = 0.0 if mod == modulate_target else modulate_target
	sca = Vector2(0.5,0.5) if sca == scale_target else scale_target
	if tween:
		tween.kill()
	tween = create_tween().set_parallel(true)
	tween.tween_property($Highlight, "scale", sca, 1.0)
	tween.tween_property($Highlight, "modulate:a", mod, 1.0)
	tween.set_parallel(false)
	tween.tween_callback(breathe)
