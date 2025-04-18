#include <stdint.h>
#include "utils.h"
#include "math.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#include <cortos.h>
#include <thread_channel.h>
#include <ajit_access_routines.h>


#include "Crystal_Kyber.h"
#include "utils.h"
#include "ntt.h"
#include "intt.h"


// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175
#define k 2

void gs_intt(uint16_t *a, uint16_t *inv_psis) {
    // cortos_printf("Inside GS_INTT");
    uint16_t l = 7;
    uint16_t v = n / 2;
    uint16_t i, s;
    for ( i = 0; i < l; i++) {  
        for ( s = 0; s < v; s++) {
            uint16_t i2 = l - i - 1;
            uint16_t ie, io, iw;
            addr_gen(s, i2, l, v, &ie, &io, &iw);
            uint16_t S = inv_psis[iw];
            uint16_t U = a[ie];
            uint16_t V = a[io];
            uint16_t x, y;
            butterfly_dif(S, U, V, &x, &y);
            a[ie] = x;
            a[io] = y;
        }
    }
    for ( i = 0; i < n; i++) {
        a[i] = (uint32_t)a[i] * inv_n % q;
    }
}


void intt_256(uint16_t *y, uint16_t *inv_psis) {
    // cortos_printf("Inside INTT");
    uint16_t ye[128], yo[128];
    uint16_t i;
    for ( i = 0; i < 128; i++) {
        ye[i] = y[i];
        yo[i] = y[i + 128];
    }
    gs_intt(ye, inv_psis);
    gs_intt(yo, inv_psis);
    for ( i = 0; i < 128; i++) {
        y[2 * i] = ye[i];
        y[2 * i + 1] = yo[i];
    }
}


void intt_thread(void* args){
    uint16_t *x = ((thread_args*) args) -> x;
    uint16_t *psis = ((thread_args*) args) -> psis;
    uint16_t i;
    
    // cortos_printf("[INFO]  :   Performing NTT on:\n");
    // Print the received input
    // for( i = 0; i < 128; i++) {
    //     cortos_printf("%d ", x[i]);
    // }
    // cortos_printf("\n");
    
    // Perform NTT
    gs_intt(x, psis);

    // cortos_printf("[INFO]  :   NTT_THREAD running\n");
}

void intt_top(uint16_t *x, uint16_t *psis){

    volatile ThreadChannel* volatile tc_ptr = &tc;
    volatile thread_args volatile intt_args;
    uint8_t i;
    uint16_t xe[128], xo[128];

    // cortos_printf("[INFO]  :    NTT_TOP Entered\n");

    // cortos_printf("[INFO]  :    X Array\n");
    // for(i = 0; i < 128; i++){
    //     cortos_printf("%d, ", x[i]);
    // }

    // cortos_printf("\n");

    // cortos_printf("[INFO]  :    PSIS Array\n");

    // for(i = 0; i < 128; i++){
    //     cortos_printf("%d, ", psis[i]);
    // }


    // cortos_printf("\n");


    //Divide the array
    for (i = 0; i < 128; i++){
        xe[i] = x[2*i];
        xo[i] = x[2*i+1];    
    }

    // for(i = 0; i < 128; i++){
    //     cortos_printf("xe Array [%d] - %d\n", i, xe[i]);
    // }

    // for(i = 0; i < 128; i++){
    //     cortos_printf("xo Array [%d] - %d\n", i, xo[i]);
    // }

    // cortos_printf("[INFO]  :   NTT on Even indices - running on a thread\n");
    
    set_NTT_Args(&intt_args, xe, psis);
	while(scheduleChannelJob(tc_ptr, (void*) intt_thread, &intt_args))
	{
        // cortos_printf("[INFO] : NTT_TOP still running 1\n");
	};   

    // cortos_printf("[INFO]  :   NTT on Odd indices - running locally\n");
    gs_intt(xo, psis);

	void* vptr = NULL;
	while(getChannelResponse(tc_ptr, &vptr))
	{
        // cortos_printf("[INFO] : NTT_TOP waiting for response\n");
	}

    // cortos_printf("[INFO] : NTT_TOP Exiting\n");

}


