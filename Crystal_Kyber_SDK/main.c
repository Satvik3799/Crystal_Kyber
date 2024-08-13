#include <stdint.h>
#include "ajit_access_routines.h"
#include <cortos.h>
// #include <math.h>
//For memcpy function
// #include <string.h>

// Define necessary constants
#define q 3329
// #define n2 256
#define n 128
// #define inv_n 3303
// #define psin 17
// #define inv_psin 1175
// #define k 2

#define ACCELERATOR_REGISTERS_BASE_ADDRESS 0xFFFF4000


// Function prototypes
void addr_gen(uint16_t s, uint16_t i, uint16_t l, uint16_t v, uint16_t *ie_r, uint16_t *io_r, uint16_t *iw);
void butterfly_dif(uint16_t w, uint16_t u, uint16_t v, uint16_t *x, uint16_t *y);
uint16_t barret_reduction(uint16_t c1);
void ntt_256(uint16_t *x, uint16_t *psis);
void ct_ntt(uint16_t *a, uint16_t *psis) ;

void setup()
{
	// configure uart
	__ajit_serial_configure__(1,0,0);
	__ajit_serial_set_baudrate__ (115200, 50000000);
	__ajit_serial_set_uart_reset__ (0);

	CORTOS_DEBUG ("enabled serial.\n");

	// enable interrupt controller for the current thread.

	enableInterruptControllerAndAllInterrupts(0,0);
	CORTOS_DEBUG ("enabled interrupt controller.\n");

}


void write_to_accelerator_register (uint16_t reg_id, uint16_t val)
{
	__ajit_store_word_mmu_bypass__(val, ACCELERATOR_REGISTERS_BASE_ADDRESS + (reg_id));
}


uint16_t read_from_accelerator_register (uint16_t reg_id)
{
	uint16_t val = __ajit_load_word_mmu_bypass__ (ACCELERATOR_REGISTERS_BASE_ADDRESS + (reg_id));
	return(val);
}

void my_external_interrupt_handler ()
{

}

// Implementations of the functions

void addr_gen(uint16_t s, uint16_t i, uint16_t l, uint16_t v, uint16_t *ie_r, uint16_t *io_r, uint16_t *iw) {
    uint16_t j = s >> (l - 1 - i);
    uint16_t z = s & ((v >> i) - 1);
    *ie_r = j * (1 << (l - i)) + z;
    *io_r = *ie_r + (1 << (l - i - 1));
    *iw = (1 << i) + (s >> (l - i - 1));
}

void butterfly_dit(uint16_t w, uint16_t u, uint16_t v, uint16_t *x, uint16_t *y) {
    uint16_t v1 = barret_reduction((uint64_t)w * v % q);
    *x = (u + v1) % q;
    *y = (u - v1 + q) % q;
}

uint16_t barret_reduction(uint16_t c1) {
    uint16_t p = 0;
    uint16_t m = 5039;
    // uint16_t k = 24;
    uint64_t t123 = (uint64_t)m * c1;
    uint16_t t = t123 >> 24;
    uint64_t ta = (uint64_t)p * t;
    uint16_t c = c1 - ta;
    if (c > p) {
        c = c - p;
    }
    return c;
}


