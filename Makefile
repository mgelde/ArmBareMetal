LDSCRIPT=./stm32f446_nucleo.ld

build:
	arm-none-eabi-as -mthumb -o start.o start.S
	arm-none-eabi-ld --script $(LDSCRIPT) start.o -o main.elf
	arm-none-eabi-objcopy -S -O binary main.elf main.bin

flash:
	st-flash write main.bin 0x08000000
