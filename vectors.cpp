
using ExceptionHandler = void (*const)();

extern "C" void _start(void);

ExceptionHandler vectors[2] __attribute__((section(".vectable"))) = {
        (ExceptionHandler)0x20001000,
        (ExceptionHandler)(1 + (unsigned int)&_start),
};
