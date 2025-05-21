#ifndef KYBER_H
#define KYBER_H

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>


#include <cortos.h>
#include <thread_channel.h>
#include <ajit_access_routines.h>

#include "Crystal_Kyber.h"
#include "utils.h"
#include "ntt.h"
#include "intt.h"


void key_gen(uint32_t scap[2][256], uint32_t bcap[2][256], uint32_t psis[128], uint32_t pwmf[128]);
void encrypt(uint32_t *m, uint32_t b[2][256], uint32_t *psis, uint32_t *inv_psis, uint32_t *pwmf, uint32_t u[2][256], uint32_t *v);
void decrypt(uint32_t s[2][256], uint32_t u[2][256], uint32_t *v, uint32_t *psis, uint32_t *inv_psis, uint32_t *pwmf, uint32_t *d);

#endif