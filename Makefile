##
## EPITECH PROJECT, 2017
## Makefile pour compresser lib
## File description:
## Makefile
##

CC	=	ld

ASM = nasm

SRC	=	src/strlen.asm 	\
		src/strchr.asm 	\
		src/strcmp.asm 	\
		src/memcpy.asm	\
		src/memset.asm	\
		src/memmove.asm \
		src/rindex.asm	\
		src/strcspn.asm	\
		src/strncmp.asm	\
		src/strcasecmp.asm	\
		src/strstr.asm		\
		src/strpbrk.asm\

OBJ	=	$(SRC:.asm=.o)

CFLAGS	=	-shared -fPIC
ASMFLAGS	=	-f elf64

NAME	=	libasm.so

%.o: %.asm
			$(ASM) -o $@ $< $(ASMFLAGS)

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

test:	$(NAME)
	gcc -o test main.c $(OBJ)

