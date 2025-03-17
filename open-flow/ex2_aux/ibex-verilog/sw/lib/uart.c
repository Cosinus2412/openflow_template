#include "uart.h"

static volatile long *const uart_status   = (volatile long *const) 0x10000000;
static volatile long *const uart_rx       = (volatile long *const) 0x10000004;
static volatile long *const uart_tx       = (volatile long *const) 0x10000008;
static volatile long *const uart_baudrate = (volatile long *const) 0x1000000C;

#define RX_FLAG (1<<0) // high for received, clears on read
#define TX_FLAG (1<<1) // high on tx busy

#define F_CPU 40000000
#define BAUDRATE_UART 115200

void uart_set_baudrate(void)
{
    *uart_baudrate = F_CPU / BAUDRATE_UART;
}

void uart_putc(char c)
{
    // wait until transmitter ready:
    while (((*uart_status) & TX_FLAG));
    *uart_tx = c;
}

char uart_getc(void)
{
    // wait until a character was received:
    while (!((*uart_status) & RX_FLAG));
    return *uart_rx;
}

void uart_write(int n, const char *buf)
{
    for ( ; n > 0; n--)
        uart_putc(*(buf++));
}

void uart_read(int n, char *buf)
{
    for ( ; n > 0; n--)
        *(buf++) = uart_getc();
}

void uart_puts(const char *str)
{
    for ( ; *str != 0; str++)
        uart_putc(*str);
}

void uart_gets(char *buf, int size)
{
    char c = 0;
    for ( ; size > 1 && c != '\n' && c != '\r'; size--)
        *(buf++) = c = uart_getc();
    *buf = 0;
}
