#ifndef INTT_H
#define INTT_H

#include "utils.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <cortos.h>

#include <ajit_access_routines.h>

#include "Crystal_Kyber.h"
#include "utils.h"
#include "ntt.h"
#include "intt.h"


void gs_intt(uint16_t *a, uint16_t *inv_psis);
void intt_256(uint16_t *y, uint16_t *inv_psis);

#endif