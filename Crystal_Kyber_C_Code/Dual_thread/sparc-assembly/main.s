	.file	"main.c"
	.section	".text"
	.align 4
	.global barret_reduction
	.type	barret_reduction, #function
	.proc	016
barret_reduction:
	jmp	%o7+8
	 nop
	.size	barret_reduction, .-barret_reduction
	.align 4
	.global addr_gen
	.type	addr_gen, #function
	.proc	020
addr_gen:
	sub	%o2, %o1, %o2
	srl	%o3, %o1, %o3
	add	%o2, -1, %g2
	add	%o3, -1, %o3
	srl	%o0, %g2, %g1
	and	%o3, %o0, %o0
	sll	%g1, %o2, %o2
	add	%o2, %o0, %o2
	st	%o2, [%o4]
	mov	1, %g3
	sll	%g3, %g2, %g2
	add	%o2, %g2, %o2
	st	%o2, [%o5]
	sll	%g3, %o1, %o1
	ld	[%sp+92], %g2
	add	%g1, %o1, %g1
	jmp	%o7+8
	 st	%g1, [%g2]
	.size	addr_gen, .-addr_gen
	.global __umoddi3
	.align 4
	.global butterfly_dit
	.type	butterfly_dit, #function
	.proc	020
butterfly_dit:
	save	%sp, -96, %sp
	mov	0, %o2
	umul	%i2, %i0, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%o1, %i1, %g1
	add	%i1, 3329, %i1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g1, 3329, %g2
	smul	%g2, 3329, %g2
	sub	%g1, %g2, %g1
	st	%g1, [%i3]
	sub	%i1, %o1, %o1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%o1, 3329, %i1
	smul	%i1, 3329, %i1
	sub	%o1, %i1, %o1
	st	%o1, [%i4]
	jmp	%i7+8
	 restore
	.size	butterfly_dit, .-butterfly_dit
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	1080033280
	.long	0
	.align 8
.LC4:
	.long	1105199104
	.long	0
	.section	".text"
	.align 4
	.global ct_ntt
	.type	ct_ntt, #function
	.proc	020
ct_ntt:
	save	%sp, -104, %sp
	sethi	%hi(.LC3), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC3)], %o0
	sethi	%hi(.LC4), %g1
	ldd	[%g1+%lo(.LC4)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L5
	 sethi	%hi(-2147483648), %g1
	fdtoi	%f0, %f8
	st	%f8, [%fp-8]
	ld	[%fp-8], %l4
	add	%l4, -1, %g1
	st	%g1, [%fp-4]
	mov	0, %l3
	cmp	%l4, 0
	be	.L17
	 mov	1, %l5
.L12:
	ld	[%fp-4], %g1
.L15:
	sub	%l4, %l3, %l2
	sub	%g1, %l3, %i3
	sll	%l5, %l3, %i2
	mov	64, %g1
	sll	%l5, %i3, %l0
	srl	%g1, %l3, %l1
	mov	0, %i5
	add	%l1, -1, %l1
.L8:
	and	%i5, %l1, %g2
	srl	%i5, %i3, %g1
	sll	%g1, %l2, %i4
	add	%g1, %i2, %g1
	sll	%g1, 2, %g1
	ld	[%i1+%g1], %g3
	add	%i4, %g2, %i4
	mov	0, %o2
	sll	%i4, 2, %l7
	add	%i4, %l0, %i4
	sll	%i4, 2, %i4
	ld	[%i0+%i4], %o0
	umul	%o0, %g3, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	ld	[%i0+%l7], %l6
	add	%o1, %l6, %g3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g3, 3329, %g4
	smul	%g4, 3329, %g4
	sub	%g3, %g4, %g3
	st	%g3, [%i0+%l7]
	add	%l6, 3329, %g1
	sub	%g1, %o1, %g1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g1, 3329, %g2
	smul	%g2, 3329, %g2
	sub	%g1, %g2, %g1
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L8
	 st	%g1, [%i0+%i4]
	add	%l3, 1, %l3
	cmp	%l3, %l4
	bne	.L15
	 ld	[%fp-4], %g1
.L17:
	jmp	%i7+8
	 restore
.L5:
	fsubd	%f0, %f8, %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-8]
	ld	[%fp-8], %l4
	xor	%l4, %g1, %l4
	add	%l4, -1, %g1
	st	%g1, [%fp-4]
	mov	0, %l3
	cmp	%l4, 0
	bne	.L12
	 mov	1, %l5
	jmp	%i7+8
	 restore
	.size	ct_ntt, .-ct_ntt
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	1080033280
	.long	0
	.align 8