int main () 
{	
CORTOS_DEBUG ("main start\n");
CORTOS_DEBUG("Crystal_kyber running\n");

    //Loop variables
    uint16_t x, i, j, s;
    //For Debugging
    // Pre-computed arrays - psis, inv_psis, pwmf
    CORTOS_DEBUG ("psis start\n");

    //Size = 256B 
    uint16_t psis[n] = {
        1, 1729, 2580, 3289, 2642, 630, 1897, 848, 1062, 1919, 193, 797, 2786, 3260, 569, 1746, 296, 2447, 1339, 1476, 3046, 56, 2240, 1333, 1426, 2094, 535, 2882, 2393, 2879, 1974, 821, 289, 331, 3253, 1756, 1197, 2304, 2277, 2055, 650, 1977,
        2513, 632, 2865, 33, 1320, 1915, 2319, 1435, 807, 452, 1438, 2868, 1534, 2402,
        2647, 2617, 1481, 648, 2474, 3110, 1227, 910, 17, 2761, 583, 2649, 1637, 723,
        2288, 1100, 1409, 2662, 3281, 233, 756, 2156, 3015, 3050, 1703, 1651, 2789, 1789,
        1847, 952, 1461, 2687, 939, 2308, 2437, 2388, 733, 2337, 268, 641, 1584, 2298,
        2037, 3220, 375, 2549, 2090, 1645, 1063, 319, 2773, 757, 2099, 561, 2466, 2594,
        2804, 1092, 403, 1026, 1143, 2150, 2775, 886, 1722, 1212, 1874, 1029, 2110, 2935,
        885, 2154
    };

//     for ( x = 0; x < n; x++) {
//         CORTOS_DEBUG("psis loop counter - %d\n", x);
//         CORTOS_DEBUG("%d ", psis[x]);
//         CORTOS_DEBUG("psis loop counter - %d\n", x);
        
//     }
//     CORTOS_DEBUG("\n");

    //Size = 512B
    uint16_t s_0[256] = {0, 1, 0, 0, 0, 0, 1, 3327, 0, 3328, 3328, 1, 2, 1, 3328, 1, 1, 0, 3328, 0, 1, 0, 3326, 3328, 1, 3327, 2, 0, 1, 1, 0, 0, 3328, 3328, 1, 3328, 1, 0, 0, 3328, 2, 2, 3327, 1, 2, 0, 0, 1, 0, 0, 0, 0, 1, 3328, 1, 1, 0, 0, 0, 0, 1, 1, 3328, 1, 0, 0, 1, 3328, 0, 0, 2, 0, 0, 0, 3328, 3327, 3327, 0, 3328, 3328, 0, 3327, 1, 3328, 1, 3328, 0, 2, 0, 3327, 1, 0, 1, 1, 0, 0, 3327, 3328, 0, 1, 0, 0, 3328, 0, 0, 3328, 3328, 0, 3328, 3327, 1, 1, 3328, 0, 1, 1, 3328, 0, 3328, 3326, 0, 0, 3328, 0, 2, 3328, 0, 1, 0, 0, 2, 3328, 0, 3328, 3328, 0, 0, 0, 1, 2, 3328, 3327, 1, 0, 2, 2, 2, 3327, 2, 0, 0, 1, 0, 3328, 3328, 0, 1, 0, 0, 0, 3328, 3328, 1, 3, 3328, 1, 3328, 2, 0, 0, 0, 2, 0, 1, 1, 3328, 1, 0, 3328, 3328, 0, 3328, 3328, 1, 3328, 3327, 1, 0, 1, 3328, 1, 3328, 1, 3328, 1, 0, 3327, 3328, 1, 3, 3327, 0, 1, 3327, 3, 0, 1, 1, 1, 1, 3327, 3328, 3328, 3328, 1, 3326, 0, 1, 1, 1, 0, 0, 1, 0, 0, 2, 0, 3328, 3328, 3328, 1, 3, 3328, 0, 3328, 2, 1, 3327, 0, 1, 1, 0, 3327, 3328, 1, 1, 0, 3328, 3328, 3328, 0, 3328, 0, 0, 3328, 0};
    
    // for ( i = 0; i < 10; i++) {
    //     CORTOS_DEBUG("index = %d ---> %d ", i, s_0[i]);
    // }

    CORTOS_DEBUG("NTT Start\n");

    uint16_t l = (uint16_t)log2(n);
    uint16_t v = n / 2;
    
    
    uint16_t xe[128], xo[128];

    for ( i = 0; i < 128; i++) {
        xe[i] = s_0[2 * i];
        xo[i] = s_0[2 * i + 1];
    }

    CORTOS_DEBUG(" Pass odd array to ct_ntt \n");
    //Pass even array to ct_ntt
    for ( i = 0; i < l; i++) {
        for ( s = 0; s < v; s++) {
            uint16_t ie, io, iw;
            addr_gen(s, i, l, v, &ie, &io, &iw);
            uint16_t S = psis[iw];
            uint16_t U = xe[ie];
            uint16_t V = xe[io];
            uint16_t x, y;
            butterfly_dit(S, U, V, &x, &y);
            xe[ie] = x;
            xe[io] = y;
        }
    }

    // for ( i = 0; i < 10; i++) {
    //     CORTOS_DEBUG("index = %d ---> %d ", i, xe[i]);
    // }
    
    CORTOS_DEBUG(" Pass odd array to ct_ntt \n");
    
    for ( i = 0; i < l; i++) {
        for ( s = 0; s < v; s++) {
            uint16_t ie, io, iw;
            addr_gen(s, i, l, v, &ie, &io, &iw);
            uint16_t S = psis[iw];
            uint16_t U = xo[ie];
            uint16_t V = xo[io];
            uint16_t x, y;
            butterfly_dit(S, U, V, &x, &y);
            xo[ie] = x;
            xo[io] = y;
        }
    }

    // for ( i = 0; i < 10; i++) {
    //     CORTOS_DEBUG("index = %d ---> %d ", i, xo[i]);
    // }

    // for ( i = 0; i < 128; i++) {
    //     s_0[i] = xe[i];
    //     s_0[i + 128] = xo[i];
    // }


    // CORTOS_DEBUG("Printing s_0 array\n");
    

    // CORTOS_DEBUG("index ---> %d ", s_0[0]);

    // for ( i = 0; i < 10; i++) {
    //     // CORTOS_DEBUG("index = %d ---> %d ", i, s_0[i]);
    // }
    
    CORTOS_DEBUG("\n");


    CORTOS_DEBUG("NTT End\n");

    CORTOS_DEBUG("Int main End!!");
    return 0;

}
