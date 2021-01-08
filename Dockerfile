FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apt-utils
RUN apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git libevent-dev libssl-dev
RUN apt-get -y install software-properties-common
RUN apt-get -y install g++-arm-linux-gnueabihf g++-mingw-w64-x86-64 g++-aarch64-linux-gnu binutils-aarch64-linux-gnu
RUN apt-get -y install zip wget
RUN wget http://mirrors.edge.kernel.org/ubuntu/pool/universe/d/db/libdb5.1_5.1.29-7ubuntu1_amd64.deb \
	&& apt install ./libdb5.1_5.1.29-7ubuntu1_amd64.deb \
	&& wget http://mirrors.edge.kernel.org/ubuntu/pool/universe/d/db/libdb5.1++_5.1.29-7ubuntu1_amd64.deb \
	&& apt install ./libdb5.1++_5.1.29-7ubuntu1_amd64.deb \
	&& wget http://mirrors.edge.kernel.org/ubuntu/pool/universe/d/db/libdb5.1-dev_5.1.29-7ubuntu1_amd64.deb \
	&& apt install ./libdb5.1-dev_5.1.29-7ubuntu1_amd64.deb \
	&& wget http://mirrors.edge.kernel.org/ubuntu/pool/universe/d/db/libdb5.1++-dev_5.1.29-7ubuntu1_amd64.deb \
	&& apt install ./libdb5.1++-dev_5.1.29-7ubuntu1_amd64.deb
RUN mkdir -p proj && cd proj
RUN update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
RUN update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
RUN apt-get -y install  python-dev python3-zmq libzmq3-dev nsis bc aptitude
RUN aptitude -y install wine
RUN apt-get -y install cmake imagemagick libcap-dev librsvg2-bin libz-dev libbz2-dev libtiff-tools
RUN apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
RUN apt-get -y install libboost-all-dev
RUN apt-get -y install python-pip
RUN pip install ez_setup
COPY build-arm-only.sh /
COPY build-win-only.sh /
COPY build-linux-only.sh /
COPY build-osx-only.sh /
COPY build-aarch-only.sh /
COPY build-all.sh /