.LC6:
	.long	1105199104
	.long	0
	.section	".text"
	.align 4
	.global ntt_256
	.type	ntt_256, #function
	.proc	020
ntt_256:
	save	%sp, -1128, %sp
	mov	0, %g1
	mov	%i0, %g4
	add	%fp, -1024, %l6
	add	%fp, -512, %l5
.L19:
	ld	[%g4], %i4
	ld	[%g4+4], %i5
	st	%i4, [%l6+%g1]
	st	%i5, [%l5+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L19
	 add	%g4, 8, %g4
	sethi	%hi(.LC5), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC5)], %o0
	sethi	%hi(.LC6), %g2
	ldd	[%g2+%lo(.LC6)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L20
	 sethi	%hi(-2147483648), %g1
	fdtoi	%f0, %f8
	st	%f8, [%fp-1028]
	ld	[%fp-1028], %g1
.L21:
	add	%g1, -1, %g1
	st	%g1, [%fp-1032]
	ld	[%fp-1028], %g2
	cmp	%g2, 0
	be	.L28
	 mov	0, %l1
	ld	[%fp-1032], %g1
.L42:
	mov	64, %g2
	sub	%g1, %l1, %i5
	srl	%g2, %l1, %i2
	ld	[%fp-1028], %g1
	mov	1, %g2
	sub	%g1, %l1, %l0
	add	%i2, -1, %i2
	sll	%g2, %i5, %i3
	sll	%g2, %l1, %i4
	mov	0, %l4
.L27:
	srl	%l4, %i5, %o7
	and	%l4, %i2, %g4
	sll	%o7, %l0, %o5
	add	%o7, %i4, %o7
	add	%o5, %g4, %g4
	sll	%o7, 2, %o7
	sll	%g4, 2, %l2
	ld	[%i1+%o7], %o7
	add	%g4, %i3, %g4
	mov	3329, %o3
	sll	%g4, 2, %l7
	ld	[%l6+%l7], %o0
	umul	%o0, %o7, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	0, %o2
	ld	[%l6+%l2], %l3
	add	%o1, %l3, %o7
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%o7, 3329, %o3
	smul	%o3, 3329, %o3
	sub	%o7, %o3, %o7
	st	%o7, [%l6+%l2]
	add	%l3, 3329, %o5
	sub	%o5, %o1, %o5
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%o5, 3329, %o7
	smul	%o7, 3329, %o7
	sub	%o5, %o7, %o5
	add	%l4, 1, %l4
	cmp	%l4, 64
	bne	.L27
	 st	%o5, [%l6+%l7]
	add	%l1, 1, %l1
	ld	[%fp-1028], %g1
	cmp	%l1, %g1
	bne	.L42
	 ld	[%fp-1032], %g1
.L28:
	sethi	%hi(.LC5), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC5)], %o0
	sethi	%hi(.LC6), %g2
	ldd	[%g2+%lo(.LC6)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L23
	 sethi	%hi(-2147483648), %g1
	fdtoi	%f0, %f8
	st	%f8, [%fp-1028]
	ld	[%fp-1028], %g1
.L24:
	add	%g1, -1, %g1
	st	%g1, [%fp-1032]
	ld	[%fp-1028], %g2
	cmp	%g2, 0
	be	.L26
	 mov	0, %l2
	ld	[%fp-1032], %g1
.L43:
	mov	64, %g2
	sub	%g1, %l2, %i4
	srl	%g2, %l2, %l0
	ld	[%fp-1028], %g1
	mov	1, %g2
	sub	%g1, %l2, %l1
	add	%l0, -1, %l0
	sll	%g2, %i4, %i2
	sll	%g2, %l2, %i3
	mov	0, %i5
.L29:
	and	%i5, %l0, %g4
	srl	%i5, %i4, %g1
	sll	%g1, %l1, %l7
	add	%g1, %i3, %g1
	sll	%g1, 2, %g1
	ld	[%i1+%g1], %o7
	add	%l7, %g4, %l7
	mov	0, %o2
	sll	%l7, 2, %l3
	add	%l7, %i2, %l7
	sll	%l7, 2, %l7
	ld	[%l5+%l7], %o0
	umul	%o0, %o7, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	ld	[%l5+%l3], %l4
	add	%o1, %l4, %o7
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%o7, 3329, %o5
	smul	%o5, 3329, %o5
	sub	%o7, %o5, %o7
	st	%o7, [%l5+%l3]
	add	%l4, 3329, %g1
	sub	%g1, %o1, %g1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g1, 3329, %g4
	smul	%g4, 3329, %g4
	sub	%g1, %g4, %g1
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L29
	 st	%g1, [%l5+%l7]
	add	%l2, 1, %l2
	ld	[%fp-1028], %g2
	cmp	%l2, %g2
	bne	.L43
	 ld	[%fp-1032], %g1
.L26:
	mov	0, %g1
.L30:
	ld	[%l6+%g1], %g4
	st	%g4, [%i0+%g1]
	ld	[%l5+%g1], %i5
	add	%i0, %g1, %g4
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L30
	 st	%i5, [%g4+512]
	jmp	%i7+8
	 restore
.L23:
	fsubd	%f0, %f8, %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-1028]
	ld	[%fp-1028], %g2
	xor	%g2, %g1, %g2
	st	%g2, [%fp-1028]
	b	.L24
	 mov	%g2, %g1
