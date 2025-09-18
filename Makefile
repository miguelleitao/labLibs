
TARGET=calc

OBJS=calc.o 
DINOBJS=calc_din.o

LIBOBJS=soma.o sub.o

LIB=operacoes

LIBFILE=lib$(LIB).a

SOFILE=lib$(LIB).so

SRCS=$(OBJS:.o=.c) 
DINSRCS=$(DINOBJS:.o=.c)
LIBSRCS=$(LIBOBJS:.o=.c)
EXECS=${TARGET}0 ${TARGET}1 ${TARGET}2 ${TARGET}3 ${TARGET}4 ${TARGET}5

CFLAGS=-Wall -O2

WPATH=http://ave.dee.isep.ipp.pt/~jml/arcom/lab1

WGET=wget -q 

all: $(EXECS)

calc0: calc0.c
	cc -o $@ $<
calc1:$(OBJS) $(LIBOBJS)
	cc -o $@ ${OBJS} $(LIBOBJS)
calc2:$(OBJS) $(LIBFILE)
	cc -o $@ ${OBJS} -L. -l $(LIB)
calc3:$(OBJS) $(LIBFILE)
	cc -o $@ -static ${OBJS} -L. -l $(LIB)
calc4:$(OBJS) $(SOFILE)
	cc -o $@ ${OBJS} -L. -l $(LIB)
calc5:$(DINOBJS)
	cc -o $@ ${DINOBJS} -ldl

$(LIBFILE): $(LIBOBJS)
	ar r $(LIBFILE) $(LIBOBJS)

$(SOFILE): $(LIBOBJS)
	$(CC) -o $(SOFILE) -shared $(LIBOBJS)	

getall:
	$(WGET) $(WPATH)/calc0.c
	$(WGET) $(WPATH)/calc.c
	$(WGET) $(WPATH)/soma.c
	$(WGET) $(WPATH)/sub.c 
	$(WGET) $(WPATH)/calc.h
	$(WGET) $(WPATH)/calc_din.c

clean:
	rm -f $(OBJS) $(EXECS) $(SOFILE) $(LIBFILE) $(LIBOBJS) $(DINOBJS)

distclean: clean
	rm -f ${TARGET}?

depend:
	makedepend -- $(CFLAGS) -- $(SRCS) $(LIBSRCS)


