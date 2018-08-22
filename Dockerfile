FROM debian:stretch-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y apt-utils && apt install -y unzip wget qemu-system-arm && apt clean

RUN wget https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2018-06-29/2018-06-27-raspbian-stretch-lite.zip \
  && unzip 2018-06-27-raspbian-stretch-lite.zip

RUN wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.9.59-stretch \
  && wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb

ADD ./run.sh /

RUN mkdir /img

VOLUME /img

ENV PORT_SSH=22

ENTRYPOINT /run.sh


