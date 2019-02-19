FROM balenalib/rpi-debian-python:2.7-stretch

RUN [ "cross-build-start" ]

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libtool pkg-config autoconf automake texinfo wget git && \
    git clone --single-branch --branch v0.10.0 --depth 1 git://git.code.sf.net/p/openocd/code /_tmp/openocd && \
    cd /_tmp/openocd && \
    ./bootstrap && \
    ./configure --enable-sysfsgpio --enable-bcm2835gpio && \
    make && \
    make install && \
    cd / && \
    rm -rf /_tmp && \
    apt-get remove -y build-essential libtool pkg-config autoconf automake texinfo wget git && \
    apt-get autoremove --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN [ "cross-build-end" ]
