	.file	"ajit_mmap.c"
	.section	".text"
	.align 4
	.global initPageTableAllocator
	.type	initPageTableAllocator, #function
	.proc	020
initPageTableAllocator:
	save	%sp, -96, %sp
	mov	0, %i4
	mov	%i3, %l0
	mov	0, %i5
	mov	%i2, %i3
	cmp	%l0, 0
	mov	%i1, %i2
	be	.L4
	 mov	0, %i1
	addcc	%i5, %i3, %g3
.L11:
	addx	%i4, %i2, %g2
	mov	%g3, %o2
	mov	%g2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	0, %o0
	addcc	%i5, 4, %g3
	addx	%i4, 0, %g2
	mov	%g3, %i5
	cmp	%i1, %g2
	bne	.L4
	 mov	%g2, %i4
	cmp	%l0, %g3
	bgu	.L11
	 addcc	%i5, %i3, %g3
.L4:
	std	%i2, [%i0]
	st	%g0, [%i0+8]
	st	%l0, [%i0+12]
	st	%g0, [%i0+16]
	st	%g0, [%i0+20]
	jmp	%i7+8
	 restore
	.size	initPageTableAllocator, .-initPageTableAllocator
	.align 4
	.global allocatePageTableBlock
	.type	allocatePageTableBlock, #function
	.proc	016
allocatePageTableBlock:
	save	%sp, -96, %sp
	mov	0, %i4
	cmp	%i1, 1
	bleu	.L22
	 mov	256, %i5
.L13:
	ldd	[%i0+16], %o0
	addcc	%i5, %o1, %g3
	ldd	[%i0], %o2
	addx	%i4, %o0, %g2
	addcc	%i5, %o3, %o5
	addx	%i4, %o2, %o4
	cmp	%g2, %o4
	bgu	.L17
	 nop
	be	.L20
	 cmp	%g3, %o5
	std	%o0, [%i2]
.L21:
	std	%g2, [%i0+16]
	jmp	%i7+8
	 restore %g0, 0, %o0
.L20:
	bleu,a	.L21
	 std	%o0, [%i2]
.L17:
	jmp	%i7+8
	 restore %g0, 1, %o0
.L22:
	b	.L13
	 mov	1024, %i5
	.size	allocatePageTableBlock, .-allocatePageTableBlock
	.align 4
	.global ajit_mmap_index_into_table
	.type	ajit_mmap_index_into_table, #function
	.proc	016
ajit_mmap_index_into_table:
	cmp	%o0, 2
	be	.L26
	 cmp	%o0, 3
	be	.L27
	 cmp	%o0, 1
	be	.L30
	 nop
	jmp	%o7+8
	 mov	0, %o0
.L30:
	jmp	%o7+8
	 srl	%o1, 24, %o0
.L27:
	srl	%o1, 12, %o0
	jmp	%o7+8
	 and	%o0, 63, %o0
.L26:
	srl	%o1, 18, %o0
	jmp	%o7+8
	 and	%o0, 63, %o0
	.size	ajit_mmap_index_into_table, .-ajit_mmap_index_into_table
	.align 4
	.global ajit_mmap_is_pte
	.type	ajit_mmap_is_pte, #function
	.proc	014
ajit_mmap_is_pte:
	and	%o0, 3, %o0
	xor	%o0, 2, %o0
	subcc	%g0, %o0, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	ajit_mmap_is_pte, .-ajit_mmap_is_pte
	.align 4
	.global ajit_mmap_is_ptd
	.type	ajit_mmap_is_ptd, #function
	.proc	014
ajit_mmap_is_ptd:
	and	%o0, 3, %o0
	xor	%o0, 1, %o0
	subcc	%g0, %o0, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	ajit_mmap_is_ptd, .-ajit_mmap_is_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_ptd
	.type	ajit_mmap_get_phy_addr_from_ptd, #function
	.proc	017
