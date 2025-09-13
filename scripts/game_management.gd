extends Node

@onready var score_label: Label = $/root/Game/CanvasLayer/ScoreLabel
@onready var pause_menu_scene = preload("res://scenes/main_menu.tscn")
var pause_menu_instance : Control

# بقیه کدهای مربوط به امتیاز
var score = 0
func show_score():
	score_label.text = "Coins: " + str(score)
func add_point():
	score += 1
	print(score)
	show_score()
func reset_point():
	score = 0
	print(score)
	show_score()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause_menu()

func toggle_pause_menu():
	if get_tree().paused:
		get_tree().paused = false
		if pause_menu_instance != null:
			pause_menu_instance.hide()
	else:
		get_tree().paused = true
		if pause_menu_instance == null:
			pause_menu_instance = pause_menu_scene.instantiate()
			var ui_container = get_tree().current_scene.find_child("Control", true, false)
			ui_container.add_child(pause_menu_instance)
			# این خط جدید است: معرفی GameManagement به منو
			pause_menu_instance.set_game_manager(self)
		pause_menu_instance.show()
