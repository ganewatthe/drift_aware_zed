#include <stdio.h>
#include "hist.h"


int main()
{
	bool data_vld_i;
	ap_uint<16> airtime_i;
	ap_uint<16> histarray_o;
	bool histarray_vld_o;
	int i = 0, j=0;

	int cumsum = 0;

	for (i=0; i<SAMPLE*NUM_BIN;)
	{
		data_vld_i = 1;
		airtime_i = rand()%10000;

		hist(data_vld_i, airtime_i, &histarray_vld_o, &histarray_o);
		//printf("histval: %d valid: %d\n", (int) histarray_o, (int) histarray_vld_o);

		for (j=i; i<j+NUM_BIN; i++)
		{
			data_vld_i = 0;
			airtime_i = 100;

			hist(data_vld_i, airtime_i, &histarray_vld_o, &histarray_o);
			if (histarray_vld_o == 1)
			{
				printf("histval: %d valid: %d\n", (int) histarray_o, (int) histarray_vld_o);
				cumsum = cumsum + histarray_o;
			}
		}
	}
	printf("\n Cumsum: %d\n\n", cumsum);


	// second run
	// reset everything
	data_vld_i = 0;
	airtime_i = 100;
	hist(data_vld_i, airtime_i, &histarray_vld_o, &histarray_o);
	cumsum = 0;
	for (i=0; i<SAMPLE*NUM_BIN;)
	{
		data_vld_i = 1;
		airtime_i = rand()%10000;

		hist(data_vld_i, airtime_i, &histarray_vld_o, &histarray_o);
		//printf("histval: %d valid: %d\n", (int) histarray_o, (int) histarray_vld_o);

		for (j=i; i<j+NUM_BIN; i++)
		{
			data_vld_i = 0;
			airtime_i = 100;

			hist(data_vld_i, airtime_i, &histarray_vld_o, &histarray_o);
			if (histarray_vld_o == 1)
			{
				printf("histval: %d valid: %d\n", (int) histarray_o, (int) histarray_vld_o);
				cumsum = cumsum + histarray_o;
			}
		}
	}

	printf("\n Cumsum: %d\n\n", cumsum);

	return 0;
}
