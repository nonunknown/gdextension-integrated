@tool
extends VBoxContainer



func _on_bt_generate_pressed():
	var platform:String = $HBoxContainer/ob_platform.get_item_text($HBoxContainer/ob_platform.get_selected_id())
	var compilation:String = $HBoxContainer2/ob_compilation.get_item_text($HBoxContainer2/ob_compilation.get_selected_id())
	var bits:String = $HBoxContainer3/ob_bits.get_item_text($HBoxContainer3/ob_bits.get_selected_id())
	var use_mingw:String = str( $HBoxContainer3/cb_use_mingw.pressed )
	var use_llvm:String = str( $HBoxContainer3/cb_use_llvm.pressed )
	
	pass # Replace with function body.


func _on_Binding_visibility_changed():
	$HBoxContainer3/sb_cores.value = OS.get_processor_count()
	pass # Replace with function body.


func _on_ob_platform_item_selected(index):
	match index:
		0:
			$HBoxContainer3/cb_use_llvm.disabled = false
			$HBoxContainer3/cb_use_mingw.disabled = true
		1:
			$HBoxContainer3/cb_use_llvm.disabled = true
			$HBoxContainer3/cb_use_mingw.disabled = false
	pass # Replace with function body.
