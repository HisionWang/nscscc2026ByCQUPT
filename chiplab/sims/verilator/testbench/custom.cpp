#include "custom.h"

bool is_custom_instr(unsigned instr)
{
	if ((instr & CUS_INSTR_MASK) != CUS_INSTR_OPCODE)
		return false;
	return true;
}
