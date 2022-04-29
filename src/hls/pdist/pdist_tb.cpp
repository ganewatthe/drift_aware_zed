#include <stdio.h>
#include <stdlib.h>
#include "pdist.h"

int main()
{
	int i=0;

	// inputs
	dtype1 absdiff_i;
	bool absdiff_vld_i;
	// outputs
	dtype2 pdist_o;
	bool pdist_vld_o;

	absdiff_i = (dtype1) 0.1;
	printf("\n First run\n\n");
	// first histogram
	for(i=0; i<NUM_BIN; i++)
	{
		//absdiff_i = 10;
		absdiff_vld_i = 1;

		pdist(absdiff_vld_i, absdiff_i, &pdist_vld_o, &pdist_o);

		// absdiff_i = absdiff_i + 100;

		printf("%d pdist: %f pdist_valid: %d\n", i, (float) pdist_o, pdist_vld_o);
	}

	absdiff_i = (dtype1) 1.0;
	absdiff_vld_i = 0;
	pdist(absdiff_vld_i, absdiff_i, &pdist_vld_o, &pdist_o);

	printf("\n Second run\n\n");
	// first histogram
	for(i=0; i<NUM_BIN; i++)
	{
		// absdiff_i = 10;
		absdiff_vld_i = 1;

		pdist(absdiff_vld_i, absdiff_i, &pdist_vld_o, &pdist_o);

		// absdiff_i = absdiff_i + 1000;

		printf("%d pdist: %f pdist_valid: %d\n", i, (float) pdist_o, pdist_vld_o);
	}

	return 0;
}
