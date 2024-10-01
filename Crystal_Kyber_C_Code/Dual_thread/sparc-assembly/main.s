	.file	"main.c"
	.section	".text"
	.align 4
	.global bit_reverse
	.type	bit_reverse, #function
	.proc	016
bit_reverse:
	cmp	%o1, 0
	be	.L6
	 mov	0, %g1
	mov	0, %g2
	add	%o1, -1, %o3
	mov	1, %o4
.L5:
	sub	%o3, %g1, %g4
	srl	%o0, %g1, %o5
	mov	%g2, %g3
	sll	%o4, %g4, %g4
	andcc	%o5, 1, %g0
	be	.L4
	 or	%g4, %g2, %g2
	mov	%g2, %g3
.L4:
	add	%g1, 1, %g1
	cmp	%g1, %o1
	bne	.L5
	 mov	%g3, %g2
.L2:
	jmp	%o7+8
	 mov	%g2, %o0
.L6:
	b	.L2
	 mov	0, %g2
	.size	bit_reverse, .-bit_reverse
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
.LC2:
	.long	1080033280
	.long	0
	.align 8
.LC3:
	.long	1105199104
	.long	0
	.section	".text"
	.align 4
	.global ct_ntt
	.type	ct_ntt, #function
	.proc	020
ct_ntt:
	save	%sp, -104, %sp
	sethi	%hi(.LC2), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC2)], %o0
	sethi	%hi(.LC3), %g1
	ldd	[%g1+%lo(.LC3)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L14
	 sethi	%hi(-2147483648), %g1
	fdtoi	%f0, %f8
	st	%f8, [%fp-8]
	ld	[%fp-8], %l4
	add	%l4, -1, %g1
	st	%g1, [%fp-4]
	mov	0, %l3
	cmp	%l4, 0
	be	.L25
	 mov	1, %l5
.L21:
	ld	[%fp-4], %g1
.L23:
	sub	%l4, %l3, %l2
	sub	%g1, %l3, %i3
	sll	%l5, %l3, %i2
	mov	64, %g1
	sll	%l5, %i3, %l0
	srl	%g1, %l3, %l1
	mov	0, %i5
	add	%l1, -1, %l1
.L17:
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
	bne	.L17
	 st	%g1, [%i0+%i4]
	add	%l3, 1, %l3
	cmp	%l3, %l4
	bne	.L23
	 ld	[%fp-4], %g1
.L25:
	jmp	%i7+8
	 restore
.L14:
	fsubd	%f0, %f8, %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-8]
	ld	[%fp-8], %l4
	xor	%l4, %g1, %l4
	add	%l4, -1, %g1
	st	%g1, [%fp-4]
	mov	0, %l3
	cmp	%l4, 0
	bne	.L21
	 mov	1, %l5
	jmp	%i7+8
	 restore
	.size	ct_ntt, .-ct_ntt
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	1080033280
	.long	0
	.align 8
.LC5:
	.long	1105199104
	.long	0
	.section	".text"
	.align 4
	.global gen_tf
	.type	gen_tf, #function
	.proc	020
gen_tf:
	save	%sp, -1640, %sp
	sethi	%hi(.LC4), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC4)], %o0
	sethi	%hi(.LC5), %g1
	ldd	[%g1+%lo(.LC5)], %f8
	fcmped	%f0, %f8
	nop
	fbge,a	.L27
	 fsubd	%f0, %f8, %f8
	fdtoi	%f0, %f8
	st	%f8, [%fp-1540]
	ld	[%fp-1540], %i3
.L28:
	mov	0, %i4
	add	%fp, -512, %l0
	add	%i3, -1, %o7
	mov	1, %i2
.L29:
	mov	0, %g2
	cmp	%i3, 0
	be	.L43
	 mov	0, %g1
.L38:
	sub	%o7, %g1, %g4
	srl	%i4, %g1, %i5
	mov	%g2, %g3
	sll	%i2, %g4, %g4
	andcc	%i5, 1, %g0
	be	.L31
	 or	%g4, %g2, %g2
	mov	%g2, %g3
