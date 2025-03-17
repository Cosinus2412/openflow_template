#include <stdint.h>
#include <stddef.h>
#include <stdnoreturn.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

#include "ibex-pario.h"

static volatile uint32_t* eoc = (uint32_t*) 0x40000000;

static int unimplemented() {
    return -ENOSYS;
}

void _close() __attribute__((weak, alias("unimplemented")));
void _fstat() __attribute__((weak, alias("unimplemented")));
void _isatty() __attribute__((weak, alias("unimplemented")));
void _lseek() __attribute__((weak, alias("unimplemented")));

__attribute__((weak)) ssize_t _read(int fd, void * buf, size_t count) {
    if (fd != STDIN_FILENO) {
        return -EBADF;
    }

    char * s = (char *)buf;
    for (size_t i = 0; i < count; i++) {
        s[i] = 0;
    }

    return count;
}

__attribute__((weak)) ssize_t _write(int fd, const void * buf, size_t count) {
    if (fd != STDOUT_FILENO && fd != STDERR_FILENO) {
        return -EBADF;
    }

    const char * s = (const char *)buf;
    for (size_t i = 0; i < count; i++) {
        parout_putchar(s[i]);
    }

    return count;
}

__attribute__((weak)) noreturn void _exit(int status) {
    // Enable End of computing
    *eoc = 1;

    while (1);
}

__attribute__((weak)) void* _sbrk(ptrdiff_t incr) {
  extern char   _end; /* Set by linker.*/
  static char * heap_end;
  char *        prev_heap_end;

  if (heap_end == 0)
    heap_end = (char *)&_end;

  prev_heap_end = heap_end;
  heap_end += incr;
  return (void *) prev_heap_end;
}
