#!/usr/bin/env bash

sudo DEBIAN_FRONTEND=noninteractive apt-get update -y -q
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
     apparmor \
     apt-file \
     autoconf \
     automake \
     build-essential \
     bzip2 \
     cmake \
     curl \
     default-jdk \
     default-jre \
     dos2unix \
     emacs \
     g++ \
     gdebi-core \
     gettext \
     gfortran \
     git \
     htop \
     libapparmor1 \
     libatlas-base-dev \
     libboost-all-dev \
     libclang-dev \
     libclang1 \
     libcupti-dev \
     libcurl4-gnutls-dev \
     libevent-dev \
     libgconf-2-4 \
     libgdal-dev \
     libgeos-dev \
     libgflags-dev \
     libgl1-mesa-glx \
     libgoogle-glog-dev \
     libgtest-dev \
     libiomp-dev \
     libjpeg-dev \
     libleveldb-dev \
     liblmdb-dev \
     libopencv-dev \
     libpgm-dev \
     libpng++-dev \
     libpng-dev \
     libpq-dev \
     libprotobuf-dev \
     libspatialindex-dev \
     libssh2-1-dev \
     libssl-dev \
     libtiff5-dev \
     libtool \
     libxi6 \
     make \
     man \
     memcached \
     mercurial \
     ncdu \
     net-tools \
     nginx \
     openssh-server \
     openssl \
     pkg-config \
     postgresql \
     postgresql-contrib \
     protobuf-compiler \
     python3 \
     python3-pip \
     rabbitmq-server \
     rsyslog \
     screen \
     software-properties-common \
     sudo \
     supervisor \
     swig \
     tmux \
     unzip \
     uuid-dev \
     vim \
     wget \
     xvfb \
     zip \
    && echo
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q autoremove
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q clean
