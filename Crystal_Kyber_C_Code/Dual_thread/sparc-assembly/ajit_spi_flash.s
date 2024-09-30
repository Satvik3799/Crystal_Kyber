	.file	"ajit_spi_flash.c"
	.section	".text"
	.align 4
	.global ajit_spi_transfer_is_in_progress
	.type	ajit_spi_transfer_is_in_progress, #function
	.proc	016
ajit_spi_transfer_is_in_progress:
	sethi	%hi(-53248), %o0
	or	%o0, 776, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%o0] 32, %o0
	
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 and	%o0, 1, %o0
	.size	ajit_spi_transfer_is_in_progress, .-ajit_spi_transfer_is_in_progress
	.align 4
	.global ajit_spi_flash_send_byte
	.type	ajit_spi_flash_send_byte, #function
	.proc	020
ajit_spi_flash_send_byte:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	or	%i5, 768, %g1
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i1, [%g1] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %i0
	and	%i2, 1, %i2
	sll	%i0, 3, %i0
	add	%i2, %i2, %i2
	or	%i0, 1, %i0
	or	%i5, 776, %i5
	or	%i0, %i2, %i2
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i2, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L8
	 nop
.L5:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L5
	 nop
.L8:
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_send_byte, .-ajit_spi_flash_send_byte
	.align 4
	.global ajit_spi_flash_receive_byte
	.type	ajit_spi_flash_receive_byte, #function
	.proc	014
ajit_spi_flash_receive_byte:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	mov	0, %g1
	or	%i5, 768, %g2
#APP
! 56 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %i0
	and	%i1, 1, %i1
	sll	%i0, 3, %i0
	add	%i1, %i1, %i1
	or	%i0, 1, %i0
	or	%i5, 776, %i5
	or	%i0, %i1, %i1
#APP
! 64 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i1, [%i5] 32
	
! 0 "" 2
! 73 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
#NO_APP
	cmp	%g1, 0
	be	.L10
	 nop
.L12:
	call	__ajit_sleep__, 0
	 mov	64, %o0
	mov	0, %g1
#APP
! 73 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
#NO_APP
	b,a	.L12
.L10:
#APP
! 86 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%g2] 32, %i0
	
! 0 "" 2
#NO_APP
	and	%i0, 0xff, %i0
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_receive_byte, .-ajit_spi_flash_receive_byte
	.align 4
	.global ajit_spi_flash_reset
	.type	ajit_spi_flash_reset, #function
	.proc	020
ajit_spi_flash_reset:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	mov	102, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %g1
	or	%i5, 776, %i5
	sll	%g1, 3, %g1
	or	%g1, 3, %g1
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L18
	 nop
.L16:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L16
	 nop
.L18:
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_reset, .-ajit_spi_flash_reset
	.align 4
	.global ajit_spi_flash_memory_reset
	.type	ajit_spi_flash_memory_reset, #function
	.proc	020
ajit_spi_flash_memory_reset:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	mov	153, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %g1
	or	%i5, 776, %i5
	sll	%g1, 3, %g1
	or	%g1, 3, %g1
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L24
	 nop
.L22:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L22
	 nop
.L24:
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_memory_reset, .-ajit_spi_flash_memory_reset
	.align 4
	.global ajit_spi_set_clock_frequency
	.type	ajit_spi_set_clock_frequency, #function
	.proc	020
ajit_spi_set_clock_frequency:
	and	%o0, 15, %o0
	sethi	%hi(-53248), %g1
	or	%o0, 16, %o0
	or	%g1, 780, %g1
#APP
! 107 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %o0, [%g1] 32
	
! 0 "" 2
#NO_APP
	jmp	%o7+8
	 nop
	.size	ajit_spi_set_clock_frequency, .-ajit_spi_set_clock_frequency
	.align 4
	.global ajit_spi_flash_is_busy
	.type	ajit_spi_flash_is_busy, #function
	.proc	016
ajit_spi_flash_is_busy:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	mov	5, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %i0
	or	%i5, 776, %i5
	sll	%i0, 3, %i0
	or	%i0, 1, %g1
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L36
	 sethi	%hi(-53248), %i5
.L31:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L31
	 nop
	sethi	%hi(-53248), %i5
