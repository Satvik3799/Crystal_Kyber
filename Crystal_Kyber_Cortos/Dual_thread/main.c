#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "thread_channel.h"
#include "NTT.h"
#include "cortos.h"
// Define necessary constants
#include "constants.h"

typedef struct argstruct {
    uint16_t *x_array; // Pointer to the x array
    uint16_t *psis_array; // Pointer to the psis array
} argstruct;


ThreadChannel tc;

uint64_t t0, t1, t2, t3; //To get time

void setup() {
    __ajit_serial_configure__(1, 0, 0);
    __ajit_serial_set_baudrate__(115200, 80000000);
    __ajit_serial_set_uart_reset__(0);

	CORTOS_DEBUG("Init channel.\n");
	// initialize scoreboard.
	initChannel(&tc, 1);

}

int ntt_s (void* varg)
{
	argstruct* arg = (argstruct*) varg;
	ct_ntt(arg->x_array, arg->psis_array);

}

int main_00 (void)
{

	uint32_t i,j;	
    uint32_t psis[n], inv_psis[n];

    // Generate pre-computed factors
    gen_tf(psis, inv_psis);

    uint32_t s0[n2] = {0, 1, 0, 0, 0, 0, 1, 3327, 0, 3328, 3328, 1, 2, 1, 3328, 1, 1, 0, 3328, 0,
        1, 0, 3326, 3328, 1, 3327, 2, 0, 1, 1, 0, 0, 3328, 3328, 1, 3328, 1, 0, 0, 3328, 2, 
        2, 3327, 1, 2, 0, 0, 1, 0, 0, 0, 0, 1, 3328, 1, 1, 0, 0, 0, 0, 1, 1, 3328, 1, 0, 0, 
        1, 3328, 0, 0, 2, 0, 0, 0, 3328, 3327, 3327, 0, 3328, 3328, 0, 3327, 1, 3328, 1, 3328, 
        0, 2, 0, 3327, 1, 0, 1, 1, 0, 0, 3327, 3328, 0, 1, 0, 0, 3328, 0, 0, 3328, 3328, 0, 
        3328, 3327, 1, 1, 3328, 0, 1, 1, 3328, 0, 3328, 3326, 0, 0, 3328, 0, 2, 3328, 0, 1, 
        0, 0, 2, 3328, 0, 3328, 3328, 0, 0, 0, 1, 2, 3328, 3327, 1, 0, 2, 2, 2, 3327, 2, 0, 
        0, 1, 0, 3328, 3328, 0, 1, 0, 0, 0, 3328, 3328, 1, 3, 3328, 1, 3328, 2, 0, 0, 0, 2, 
        0, 1, 1, 3328, 1, 0, 3328, 3328, 0, 3328, 3328, 1, 3328, 3327, 1, 0, 1, 3328, 1, 3328, 
        1, 3328, 1, 0, 3327, 3328, 1, 3, 3327, 0, 1, 3327, 3, 0, 1, 1, 1, 1, 3327, 3328, 3328, 
        3328, 1, 3326, 0, 1, 1, 1, 0, 0, 1, 0, 0, 2, 0, 3328, 3328, 3328, 1, 3, 3328, 0, 3328, 
        2, 1, 3327, 0, 1, 1, 0, 3327, 3328, 1, 1, 0, 3328, 3328, 3328, 0, 3328, 0, 0, 3328, 0};

   //Divide x into even and odd elements
    uint32_t s0_even[n], s0_odd[n];
    for ( i = 0; i < n; i++) {
        s0_even[i] = s0[2 * i];
        s0_odd[i] = s0[2 * i + 1];
    }

	CORTOS_DEBUG("Shared run.\n");

    argstruct arrays = {s0_odd, psis};
    argstruct* rarg;

    t0 = __ajit_get_clock_time();

    //Running on Thread 0
    ct_ntt(s0_even, psis);

    //Running on Thread 1
    scheduleChannelJob(&tc, (void*) &ntt_s, (void*) &arrays);

    //Wait for both to finish
	while(getChannelResponse(&tc, (void**) &rarg))
	{
	}

    // Combine even and odd elements
    for ( i = 0; i < n; i++) {
        s0[i] = s0_even[i];
        s0[i + n] = s0_odd[i];
    }

    t1 =__ajit_get_clock_time();
	cortos_printf("Single-thread time=%f ticks\n", ((double) (t1 - t0)));


    cortos_printf("Result of NTT function with s0:\n");
    for (i = 0; i < 256; i++) {
        cortos_printf("%d ", s0[i]);
    }
    cortos_printf("\n");    

}



void main_01 () 
{
	void (*__fn) (void*);

	void *__arg;
	while(getChannelJob(&tc, (void**) &__fn, (void**) &__arg))
	{
	}

	(*__fn)(__arg);
	tc.status = CH_COMPLETED;
}

