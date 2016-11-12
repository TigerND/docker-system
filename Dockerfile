# -*- coding: utf-8 -*-

FROM buildpack-deps:xenial

MAINTAINER Aleksandr Zykov <tiger@vilijavis.lt>

ENV DEBIAN_FRONTEND noninteractive

RUN ( \
        apt-get update -q \
    &&  apt-get upgrade -qy --no-install-recommends \
    &&  apt-get clean -qy \
    )
    
RUN ( \
        apt-get install -qy --no-install-recommends \
            ca-certificates \
    &&   apt-get clean -qy \
    )

RUN ( \
        apt-get install -qy --no-install-recommends \
            python-pip \
            aptitude \
            lsb-release \
            coreutils \
            dnsutils \
            iputils-ping \
            net-tools \
            iptables \
            figlet \
            wget \
            curl \
            bzip2 \
            unzip \
            zip \
    &&  apt-get clean -qy \
    )
    
RUN ( \
        pip install \
            ansible \
    )

RUN ansible --version

RUN figlet 'Ready!'
