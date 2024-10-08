	.file	"main.c"
	.section	".text"
	.align 4
	.global ntt_s
	.type	ntt_s, #function
	.proc	04
ntt_s:
	save	%sp, -96, %sp
	ld	[%i0], %o0
	call	ct_ntt, 0
	 ld	[%i0+4], %o1
	jmp	%i7+8
	 restore
	.size	ntt_s, .-ntt_s
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.asciz	"DEBUG"
	.align 8
.LC2:
	.asciz	"../main.c"
	.align 8
.LC3:
	.asciz	"Init channel.\n"
	.section	".text"
	.align 4
	.global setup
	.type	setup, #function
	.proc	020
setup:
	save	%sp, -96, %sp
	mov	0, %o2
	mov	1, %o0
	call	__ajit_serial_configure_via_vmap__, 0
	 mov	0, %o1
	sethi	%hi(80000000), %o1
	sethi	%hi(114688), %o0
	call	__ajit_serial_set_baudrate_via_vmap__, 0
	 or	%o0, 512, %o0
	call	__ajit_serial_set_uart_reset_via_vmap__, 0
	 mov	0, %o0
	mov	28, %o3
	sethi	%hi(.LC1), %o0
	sethi	%hi(.LC2), %o1
	or	%o0, %lo(.LC1), %o0
	or	%o1, %lo(.LC2), %o1
	sethi	%hi(__func__.2902), %o2
	sethi	%hi(.LC3), %o4
	or	%o2, %lo(__func__.2902), %o2
	or	%o4, %lo(.LC3), %o4
	sethi	%hi(tc), %i0
	call	__cortos_log_printf, 0
	 mov	1, %i1
	call	initChannel, 0
	 restore %i0, %lo(tc), %o0
	.size	setup, .-setup
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"Shared run.\n"
	.align 8
.LC5:
	.asciz	"Single-thread time=%f ticks\n"
	.global __floatundidf
	.align 8
.LC6:
	.asciz	"Result of NTT function with s0:\n"
	.align 8
.LC7:
	.asciz	"%d "
	.align 8
.LC8:
	.asciz	"\n"
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
	.section	".text"
	.align 4
	.global main_00
	.type	main_00, #function
	.proc	04
main_00:
	save	%sp, -3192, %sp
	add	%fp, -2560, %o1
	add	%fp, -3072, %i0
	call	gen_tf, 0
	 mov	%i0, %o0
	add	%fp, -1024, %i4
	sethi	%hi(.LC0), %o1
	mov	%i4, %o0
	or	%o1, %lo(.LC0), %o1
	call	memcpy, 0
	 mov	1024, %o2
	mov	%i4, %i5
	mov	%fp, %i1
	mov	%i4, %g1
	mov	0, %g2
	add	%fp, -2048, %i2
	add	%fp, -1536, %i3
.L4:
	ld	[%g1], %g4
	ld	[%g1+4], %g3
	st	%g4, [%i2+%g2]
	st	%g3, [%i3+%g2]
	add	%g1, 8, %g1
	cmp	%g1, %i1
	bne	.L4
	 add	%g2, 4, %g2
	mov	70, %o3
	sethi	%hi(.LC1), %o0
	sethi	%hi(.LC2), %o1
	or	%o0, %lo(.LC1), %o0
	or	%o1, %lo(.LC2), %o1
	sethi	%hi(__func__.2920), %o2
	sethi	%hi(.LC4), %o4
	or	%o2, %lo(__func__.2920), %o2
	call	__cortos_log_printf, 0
	 or	%o4, %lo(.LC4), %o4
	st	%i0, [%fp-3076]
	call	__ajit_get_clock_time, 0
	 st	%i3, [%fp-3080]
	sethi	%hi(t0), %l0
	std	%o0, [%l0+%lo(t0)]
	mov	%i0, %o1
	call	ct_ntt, 0
	 mov	%i2, %o0
	sethi	%hi(tc), %i0
	sethi	%hi(ntt_s), %o1
	or	%i0, %lo(tc), %o0
	or	%o1, %lo(ntt_s), %o1
	add	%fp, -3080, %o2
	call	scheduleChannelJob, 0
	 or	%i0, %lo(tc), %i0
	mov	%i0, %o0
.L13:
	call	getChannelResponse, 0
	 add	%fp, -3084, %o1
	cmp	%o0, 0
	bne	.L13
	 mov	%i0, %o0
	mov	0, %g1
.L6:
	ld	[%i2+%g1], %g2
	st	%g2, [%i4+%g1]
	ld	[%i3+%g1], %g3
	add	%i4, %g1, %g2
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L6
	 st	%g3, [%g2+512]
	call	__ajit_get_clock_time, 0
	 sethi	%hi(.LC7), %i4
	sethi	%hi(t1), %g1
	mov	%o0, %g2
	mov	%o1, %g3
	ldd	[%l0+%lo(t0)], %o0
	std	%g2, [%g1+%lo(t1)]
	subcc	%g3, %o1, %o1
	call	__floatundidf, 0
	 subx	%g2, %o0, %o0
	std	%f0, [%fp-3096]
	ldd	[%fp-3096], %g2
	sethi	%hi(.LC5), %o0
	mov	%g2, %o1
	mov	%g3, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC5), %o0
	sethi	%hi(.LC6), %o0
	or	%o0, %lo(.LC6), %o0
	call	cortos_printf, 0
	 or	%i4, %lo(.LC7), %i4
	ld	[%i5], %o1
.L14:
	call	cortos_printf, 0
	 mov	%i4, %o0
	add	%i5, 4, %i5
	cmp	%i5, %i1
	bne,a	.L14
	 ld	[%i5], %o1
	sethi	%hi(.LC8), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC8), %o0
	jmp	%i7+8
	 restore
	.size	main_00, .-main_00
	.align 4
	.global main_01
	.type	main_01, #function
	.proc	020
main_01:
	save	%sp, -104, %sp
	sethi	%hi(tc), %i5
	or	%i5, %lo(tc), %i5
	mov	%i5, %o0
.L18:
	add	%fp, -8, %o1
	call	getChannelJob, 0
	 add	%fp, -4, %o2
	cmp	%o0, 0
	bne	.L18
	 mov	%i5, %o0
	ld	[%fp-8], %g1
	call	%g1, 0
	 ld	[%fp-4], %o0
	mov	4, %g1
	st	%g1, [%i5+20]
	jmp	%i7+8
	 restore
	.size	main_01, .-main_01
	.common	t3,8,8
	.common	t2,8,8
	.common	t1,8,8
	.common	t0,8,8
	.common	tc,24,4
	.section	".rodata"
	.align 8
	.type	__func__.2902, #object
	.size	__func__.2902, 6
__func__.2902:
	.asciz	"setup"
	.align 8
	.type	__func__.2920, #object
	.size	__func__.2920, 8
__func__.2920:
	.asciz	"main_00"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
