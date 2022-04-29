#ifndef HIST_H
#define HIST_H

#include "ap_int.h"

#define SAMPLE 8192
#define NUM_BIN 20

void hist(bool data_vld_i, ap_uint<16> airtime_i, bool *histarray_vld_o, ap_uint<16> *histarray_o);

#endif
