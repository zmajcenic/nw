BIN_DIR = bin
SYM_DIR = symbol
DSK_DIR = dsk

.PHONY: all basic upload clean buildnum

all: basic 

basic:
	cp basic/*.BAS dsk/
	./append_ctrl_z.sh

upload:
	pscp -P 22 bin/ff.rom pi@192.168.0.3:/media/usb0/gr8net/

clean:
	rm $(DSK_DIR)/*.*

buildnum:
	date -Iseconds > buildnum.txt
	echo " DB "\"`cat buildnum.txt`\" > buildnum.inc


	