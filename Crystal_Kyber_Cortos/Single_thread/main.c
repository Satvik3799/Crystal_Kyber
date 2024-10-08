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
	// uint8_t core_id, thread_id;
	// ajit_get_core_and_thread_id(&core_id, &thread_id);
    __ajit_serial_configure__ (1,0,0);
    
    uint32_t psis[n], inv_psis[n];

    // Generate pre-computed factors
    gen_tf(psis, inv_psis);

    // uint32_t psis[n] =  {
    //     1, 1729, 2580, 3289, 2642, 630, 1897, 848, 1062, 1919, 193, 797, 2786, 3260, 569, 1746, 296, 2447, 1339, 1476, 3046, 56, 2240, 1333, 1426, 2094, 535, 2882, 2393, 2879, 1974, 821, 289, 331, 3253, 1756, 1197, 2304, 2277, 2055, 650, 1977,
    //     2513, 632, 2865, 33, 1320, 1915, 2319, 1435, 807, 452, 1438, 2868, 1534, 2402,
    //     2647, 2617, 1481, 648, 2474, 3110, 1227, 910, 17, 2761, 583, 2649, 1637, 723,
    //     2288, 1100, 1409, 2662, 3281, 233, 756, 2156, 3015, 3050, 1703, 1651, 2789, 1789,
    //     1847, 952, 1461, 2687, 939, 2308, 2437, 2388, 733, 2337, 268, 641, 1584, 2298,
    //     2037, 3220, 375, 2549, 2090, 1645, 1063, 319, 2773, 757, 2099, 561, 2466, 2594,
    //     2804, 1092, 403, 1026, 1143, 2150, 2775, 886, 1722, 1212, 1874, 1029, 2110, 2935,
    //     885, 2154
    //     };

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
    
        // uint16_t i;

		// Print
		// cortos_printf("Hello world from core:thread %d:%d!\n\n", core_id, thread_id);

        // Perform NTT transform
 
        // Perform NTT transform
        // start = clock();

    //Divide x into even and odd elements
        uint32_t s0_even[n], s0_odd[n];
        for ( i = 0; i < n; i++) {
            s0_even[i] = s0[2 * i];
            s0_odd[i] = s0[2 * i + 1];
        }

    ct_ntt(s0_even, psis);
    ct_ntt(s0_odd, psis);
    for ( i = 0; i < n; i++) {
        s0[i] = s0_even[i];
        s0[i + n] = s0_odd[i];
    }

        // ntt_256(s0, psis);
        // end = clock();
        //  // Calculate the elapsed time in seconds
        // cpu_time_used = (((double)(end - start)) / CLOCKS_PER_SEC) * 1000000;
        // cortos_printf("Execution time: %f micro-seconds\n", cpu_time_used);

        cortos_printf("Result of NTT function with s0:\n");
        for (i = 0; i < 256; i++) {
            cortos_printf("%d ", s0[i]);
        }
        cortos_printf("\n");    



	return(0);

}