.L31:
	add	%g1, 1, %g1
	cmp	%g1, %i3
	bne	.L38
	 mov	%g3, %g2
	sll	%i4, 2, %g1
	add	%i4, 1, %i4
	cmp	%i4, 128
	bne	.L29
	 st	%g2, [%l0+%g1]
	mov	0, %i4
.L44:
	mov	1, %i3
	mov	1, %i5
	add	%fp, -1536, %l1
	add	%fp, -1024, %i2
.L33:
	st	%i3, [%i2+%i4]
	st	%i5, [%l1+%i4]
	mov	0, %o2
	mov	3329, %o3
	srl	%i5, 28, %o0
	sll	%i5, 4, %o1
	addcc	%o1, %i5, %o1
	call	__umoddi3, 0
	 addx	%o0, 0, %o0
	mov	0, %o2
	mov	%o1, %i5
	umul	%i3, 1175, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%i4, 4, %i4
	cmp	%i4, 512
	bne	.L33
	 mov	%o1, %i3
	mov	0, %g1
	ld	[%l0+%g1], %g2
.L45:
	sll	%g2, 2, %g2
	add	%fp, %g2, %g2
	ld	[%g2-1536], %g3
	st	%g3, [%i0+%g1]
	ld	[%g2-1024], %g2
	st	%g2, [%i1+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne,a	.L45
	 ld	[%l0+%g1], %g2
	jmp	%i7+8
	 restore
.L43:
	sll	%i4, 2, %g1
	mov	%i3, %g2
	add	%i4, 1, %i4
	cmp	%i4, 128
	bne	.L29
	 st	%g2, [%l0+%g1]
	b	.L44
	 mov	0, %i4
.L27:
	sethi	%hi(-2147483648), %g1
	fdtoi	%f8, %f10
	st	%f10, [%fp-1540]
	ld	[%fp-1540], %i3
	b	.L28
	 xor	%i3, %g1, %i3
	.size	gen_tf, .-gen_tf
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	1080033280
	.long	0
	.align 8
.LC7:
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
.L47:
	ld	[%g4], %i4
	ld	[%g4+4], %i5
	st	%i4, [%l6+%g1]
	st	%i5, [%l5+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L47
	 add	%g4, 8, %g4
	sethi	%hi(.LC6), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC6)], %o0
	sethi	%hi(.LC7), %g2
	ldd	[%g2+%lo(.LC7)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L48
	 sethi	%hi(-2147483648), %g1
	fdtoi	%f0, %f8
	st	%f8, [%fp-1028]
	ld	[%fp-1028], %g1
.L49:
	add	%g1, -1, %g1
	st	%g1, [%fp-1032]
	ld	[%fp-1028], %g2
	cmp	%g2, 0
	be	.L56
	 mov	0, %l1
	ld	[%fp-1032], %g1
.L70:
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
.L55:
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
	bne	.L55
	 st	%o5, [%l6+%l7]
	add	%l1, 1, %l1
	ld	[%fp-1028], %g1
	cmp	%l1, %g1
	bne	.L70
	 ld	[%fp-1032], %g1
.L56:
	sethi	%hi(.LC6), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC6)], %o0
	sethi	%hi(.LC7), %g2
	ldd	[%g2+%lo(.LC7)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L51
	 sethi	%hi(-2147483648), %g1
	fdtoi	%f0, %f8
	st	%f8, [%fp-1028]
	ld	[%fp-1028], %g1
.L52:
	add	%g1, -1, %g1
	st	%g1, [%fp-1032]
	ld	[%fp-1028], %g2
	cmp	%g2, 0
	be	.L54
	 mov	0, %l2
	ld	[%fp-1032], %g1
.L71:
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
.L57:
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
	bne	.L57
	 st	%g1, [%l5+%l7]
	add	%l2, 1, %l2
	ld	[%fp-1028], %g2
	cmp	%l2, %g2
	bne	.L71
	 ld	[%fp-1032], %g1
.L54:
	mov	0, %g1
.L58:
	ld	[%l6+%g1], %g4
	st	%g4, [%i0+%g1]
	ld	[%l5+%g1], %i5
	add	%i0, %g1, %g4
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L58
	 st	%i5, [%g4+512]
	jmp	%i7+8
	 restore
.L51:
	fsubd	%f0, %f8, %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-1028]
	ld	[%fp-1028], %g2
	xor	%g2, %g1, %g2
	st	%g2, [%fp-1028]
	b	.L52
	 mov	%g2, %g1
