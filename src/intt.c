#include <defs.h>

void gs_intt(uint32_t *a, uint32_t *inv_psis) {
    uint32_t i, s;
    uint32_t l = (uint32_t)log2(n);
    uint32_t v = n / 2;

    for ( i = 0; i < l; i++) {  
        for ( s = 0; s < v; s++) {
            uint32_t i2 = l - i - 1;
            uint32_t ie, io, iw;
            addr_gen(s, i2, l, v, &ie, &io, &iw);
            uint32_t S = inv_psis[iw];
            uint32_t U = a[ie];
            uint32_t V = a[io];
            uint32_t x, y;
            butterfly_dif(S, U, V, &x, &y);
            a[ie] = x;
            a[io] = y;
        }
    }
    for ( i = 0; i < n; i++) {
        a[i] = (uint32_t)a[i] * inv_n % q;
    }
}


void intt_256(uint32_t *y, uint32_t *inv_psis) {
    uint32_t ye[n], yo[n];
    uint32_t i;
    for ( i = 0; i < n; i++) {
        ye[i] = y[i];
        yo[i] = y[i + n];
    }
    gs_intt(ye, inv_psis);
    gs_intt(yo, inv_psis);
    for ( i = 0; i < n; i++) {
        y[2 * i] = ye[i];
        y[2 * i + 1] = yo[i];
    }
}

void intt_512(uint32_t *y, uint32_t *inv_psis) {
    uint32_t ye[n], yo[n];
    uint32_t i;
    for ( i = 0; i < n; i++) {
        ye[i] = y[i];
        yo[i] = y[i + n];
    }
    intt_256(ye, inv_psis);
    intt_256(yo, inv_psis);
    for ( i = 0; i < n; i++) {
        y[2 * i] = ye[i];
        y[2 * i + 1] = yo[i];
    }
}
