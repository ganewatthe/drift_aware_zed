#ifndef CDF_FLOAT_H
#define CDF_FLOAT_H

#include <ap_int.h>

#define NUM_BIN  25
#define SAMPLE   32

void cdf_float(bool data_vld_i, ap_uint<16> airtime_i, bool *cumsum_vld_o, float *cumsum_o);

#endif