ajit_mmap_get_phy_addr_from_ptd:
	and	%o0, -4, %o0
	sll	%o2, 2, %o2
	srl	%o0, 28, %g2
	mov	%o2, %o3
	sll	%o0, 4, %g3
	mov	0, %o2
	or	%o3, %g3, %g3
	or	%o2, %g2, %g2
	mov	%g3, %o1
	jmp	%o7+8
	 mov	%g2, %o0
	.size	ajit_mmap_get_phy_addr_from_ptd, .-ajit_mmap_get_phy_addr_from_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_pte
	.type	ajit_mmap_get_phy_addr_from_pte, #function
	.proc	017
ajit_mmap_get_phy_addr_from_pte:
	cmp	%o1, 3
	be	.L39
	 cmp	%o1, 2
	be	.L40
	 mov	0, %o4
	cmp	%o1, 1
	be	.L41
	 mov	%o2, %o5
	srl	%o0, 8, %g1
	srl	%o0, 28, %g2
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
.L39:
	and	%o2, 4095, %o4
	srl	%o0, 8, %g1
	mov	%o4, %o5
	srl	%o0, 28, %g2
	mov	0, %o4
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
.L40:
	sethi	%hi(-16384), %o4
	andn	%o2, %o4, %o4
	srl	%o0, 8, %g1
	mov	%o4, %o5
	srl	%o0, 28, %g2
	mov	0, %o4
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
.L41:
	sethi	%hi(-16777216), %o4
	andn	%o2, %o4, %o4
	srl	%o0, 8, %g1
	mov	%o4, %o5
	srl	%o0, 28, %g2
	mov	0, %o4
	sll	%g1, 12, %g3
	or	%o4, %g2, %g2
	or	%o5, %g3, %g3
	mov	%g2, %o0
	jmp	%o7+8
	 mov	%g3, %o1
	.size	ajit_mmap_get_phy_addr_from_pte, .-ajit_mmap_get_phy_addr_from_pte
	.align 4
	.global ajit_mmap_make_ptd
	.type	ajit_mmap_make_ptd, #function
	.proc	016
ajit_mmap_make_ptd:
	sll	%o1, 26, %g1
	srl	%o2, 6, %o2
	or	%g1, %o2, %o2
	sll	%o2, 2, %g3
	jmp	%o7+8
	 or	%g3, 1, %o0
	.size	ajit_mmap_make_ptd, .-ajit_mmap_make_ptd
	.align 4
	.global ajit_mmap_make_pte
	.type	ajit_mmap_make_pte, #function
	.proc	016
ajit_mmap_make_pte:
	sll	%o3, 20, %o3
	sll	%o1, 2, %o1
	srl	%o4, 12, %o4
	or	%o1, 2, %o1
	or	%o3, %o4, %o4
	sll	%o4, 8, %o0
	jmp	%o7+8
	 or	%o1, %o0, %o0
	.size	ajit_mmap_make_pte, .-ajit_mmap_make_pte
	.align 4
	.global ajit_lookup_mmap
	.type	ajit_lookup_mmap, #function
	.proc	04
