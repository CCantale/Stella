extends Node

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main scene/main_scene.tscn")


func _on_exit_pressed():
	get_tree().quit()
