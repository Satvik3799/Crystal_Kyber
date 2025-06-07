#include <defs.h>

/* === Keccak‐f[1600] permutation on a 5×5 array of 64‐bit lanes === */
static void keccakF1600(lane_t A[5][5]) {
    for (unsigned round = 0; round < KECCAK_ROUNDS; round++) {
        // --- θ step ---
        lane_t C[5];
        for (unsigned x = 0; x < 5; x++) {
            C[x] = A[x][0] ^ A[x][1] ^ A[x][2] ^ A[x][3] ^ A[x][4];
        }

        
        lane_t D[5];
        for (unsigned x = 0; x < 5; x++) {
            lane_t tmp = C[(x + 4) % 5] ^ ((C[(x + 1) % 5] << 1) | (C[(x + 1) % 5] >> (64 - 1)));
            D[x] = tmp;
        }
        for (unsigned x = 0; x < 5; x++) {
            for (unsigned y = 0; y < 5; y++) {
                A[x][y] ^= D[x];
            }
        }

        // --- ρ & π ---
        lane_t B[5][5];
        for (unsigned x = 0; x < 5; x++) {
            for (unsigned y = 0; y < 5; y++) {
                unsigned r = rhoOffsets[x][y];
                lane_t v = A[x][y];
                lane_t rotated = (v << r) | (v >> (64 - r));
                unsigned x2 = piX[x][y];
                unsigned y2 = piY[x][y];
                B[x2][y2] = rotated;
            }
        }

        // --- χ ---
        for (unsigned x = 0; x < 5; x++) {
            for (unsigned y = 0; y < 5; y++) {
                lane_t t0 = B[x][y];
                lane_t t1 = B[chiX[0][x]][y];
                lane_t t2 = B[chiX[1][x]][y];
                A[x][y] = t0 ^ ((~t1) & t2);
            }
        }

        // --- ι (iota) ---
        A[0][0] ^= RC[round];
    }
}

/* === Sponge function Keccak(rate, cap): absorb, pad, squeeze === */
void keccak(
    const uint8_t *input, size_t inLen,
    uint8_t delim,
    uint8_t *output, size_t outLen,
    unsigned rate, unsigned capacity
) {
    uint8_t S[200];
    memset(S, 0, 200);

    unsigned rateBytes = rate >> 3;
    size_t inOffset = 0;

    // Absorb
    while (inOffset < inLen) {
        size_t chunk = (inLen - inOffset < rateBytes) ? (inLen - inOffset) : rateBytes;
        for (size_t i = 0; i < chunk; i++) {
            S[i] ^= input[inOffset + i];
        }
        inOffset += chunk;
        if (chunk == rateBytes) {
            // Permute
            lane_t A[5][5];
            // Load S → A
            for (unsigned x = 0; x < 5; x++) {
                for (unsigned y = 0; y < 5; y++) {
                    uint64_t lane = 0;
                    for (unsigned b = 0; b < 8; b++) {
                        lane |= ((uint64_t)S[8 * (x + 5 * y) + b]) << (8 * b);
                    }
                    A[x][y] = lane;
                }
            }
            keccakF1600(A);
            // Store A → S
            for (unsigned x = 0; x < 5; x++) {
                for (unsigned y = 0; y < 5; y++) {
                    uint64_t lane = A[x][y];
                    for (unsigned b = 0; b < 8; b++) {
                        S[8 * (x + 5 * y) + b] = (uint8_t)((lane >> (8 * b)) & 0xFF);
                    }
                }
            }
        }
    }

    // Padding
    S[inLen % rateBytes] ^= delim;
    if ((delim & 0x80) != 0 && (inLen % rateBytes) == (rateBytes - 1)) {
        lane_t A[5][5];
        for (unsigned x = 0; x < 5; x++) {
            for (unsigned y = 0; y < 5; y++) {
                uint64_t lane = 0;
                for (unsigned b = 0; b < 8; b++) {
                    lane |= ((uint64_t)S[8 * (x + 5 * y) + b]) << (8 * b);
                }
                A[x][y] = lane;
            }
        }
        keccakF1600(A);
        for (unsigned x = 0; x < 5; x++) {
            for (unsigned y = 0; y < 5; y++) {
                uint64_t lane = A[x][y];
                for (unsigned b = 0; b < 8; b++) {
                    S[8 * (x + 5 * y) + b] = (uint8_t)((lane >> (8 * b)) & 0xFF);
                }
            }
        }
    }
    S[rateBytes - 1] ^= 0x80;

    {
        // Final permute
        lane_t A[5][5];
        for (unsigned x = 0; x < 5; x++) {
            for (unsigned y = 0; y < 5; y++) {
                uint64_t lane = 0;
                for (unsigned b = 0; b < 8; b++) {
                    lane |= ((uint64_t)S[8 * (x + 5 * y) + b]) << (8 * b);
                }
                A[x][y] = lane;
            }
        }
        keccakF1600(A);
        for (unsigned x = 0; x < 5; x++) {
            for (unsigned y = 0; y < 5; y++) {
                uint64_t lane = A[x][y];
                for (unsigned b = 0; b < 8; b++) {
                    S[8 * (x + 5 * y) + b] = (uint8_t)((lane >> (8 * b)) & 0xFF);
                }
            }
        }
    }

    // Squeeze
    size_t outOffset = 0;
    while (outOffset < outLen) {
        size_t chunk = (outLen - outOffset < rateBytes) ? (outLen - outOffset) : rateBytes;
        memcpy(output + outOffset, S, chunk);
        outOffset += chunk;
        if (outOffset < outLen) {
            lane_t A[5][5];
            for (unsigned x = 0; x < 5; x++) {
                for (unsigned y = 0; y < 5; y++) {
                    uint64_t lane = 0;
                    for (unsigned b = 0; b < 8; b++) {
                        lane |= ((uint64_t)S[8 * (x + 5 * y) + b]) << (8 * b);
                    }
                    A[x][y] = lane;
                }
            }
            keccakF1600(A);
            for (unsigned x = 0; x < 5; x++) {
                for (unsigned y = 0; y < 5; y++) {
                    uint64_t lane = A[x][y];
                    for (unsigned b = 0; b < 8; b++) {
                        S[8 * (x + 5 * y) + b] = (uint8_t)((lane >> (8 * b)) & 0xFF);
                    }
                }
            }
        }
    }
}

