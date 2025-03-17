  .section .text.startup
  .global _start
  .type   _start, @function
  .org 0x80
_start:
  # Initialize the stack pointer.
  la sp, __StackTop

  # Initialize the global pointer.
.option push
.option norelax
1:auipc gp, %pcrel_hi(__global_pointer$)
  addi  gp, gp, %pcrel_lo(1b)
.option pop

  # Copy the data section from flash into ram
  la    a0, __data_start__
  la    a1, __erodata
  la    a2, __data_end__
  sub   a2, a2, a0
  call  memcpy

  # Clear the bss segment
  la      a0, __bss_start__
  la      a2, __bss_end__
  sub     a2, a2, a0
  li      a1, 0
  call    memset

  la      a0, __libc_fini_array   # Register global termination functions
  call    atexit                  #  to be called upon exit
  call    __libc_init_array       # Run global initialization functions

  addi a0, zero, 0
  addi a1, zero, 0
  jal ra, main
  jal x0, exit
  .size  _start, .-_start
