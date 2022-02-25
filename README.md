# cross-riscv-elf
Cross compile environment for RISC-V

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
```
