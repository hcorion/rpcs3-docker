FROM ubuntu:14.04
LABEL maintainer="hcorion"


ENV QTVER=5.10.1
ENV QTVERMIN=510
ENV CLANG_BINARY=clang-6.0
ENV CLANGXX_BINARY=clang++-6.0
ENV GCC_BINARY=gcc-8
ENV GXX_BINARY=g++-8

RUN \
	apt-get update -y && \
	apt-get install -y curl software-properties-common && \
	curl -Lvs https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
	add-apt-repository -y ppa:beineri/opt-qt-${QTVER}-trusty && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
	add-apt-repository -y ppa:jonathonf/binutils && \
	add-apt-repository -y "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-6.0 main" && \
	apt-get update -y && \
	\
	apt-get -qq install -y \
	build-essential binutils $GCC_BINARY $GXX_BINARY ninja-build git ccache bc $CLANG_BINARY $CLANGXX_BINARY \
	libasound2-dev libopenal-dev freeglut3-dev libudev-dev libevdev-dev libpulse-dev \
	libwayland-dev libwayland-cursor0 libwayland-client0 libwayland-server0 \
	desktop-file-utils dput gnupg pbuilder ubuntu-dev-tools apt-file \
	qt${QTVERMIN}-meta-minimal && \
	apt-get install --only-upgrade dpkg
	
RUN \
	curl -sLO https://mirrors.kernel.org/ubuntu/pool/universe/g/glew/libglew2.0_2.0.0-6_amd64.deb && \
	curl -sLO https://mirrors.kernel.org/ubuntu/pool/universe/g/glew/libglew-dev_2.0.0-6_amd64.deb && \
	curl -sLO https://mirrors.kernel.org/ubuntu/pool/universe/v/vulkan-loader/libvulkan1_1.1.82.0-0ubuntu1_amd64.deb && \
	curl -sLO https://mirrors.kernel.org/ubuntu/pool/universe/v/vulkan-loader/libvulkan-dev_1.1.82.0-0ubuntu1_amd64.deb && \
	dpkg -i ./*.deb && \
	rm ./*.deb

# Setup newer CMake
RUN \
	curl -sLO https://cmake.org/files/v3.8/cmake-3.8.2-Linux-x86_64.sh && \
	sh cmake-3.8.2-Linux-x86_64.sh --skip-license && \
	cmake --version
