CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c99 -pedantic -g -fsanitize=address
LDFLAG = -fsanitize=address
LDLIBS =
CPPFLAGS = -Isrc -Itests -D_DEFAULT_SOURCE

SRC = src/*.c
OBJS = ${SRC:.c=.o}
EXEC = net

.PHONY: clean all library distclean

all: $(EXEC)

${EXEC}: ${OBJS}
	${CC} ${CFLAGS} $^ -o $@ ${LDLIBS}

distclean:
	${RM} ${OBJS} vgcore.*


clean: distclean
	${RM} ${EXEC}
