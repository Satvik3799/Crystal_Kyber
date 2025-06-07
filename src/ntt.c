#include <defs.h>

void ct_ntt(uint32_t *a, uint32_t *psis) {
    uint32_t l = (uint32_t)log2(n);
    uint32_t v = n / 2;
    uint32_t i,s;
    for ( i = 0; i < l; i++) {
        for ( s = 0; s < v; s++) {
            uint32_t ie, io, iw;
            addr_gen(s, i, l, v, &ie, &io, &iw);
            uint32_t S = psis[iw];
            uint32_t U = a[ie];
            uint32_t V = a[io];
            uint32_t x, y;
            butterfly_dit(S, U, V, &x, &y);
            a[ie] = x;
            a[io] = y;
        }

    }
}


// NTT and INTT for Single thread 256 point
void ntt_256(uint32_t *x, uint32_t *psis) {
    uint32_t xe[n], xo[n];
    uint32_t i;
    for ( i = 0; i < n; i++) {
        xe[i] = x[2 * i];
        xo[i] = x[2 * i + 1];
    };
    ct_ntt(xe, psis);
    ct_ntt(xo, psis);
    for ( i = 0; i < n; i++) {
        x[i] = xe[i];
        x[i + n] = xo[i];
    };
}

void ntt_512(uint32_t *x, uint32_t *psis) {
    uint32_t xe[n], xo[n];
    uint32_t i;
    for ( i = 0; i < n; i++) {
        xe[i] = x[2 * i];
        xo[i] = x[2 * i + 1];
    };
    ntt_256(xe, psis);
    ntt_256(xo, psis);
    for ( i = 0; i < n; i++) {
        x[i] = xe[i];
        x[i + n] = xo[i];
    };
}
