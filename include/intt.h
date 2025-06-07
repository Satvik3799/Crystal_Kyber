#ifndef INTT_H
#define INTT_H

#include <defs.h>

void gs_intt(uint32_t *a, uint32_t *inv_psis);
void intt_256(uint32_t *y, uint32_t *inv_psis);
void intt_thread(void* args);
void intt_top(uint32_t *x, uint32_t *psis);
void intt_512(uint32_t *y, uint32_t *inv_psis);

#endif