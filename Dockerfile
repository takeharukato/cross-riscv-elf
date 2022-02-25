FROM ubuntu
LABEL maintainer="Takeharu KATO"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update; \
    apt install -y language-pack-ja-base language-pack-ja; \
    apt install -y git; \
    apt install -y autoconf automake autotools-dev curl python3 libmpc-dev \
    libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf \
    libtool patchutils bc zlib1g-dev libexpat-dev;    	   	   	 \
    git clone https://github.com/riscv/riscv-gnu-toolchain ; \
    cd riscv-gnu-toolchain;				   \
    ./configure --prefix=/opt/riscv64;			   \
    make -j `nproc`;						   \
    make install;
