FROM ubuntu:16.04
LABEL maintainer="hcorion"


ENV QTVER=5.12.6
ENV QTVERMIN=512
ENV LLVMVER=9
ENV CMAKEVER=3.8.2

ENV CLANG_BINARY=clang-${LLVMVER}
ENV CLANGXX_BINARY=clang++-${LLVMVER}
ENV GCC_BINARY=gcc-8
ENV GXX_BINARY=g++-8

RUN \
	apt-get update -y && \
	apt-get install -y curl software-properties-common && \
	curl -Lvs https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
	add-apt-repository -y ppa:beineri/opt-qt-${QTVER}-xenial && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
	add-apt-repository -y "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-${LLVMVER} main" && \
	apt-get update -y --fix-missing && \
	\
	apt-get -qq install -y \
	build-essential binutils $GCC_BINARY $GXX_BINARY ninja-build git ccache bc $CLANG_BINARY $CLANGXX_BINARY \
	libasound2-dev libopenal-dev freeglut3-dev libudev-dev libevdev-dev libpulse-dev \
	libwayland-dev libwayland-cursor0 libwayland-client0 libwayland-server0 \
	desktop-file-utils dput gnupg pbuilder ubuntu-dev-tools apt-file \
	qt${QTVERMIN}-meta-minimal qt${QTVERMIN}svg && \
	apt-get install --only-upgrade dpkg
	
RUN \
	curl -sLO http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc6_2.29-0ubuntu2_amd64.deb && \
	curl -sLO http://http.us.debian.org/debian/pool/main/g/glew/libglew2.1_2.1.0-4_amd64.deb && \
	curl -sLO http://http.us.debian.org/debian/pool/main/g/glew/libglew-dev_2.1.0-4_amd64.deb && \
	curl -sLO http://http.us.debian.org/debian/pool/main/v/vulkan-loader/libvulkan1_1.1.126.0-2_amd64.deb && \
	curl -sLO http://http.us.debian.org/debian/pool/main/v/vulkan-loader/libvulkan-dev_1.1.126.0-2_amd64.deb && \
	dpkg -i ./libc6*.deb && \
	dpkg -i ./*.deb && \
	rm ./*.deb

# Setup newer CMake
RUN \
	curl -sLO https://cmake.org/files/v3.8/cmake-${CMAKEVER}-Linux-x86_64.sh && \
	sh cmake-${CMAKEVER}-Linux-x86_64.sh --skip-license && \
	rm ./cmake*.sh && \
	cmake --version
