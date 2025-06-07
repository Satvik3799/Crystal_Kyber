#include <defs.h>

// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175
// #define k 2


uint32_t A[2][2][256]; //Global A for it to be avaible to all functions

void key_gen(uint32_t scap[2][256], uint32_t bcap[2][256]) {
    
    //Public Matrix A has been already generated
    uint32_t e[2][256];
    generate_2D(e);

    uint32_t s[2][256];
    generate_2D(s);


    uint32_t i;

    // Step 1: Generate Twiddle Factors
    uint32_t inv_psis[n], psis[n];
    gen_tf(psis, inv_psis);

    // Step 2: Generate Point-wise Multiplication Factors
 
    uint32_t pwmf[n];
    gen_pwmf(pwmf);

    // Step 3: Compute NTT for s and e
    ntt_256(s[0], psis);
    ntt_256(s[1], psis); 
    ntt_256(e[0], psis);
    ntt_256(e[1], psis);

    // Step 4: Compute tcap
    uint32_t tcap[2][2][256];
    point_wise_mult(tcap[0][0], A[0][0], s[0], pwmf);     
    point_wise_mult(tcap[0][1], A[0][1], s[1], pwmf);
    point_wise_mult(tcap[1][0], A[1][0], s[0], pwmf);
    point_wise_mult(tcap[1][1], A[1][1], s[1], pwmf);


    // Step 5: Compute bcap
    for ( i = 0; i < 256; i++) {
        bcap[0][i] = (tcap[0][0][i] + tcap[0][1][i] + e[0][i]) % q;
        bcap[1][i] = (tcap[1][0][i] + tcap[1][1][i] + e[1][i]) % q;
    }

    // Compute scap
    for ( i = 0; i < 256; i++) {
        scap[0][i] = s[0][i];
        scap[1][i] = s[1][i];
    }

}

void encrypt(uint32_t *m, uint32_t b[2][256], uint32_t *psis, uint32_t *inv_psis, uint32_t *pwmf, uint32_t u[2][256], uint32_t *v) {
  
    uint32_t r[2][256];
    generate_2D(r);


    uint32_t e1[2][256];
    generate_2D(e1);
   
    uint32_t e2[256];
    generate_1D(e2);

    uint32_t tcap[2][2][256];
    uint32_t ucap[2][256];
    uint32_t bx[2][256];
    uint32_t by[256];
    uint32_t bz[256];
    uint32_t i;
    
    // Compute the NTT of r
    ntt_256(r[0], psis);
    ntt_256(r[1], psis);

  
    // Compute the point-wise multiplications
    point_wise_mult(tcap[0][0], r[0], A[0][0], pwmf);
    point_wise_mult(tcap[1][0], r[0], A[0][1], pwmf);
    point_wise_mult(tcap[0][1], r[1], A[1][0], pwmf);
    point_wise_mult(tcap[1][1], r[1], A[1][1], pwmf);

    // Combine the results
    for ( i = 0; i < 256; i++) {
        ucap[0][i] = (tcap[0][0][i] + tcap[0][1][i]) % q;
        ucap[1][i] = (tcap[1][0][i] + tcap[1][1][i]) % q;
    }

    // Compute the inverse NTT of ucap
    intt_256(ucap[0], inv_psis);
    intt_256(ucap[1], inv_psis);

    // Add the error terms
    for ( i = 0; i < 256; i++) {
        u[0][i] = (ucap[0][i] + e1[0][i]) % q;
        u[1][i] = (ucap[1][i] + e1[1][i]) % q;
    }

    // Compute the point-wise multiplications for bx
    point_wise_mult(bx[0], r[0], b[0], pwmf);
    point_wise_mult(bx[1], r[1], b[1], pwmf);

    // Combine the results for by
    for ( i = 0; i < 256; i++) {
        by[i] = (bx[0][i] + bx[1][i]) % q;
    }

    // Compute the inverse NTT of by
    intt_256(by, inv_psis);

    // Compute the final v
    for ( i = 0; i < 256; i++) {
        bz[i] = by[i];
        v[i] = (bz[i] + e2[i] + m[i]) % q;
    }
}

void decrypt(uint32_t s[2][256], uint32_t u[2][256], uint32_t *v, uint32_t *psis, uint32_t *inv_psis, uint32_t *pwmf, uint32_t *d) {
    // uint32_t ucap[2][256];
    uint32_t ux[2][256];
    uint32_t uy[256];
    uint32_t uz[256];
    uint32_t i;

 
    // Compute the NTT of u
    ntt_256(u[0], psis);
    ntt_256(u[1], psis);

 

    // Compute the point-wise multiplications
    point_wise_mult(ux[0], u[0], s[0], pwmf);
    point_wise_mult(ux[1], u[1], s[1], pwmf);

 
    // Combine the results for uy
    for ( i = 0; i < 256; i++) {
        uy[i] = (ux[0][i] + ux[1][i]) % q;
    }

    // Compute the inverse NTT of uy
    intt_256(uy, inv_psis);

    // Compute the final decrypted message d
    for ( i = 0; i < 256; i++) {
        uz[i] = uy[i];
        d[i] = (v[i] - uz[i] + q) % q;  // Ensure non-negative result
    }
}


