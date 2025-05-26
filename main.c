#include <stdbool.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

//satvik headers
#include "utils.h"
#include "ntt.h"
#include "intt.h"
#include "Crystal_Kyber.h"


// Define necessary constants
#define q 3329
#define n2 256
#define n 128
#define inv_n 3303
#define psin 17
#define inv_psin 1175
#define k 2

uint32_t main()
{

    uint32_t i,j;

    // Generate pre-computed factors

    uint32_t psis[128], inv_psis[128], pwmf[128];
    gen_pwmf(pwmf);

    gen_tf(psis, inv_psis);

    printf("\n[INFO]         :           Pre-computed factors generated.\n");

    // Print the PWMF array
    printf("[INFO]           :           PWMF array:\n");
    for (i = 0; i < 5; i++) {
        printf("%u ", pwmf[i]);
    }
    printf("\n");
    
    //  Print the PSIS array
    printf("[INFO]           :           PSIS array\n");
    for (i = 0; i < 5; i++) {
        printf("%u, ", psis[i]);
    }
    printf("\n");

    // Print the INV_PSIS array
    printf("[INFO]           :           INV_PSIS array:\n");
    for (i = 0; i < 5; i++) {
        printf("%u ", inv_psis[i]);
    }
    printf("\n");
    
    // Generate Private Key (s) and Public Key (b)
    uint32_t scap[2][256];
    uint32_t bcap[2][256];

    t00_0 =__ajit_get_clock_time();
    key_gen(scap, bcap, psis, pwmf);
    t00_1 = __ajit_get_clock_time();
	printf("[RESULT]              :           Key generation Time: %f\n", (double) (t00_1 - t00_0));
    
    printf("[INFO]           :           Public Key and Secret Key generated!\n");

    //  Display private key (scap) and public key (bcap)
    printf("[RESULT]           :            Private Key (scap):\n");
    for ( i = 0; i < 2; i++) {
        for ( j = 0; j < 5; j++) {
            printf("%u ", scap[i][j]);
        }
        printf("\n");
    }
    printf("\n");

    printf("\n[RESULT]           :            Public Key (bcap):\n");
    for ( i = 0; i < 2; i++) {
        for ( j = 0; j < 5; j++) {
            printf("%u ", bcap[i][j]);
        }
        printf("\n");
    }
    printf("\n");

    // input message
    uint32_t m[n2] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    };

    // for (i = 0; i < n2; i++) {
    //     if (i < 64) {
    //         m[i] = 0;
    //     } else if (i > 64 & i < 128)  {
    //         m[i] = 1;
    //     }
    //     else if (i > 128 & i < 192) {
    //         m[i] = 0;
    //     } else if (i > 192 & i < 256)  {
    //         m[i] = 1;
    //     }
    // }

    // for (i = 0; i < n2; i++) {
    //         m[i] = 0;
    // }

    

    // for ( i = 0; i < n2; i++) {
    //     m[i] = rand() % 2; // Generate either 0 or 1 randomly
    // }

    // // Initialize the array with values from 0 to 255
    // for (uint32_t i = 0; i < n2; i++) {
    //     m[i] = i;
    // }

    // // Print the original message array

    printf("\n");
    printf("---------------------------------------------------------------------------------\n");
    printf("Original Message:\n");
    printf("---------------------------------------------------------------------------------\n");
    for ( i = 0; i < 256; i++) {
        printf("%u ", m[i]);
    }
    printf("\n");

    printf("\n");
    printf("---------------------------------------------------------------------------------\n");
    printf("\n");

    // Encryption
    uint32_t u[2][256];
    uint32_t v[256];
    uint32_t encoded_m[n2];
    for ( i = 0; i < n2; i++) {
        encoded_m[i] = 1664 * m[i];
    }

    printf("\n");
    printf("---------------------------------------------------------------------------------\n");
    printf("[INFO]             :             Encryption of the message started.\n");
    printf("---------------------------------------------------------------------------------\n");

    
    t00_0 =__ajit_get_clock_time();
    encrypt(encoded_m, bcap, psis, inv_psis, pwmf, u, v);
    t00_1 = __ajit_get_clock_time();
	printf("[RESULT]           :           Encryption Time: %f\n", (double) (t00_1 - t00_0));
    

    // Display encrypted message (u and v)
    printf("[RESULT]           :           Encrypted Message u\n");
    for ( i = 0; i < 2; i++) {
        for ( j = 0; j < 5; j++) {
            printf("%u ", u[i][j]);
        }
        printf("\n");
    }
    printf("\n");


    printf("[RESULT]           :           Encrypted Message v\n");
    for ( i = 0; i < 5; i++) {
        printf("%u ", v[i]);
    }

    printf("\n");
    printf("---------------------------------------------------------------------------------\n");
    printf("\n");

    // Decryption
    uint32_t d[256];
    printf("---------------------------------------------------------------------------------\n");
    printf("[INFO]              :           Decryption of the message started.\n");
    printf("---------------------------------------------------------------------------------\n");
    
    t00_0 =__ajit_get_clock_time();
    decrypt(scap, u, v, psis, inv_psis, pwmf, d);
    t00_1 = __ajit_get_clock_time();
	printf("[RESULT]           :           Decryption Time: %f %f\n", (double) (t00_1 - t00_0));
    


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
    printf("[RESULT]           :           Decrypted Message.\n");
    for ( i = 0; i < 256; i++) {
        printf("%u ", md[i]);
    }
    
    printf("\n");
    printf("---------------------------------------------------------------------------------\n");
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
    printf("---------------------------------------------------------------------------------\n");
    printf("[RESULT]           :             Original and decoded messages match: %s\n", match ? "true" : "false");
    printf("---------------------------------------------------------------------------------\n");

    return(1);

}

