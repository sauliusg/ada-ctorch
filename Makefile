#--*- Makefile -*--

PRG_DIR ?= .
SRC_DIR ?= src
BIN_DIR ?= bin

ADA_PROGRAMS ?= $(wildcard ${PRG_DIR}/*.adb)

C_SOURCES ?= $(wildcard ${SRC_DIR}/*.cpp)

ADA_SOURCE ?= $(wildcard ${SRC_DIR}/*.adb)

ADA_EXEC ?= ${ADA_PROGRAMS:${PRG_DIR}/%.adb=${BIN_DIR}/%}

gnatmake = gnatmake

all: ${ADA_EXEC}

${BIN_DIR}/%: ${PRG_DIR}/%.adb
	${gnatmake} $<

clean:
	rm -f ${ADA_EXEC}
