#pragma once
#include <stdint.h>
#include <stdbool.h>

typedef struct {
    uint32_t ctrl;
    uint8_t data;
} pario_t;

static volatile pario_t* parout = (pario_t*) 0x30000000;

static void parout_putchar(char value) {
    while (parout->ctrl & 0x1);
    parout->data = value;
    parout->ctrl = parout->ctrl | 0x1;
}
