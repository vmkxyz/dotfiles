#include <stdlib.h>

// we wrap the command into a c binary because just running the command as a dwl keybind is broken
int main() {
	system("loginctl suspend");
	return 0;
}

