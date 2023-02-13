bin= reverse_string
obj= reverse_string.o
src= reverse_string.asm


${bin}: ${obj}
	clang -o $@ $^ -no-pie


${obj}: ${src}
	nasm -f elf64 -g -F dwarf $^


clear:
	rm ${bin} ${obj}