.L48:
	fsubd	%f0, %f8, %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-1028]
	ld	[%fp-1028], %g2
	xor	%g2, %g1, %g2
	st	%g2, [%fp-1028]
	b	.L49
	 mov	%g2, %g1
	.size	ntt_256, .-ntt_256
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.asciz	"\n"
	.align 8
.LC9:
	.asciz	"Hello world from core:thread %d:%d!\n\n"
	.align 8
.LC10:
	.asciz	"Result of NTT function:\n"
	.align 8
.LC11:
	.asciz	"%d "
	.section	".rodata"
	.align 4
.LC0:
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
.LC1:
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
	save	%sp, -3176, %sp
	add	%fp, -3080, %o0
	call	ajit_get_core_and_thread_id, 0
	 add	%fp, -3076, %o1
	add	%fp, -2560, %o1
	call	gen_tf, 0
	 add	%fp, -3072, %o0
	mov	1024, %o2
	sethi	%hi(.LC0), %o1
	add	%fp, -2048, %o0
	call	memcpy, 0
	 or	%o1, %lo(.LC0), %o1
	add	%fp, -1024, %i5
	sethi	%hi(.LC1), %o1
	mov	%i5, %o0
	or	%o1, %lo(.LC1), %o1
	call	memcpy, 0
	 mov	1024, %o2
	ldub	[%fp-3076], %g1
	sethi	%hi(done), %g2
	cmp	%g1, 0
	be	.L85
	 or	%g2, %lo(done), %g2
.L80:
	ld	[%g2], %g1
	cmp	%g1, 0
	be	.L80
	 sethi	%hi(.LC8), %i2
	call	ee_printf, 0
	 or	%i2, %lo(.LC8), %o0
	ldub	[%fp-3076], %o2
	ldub	[%fp-3080], %o1
	sethi	%hi(.LC9), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC9), %o0
	mov	%i5, %o0
	call	ntt_256, 0
	 add	%fp, -3072, %o1
	sethi	%hi(.LC10), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC10), %o0
	sethi	%hi(.LC11), %g1
	mov	%fp, %i3
	or	%g1, %lo(.LC11), %i4
	ld	[%i5], %o1
.L86:
	call	ee_printf, 0
	 mov	%i4, %o0
	add	%i5, 4, %i5
	cmp	%i5, %i3
	bne,a	.L86
	 ld	[%i5], %o1
	call	ee_printf, 0
	 or	%i2, %lo(.LC8), %o0
.L75:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L85:
	mov	0, %o1
	mov	0, %o2
	call	__ajit_serial_configure_via_bypass__, 0
	 mov	1, %o0
	sethi	%hi(.LC8), %i2
	call	ee_printf, 0
	 or	%i2, %lo(.LC8), %o0
	ldub	[%fp-3076], %o2
	ldub	[%fp-3080], %o1
	sethi	%hi(.LC9), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC9), %o0
	add	%fp, -2048, %o0
	call	ntt_256, 0
	 add	%fp, -3072, %o1
	sethi	%hi(.LC10), %o0
	call	ee_printf, 0
	 or	%o0, %lo(.LC10), %o0
	sethi	%hi(.LC11), %g1
	add	%fp, -2048, %i4
	or	%g1, %lo(.LC11), %i3
	ld	[%i4], %o1
.L87:
	call	ee_printf, 0
	 mov	%i3, %o0
	add	%i4, 4, %i4
	cmp	%i4, %i5
	bne,a	.L87
	 ld	[%i4], %o1
	call	ee_printf, 0
	 or	%i2, %lo(.LC8), %o0
	mov	1, %g2
	sethi	%hi(done), %g1
	st	%g2, [%g1+%lo(done)]
	b,a	.L75
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
