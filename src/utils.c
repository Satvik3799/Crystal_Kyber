#include <defs.h>

static const uint32_t ALLOWED_VALUES[5] = { 0, 1, 2, 3, 4};

void generate_2D(uint32_t r[2][256]) {
    for (uint32_t i = 0; i < 2; ++i)
        for (uint32_t j = 0; j < 256; ++j)
            r[i][j] = ALLOWED_VALUES[rand() % 5];
};

void generate_1D(uint32_t r1[256]) {
    for (uint32_t j = 0; j < 256; ++j)
        r1[j] = ALLOWED_VALUES[rand() % 5];
}

uint32_t bit_reverse(uint32_t num, uint32_t logn) {
    uint32_t rev_num = 0;
    uint32_t i;
    for (i = 0; i < logn; i++) {
        if ((num >> i) & 1) {
            rev_num |= 1 << (logn - 1 - i);
        }
    }//
    return rev_num;
}

uint32_t barret_reduction(uint64_t c1) {
    uint32_t p = 0;
    uint32_t m = 5039;
    // uint32_t k = 24;
    uint64_t t123 = (uint64_t)m * c1;
    uint32_t t = t123 >> 24;
    uint64_t ta = (uint64_t)q * t;
    uint32_t c = c1 - ta;
    if (c > q) {
        c = c - q;
    }//
    return c;
}

void addr_gen(uint32_t s, uint32_t i, uint32_t l, uint32_t v, uint32_t *ie_r, uint32_t *io_r, uint32_t *iw) {
    uint32_t j = s >> (l - 1 - i);
    uint32_t z = s & ((v >> i) - 1);
    *ie_r = j * (1 << (l - i)) + z;
    *io_r = *ie_r + (1 << (l - i - 1));
    *iw = (1 << i) + (s >> (l - i - 1));
}

void butterfly_dit(uint32_t w, uint32_t u, uint32_t v, uint32_t *x, uint32_t *y) {
    uint32_t v1 = barret_reduction((uint64_t)w * v % q); //
    *x = (u + v1) % q;
    *y = (u - v1 + q) % q;
}

void butterfly_dif(uint32_t w, uint32_t u, uint32_t v, uint32_t *x, uint32_t *y) {
    *x = (u + v) % q;
    uint32_t y1 = (u - v + q) % q;
    *y = barret_reduction((uint32_t)w * y1 % q); //
}


//Output is y3 and y1, y2, pwmf are input arrays
void point_wise_mult(uint32_t *y3, uint32_t *y1, uint32_t *y2, uint32_t *pwmf) {
    uint32_t y1e[n], y1o[n], y2e[n], y2o[n], y3e[n], y3o[n];
    uint32_t i;

    for ( i = 0; i < n; i++) {
        y1e[i] = y1[i];
        y1o[i] = y1[i + n];
        y2e[i] = y2[i];
        y2o[i] = y2[i + n];
    }; //
    for ( i = 0; i < n; i++) {
        y3e[i] = ((uint32_t)y1e[i] * y2e[i] % q + (uint32_t)y1o[i] * y2o[i] % q * pwmf[i] % q) % q;
        y3o[i] = ((uint32_t)y1e[i] * y2o[i] % q + (uint32_t)y1o[i] * y2e[i] % q) % q;
    }; 
    for ( i = 0; i < n; i++) {
        y3[i] = y3e[i];
        y3[i + n] = y3o[i];
    }; 

};



void gen_tf(uint32_t *psis, uint32_t *inv_psis) {
    uint32_t logn = (uint32_t)log2(n);
    uint32_t tmp1[n], tmp2[n], positions[n];
    uint32_t x;
    for ( x = 0; x < n; x++) {
        positions[x] = bit_reverse(x, logn);
    }; 

    uint32_t psi = 1, inv_psi = 1;
    for ( x = 0; x < n; x++) {
        tmp1[x] = psi;
        tmp2[x] = inv_psi;
        psi = (uint64_t)psi * psin % q;
        inv_psi = (uint64_t)inv_psi * inv_psin % q;
    }; 

    for ( x = 0; x < n; x++) {
        psis[x] = tmp1[positions[x]];
        inv_psis[x] = tmp2[positions[x]];
    }; 

};


void gen_pwmf(uint32_t *pwmf) {
    uint32_t logn = (uint32_t)log2(n);
    uint32_t i;
    for ( i = 0; i < n; i++) {
        uint32_t exponent = 2 * bit_reverse(i, logn) + 1;
        uint32_t val = 1;
        uint32_t base = psin;
        while (exponent > 0) {
            if (exponent % 2 == 1) {
                val = (val * base) % q;
            }
            base = (base * base) % q;
            exponent /= 2;
        } //

        pwmf[i] = val;
    } 
}

