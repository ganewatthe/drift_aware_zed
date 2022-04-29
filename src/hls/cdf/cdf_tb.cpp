#include <stdlib.h>
#include <stdio.h>
#include "cdf.h"
#include "cdf_float.h"

//using namespace std;

int main()
{

	bool data_vld_i;
	ap_uint<16> airtime_i;
	dtype_o cumsum_o = 0.5;
	bool cumsum_vld_o;

	float cumsum_float_o;
	bool cumsum_vld_float_o;
	int i = 0, j=0;

	// airtime_i = 100;
	// cumsum_o = (dtype_o) airtime_i / 400 + (dtype_o) 0.25;

	// printf("%f\n", (float) cumsum_o);

	for (i=0; i<SAMPLE*NUM_BIN;)
	{
		data_vld_i = 1;
		airtime_i = 1000;//rand()%10000;

		cdf(data_vld_i, airtime_i, &cumsum_vld_o, &cumsum_o);
		cdf_float(data_vld_i, airtime_i, &cumsum_vld_float_o, &cumsum_float_o);
		// printf("cumsum: %d valid: %d\n", (int) cumsum_o, (int) cumsum_vld_o);

		for (j=i; i<j+NUM_BIN; i++)
		{
			data_vld_i = 0;
			airtime_i = 100;

			cdf(data_vld_i, airtime_i, &cumsum_vld_o, &cumsum_o);
			cdf_float(data_vld_i, airtime_i, &cumsum_vld_float_o, &cumsum_float_o);
			if (cumsum_vld_o == 1)
			{	if ((float) cumsum_o == cumsum_float_o)
					printf("pass ");
				else
					printf("fail ");
				printf("cumsum: %f %f valid: %d\n", (float) cumsum_o, cumsum_float_o, (int) cumsum_vld_o);
			}
		}
	}

	// need NUM_BIN+1 clock cycles to reset counter_o
	data_vld_i = 0;
	airtime_i = 100;
	cdf(data_vld_i, airtime_i, &cumsum_vld_o, &cumsum_o);
	cdf_float(data_vld_i, airtime_i, &cumsum_vld_float_o, &cumsum_float_o);

	printf("\n2nd cumsum\n");

	for (i=0; i<SAMPLE*NUM_BIN;)
	{
		data_vld_i = 1;
		airtime_i = rand()%10000;

		cdf(data_vld_i, airtime_i, &cumsum_vld_o, &cumsum_o);
		cdf_float(data_vld_i, airtime_i, &cumsum_vld_float_o, &cumsum_float_o);
		// printf("cumsum: %d valid: %d\n", (int) cumsum_o, (int) cumsum_vld_o);

		for (j=i; j<i+NUM_BIN; j++)
		{
			data_vld_i = 0;
			airtime_i = 100;

			cdf(data_vld_i, airtime_i, &cumsum_vld_o, &cumsum_o);
			cdf_float(data_vld_i, airtime_i, &cumsum_vld_float_o, &cumsum_float_o);
			if (cumsum_vld_o == 1)
			{
				if (((float) cumsum_o - cumsum_float_o) < 0.1)
					printf("pass ");
				else
					printf("fail ");
				printf("cumsum: %f %f valid: %d\n", (float) cumsum_o, cumsum_float_o, (int) cumsum_vld_o);
			}
		}
	}

	return 0;
}
