#include <stdint.h>
#include "core_portme.h"
#include "ajit_access_routines.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>


#include "NTT.h"

// Define necessary constants
#include "constants.h"

void setup() {
    __ajit_serial_configure__(1, 0, 0);
    __ajit_serial_set_baudrate__(115200, 80000000);
    __ajit_serial_set_uart_reset__(0);
}


int main(void)
{

	uint32_t i,j;	
    uint64_t t0, t1; //To get time
    
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

    t0 = __ajit_get_clock_time();

    ct_ntt(s0_even, psis);
    ct_ntt(s0_odd, psis);

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



	return(0);

}
