#ifndef INTT_H
#define INTT_H

#include "utils.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#include "utils.h"
#include "ntt.h"
#include "intt.h"


void gs_intt(uint32_t *a, uint32_t *inv_psis);
void intt_256(uint32_t *y, uint32_t *inv_psis);
void intt_512(uint32_t *y, uint32_t *inv_psis);

#endif