int main() {
    
    uint32_t i,j;
    
    // Allocate memory for the twiddle factors and point-wise multiplication factors
    uint32_t psis[128];
    uint32_t inv_psis[128];
    uint32_t pwmf[128];

    // Generate pre-computed factors
    gen_tf(psis, inv_psis);
    gen_pwmf(pwmf);
    

    // Generate Public Matrix A
    srand((unsigned)time(NULL)); //To generate random error arrays
    uint8_t seed[32];
    for (int i = 0; i < 32; i++) seed[i] = (uint8_t)i;
    unsigned k = 2;
    // Allocate a flat buffer of k*k*256 uint16_t elements
    uint16_t *A = malloc(k * k * 256 * sizeof(uint16_t));
    if (!A) {
        fprintf(stderr, "Allocation failed\n");
        return 1;
    }
    generate_A(seed, k, A);

    //Pritnt Public Matrix A
    printf("A Array:");

    for (unsigned i = 0; i < k; i++) {
        for (unsigned j = 0; j < k; j++) {
            printf("Sub-array A[%u][%u]:\n", i, j);
            // Compute pointer to the (i,j)-th block of 256 elements
            uint16_t *sub = A + ((i * k + j) * 256);
            for (unsigned t = 0; t < 256; t++) {
                printf("%5u,", sub[t]);
                if ((t + 1) % 16 == 0) {
                    printf("\n");
                }
            }
            printf("\n");
        }
    }

    // Generate Private Key (s) and Public Key (b)
    uint32_t scap[2][256];
    uint32_t bcap[2][256];
    key_gen(scap, bcap);

     // Display private key (scap) and public key (bcap)
    printf("Private Key (scap):\n");
    for ( i = 0; i < 2; i++) {
        for ( j = 0; j < 256; j++) {
            printf("%u ", scap[i][j]);
        }
        printf("\n");
    }

    printf("\nPublic Key (bcap):\n");
    for ( i = 0; i < 2; i++) {
        for ( j = 0; j < 256; j++) {
            printf("%u ", bcap[i][j]);
        }
        printf("\n");
    }

    //input message
    uint32_t m[n2];
    
    //Fixed input
    // for (uint32_t i = 0; i < n2; i++) {
    //     if (i < 128) {
    //         m[i] = 0;
    //     } else {
    //         m[i] = 1;
    //     }
    // }

    //Random input
    // Seed the random number generator
    srand(time(0));

    for ( i = 0; i < n2; i++) {
        m[i] = rand() % 2; // Generate either 0 or 1 randomly
    }

    // Initialize the array with values from 0 to 255
    // for (uint32_t i = 0; i < n2; i++) {
    //     m[i] = i;
    // }

    // Print the original message array
    printf("Original Message:\n");
    for ( i = 0; i < 256; i++) {
        printf("%u ", m[i]);
    }
    printf("\n");

    // Encryption
    uint32_t u[2][256];
    uint32_t v[256];
    uint32_t encoded_m[n2];
    for ( i = 0; i < n2; i++) {
        encoded_m[i] = 1664 * m[i];
    }
    encrypt(encoded_m, bcap,psis, inv_psis, pwmf, u, v);

    // Display encrypted message (u and v)
    printf("\nEncrypted Message (u and v):\n");
    printf("u:\n");
    for ( i = 0; i < 2; i++) {
        for ( j = 0; j < 256; j++) {
            printf("%u ", u[i][j]);
        }
        printf("\n");
    }
    printf("v:\n");
    for ( i = 0; i < 256; i++) {
        printf("%u ", v[i]);
    }
    printf("\n");

    // Decryption
    uint32_t d[256];
    decrypt(scap, u, v, psis, inv_psis, pwmf, d);

    // Decode message
    uint32_t md[256];
    for ( i = 0; i < 256; i++) {
        if (d[i] > 832 && d[i] < 2467) {
            md[i] = 1;
        } else {
            md[i] = 0;
        }
    }

    // Display decrypted message
    printf("\nDecrypted Message:\n");
    for ( i = 0; i < 256; i++) {
        printf("%u ", md[i]);
    }
    printf("\n");


    // Check if original message and decoded message are the same
    bool match = true;
    for ( i = 0; i < n2; i++) {
        if (m[i] != md[i]) {
            match = false;
            break;
        }
    }
    printf(" \n");
    printf(" \n");
    printf("******************* \n");
    printf("Original and decoded messages match: %s\n", match ? "true" : "false");
    printf("******************* \n");

    return 0;
}

