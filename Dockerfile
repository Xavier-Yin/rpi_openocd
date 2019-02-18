FROM balenalib/rpi-debian-python:2.7-stretch

RUN [ "cross-build-start" ]

RUN apt-get update && \
apt-get upgrade && \
apt-get install -y build-essential libtool pkg-config autoconf automake texinfo wget tar git && \
apt-get clean && \
git clone --single-branch --branch v0.10.0 --depth 1 git://git.code.sf.net/p/openocd/code /_tmp/openocd && \
cd /_tmp/openocd && \
./bootstrap && \
./configure --enable-sysfsgpio --enable-bcm2835gpio && \
make && \
make install

RUN [ "cross-build-end" ]
