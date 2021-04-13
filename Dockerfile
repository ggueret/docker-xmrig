FROM debian:buster

RUN apt-get update && apt-get -y install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev && \
    git clone https://github.com/xmrig/xmrig.git && \
    mkdir xmrig/build && cd xmrig/build && \
    cmake .. && \
    make -j$(nproc) && \
    mv xmrig /usr/local/sbin/xmrig && \
    cd / && rm -rf xmrig && \
    apt-mark manual libuv1 libssl1.1 libhwloc5 libltdl7 libnuma1 && \
    apt-get -y remove --purge git build-essential cmake libuv1-dev libssl-dev libhwloc-dev && \
    apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/local/sbin/xmrig" ]
