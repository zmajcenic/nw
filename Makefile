BIN_DIR = bin
SYM_DIR = symbol
DSK_DIR = dsk

.PHONY: all basic upload clean buildnum cas

all: basic 

basic:
	cp basic/*.BAS dsk/
	./append_ctrl_z.sh

upload:
	pscp -P 22 islwar.cas pi@192.168.0.3:/media/usb0/gr8net/

clean:
	rm $(DSK_DIR)/*.*

buildnum:
	date -Iseconds > buildnum.txt
	echo " DB "\"`cat buildnum.txt`\" > buildnum.inc

cas: basic
	if [ -x islwar.cas ]; then rm islwar.cas; fi
	cp dsk/SC2CONS.BAS islwar.asc
	mcp -a islwar.cas islwar.asc
	