/*************************************************************************/
/*  %CLASSN%.h                                                            */
/*************************************************************************/


#ifndef %CLASSN_U%_CLASS_H
#define %CLASSN_U%_CLASS_H

#include <godot_cpp/classes/control.hpp>
#include <godot_cpp/classes/global_constants.hpp>

#include <godot_cpp/core/binder_common.hpp>

using namespace godot;

class %CLASSN% : public Control {
	GDCLASS(%CLASSN%, Control);

protected:
	static void _bind_methods();

public:
	// Functions.
	void simple_func();
	%CLASSN%();
	~%CLASSN%();
};



#endif // ! %CLASSN_U%_CLASS_H
