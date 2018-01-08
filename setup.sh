sudo apt-get update & sudo apt-get upgrade -y
sudo apt-get install git build-essential autotools-dev autoconf libcurl3 libcurl4-gnutls-dev libncurses5-dev pkg-config automake yasm build-essential libssl-dev
sudo apt-get install libcurl4-openssl-dev libncurses5-dev pkg-config automake yasm libjansson-dev libgmp-dev automake
git clone https://github.com/JayDDee/cpuminer-opt.git
cd cpuminer-opt
./build.sh
./autogen.sh
CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11" ./configure --with-curl
make
sudo make install

cpuminer -a yescrypt -o stratum+tcp://yescrypt.mine.zpool.ca:6233 -u wallet
