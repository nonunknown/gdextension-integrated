@tool
extends EditorPlugin

const main_panel = preload("res://addons/gd_extension/MainScreen.tscn")
var main_panel_instance:Control

func _enter_tree() -> void:
	main_panel_instance = main_panel.instantiate()
	
	get_editor_interface().get_editor_main_control().add_child(main_panel_instance)
	_make_visible(false)
	pass


func _exit_tree() -> void:
	if main_panel_instance:
		main_panel_instance.queue_free()
		main_panel_instance = null
	pass

func _has_main_screen() -> bool:
	return true

func _make_visible(visible: bool) -> void:
	if main_panel_instance:
		main_panel_instance.visible = visible
	pass

func _get_plugin_name() -> String:
	return "Extension"

func _get_plugin_icon() -> Texture2D:
	return get_editor_interface().get_base_control().get_theme_icon("GDScript","EditorIcons")
