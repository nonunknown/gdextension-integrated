@tool
extends VBoxContainer

signal keep_going

var dir:Directory = Directory.new()
var path_gdextension:String = ""

func _on_bt_check_pressed():
	dir.open(ProjectSettings.globalize_path("user://"))
	dir.change_dir("../../")
	dir.make_dir("gdextension")
	dir.change_dir("gdextension")
	path_gdextension = dir.get_current_dir()
	print(path_gdextension)
	

	var keep_test:bool = $HBoxContainer/cb_keep.pressed
	var use_ssh:bool = $HBoxContainer/ob_clone.selected == 0
	var cmd:String = ""
	var path_bash:String = ProjectSettings.globalize_path( "res://addons/gd_extension/macros/git.sh" )

	cmd = "\"%s\" " % path_bash
	cmd += "-k %s " % keep_test
	cmd += "-s %s " % use_ssh
	cmd += "-p \"%s\" " % path_gdextension
	
	$command_data.visible = true
	$command_data/VBoxContainer/HBoxContainer/le_cmd.text = cmd
	
	await get_tree().create_timer(1).timeout
	
	pass # Replace with function body.


func _on_bt_copy_pressed():
	DisplayServer.clipboard_set($command_data/VBoxContainer/HBoxContainer/le_cmd.text)
	$command_data/VBoxContainer/HBoxContainer/bt_copy.text = "Copied"
	await get_tree().create_timer(.3).timeout
	$command_data/VBoxContainer/HBoxContainer/bt_copy.text = "Copy"
	
	pass # Replace with function body.


func _on_bt_made_pressed():
	var dirs:int = 2
#	dir.list_dir_begin()
#	var file_name = dir.get_next()
#	while file_name != "":
#		if dir.current_is_dir():
#			print("Found directory: " + file_name)
#			match dir.get_current_dir():
#				"projects":
#					dirs += 1
#				"godot-cpp":
#					dirs += 1
#		file_name = dir.get_next()
	var lb:Label = $command_data/VBoxContainer/lb_error
	if dirs != 2:
		lb.text = "Sorry I think you didnt made it right, make sure you have executed the terminal command"
		return
	lb.text = "Awesome, lets keep going!"
	keep_going.emit()
	pass # Replace with function body.
