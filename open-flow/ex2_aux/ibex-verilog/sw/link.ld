OUTPUT_ARCH(riscv)
ENTRY(_start)

SEARCH_DIR(.)
__DYNAMIC = 0;

MEMORY
{
    rom : ORIGIN = 0x00000000, LENGTH = 0x00002000 /* 8 kB */
    ram : ORIGIN = 0x00020000, LENGTH = 0x00004000 /* 16 kB */
}

STACK_LEN = 0x1000; /* 4 kB */

SECTIONS
{
    .vectors 0 : {
        *(.vectors)
    } >rom

    .text : {
        . = ALIGN(4);
        _stext = .;
        *(.text)
        *(.text.*)
        _etext  =  .;
        __CTOR_LIST__ = .;
        LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
        *(.ctors)
        LONG(0)
        __CTOR_END__ = .;
        __DTOR_LIST__ = .;
        LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
        *(.dtors)
        LONG(0)
        __DTOR_END__ = .;
        *(.lit)
        *(.shdata)
        . = ALIGN(4);
        _endtext = .;
    } >rom

    .rodata : {
        . = ALIGN(4);
        *(.rodata);
        *(.rodata.*)
    } >rom

    .shbss : {
        . = ALIGN(4);
        *(.shbss)
    } >ram

    .data : {
        . = ALIGN(4);
        sdata = .;
        _sdata = .;
        *(.data);
        *(.data.*)
        edata = .;
        _edata = .;
    } >ram AT> rom

    .bss (NOLOAD) : {
        . = ALIGN(4);
        _bss_start = .;
        *(.bss)
        *(.bss.*)
        *(.sbss)
        *(.sbss.*)
        *(COMMON)
        _bss_end = .;
    } >ram

    .stack ORIGIN(ram) + LENGTH(ram) - STACK_LEN (NOLOAD) : {
        . = ALIGN(16);
        _stack_start = .;
        . = . + STACK_LEN;
        . = ALIGN(16);
        stack = .;
        _stack = .;
        _stack_end = .;
    } >ram

    .stab 0 (NOLOAD) : {
        [ .stab ]
    }

    .stabstr 0 (NOLOAD) : {
        [ .stabstr ]
    }
}
