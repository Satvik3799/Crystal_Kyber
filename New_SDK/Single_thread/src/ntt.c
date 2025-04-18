
#include "core_portme.h"
#include "utils.h"
#include "math.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <cortos.h>

#include <ajit_access_routines.h>

#include "Crystal_Kyber.h"
#include "utils.h"
#include "ntt.h"
#include "intt.h"


#define n 128

void ct_ntt(uint16_t *a, uint16_t *psis) {
    // cortos_printf("ct_ntt started execution\n");
    uint8_t l = (uint8_t)log2(n);
    uint8_t v = n / 2;
    uint8_t i,s;
    for ( i = 0; i < l; i++) {
        for ( s = 0; s < v; s++) {
            uint16_t ie, io, iw;
            addr_gen(s, i, l, v, &ie, &io, &iw);
            uint16_t S = psis[iw];
            uint16_t U = a[ie];
            uint16_t V = a[io];
            uint16_t x, y;
            butterfly_dit(S, U, V, &x, &y);
            // cortos_printf("%d", s);
            a[ie] = x;
            a[io] = y;
        }

        // cortos_printf("-- %d --\n", i);
    }
    // cortos_printf("\n");
    // cortos_printf("ct_ntt finished execution\n");
}


// NTT and INTT for Single thread 256 point
void ntt_256(uint16_t *x, uint16_t *psis) {
    uint16_t xe[128], xo[128];
    uint16_t i;
    for ( i = 0; i < 128; i++) {
        xe[i] = x[2 * i];
        xo[i] = x[2 * i + 1];
    };
    ct_ntt(xe, psis);
    ct_ntt(xo, psis);
    for ( i = 0; i < 128; i++) {
        x[i] = xe[i];
        x[i + 128] = xo[i];
    };
}