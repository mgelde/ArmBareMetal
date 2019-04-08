LDSCRIPT=./stm32f446_nucleo.ld

objects = main.o start.o vectors.o
CC=arm-none-eabi-gcc
CXX=arm-none-eabi-g++
AS=arm-none-eabi-as
LD=arm-none-eabi-ld

ASFLAGS = -mthumb -mcpu=cortex-m3
CFLAGS = -mcpu=cortex-m3 -mthumb
CXXFLAGS = -mcpu=cortex-m3 -mthumb -fno-exceptions

.PHONY: build
build: $(objects)
	$(LD) --script $(LDSCRIPT) $(objects) -o app.elf
	arm-none-eabi-objcopy -S -O binary app.elf app.bin

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) -o $@ $<

%.o: %.S
	$(AS) $(ASFLAGS) -o $@ $<

.PHONY: flash
flash:
	st-flash write app.bin 0x08000000

.PHONY: clean
clean:
	-rm $(objects) app.elf app.bin