.L20:
	fsubd	%f0, %f8, %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-1028]
	ld	[%fp-1028], %g2
	xor	%g2, %g1, %g2
	st	%g2, [%fp-1028]
	b	.L21
	 mov	%g2, %g1
	.size	ntt_256, .-ntt_256
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.asciz	"Hello world from core:thread %d:%d!\n\n"
	.align 8
.LC8:
	.asciz	"Result of NTT function:\n"
	.align 8
.LC9:
	.asciz	"%d "
	.align 8
.LC10:
	.asciz	"\n"
	.section	".rodata"
	.align 4
.LC0:
	.long	1
	.long	1729
	.long	2580
	.long	3289
	.long	2642
	.long	630
	.long	1897
	.long	848
	.long	1062
	.long	1919
	.long	193
	.long	797
	.long	2786
	.long	3260
	.long	569
	.long	1746
	.long	296
	.long	2447
	.long	1339
	.long	1476
	.long	3046
	.long	56
	.long	2240
	.long	1333
	.long	1426
	.long	2094
	.long	535
	.long	2882
	.long	2393
	.long	2879
	.long	1974
	.long	821
	.long	289
	.long	331
	.long	3253
	.long	1756
	.long	1197
	.long	2304
	.long	2277
	.long	2055
	.long	650
	.long	1977
	.long	2513
	.long	632
	.long	2865
	.long	33
	.long	1320
	.long	1915
	.long	2319
	.long	1435
	.long	807
	.long	452
	.long	1438
	.long	2868
	.long	1534
	.long	2402
	.long	2647
	.long	2617
	.long	1481
	.long	648
	.long	2474
	.long	3110
	.long	1227
	.long	910
	.long	17
	.long	2761
	.long	583
	.long	2649
	.long	1637
	.long	723
	.long	2288
	.long	1100
	.long	1409
	.long	2662
	.long	3281
	.long	233
	.long	756
	.long	2156
	.long	3015
	.long	3050
	.long	1703
	.long	1651
	.long	2789
	.long	1789
	.long	1847
	.long	952
	.long	1461
	.long	2687
	.long	939
	.long	2308
	.long	2437
	.long	2388
	.long	733
	.long	2337
	.long	268
	.long	641
	.long	1584
	.long	2298
	.long	2037
	.long	3220
	.long	375
	.long	2549
	.long	2090
	.long	1645
	.long	1063
	.long	319
	.long	2773
	.long	757
	.long	2099
	.long	561
	.long	2466
	.long	2594
	.long	2804
	.long	1092
	.long	403
	.long	1026
	.long	1143
	.long	2150
	.long	2775
	.long	886
	.long	1722
	.long	1212
	.long	1874
	.long	1029
	.long	2110
	.long	2935
	.long	885
	.long	2154
	.align 4
