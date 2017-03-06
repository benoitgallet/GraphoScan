# Variables d'environnement
ifeq ($(wildcard ${OPT_INC}),)
	CXX   = g++
endif

BASE_NAME = acquisition
NAME      = ${BASE_NAME}${D}
INC       = -I/usr/include/flycapture
LIBS      = -lflycapture${D} ${FC2_DEPS}

_OBJ      = ${BASE_NAME}.o
SRC       = $(_OBJ:.o=.cpp)
OBJ       = $(patsubst %,%,$(_OBJ))
ONELINE	  = -O2

OPENCV	= `pkg-config --cflags --libs opencv`

# Règle principale
.PHONY: all
all: ${NAME}

# Règle de nettoyage
.PHONY: clean
clean:
	rm -f *.o

# Compilation
${NAME}: ${OBJ}
	${CXX} ${OBJ} -o ${NAME} ${LIBS} ${OPENCV} ${ONELINE}

# Objets intermédiaires
${OBJ}: %.o : %.cpp
	${CXX} ${INC} -Wall -c $< -o $@
