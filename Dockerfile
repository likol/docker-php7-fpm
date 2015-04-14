FROM ubuntu-upstart:14.04
MAINTAINER likol@likol.idv.tw

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C \
&& echo "deb http://ppa.launchpad.net/nginx/development/ubuntu trusty main" > /etc/apt/sources.list.d/nginx-development.list
RUN apt-get update \
&& apt-get install -y \
nginx \
libcurl4-openssl-dev \
libmcrypt-dev \
libxml2-dev \
libjpeg-dev \
libfreetype6-dev \
libmysqlclient-dev \
libt1-dev \
libgmp-dev \
libpspell-dev \
libicu-dev \
librecode-dev

ADD http://repos.zend.com/zend-server/early-access/php7/php-7.0-latest-DEB-x86_64.tar.gz /usr/local/php7

RUN tar zxPf /usr/local/php7
RUN echo 'export PATH="$PATH:/usr/local/php7/bin"' >> /etc/bash.bashrc

COPY assets/conf/etc /usr/local/php7/etc
COPY assets/conf/default /etc/nginx/sites-available/default
COPY assets/conf/php7-fpm.conf /etc/init/php7-fpm.conf

RUN chmod 0755 -R /usr/local/php7/bin \
&& chmod 0755 -R /usr/local/php7/sbin

EXPOSE 80

CMD ["/sbin/init"]