.L36:
	mov	0, %g1
	or	%i5, 768, %g2
#APP
! 56 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i0, 3, %i0
	or	%i5, 776, %i5
#APP
! 64 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i0, [%i5] 32
	
! 0 "" 2
! 73 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
#NO_APP
	cmp	%g1, 0
	be	.L35
	 nop
.L34:
	call	__ajit_sleep__, 0
	 mov	64, %o0
	mov	0, %g1
#APP
! 73 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
#NO_APP
	b,a	.L34
.L35:
#APP
! 86 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%g2] 32, %i0
	
! 0 "" 2
#NO_APP
	and	%i0, 1, %i0
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_is_busy, .-ajit_spi_flash_is_busy
	.align 4
	.global ajit_spi_flash_generic_erase
	.type	ajit_spi_flash_generic_erase, #function
	.proc	020
ajit_spi_flash_generic_erase:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	mov	6, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %i3
	or	%i5, 776, %i5
	sll	%i3, 3, %i3
	or	%i3, 3, %i4
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i4, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L63
	 sethi	%hi(-53248), %i5
.L55:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L55
	 nop
	sethi	%hi(-53248), %i5
.L63:
	or	%i5, 768, %g1
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i1, [%g1] 32
	
! 0 "" 2
#NO_APP
	or	%i3, 1, %i3
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i3, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L64
	 srl	%i2, 16, %g1
.L54:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L54
	 srl	%i2, 16, %g1
.L64:
	sethi	%hi(-53248), %i5
	and	%g1, 255, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i3, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L65
	 srl	%i2, 8, %g1
.L53:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L53
	 srl	%i2, 8, %g1
.L65:
	sethi	%hi(-53248), %i5
	and	%g1, 255, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i3, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L66
	 sethi	%hi(-53248), %i5
.L52:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L52
	 nop
	sethi	%hi(-53248), %i5
.L66:
	and	%i2, 255, %i2
	or	%i5, 768, %g1
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i2, [%g1] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i4, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L67
	 sethi	%hi(-53248), %i5
.L51:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L51
	 nop
	sethi	%hi(-53248), %i5
.L67:
	mov	4, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i4, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L68
	 nop
.L50:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L50
	 nop
	jmp	%i7+8
	 restore
.L68:
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_generic_erase, .-ajit_spi_flash_generic_erase
	.align 4
	.global ajit_spi_flash_subsector_erase
	.type	ajit_spi_flash_subsector_erase, #function
	.proc	020
ajit_spi_flash_subsector_erase:
	mov	%o1, %o2
	mov	32, %o1
	or	%o7, %g0, %g1
	call	ajit_spi_flash_generic_erase, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_subsector_erase, .-ajit_spi_flash_subsector_erase
	.align 4
	.global ajit_spi_flash_sector_erase
	.type	ajit_spi_flash_sector_erase, #function
	.proc	020
ajit_spi_flash_sector_erase:
	mov	%o1, %o2
	mov	216, %o1
	or	%o7, %g0, %g1
	call	ajit_spi_flash_generic_erase, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_sector_erase, .-ajit_spi_flash_sector_erase
	.align 4
	.global ajit_spi_flash_bulk_erase
	.type	ajit_spi_flash_bulk_erase, #function
	.proc	020
ajit_spi_flash_bulk_erase:
	mov	%o1, %o2
	mov	199, %o1
	or	%o7, %g0, %g1
	call	ajit_spi_flash_generic_erase, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_bulk_erase, .-ajit_spi_flash_bulk_erase
	.align 4
	.global ajit_spi_flash_read
	.type	ajit_spi_flash_read, #function
	.proc	020
ajit_spi_flash_read:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	mov	3, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %i4
	or	%i5, 776, %i5
	sll	%i4, 3, %i4
	or	%i4, 1, %i4
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i4, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L97
	 srl	%i1, 16, %g1
.L90:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L90
	 srl	%i1, 16, %g1
.L97:
	sethi	%hi(-53248), %i5
	and	%g1, 255, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i4, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L98
	 srl	%i1, 8, %g1
.L89:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L89
	 srl	%i1, 8, %g1
.L98:
	sethi	%hi(-53248), %i5
	and	%g1, 255, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i4, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L99
	 sethi	%hi(-53248), %i5
