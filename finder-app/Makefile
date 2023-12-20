all: writer


SRC=writer.c
OBJ=$(SRC:.c=.o)


writer: $(OBJ)
	${CROSS_COMPILE}gcc -o writer $(OBJ)

clean:
	rm -f writer $(OBJ)
