#include <stdio.h>
#include <stdint.h>

void point_wise_mult(uint32_t *y1, uint32_t *y2, uint32_t *pwmf, uint32_t *y3, uint32_t q, uint32_t n) {
    uint32_t y1e[n], y1o[n], y2e[n], y2o[n], y3e[n], y3o[n];
    for (uint32_t i = 0; i < n; i++) {
        y1e[i] = y1[i];
        y1o[i] = y1[i + n];
        y2e[i] = y2[i];
        y2o[i] = y2[i + n];
    }
    for (uint32_t i = 0; i < n; i++) {
        y3e[i] = ((uint64_t)y1e[i] * y2e[i] % q + (uint64_t)y1o[i] * y2o[i] % q * pwmf[i] % q) % q;
        y3o[i] = ((uint64_t)y1e[i] * y2o[i] % q + (uint64_t)y1o[i] * y2e[i] % q) % q;
    }
    for (uint32_t i = 0; i < n; i++) {
        y3[i] = y3e[i];
        y3[i + n] = y3o[i];
    }
}

int main() {
    uint32_t n = 128;
    uint32_t q = 1000;

    uint32_t y1[256];
    uint32_t y2[256];
    uint32_t pwmf[128];
    uint32_t y3[256];

    // Initialize static input arrays
    for (uint32_t i = 0; i < 256; i++) {
        y1[i] = i;
        y2[i] = i + 256;
    }
    for (uint32_t i = 0; i < 128; i++) {
        pwmf[i] = i % 10;
    }

    // Print the input arrays
    printf("Input array y1:\n");
    for (uint32_t i = 0; i < 256; i++) {
        printf("%u ", y1[i]);
    }
    printf("\n\nInput array y2:\n");
    for (uint32_t i = 0; i < 256; i++) {
        printf("%u ", y2[i]);
    }
    printf("\n\nInput array pwmf:\n");
    for (uint32_t i = 0; i < 128; i++) {
        printf("%u ", pwmf[i]);
    }
    printf("\n");

    // Call the function
    point_wise_mult(y1, y2, pwmf, y3, q, n);

    // Print the result
    printf("Result of point_wise_mult function:\n");
    for (uint32_t i = 0; i < 256; i++) {
        printf("%u ", y3[i]);
    }
    printf("\n");

    return 0;
}