.L88:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L88
	 nop
	sethi	%hi(-53248), %i5
.L99:
	and	%i1, 255, %i1
	or	%i5, 768, %g1
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i1, [%g1] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i4, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L100
	 cmp	%i3, 0
.L87:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L87
	 cmp	%i3, 0
.L100:
	be	.L102
	 sethi	%hi(-53248), %g3
	add	%i3, -1, %i0
	or	%g3, 768, %g4
	mov	0, %g2
	mov	0, %g1
	mov	0, %i1
	or	%g3, 776, %g3
.L86:
#APP
! 56 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i1, [%g4] 32
	
! 0 "" 2
#NO_APP
	xor	%g2, %i0, %i5
	subcc	%g0, %i5, %g0
	subx	%g0, -1, %i5
	add	%i5, %i5, %i5
	or	%i5, %i4, %i5
#APP
! 64 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i5, [%g3] 32
	
! 0 "" 2
#NO_APP
	mov	0, %i5
#APP
! 73 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i5, [%g3] 32
	
! 0 "" 2
! 86 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%g4] 32, %i5
	
! 0 "" 2
#NO_APP
	stb	%i5, [%i2+%g2]
	add	%g1, 1, %g1
	cmp	%g1, %i3
	bne	.L86
	 mov	%g1, %g2
.L102:
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_read, .-ajit_spi_flash_read
	.align 4
	.global ajit_spi_flash_write
	.type	ajit_spi_flash_write, #function
	.proc	020
ajit_spi_flash_write:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %i5
	mov	6, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	and	%i0, 7, %i0
	or	%i5, 776, %i5
	sll	%i0, 3, %i0
	or	%i0, 3, %l1
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %l1, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L138
	 sethi	%hi(-53248), %i5
.L128:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L128
	 nop
	sethi	%hi(-53248), %i5
.L138:
	mov	2, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i0, 1, %i0
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i0, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L139
	 srl	%i1, 16, %g1
.L127:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L127
	 srl	%i1, 16, %g1
.L139:
	sethi	%hi(-53248), %i5
	and	%g1, 255, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i0, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L140
	 srl	%i1, 8, %g1
.L126:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L126
	 srl	%i1, 8, %g1
.L140:
	sethi	%hi(-53248), %i5
	and	%g1, 255, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i0, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L141
	 sethi	%hi(-53248), %i5
.L125:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L125
	 nop
	sethi	%hi(-53248), %i5
.L141:
	and	%i1, 255, %i1
	or	%i5, 768, %g1
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i1, [%g1] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %i0, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L142
	 sethi	%hi(-53248), %i5
.L124:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L124
	 nop
	sethi	%hi(-53248), %i5
.L142:
	add	%i3, -1, %l0
	or	%i5, 768, %i1
	mov	0, %g1
	mov	0, %i4
	cmp	%i3, 0
	be	.L115
	 or	%i5, 776, %i5
.L122:
	ldub	[%i2+%g1], %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g2, [%i1] 32
	
! 0 "" 2
#NO_APP
	xor	%l0, %g1, %g1
	subcc	%g0, %g1, %g0
	subx	%g0, -1, %g1
	add	%g1, %g1, %g1
	or	%g1, %i0, %g1
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be,a	.L143
	 add	%i4, 1, %i4
.L123:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L123
	 nop
	add	%i4, 1, %i4
.L143:
	cmp	%i4, %i3
	bne	.L122
	 mov	%i4, %g1
.L115:
	sethi	%hi(-53248), %i5
	mov	4, %g1
	or	%i5, 768, %g2
#APP
! 32 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %g1, [%g2] 32
	
! 0 "" 2
#NO_APP
	or	%i5, 776, %i5
#APP
! 40 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	sta %l1, [%i5] 32
	
! 0 "" 2
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	be	.L144
	 nop
.L121:
	call	__ajit_sleep__, 0
	 mov	64, %o0
#APP
! 17 "/home/satvik/AJIT/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_spi_flash.c" 1
	lda [%i5] 32, %g1
	
! 0 "" 2
#NO_APP
	andcc	%g1, 1, %g0
	bne	.L121
	 nop
	jmp	%i7+8
	 restore
.L144:
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_write, .-ajit_spi_flash_write
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
