FROM ubuntu:xenial
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

ENV MKKXSTUDIO 000
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get -qq update; \
apt-get -qqy dist-upgrade ; \
apt-get -qqy --no-install-recommends install locales \
avr-libc build-essential \
sudo procps ca-certificates wget pwgen supervisor \
apt-transport-https software-properties-common wget ; \
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_9.3.1~kxstudio1_all.deb ; \
sudo dpkg -i kxstudio-repos_9.3.1~kxstudio1_all.deb ; \
echo 'en_US.ISO-8859-15 ISO-8859-15'>>/etc/locale.gen ; \
echo 'en_US ISO-8859-1'>>/etc/locale.gen ; \
echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen ; \
locale-gen ; \
apt-get -qq update; \
apt-get -qqy --no-install-recommends install \
kxstudio-artwork kxstudio-default-settings \
kxstudio-meta-audio-plugins-vst \
kxstudio-meta-audio-plugins-vamp \
kxstudio-meta-graphics \
kxstudio-meta-video \
kxstudio-meta-wine \
kxstudio-meta-restricted-extras \
kxstudio-scripts ; \
apt-get -y autoremove ; \
apt-get clean ; \
rm -Rf /var/lib/apt/lists/*

WORKDIR /home/git

CMD ["/bin/bash"]