ajit_lookup_mmap:
	save	%sp, -96, %sp
	stb	%g0, [%i4]
	st	%g0, [%i5]
	st	%g0, [%i5+4]
	ld	[%fp+92], %l6
	sll	%i2, 2, %i2
	st	%g0, [%l6]
	addcc	%i1, %i2, %i1
	st	%g0, [%l6+4]
	addx	%i0, 0, %i0
	ld	[%fp+96], %l7
	mov	%i0, %o0
	st	%g0, [%l7]
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%i1, %o1
	stb	%g0, [%i4]
	std	%i0, [%l6]
	srl	%i3, 24, %l0
	srl	%i3, 16, %l2
	sll	%l0, 2, %l0
	and	%l2, 252, %l2
	srl	%i3, 10, %l4
	st	%o0, [%l7]
	and	%l4, 252, %l4
	mov	%l0, %l1
	mov	%l2, %l3
	mov	%l4, %l5
	and	%o0, 3, %i2
	mov	0, %l0
	mov	0, %l2
	cmp	%i2, 1
	bne	.L45
	 mov	0, %l4
	and	%o0, -4, %o0
	srl	%o0, 28, %g2
	sll	%o0, 4, %g3
	or	%l0, %g2, %l0
	or	%l1, %g3, %l1
	mov	%l0, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l1, %o1
	stb	%i2, [%i4]
	std	%l0, [%l6]
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L46
	 st	%o0, [%l7]
	and	%o0, -4, %o0
	srl	%o0, 28, %g2
	sll	%o0, 4, %g3
	or	%l2, %g2, %l2
	or	%l3, %g3, %l3
	mov	%l2, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l3, %o1
	mov	2, %g1
	stb	%g1, [%i4]
	std	%l2, [%l6]
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L47
	 st	%o0, [%l7]
	and	%o0, -4, %o0
	srl	%o0, 28, %g2
	sll	%o0, 4, %g3
	or	%l4, %g2, %l4
	or	%l5, %g3, %l5
	mov	%l4, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l5, %o1
	mov	3, %g1
	stb	%g1, [%i4]
	std	%l4, [%l6]
	st	%o0, [%l7]
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L60
	 mov	1, %i0
.L61:
	jmp	%i7+8
	 restore
.L60:
	cmp	%g1, 2
	bne	.L61
	 and	%i3, 4095, %i3
	mov	0, %i2
.L50:
	srl	%o0, 8, %g1
.L62:
	srl	%o0, 28, %g2
	sll	%g1, 12, %g3
	or	%i2, %g2, %g2
	or	%i3, %g3, %g3
	std	%g2, [%i5]
	jmp	%i7+8
	 restore %g0, 0, %o0
.L47:
	cmp	%g1, 2
	be	.L54
	 sethi	%hi(-16384), %g1
.L59:
	jmp	%i7+8
	 restore %g0, 1, %o0
.L54:
	mov	0, %i2
	b	.L50
	 andn	%i3, %g1, %i3
.L46:
	cmp	%g1, 2
	bne	.L59
	 sethi	%hi(-16777216), %g1
	mov	0, %i2
	b	.L50
	 andn	%i3, %g1, %i3
.L45:
	cmp	%i2, 2
	bne	.L59
	 mov	0, %i2
	b	.L62
	 srl	%o0, 8, %g1
	.size	ajit_lookup_mmap, .-ajit_lookup_mmap
	.align 4
	.global ajit_mmap_operation
	.type	ajit_mmap_operation, #function
	.proc	04
ajit_mmap_operation:
	save	%sp, -104, %sp
	ldub	[%fp+95], %g1
	sll	%i4, 2, %i4
	addcc	%i2, %i4, %l5
	ld	[%fp+96], %l1
	addx	%i1, 0, %l4
	st	%g1, [%fp-4]
	ld	[%fp+100], %l7
	ld	[%fp+104], %l6
	mov	%l4, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l5, %o1
	srl	%l1, 24, %l3
	srl	%l1, 16, %l0
	and	%o0, 3, %g1
	srl	%l1, 10, %l1
	sll	%l3, 2, %l3
	and	%l0, 252, %l0
	and	%l1, 252, %l1
	mov	%i3, %i1
	mov	%i5, %l2
	mov	0, %g2
	mov	0, %i4
	cmp	%g1, 1
	bne	.L82
	 mov	0, %i2
	and	%o0, -4, %o0
	srl	%o0, 28, %l4
	sll	%o0, 4, %l5
	or	%l4, %g2, %l4
	or	%l5, %l3, %l5
	mov	%l4, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l5, %o1
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L64
	 mov	1, %g2
	and	%o0, -4, %o0
	srl	%o0, 28, %l4
	sll	%o0, 4, %l5
	or	%i4, %l4, %l4
	or	%l0, %l5, %l5
	mov	%l4, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l5, %o1
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L84
	 mov	2, %g2
	and	%o0, -4, %o0
	srl	%o0, 28, %l4
	sll	%o0, 4, %l5
	or	%i2, %l4, %l4
	or	%l1, %l5, %l5
	mov	%l4, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l5, %o1
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L64
	 mov	3, %g2
	cmp	%i1, 1
