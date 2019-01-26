COMPILE_KERNEL?=/usr/lib/modules/$(shell uname -r)/build
CFLAGS_simple_driver.o := -DDEBUG
obj-m += day1.o

all:
	make -C $(COMPILE_KERNEL) M=$(PWD) modules -I string

clean:
	make -C $(COMPILE_KERNEL) M=$(PWD) clean

