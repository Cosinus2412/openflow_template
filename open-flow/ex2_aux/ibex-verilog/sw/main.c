#include <uart.h>

static volatile long *const led_data = (volatile long *const) 0x20000000;

int main(int argc, char *argv[])
{
    *led_data = 1;
    *led_data = 0;
    *led_data = 1;
    
    uart_set_baudrate();
    uart_puts("Booting!\n");

    // enable timer interrupt
    //asm volatile("csrw mie,     %0" :: "r"(0x00000080));
    //asm volatile("csrs mstatus, %0" :: "r"(0x00000008));

    uart_puts("Enabled interrupts!\n");

    *led_data = 1;
    *led_data = 0;
    *led_data = 1;

    while (1)
    {
        uart_putc(uart_getc());
    }

    return 0;
}

void exception_handler(long mcause, void *mepc, void *mtval, void *frame_ptr)
{
    // clear interrupt flag
    //volatile long *const interrupt_flags = (volatile long *const)0xFF000200; // TODO!!!!!!!
    //*interrupt_flags = 1;

    static int cnt = 0;
    
    cnt++;
    
    if (cnt == 100)
    {
      //*led_data = !(*led_data);
      cnt = 0;
      uart_puts("Hello world!\n");
    }

}