.L102:
	be	.L97
	 and	%g2, 0xff, %g1
.L78:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L97:
	cmp	%g1, %l2
	bgu	.L78
	 ld	[%fp-4], %g1
	sll	%l7, 20, %l7
	sll	%g1, 2, %i1
	srl	%l6, 12, %l6
	or	%i1, 2, %i1
	or	%l7, %l6, %l6
	mov	%l4, %o2
	sll	%l6, 8, %l6
	mov	%l5, %o3
	mov	%g2, %g1
	b	.L77
	 or	%i1, %l6, %i1
.L99:
	bne,a	.L101
	 std	%i2, [%i0+16]
	cmp	%i3, %o1
	bgu	.L88
	 nop
	std	%i2, [%i0+16]
.L101:
	and	%g1, 0xff, %g1
	cmp	%g1, %l2
	be	.L72
	 mov	%i1, %o0
	sll	%i4, 26, %g1
	srl	%i5, 6, %o0
	or	%g1, %o0, %o0
	sll	%o0, 2, %o0
	or	%o0, 1, %o0
.L72:
	mov	%o2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%o3, %o2
	mov	0, %g2
	cmp	%l4, 2
	be	.L73
	 mov	%l0, %g3
	cmp	%l4, 3
	be	.L73
	 mov	%l1, %g3
	cmp	%l4, 1
	be	.L73
	 mov	%l3, %g3
	mov	0, %g3
.L73:
	addcc	%g3, %i5, %o3
	addx	%g2, %i4, %o2
	cmp	%l4, %l2
	bgu	.L78
	 mov	%l5, %g1
.L77:
	add	%g1, 1, %l5
	mov	0, %g2
	and	%l5, 0xff, %l4
	cmp	%l4, 1
	bleu	.L103
	 mov	256, %g3
.L70:
	ldd	[%i0+16], %i4
	addcc	%g3, %i5, %i3
	ldd	[%i0], %o4
	addx	%g2, %i4, %i2
	addcc	%g3, %o5, %o1
	addx	%g2, %o4, %o0
	cmp	%i2, %o0
	bleu	.L99
	 nop
.L88:
	jmp	%i7+8
	 restore %g0, 1, %o0
.L103:
	b	.L70
	 mov	1024, %g3
.L84:
.L64:
	cmp	%g1, 2
	bne	.L102
	 cmp	%i1, 1
	be	.L100
	 xor	%i1, 2, %i1
	subcc	%g0, %i1, %g0
	subx	%g0, 0, %g1
	mov	%l4, %o1
	and	%o0, %g1, %o0
	mov	%l5, %o2
	call	__ajit_store_word_to_physical_address__, 0
	 mov	0, %i0
	jmp	%i7+8
	 restore
.L100:
	ld	[%fp-4], %g1
	sll	%l7, 20, %l7
	sll	%g1, 2, %o0
	mov	%l4, %o1
	mov	%l5, %o2
	or	%o0, 2, %o0
	srl	%l6, 12, %l6
	mov	0, %i0
	or	%l7, %l6, %l6
	sll	%l6, 8, %l6
	call	__ajit_store_word_to_physical_address__, 0
	 or	%o0, %l6, %o0
	jmp	%i7+8
	 restore
.L82:
	b	.L64
	 mov	0, %g2
	.size	ajit_mmap_operation, .-ajit_mmap_operation
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
