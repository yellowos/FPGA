/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <alt_types.h>
#include <sys/alt_sys_wrappers.h>
#include <system.h>
#include <altera_avalon_pio_regs.h>

int main()
{
	alt_8 i;

	printf("Hello from Nios II!\n");

	while(1)
	{
		for(i = 0; i < 8; i++)
		{
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 1<<i);
			ALT_USLEEP (62500);
		}
	}

	return 0;
}
