#!/bin/bash
cd /opt && git clone https://github.com/pguyot/kaldi.git
cd /opt/kaldi/tools && sudo extras/install_mkl.sh
sudo apt-get install automake autoconf sox libtool subversion
cd /opt/kaldi/tools && make -j 8
cd /opt/kaldi/src && ./configure --shared && make -j 8
sudo cp /opt/kaldi/kaldi-asr.pc /usr/lib/x86_64-linux-gnu/pkgconfig/kaldi-asr.pc
sudo cp /opt/kaldi/kaldi.conf /etc/ld.so.conf.d/kaldi.conf
cat /opt/kaldi/kaldi-files.txt | tar cJf kaldi-c3260f2-linux_x86_64-vfp.tar.xz -T - -C /
