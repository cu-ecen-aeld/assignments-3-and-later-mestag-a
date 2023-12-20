all: writer


SRC=writer.c
OBJ=$(SRC:.c=.o)

%.o: %.c
	${CROSS_COMPILE}gcc -o $@ -c $<


writer: $(OBJ)
	${CROSS_COMPILE}gcc -o writer $(OBJ)

clean:
	rm -f writer $(OBJ)
