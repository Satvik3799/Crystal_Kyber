	.file	"main.c"
	.section	".text"
	.align 4
	.global setup
	.type	setup, #function
	.proc	020
setup:
	save	%sp, -96, %sp
	mov	1, %o0
	mov	0, %o1
	call	__ajit_serial_configure_via_vmap__, 0
	 mov	0, %o2
	sethi	%hi(80000000), %o1
	mov	0, %i0
	sethi	%hi(114688), %o0
	call	__ajit_serial_set_baudrate_via_vmap__, 0
	 or	%o0, 512, %o0
	call	__ajit_serial_set_uart_reset_via_vmap__, 0
	 restore
	.size	setup, .-setup
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.asciz	"Single-thread time=%f ticks\n"
	.global __floatundidf
	.align 8
.LC2:
	.asciz	"Result of NTT function with s0:\n"
	.align 8
.LC3:
	.asciz	"%d "
	.align 8
.LC4:
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
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -3176, %sp
	add	%fp, -2560, %o1
	call	gen_tf, 0
	 add	%fp, -3072, %o0
	add	%fp, -1024, %i2
	sethi	%hi(.LC0), %o1
	mov	%i2, %o0
	or	%o1, %lo(.LC0), %o1
	call	memcpy, 0
	 mov	1024, %o2
	mov	%i2, %i3
	mov	%fp, %l0
	mov	%i2, %g1
	mov	0, %g2
	add	%fp, -2048, %i0
	add	%fp, -1536, %i1
.L3:
	ld	[%g1], %g4
	ld	[%g1+4], %g3
	st	%g4, [%i0+%g2]
	st	%g3, [%i1+%g2]
	add	%g1, 8, %g1
	cmp	%g1, %l0
	bne	.L3
	 add	%g2, 4, %g2
	call	__ajit_get_clock_time, 0
	 nop
	mov	%o0, %i4
	mov	%o1, %i5
	mov	%i0, %o0
	call	ct_ntt, 0
	 add	%fp, -3072, %o1
	mov	%i1, %o0
	call	ct_ntt, 0
	 add	%fp, -3072, %o1
	mov	0, %g1
.L4:
	ld	[%i0+%g1], %g2
	st	%g2, [%i2+%g1]
	ld	[%i1+%g1], %g3
	add	%i2, %g1, %g2
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L4
	 st	%g3, [%g2+512]
	call	__ajit_get_clock_time, 0
	 nop
	subcc	%o1, %i5, %o1
	call	__floatundidf, 0
	 subx	%o0, %i4, %o0
	std	%f0, [%fp-3080]
	ldd	[%fp-3080], %g2
	sethi	%hi(.LC1), %o0
	mov	%g2, %o1
	mov	%g3, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	sethi	%hi(.LC2), %o0
	sethi	%hi(.LC3), %i5
	or	%o0, %lo(.LC2), %o0
	call	cortos_printf, 0
	 or	%i5, %lo(.LC3), %i5
	ld	[%i3], %o1
.L10:
	call	cortos_printf, 0
	 mov	%i5, %o0
	add	%i3, 4, %i3
	cmp	%i3, %l0
	bne,a	.L10
	 ld	[%i3], %o1
	mov	0, %i0
	sethi	%hi(.LC4), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC4), %o0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