/* === SHAKE128 XOF: consume input, produce 256 uint16_t values (<2^12) === */
void shake128(
    const uint8_t *input, size_t inputLen,
    uint16_t *out256  // out256[256] buffer
) {
    // Step 1: get 512 raw output bytes from Keccak
    uint8_t buf512[512];
    keccak(input, inputLen, 0x1F, buf512, 512, 1344, 256);

    // Step 2: convert each pair (buf512[2*i], buf512[2*i+1]) into 12-bit
    for (unsigned i = 0; i < 256; i++) {
        uint16_t lo = buf512[2 * i];
        uint16_t hi = buf512[2 * i + 1];
        out256[i] = (uint16_t)((lo + (hi << 8)) >> 4);
    }
}

/* === generate_A: fill Aout array with k×k blocks of 256 uint16_t values each === */
void generate_A(
    const uint8_t seed[32],
    unsigned k,
    uint16_t *Aout  // must be allocated with k*k*256 entries
) {
    uint8_t extInput[34];
    memcpy(extInput, seed, 32);
    for (unsigned i = 0; i < k; i++) {
        for (unsigned j = 0; j < k; j++) {
            extInput[32] = (uint8_t)j;
            extInput[33] = (uint8_t)i;
            shake128(extInput, 34, &Aout[(i * k + j) * 256]);
        }
    }
}

/* === Example of usage: === */

// int main(void) {
//     uint8_t seed[32];
//     for (int i = 0; i < 32; i++) seed[i] = (uint8_t)i;
//     unsigned k = 2;
//     // Allocate a flat buffer of k*k*256 uint16_t elements
//     uint16_t *A = malloc(k * k * 256 * sizeof(uint16_t));
//     if (!A) {
//         fprintf(stderr, "Allocation failed\n");
//         return 1;
//     }
// generate_A(seed, k, A);
//     // (Assume generate_A(seed, k, A) fills A with 2*2*256 values)

//     for (unsigned i = 0; i < k; i++) {
//         for (unsigned j = 0; j < k; j++) {
//             printf("Sub-array A[%u][%u]:\n", i, j);
//             // Compute pointer to the (i,j)-th block of 256 elements
//             uint16_t *sub = A + ((i * k + j) * 256);
//             for (unsigned t = 0; t < 256; t++) {
//                 printf("%5u,", sub[t]);
//                 if ((t + 1) % 16 == 0) {
//                     printf("\n");
//                 }
//             }
//             printf("\n");
//         }
//     }

//     free(A);
//     return 0;
// }