.LC1:
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	3327
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	2
	.long	1
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	3326
	.long	3328
	.long	1
	.long	3327
	.long	2
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	2
	.long	2
	.long	3327
	.long	1
	.long	2
	.long	0
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	0
	.long	0
	.long	2
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	3327
	.long	3327
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	3327
	.long	1
	.long	3328
	.long	1
	.long	3328
	.long	0
	.long	2
	.long	0
	.long	3327
	.long	1
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	3327
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	3328
	.long	3327
	.long	1
	.long	1
	.long	3328
	.long	0
	.long	1
	.long	1
	.long	3328
	.long	0
	.long	3328
	.long	3326
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	2
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	0
	.long	2
	.long	3328
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	0
	.long	0
	.long	1
	.long	2
	.long	3328
	.long	3327
	.long	1
	.long	0
	.long	2
	.long	2
	.long	2
	.long	3327
	.long	2
	.long	0
	.long	0
	.long	1
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	3
	.long	3328
	.long	1
	.long	3328
	.long	2
	.long	0
	.long	0
	.long	0
	.long	2
	.long	0
	.long	1
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	3328
	.long	3327
	.long	1
	.long	0
	.long	1
	.long	3328
	.long	1
	.long	3328
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	3327
	.long	3328
	.long	1
	.long	3
	.long	3327
	.long	0
	.long	1
	.long	3327
	.long	3
	.long	0
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3327
	.long	3328
	.long	3328
	.long	3328
	.long	1
	.long	3326
	.long	0
	.long	1
	.long	1
	.long	1
	.long	0
	.long	0
	.long	1
	.long	0
	.long	0
	.long	2
	.long	0
	.long	3328
	.long	3328
	.long	3328
	.long	1
	.long	3
	.long	3328
	.long	0
	.long	3328
	.long	2
	.long	1
	.long	3327
	.long	0
	.long	1
	.long	1
	.long	0
	.long	3327
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	3328
	.long	3328
	.long	3328
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	3328
	.long	0
	.align 4
