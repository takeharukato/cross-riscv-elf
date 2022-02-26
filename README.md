# cross-riscv-elf
Cross compile environment for RISC-V

/opt/riscvにRISC-V用のgccクロスコンパイラをインストールしたLinux環境
(Ubuntu)のコンテナイメージです。

# イメージ取得方法

以下のコマンドを実行して, コンパイル環境のコンテナイメージを取得します。

```
docker pull ghcr.io/takeharukato/riscv-cross-compiler:latest
```

実行例:
```
$ docker pull ghcr.io/takeharukato/riscv-cross-compiler:latest
latest: Pulling from takeharukato/riscv-cross-compiler
08c01a0ec47e: Pull complete
afaed4cdca1e: Pull complete
496dc090b0ff: Pull complete
012f583b315a: Pull complete
20e962149c81: Pull complete
Digest:
sha256:cd15f4b6d40dc3cd12de1992caff7dda03f551ea0d345078338ada96421a3b72
Status: Downloaded newer image for ghcr.io/takeharukato/riscv-cross-compiler:latest
$
```

# イメージの確認

ダウンロードしたコンテナイメージを確認する場合は,

```
docker images
```

を実行します。

実行例は以下の通りです。
```
$ docker images
docker images
REPOSITORY                                  TAG       IMAGE ID       CREATED         SIZE
ghcr.io/takeharukato/riscv-cross-compiler   latest    4cb744e948c8   8 minutes ago   2.52GB
```
# コンパイル環境への入り方

以下のコマンドを実行することでコンテナイメージ内に入ることができます。

```
docker run -it ghcr.io/takeharukato/riscv-cross-compiler
```

ホストの作業ディレクトリ(以下の例では, カレントディレクトリにあるwork
を/home/workにマウントします) をマウントする場合は, 以下を実行します。

```
docker run -v `pwd`/work:/home/work -it ghcr.io/takeharukato/riscv-cross-compiler
```

実行例:

```
$ ls work
localfile.txt
$ docker run -v
`pwd`/work:/home/work -it ghcr.io/takeharukato/riscv-cross-compiler
root@6d2e13a17ff1:/# cd /home/work/
root@6d2e13a17ff1:/home/work# ls
localfile.txt
root@6d2e13a17ff1:/home/work#
root@6d2e13a17ff1:/home/work# ls /opt/riscv/bin/
qemu-edid                          riscv32-unknown-elf-gcov           riscv64-unknown-elf-g++
qemu-ga                            riscv32-unknown-elf-gcov-dump      riscv64-unknown-elf-gcc
qemu-img                           riscv32-unknown-elf-gcov-tool      riscv64-unknown-elf-gcc-11.1.0
qemu-io                            riscv32-unknown-elf-gdb            riscv64-unknown-elf-gcc-ar
qemu-keymap                        riscv32-unknown-elf-gdb-add-index  riscv64-unknown-elf-gcc-nm
qemu-nbd                           riscv32-unknown-elf-gprof          riscv64-unknown-elf-gcc-ranlib
qemu-pr-helper                     riscv32-unknown-elf-ld             riscv64-unknown-elf-gcov
qemu-riscv32                       riscv32-unknown-elf-ld.bfd         riscv64-unknown-elf-gcov-dump
qemu-riscv64                       riscv32-unknown-elf-lto-dump       riscv64-unknown-elf-gcov-tool
qemu-storage-daemon                riscv32-unknown-elf-nm             riscv64-unknown-elf-gdb
qemu-system-riscv32                riscv32-unknown-elf-objcopy        riscv64-unknown-elf-gdb-add-index
qemu-system-riscv64                riscv32-unknown-elf-objdump        riscv64-unknown-elf-gprof
riscv32-unknown-elf-addr2line      riscv32-unknown-elf-ranlib         riscv64-unknown-elf-ld
riscv32-unknown-elf-ar             riscv32-unknown-elf-readelf        riscv64-unknown-elf-ld.bfd
riscv32-unknown-elf-as             riscv32-unknown-elf-run            riscv64-unknown-elf-lto-dump
riscv32-unknown-elf-c++            riscv32-unknown-elf-size           riscv64-unknown-elf-nm
riscv32-unknown-elf-c++filt        riscv32-unknown-elf-strings        riscv64-unknown-elf-objcopy
riscv32-unknown-elf-cpp            riscv32-unknown-elf-strip          riscv64-unknown-elf-objdump
riscv32-unknown-elf-elfedit        riscv64-unknown-elf-addr2line      riscv64-unknown-elf-ranlib
riscv32-unknown-elf-g++            riscv64-unknown-elf-ar             riscv64-unknown-elf-readelf
riscv32-unknown-elf-gcc            riscv64-unknown-elf-as             riscv64-unknown-elf-run
riscv32-unknown-elf-gcc-11.1.0     riscv64-unknown-elf-c++            riscv64-unknown-elf-size
riscv32-unknown-elf-gcc-ar         riscv64-unknown-elf-c++filt        riscv64-unknown-elf-strings
riscv32-unknown-elf-gcc-nm         riscv64-unknown-elf-cpp            riscv64-unknown-elf-strip
riscv32-unknown-elf-gcc-ranlib     riscv64-unknown-elf-elfedit

```
