extends Node2D

@export var matches_nbr = 1
var word = "HOME"
var tries_left = 3
var word_index = 0
var fail_animation_on = false

const A_KEYCODE = 65 
const Z_KEYCODE = 90

func _ready():
	$"Stella's layer/Stella/Animations".play("Light match")


func _process(_delta):
	pass


func is_letter(input):
	return input >= A_KEYCODE and input <= Z_KEYCODE
	
func _input(event):
	
	if $"Word's layer/Word".visible == false or fail_animation_on:
		return

	if event is InputEventKey and event.is_pressed() and is_letter(event.keycode):
		if word[word_index] == event.as_text():
			word_index += 1
			$"Word's layer/Word/Time to type".start()
			if word_index == len(word):
				word_index = 0
				tries_left = 3
				$"Word's layer/Word".visible = false
				$"Stella's layer/Stella/Animations".play("Light match")
		else:
			fail()
			

func fail():
	$"Word's layer/Word/AnimationPlayer".play("fail")
	fail_animation_on = true
	$"Word's layer/Word/Time to type".stop()
	word_index = 0
	tries_left -= 1
	if tries_left == 0:
		matches_nbr -= 1
		tries_left = 3
		if matches_nbr == 0:
			get_tree().quit()

func _on_stella_match_gone():
	await get_tree().create_timer(0.5).timeout
	$"Word's layer/Word".visible = true


func _on_animation_player_animation_finished(anim_name):
	fail_animation_on = false


func _on_time_to_type_timeout():
	if $"Word's layer/Word".visible == true:
		fail()
