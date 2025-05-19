# ベースイメージ
FROM ubuntu:22.04

# 必要なパッケージのインストール
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    make \
    gcc \
    g++ \
    git \
    vim \
    curl \
    wget \
    pkg-config \
    libusb-1.0-0-dev \
    python3 \
    python3-pip \
    python3-setuptools \
    build-essential \
    gcc-arm-none-eabi \
    gdb-multiarch \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの作成
WORKDIR /home/dev

# pico-sdk と pico-examples をクローン
RUN git clone -b master https://github.com/raspberrypi/pico-sdk.git /opt/pico-sdk && \
    #git clone -b master https://github.com/raspberrypi/pico-examples.git /opt/pico-sdk && \
    cd /opt/pico-sdk && \
    git submodule update --init

# 環境変数設定（SDKパス）
ENV PICO_SDK_PATH=/opt/pico-sdk

# 初期ディレクトリ設定
WORKDIR /home/dev

# デフォルトのコマンド
CMD ["/bin/bash"]

