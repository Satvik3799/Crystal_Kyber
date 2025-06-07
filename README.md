# Crystal\_Kyber

Crystal Kyber C implementation.

## Build & Run

```bash
# Compile:
gcc -I ./ -I include -I src \
    Crystal_Kyber.c src/*.c \
    -o Crystal_Kyber

# Run:
./Crystal_Kyber
```

## Project Structure

```text
.
├── Crystal_Kyber.c      # Top-level driver & API
├── defs.h               # Global constants & common includes
├── include/             # Public headers
│   ├── intt.h           # INTT (inverse NTT) prototypes
│   ├── keccak.h         # Keccak/SHAKE prototypes
│   ├── ntt.h            # NTT prototypes
│   └── utils.h          # Utility functions
└── src/                 # Module implementations
    ├── intt.c           # INTT routines
    ├── keccak.c         # Keccak–F, SHAKE, and matrix-A generation
    ├── ntt.c            # Forward NTT routines
    └── utils.c          # Helpers: randomness, Barrett reduction, butterflies, etc.
```

## Files and Key Functions

* **`defs.h`**

  * Defines global parameters (e.g., `q`, `n`, twiddle factors) and includes common headers.

* **`include/intt.h`**

  * Declarations for inverse NTT routines:

    ```c
    void gs_intt(uint32_t *a, uint32_t *inv_psis);
    void intt_256(uint32_t *y, uint32_t *inv_psis);
    void intt_top(uint32_t *x, uint32_t *psis);
    ```

* **`include/ntt.h`**

  * Declarations for forward NTT routines:

    ```c
    void ct_ntt(uint32_t *a, uint32_t *psis);
    void ntt_256(uint32_t *x, uint32_t *psis);
    void ntt_top(uint32_t *x, uint32_t *psis);
    ```

* **`include/keccak.h`**

  * Keccak-F\[1600], SHAKE128, and public-matrix generation:

    ```c
    static void keccakF1600(lane_t A[5][5]);
    void keccak(const uint8_t *input, size_t inLen, uint8_t delim,
                uint8_t *output, size_t outLen,
                unsigned rate, unsigned capacity);
    void shake128(const uint8_t *input, size_t inputLen,
                  uint16_t *out256);
    void generate_A(const uint8_t seed[32], unsigned k, uint16_t *Aout);
    ```

* **`include/utils.h`**

  * Miscellaneous helpers:

    ```c
    void generate_r(uint16_t r[2][256]);
    void generate_r1(uint16_t r1[256]);
    uint32_t bit_reverse(uint32_t num, uint32_t logn);
    uint32_t barret_reduction(uint64_t c1);
    void addr_gen(uint32_t s, uint32_t i, uint32_t l, uint32_t v,
                  uint32_t *ie, uint32_t *io, uint32_t *iw);
    void butterfly_dit(uint32_t w, uint32_t u, uint32_t v,
                       uint32_t *x, uint32_t *y);
    void butterfly_dif(uint32_t w, uint32_t u, uint32_t v,
                       uint32_t *x, uint32_t *y);
    void point_wise_mult(uint32_t *y3, uint32_t *y1,
                         uint32_t *y2, uint32_t *pwmf);
    ```

* **`src/` folder**

  * Contains implementations corresponding to each header file:

    * `intt.c`, `ntt.c`, `keccak.c`, and `utils.c`.

* **`Crystal_Kyber.c`**

  * Top-level driver:

    * `key_gen` – generates key pair.
    * `encrypt` – encrypts message.
    * `decrypt` – recovers message.
    * `main` – orchestrates keygen, encryption/decryption, and prints results.
