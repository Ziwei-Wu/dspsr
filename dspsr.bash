#!/bin/bash

"""
yes, the LOFAR backend is missing in backends.list You have to add "lofar_dal" there and recompile dspsr.
(you should also install LOFAR DAL library beforehand - https://github.com/nextgen-astrodata/DAL.git)

    Hi Ziwei,

    I guess this has to do with a missing backend in backends.list when
    compiling dspsr. I can recompile if someone gives me a pointer which one
    to add for this kind of data.
"""

for pulsar in /data/zwu/Lofar_core/B*;
do
	      cd $pulsar
	      mkdir archives
	      for observation in L*;
	      do
		  cd $observation
		  cd rawvoltages/SAP0/BEAM0/raw-8bit/
		  dspsr -F 1000:D -A -L 10 -a PSRFITS -minram 1 -S 1  -fft-bench -E ../../../../*.par -O $observation *SAP000_B000_S0_*_bf.h5
		  mv *.ar ../../../../../archives/
		  cd ../../../../../
	      done
cd /data/zwu/Lofar_core/
done
exit
