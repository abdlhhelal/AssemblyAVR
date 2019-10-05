inc:=$(shell where avrasm2)

inc := $(dir $(inc))
inc := $(addprefix  $(inc),include)

file=ATS

all: clean $(file).hex

$(file).hex:$(file).asm
	avrasm2 -fI -I $(inc) -l $(file).ls $(file).asm
	
program:all
	avrdude -p atmega32 -c usbasp -u -U flash:w:$(file).hex
	
clean:
	rm -f $(file).hex  $(file).ls