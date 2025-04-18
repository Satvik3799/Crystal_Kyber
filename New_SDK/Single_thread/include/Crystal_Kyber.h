#ifndef KYBER_H
#define KYBER_H

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <cortos.h>
#include "Crystal_Kyber.h"
#include "utils.h"
#include "ntt.h"
#include "intt.h"


#include <ajit_access_routines.h>


void key_gen(uint16_t scap[2][256], uint16_t bcap[2][256], uint16_t psis[128], uint16_t pwmf[128]);
void encrypt(uint16_t *m, uint16_t b[2][256], uint16_t *psis, uint16_t *inv_psis, uint16_t *pwmf, uint16_t u[2][256], uint16_t *v);
void decrypt(uint16_t s[2][256], uint16_t u[2][256], uint16_t *v, uint16_t *psis, uint16_t *inv_psis, uint16_t *pwmf, uint16_t *d);

#endif