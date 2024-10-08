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
	.asciz	"Result of NTT function with s0:\n"
	.align 8
.LC2:
	.asciz	"%d "
	.align 8
.LC3:
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
	save	%sp, -3168, %sp
	mov	0, %o2
	mov	1, %o0
	call	__ajit_serial_configure_via_vmap__, 0
	 mov	0, %o1
	add	%fp, -2560, %o1
	call	gen_tf, 0
	 add	%fp, -3072, %o0
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
.L3:
	ld	[%g1], %g4
	ld	[%g1+4], %g3
	st	%g4, [%i2+%g2]
	st	%g3, [%i3+%g2]
	add	%g1, 8, %g1
	cmp	%g1, %i1
	bne	.L3
	 add	%g2, 4, %g2
	mov	%i2, %o0
	call	ct_ntt, 0
	 add	%fp, -3072, %o1
	mov	%i3, %o0
	call	ct_ntt, 0
	 add	%fp, -3072, %o1
	mov	0, %g1
.L4:
	ld	[%i2+%g1], %g2
	st	%g2, [%i4+%g1]
	ld	[%i3+%g1], %g3
	add	%i4, %g1, %g2
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L4
	 st	%g3, [%g2+512]
	sethi	%hi(.LC1), %o0
	sethi	%hi(.LC2), %i4
	or	%o0, %lo(.LC1), %o0
	call	cortos_printf, 0
	 or	%i4, %lo(.LC2), %i4
	ld	[%i5], %o1
.L10:
	call	cortos_printf, 0
	 mov	%i4, %o0
	add	%i5, 4, %i5
	cmp	%i5, %i1
	bne,a	.L10
	 ld	[%i5], %o1
	mov	0, %i0
	sethi	%hi(.LC3), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC3), %o0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
