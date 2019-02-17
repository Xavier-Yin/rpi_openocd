FROM balenalib/rpi-debian-python:2.7-stretch

RUN apt-get update; apt-get upgrade
RUN apt-get install -y build-essential libtool pkg-config autoconf automake texinfo wget tar git

RUN git clone --single-branch --branch v0.10.0 --depth 1 git://git.code.sf.net/p/openocd/code /_tmp/openocd
WORKDIR /_tmp/openocd
RUN ./bootstrap
RUN ./configure --enable-sysfsgpio --enable-bcm2835gpio
RUN make; make install

