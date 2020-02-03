#!/bin/bash

for pulsar in /data/zwu/Lofar_core/B*;
do
	      cd $pulsar
	      mkdir archives
	      for observation in L*/;
	      do
		  cd $observation/rawvoltages/SAP0/BEAM0/raw-8bit/
		  dspsr -F 1000:D -A -L 10 -a PSRFITS -minram 1 -S 1  -fft-bench -E ../../../../*.par -O $observation *SAP000_B000_S0_*_bf.h5
		  mv *.ar ../../../../../archives/
		  cd ../../../../../
	      done
cd /data/zwu/Lofar_core/
done
exit
