LDSCRIPT=./stm32f446_nucleo.ld

all:
	arm-none-eabi-as -mthumb -o start.o start.S
	arm-none-eabi-ld --script stm32f446_nucleo.ld start.o -o main.elf 
	arm-none-eabi-objcopy -S -O binary main.elf main.bin
