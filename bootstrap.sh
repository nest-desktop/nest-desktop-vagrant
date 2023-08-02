#!/bin/bash

# Define environment variables
NEST_DESKTOP_VERSION=3.2
NEST_VERSION=3.5

# Update and upgrade installed base packages
apt update && apt upgrade -y

# Install packages for NEST
# NEST: https://nest-simulator.readthedocs.io/en/v3.5/installation/noenv_install.html
apt install -y \
    build-essential \
    cmake \
    cython3 \
    libgsl-dev \
    libltdl-dev \
    libncurses5-dev \
    libreadline-dev \
    pandoc \
    python3-dev \
    python3-numpy \
    python3-pip \
    wget

apt autoremove -y

# Install NEST Desktop and NEST Server dependencies
python3 -m pip install \
    flask \
    flask-cors \
    gunicorn \
    nest-desktop==${NEST_DESKTOP_VERSION} \
    restrictedpython

# Download and extract NEST source files.
wget https://github.com/nest/nest-simulator/archive/refs/tags/v${NEST_VERSION}.tar.gz
tar -zxf v${NEST_VERSION}.tar.gz

# Build and install NEST
mkdir /tmp/nest-build; cd /tmp/nest-build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/nest /home/vagrant/nest-simulator-${NEST_VERSION}
make -j $(nproc); make install