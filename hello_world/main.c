#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <cortos.h>

volatile int volatile serial_print_done_0 = 0;

void my_external_interrupt_handler ()
{

}


int main(void)
{

	
	uint8_t core_id, thread_id;
	ajit_get_core_and_thread_id(&core_id, &thread_id);

	// initialize serial	
	if(thread_id == 1)
	{
		__ajit_serial_configure__ (1,0,0);

		// Print
		CORTOS_DEBUG("Hello world from thread %d!\n\n", thread_id);
		serial_print_done_0 = 1;
	}
	else
	{
		while(1)
		{
			if(serial_print_done_0)
				break;
		}

		// Print
		CORTOS_DEBUG("Hello world from thread %d!\n\n", thread_id);
		
	}
	return(0);
}


