/*************************************************************************/
/*  %CLASSN%.cpp                                                          */
/*************************************************************************/


#include "%CLASSN%.h"

#include <godot_cpp/core/class_db.hpp>

#include <godot_cpp/classes/global_constants.hpp>
#include <godot_cpp/classes/label.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

using namespace godot;

%CLASSN%::%CLASSN%() {
	UtilityFunctions::print("%CLASSN% created.");
}

%CLASSN%::~%CLASSN%() {
	UtilityFunctions::print("%CLASSN% destroyed.");
}

void %CLASSN%::_bind_methods() {
	// Methods.
	
	// Bind method example:
	ClassDB::bind_method(D_METHOD("simple_func"), &%CLASSN%::simple_func); 
}

// Methods.
void %CLASSN%::simple_func() {
	UtilityFunctions::print("Simple func called.");
}