#include <stdio.h>
#include <stdlib.h>
#include "absdiff.h"

int main()
{
	int i=0;

	// outputs
	dtype2 absdiff_o;
	bool absdiff_vld_o;

	// inputs
	bool cumsumref_vld_i;
	bool cumsumcur_vld_i;
	dtype1 cumsumref_i;
	dtype2 cumsumcur_i;
	
	printf("\n First run\n\n");
	// first histogram
	for(i=0; i<NUM_BIN; i++)
	{
		cumsumref_i = (dtype1) 0.10;
		cumsumref_vld_i = 1;
		cumsumcur_i = 0;
		cumsumcur_vld_i = 0;

		absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
				 &absdiff_vld_o, &absdiff_o);
		cumsumref_i = cumsumref_i + 100;

		printf("%i absdiff: %f absdiff_valid: %d\n", i, (float) absdiff_o, absdiff_vld_o);
	}

	printf("\n Difference\n\n");

	for(i=0; i<NUM_BIN; i++)
	{
		cumsumref_i = 0;
		cumsumref_vld_i = 0;
		cumsumcur_i = (dtype2) 0.2;
		cumsumcur_vld_i = 1;

		absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
				 &absdiff_vld_o, &absdiff_o);
		cumsumcur_i = cumsumcur_i + 100;

		printf("%i absdiff: %f absdiff_valid: %d\n", i, (float) absdiff_o, absdiff_vld_o);
	}

	// reset everything
	cumsumref_i = 0;
	cumsumref_vld_i = 0;
	cumsumcur_i = 0;
	cumsumcur_vld_i = 0;
	absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
					 &absdiff_vld_o, &absdiff_o);

	printf("\n Second run\n\n");

	cumsumref_i = 0;
	// first histogram
	for(i=0; i<NUM_BIN; i++)
	{
		cumsumref_i = (dtype1) 0.50;
		cumsumref_vld_i = 1;
		cumsumcur_i = 0;
		cumsumcur_vld_i = 0;

		absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
				 &absdiff_vld_o, &absdiff_o);
		//cumsumref_i = cumsumref_i + 100;

		printf("%i absdiff: %f absdiff_valid: %d\n", i, (float) absdiff_o, absdiff_vld_o);
	}
	
	printf("\n Difference\n\n");

	cumsumcur_i = 100;
	for(i=0; i<NUM_BIN; i++)
	{
		cumsumref_i = 0;
		cumsumref_vld_i = 0;
		cumsumcur_i = (dtype2) 0.30;
		cumsumcur_vld_i = 1;

		absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
				 &absdiff_vld_o, &absdiff_o);
		// cumsumcur_i = cumsumcur_i + 100;

		printf("%i absdiff: %f absdiff_valid: %d\n", i, (float) absdiff_o, absdiff_vld_o);
	}
	


	// reset everything
		cumsumref_i = 00;
		cumsumref_vld_i = 0;
		cumsumcur_i = 0;
		cumsumcur_vld_i = 0;
		absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
						 &absdiff_vld_o, &absdiff_o);

		printf("\n Third run\n\n");

		cumsumref_i = 0;
		// first histogram
		for(i=0; i<NUM_BIN; i++)
		{
			cumsumref_i = (dtype1) 0.20;
			cumsumref_vld_i = 1;
			cumsumcur_i = 0;
			cumsumcur_vld_i = 0;

			absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
					 &absdiff_vld_o, &absdiff_o);
			//cumsumref_i = cumsumref_i + 100;

			printf("%i absdiff: %f absdiff_valid: %d\n", i, (float) absdiff_o, absdiff_vld_o);
		}

		printf("\n Difference\n\n");

		cumsumcur_i = 100;
		for(i=0; i<NUM_BIN; i++)
		{
			cumsumref_i = 0;
			cumsumref_vld_i = 0;
			cumsumcur_i = (dtype2) 0.80;
			cumsumcur_vld_i = 1;

			absdiff(cumsumref_vld_i, cumsumref_i, cumsumcur_vld_i, cumsumcur_i,
					 &absdiff_vld_o, &absdiff_o);
			// cumsumcur_i = cumsumcur_i + 100;

			printf("%i absdiff: %f absdiff_valid: %d\n", i, (float) absdiff_o, absdiff_vld_o);
		}





	return 0;
}
