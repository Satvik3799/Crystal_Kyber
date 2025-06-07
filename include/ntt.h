#ifndef NTT_H
#define NTT_H

#include <defs.h>


void ct_ntt(uint32_t *a, uint32_t *psis);
void ntt_256(uint32_t *x, uint32_t *psis);
void ntt_thread(void* args);
void ntt_top(uint32_t *x, uint32_t *psis);



#endif