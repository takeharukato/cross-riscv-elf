#
# -*- coding:utf-8 mode: dockerfile-mode -*-
#

# Ubuntu環境を使用
FROM ubuntu
LABEL maintainer="Takeharu KATO"
# tzdataインストール時にタイムゾーンを聞かないようにする
ENV DEBIAN_FRONTEND=noninteractive
ENV PREFIX=/opt/riscv64

#
#事前準備
#

# 基本コマンド
RUN apt update; \
    apt install -y language-pack-ja-base language-pack-ja; \
    apt install -y git; \
    apt install -y wget;
# コンパイル環境
RUN apt install -y autoconf automake autotools-dev curl python3 libmpc-dev \
    libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf \
    libtool patchutils bc zlib1g-dev libexpat-dev;
# クロスコンパイラのインストール
# https://github.com/riscv-collab/riscv-gnu-toolchain
# の手順に従って実施
RUN git clone https://github.com/riscv/riscv-gnu-toolchain ; \
    cd riscv-gnu-toolchain;				   \
    ./configure --prefix=${PREFIX};			   \
    make -j `nproc`;					   \
    make install;
#
#QEMUのインストール
#
RUN apt install install -y giflib-tools libpng-dev libtiff-dev libgtk-3-dev \
    libncursesw6 libncurses5-dev libncursesw5-dev libgnutls30 nettle-dev \
    libgcrypt20-dev libsdl2-dev libguestfs-tools python3-brlapi \
    bluez-tools bluez-hcidump bluez libusb-dev libcap-dev libcap-ng-dev \
    libiscsi-dev  libnfs-dev libguestfs-dev libcacard-dev liblzo2-dev \
    liblzma-dev libseccomp-dev libssh-dev libssh2-1-dev libglu1-mesa-dev \
    mesa-common-dev freeglut3-dev ngspice-dev libattr1-dev libaio-dev \
    libtasn1-dev google-perftools libvirglrenderer-dev multipath-tools \
    libsasl2-dev libpmem-dev libudev-dev libcapstone-dev librdmacm-dev \
    libibverbs-dev libibumad-dev libvirt-dev libffi-dev libbpfcc-dev \
    libdaxctl-dev ; \
    wget https://download.qemu.org/qemu-6.1.0.tar.xz ; \
    tar xf qemu-6.1.0.tar.xz ; \
    cd qemu-6.1.0;             \
    mkdir build;               \
    cd build;                  \
    ../configure               \
    --prefix=${PREFIX}         \
    --target-list=riscv64-softmmu,riscv32-softmmu,riscv64-linux-user,riscv32-linux-user \
    --enable-system                     \
    --enable-user                       \
    --enable-linux-user                 \
    --enable-tcg-interpreter            \
    --enable-modules                    \
    --enable-debug-tcg                  \
    --enable-debug-info                 \
    --enable-membarrier                 \
    --enable-profiler                   \
    --disable-pie                       \
    --disable-werror ;                  \
    make -j `nproc` V=1 ;	        \
    make install;

# インストールファイル表示
RUN ls -lR ${PREFIX}