.LC2:
	.long	2
	.long	1
	.long	0
	.long	3327
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	3328
	.long	1
	.long	1
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	0
	.long	1
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	0
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.long	0
	.long	3
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	1
	.long	3328
	.long	0
	.long	3327
	.long	3328
	.long	1
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	2
	.long	3328
	.long	1
	.long	1
	.long	2
	.long	0
	.long	2
	.long	0
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	3328
	.long	3327
	.long	1
	.long	0
	.long	1
	.long	0
	.long	2
	.long	1
	.long	0
	.long	1
	.long	0
	.long	3328
	.long	0
	.long	3327
	.long	1
	.long	1
	.long	0
	.long	3327
	.long	3328
	.long	1
	.long	2
	.long	0
	.long	1
	.long	3328
	.long	3328
	.long	0
	.long	0
	.long	3328
	.long	1
	.long	3327
	.long	0
	.long	1
	.long	3327
	.long	2
	.long	1
	.long	1
	.long	3327
	.long	0
	.long	3327
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	3327
	.long	3328
	.long	0
	.long	3328
	.long	3
	.long	1
	.long	0
	.long	3327
	.long	1
	.long	1
	.long	2
	.long	2
	.long	1
	.long	1
	.long	2
	.long	0
	.long	2
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	0
	.long	2
	.long	3327
	.long	3327
	.long	3328
	.long	0
	.long	0
	.long	3327
	.long	0
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	3327
	.long	0
	.long	3328
	.long	1
	.long	1
	.long	2
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	2
	.long	3328
	.long	0
	.long	3326
	.long	2
	.long	2
	.long	0
	.long	3328
	.long	1
	.long	3328
	.long	2
	.long	3328
	.long	3326
	.long	0
	.long	1
	.long	3328
	.long	3328
	.long	0
	.long	2
	.long	3328
	.long	0
	.long	0
	.long	2
	.long	0
	.long	1
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	2
	.long	1
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	2
	.long	3328
	.long	3327
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	3328
	.long	2
	.long	3328
	.long	3327
	.long	3327
	.long	3328
	.long	2
	.long	3327
	.long	3328
	.long	1
	.long	3328
	.long	3327
	.long	1
	.long	0
	.long	0
	.long	3327
	.long	3327
	.long	0
	.long	3327
	.long	0
	.long	1
	.long	3328
	.long	1
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -2664, %sp
	add	%fp, -2568, %o0
	call	ajit_get_core_and_thread_id, 0
	 add	%fp, -2564, %o1
	mov	512, %o2
	sethi	%hi(.LC0), %o1
	add	%fp, -2560, %o0
	call	memcpy, 0
	 or	%o1, %lo(.LC0), %o1
	mov	1024, %o2
	sethi	%hi(.LC1), %o1
	add	%fp, -2048, %o0
	call	memcpy, 0
	 or	%o1, %lo(.LC1), %o1
	mov	1024, %o2
	add	%fp, -1024, %i5
	sethi	%hi(.LC2), %o1
	mov	%i5, %o0
	call	memcpy, 0
	 or	%o1, %lo(.LC2), %o1
	ldub	[%fp-2564], %o2
	sethi	%hi(done), %g2
	cmp	%o2, 0
	be	.L57
	 or	%g2, %lo(done), %g2
.L52:
	ld	[%g2], %g1
	cmp	%g1, 0
	be	.L52
	 sethi	%hi(.LC7), %o0
	ldub	[%fp-2568], %o1
	call	ee_printf, 0
	 or	%o0, %lo(.LC7), %o0
	mov	%i5, %o0
	call	ntt_256, 0
	 add	%fp, -2560, %o1
	sethi	%hi(.LC8), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC8), %o0
	sethi	%hi(.LC9), %g1
	mov	%fp, %i3
	or	%g1, %lo(.LC9), %i4
	ld	[%i5], %o1
.L58:
	call	ee_printf, 0
	 mov	%i4, %o0
	add	%i5, 4, %i5
	cmp	%i5, %i3
	bne,a	.L58
	 ld	[%i5], %o1
	sethi	%hi(.LC10), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC10), %o0
.L47:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L57:
	mov	1, %o0
	call	__ajit_serial_configure_via_bypass__, 0
	 mov	0, %o1
	ldub	[%fp-2564], %o2
	ldub	[%fp-2568], %o1
	sethi	%hi(.LC7), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC7), %o0
	add	%fp, -2048, %o0
	call	ntt_256, 0
	 add	%fp, -2560, %o1
	sethi	%hi(.LC8), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC8), %o0
	sethi	%hi(.LC9), %g1
	add	%fp, -2048, %i4
	or	%g1, %lo(.LC9), %i3
	ld	[%i4], %o1
.L59:
	call	ee_printf, 0
	 mov	%i3, %o0
	add	%i4, 4, %i4
	cmp	%i4, %i5
	bne,a	.L59
	 ld	[%i4], %o1
	sethi	%hi(.LC10), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC10), %o0
	mov	1, %g2
	sethi	%hi(done), %g1
	st	%g2, [%g1+%lo(done)]
	b,a	.L47
	.size	main, .-main
	.global done
	.section	".bss"
	.align 4
	.type	done, #object
	.size	done, 4
done:
	.skip	4
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
