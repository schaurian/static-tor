apt-get update
apt-get install -y build-essential curl -y
curl -fsSL "https://zlib.net/zlib-1.2.11.tar.gz" | tar zxvf -
cd zlib-1.2.11
./configure --prefix=$PWD/install
make -j$(nproc)
make install
cd ..
curl -fsSL "https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz" | tar zxvf -
cd libevent-2.1.8-stable
./configure --prefix=$PWD/install \
           --disable-shared \
           --enable-static \
           --with-pic
make -j$(nproc)
make install
cd ..
curl -fsSL "https://www.openssl.org/source/openssl-1.0.2m.tar.gz" | tar zxvf -
cd openssl-1.0.2m
./config --prefix=$PWD/install no-shared no-dso
make -j$(nproc)
make install
cd ..
#curl -fsSL "https://www.torproject.org/dist/tor-0.3.1.8.tar.gz" | tar zxvf -
curl -fsSL "https://dist.torproject.org/tor-0.4.5.8.tar.gz" | tar zxvf -
cd tor-0.4.5.8
./configure --prefix=$PWD/install \
            --enable-static-tor \
            --with-libevent-dir=$PWD/../libevent-2.1.8-stable/install \
            --with-openssl-dir=$PWD/../openssl-1.0.2m/install \
            --with-zlib-dir=$PWD/../zlib-1.2.11/install
make -j$(nproc)
make install
