FROM debian:stable-slim

ARG TOOLCHAIN_INSTALL_DIR="/opt"
ARG TOOLCHAIN_DIR="$TOOLCHAIN_INSTALL_DIR/gcc-arm-none-eabi"
ARG TOOLCHAIN_DOWNLOAD_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2"
ARG TOOLCHAIN_DOWNLOAD_PATH="/tmp/gcc-arm-none-eabi.tar.bz2"

RUN apt-get update && apt-get install -y wget bzip2 build-essential && \
    wget "$TOOLCHAIN_DOWNLOAD_URL" -O "$TOOLCHAIN_DOWNLOAD_PATH" && \
    tar xavf "$TOOLCHAIN_DOWNLOAD_PATH" -C "$TOOLCHAIN_INSTALL_DIR" && \
    mv "$TOOLCHAIN_INSTALL_DIR"/gcc-arm-none-eabi-* "$TOOLCHAIN_DIR"

ENV PATH="$TOOLCHAIN_DIR/bin:${PATH}"
