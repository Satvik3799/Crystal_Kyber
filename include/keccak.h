
#ifndef keccak_H
#define keccak_H


#include <defs.h>

/* === Constants and permutations for Keccak‐f[1600] (FIPS 202) === */
#define KECCAK_ROUNDS 24


/* === Constants and permutations for Keccak‐f[1600] (FIPS 202) === */
#define KECCAK_ROUNDS 24

static const uint64_t RC[KECCAK_ROUNDS] = {
    0x0000000000000001ULL, 0x0000000000008082ULL, 0x800000000000808aULL,
    0x8000000080008000ULL, 0x000000000000808bULL, 0x0000000080000001ULL,
    0x8000000080008081ULL, 0x8000000000008009ULL, 0x000000000000008aULL,
    0x0000000000000088ULL, 0x0000000080008009ULL, 0x000000008000000aULL,
    0x000000008000808bULL, 0x800000000000008bULL, 0x8000000000008089ULL,
    0x8000000000008003ULL, 0x8000000000008002ULL, 0x8000000000000080ULL,
    0x000000000000800aULL, 0x800000008000000aULL, 0x8000000080008081ULL,
    0x8000000000008080ULL, 0x0000000080000001ULL, 0x8000000080008008ULL
};

static const unsigned rhoOffsets[5][5] = {
    {  0, 36,  3, 41, 18 },
    {  1, 44, 10, 45,  2 },
    { 62,  6, 43, 15, 61 },
    { 28, 55, 25, 21, 56 },
    { 27, 20, 39,  8, 14 }
};

static const unsigned piX[5][5] = {
    {0, 3, 1, 4, 2},
    {1, 4, 2, 0, 3},
    {2, 0, 3, 1, 4},
    {3, 1, 4, 2, 0},
    {4, 2, 0, 3, 1}
};
static const unsigned piY[5][5] = {
    {0, 0, 0, 0, 0},
    {1, 1, 1, 1, 1},
    {2, 2, 2, 2, 2},
    {3, 3, 3, 3, 3},
    {4, 4, 4, 4, 4}
};

static const unsigned chiX[2][5] = {
    {1, 2, 3, 4, 0},
    {2, 3, 4, 0, 1}
};

typedef uint64_t lane_t;


static void keccakF1600(lane_t A[5][5]);
void keccak(
    const uint8_t *input, size_t inLen,
    uint8_t delim,
    uint8_t *output, size_t outLen,
    unsigned rate, unsigned capacity
);
void shake128(
    const uint8_t *input, size_t inputLen,
    uint16_t *out256  // out256[256] buffer
);

void generate_A(
    const uint8_t seed[32],
    unsigned k,
    uint16_t *Aout  // must be allocated with k*k*256 entries
);

#endif