FROM ubuntu-upstart:14.04
MAINTAINER likol@likol.idv.tw

ENV TERM xterm

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C \
&& echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" > /etc/apt/sources.list.d/nginx-stable.list
RUN apt-get update \
&& apt-get install -y \
nginx \
libcurl4-openssl-dev \
libmcrypt-dev \
libxml2-dev \
libjpeg-dev \
libjpeg62 \
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
RUN ln -s /usr/local/php7/bin/php /usr/bin

COPY assets/conf/etc /usr/local/php7/etc
COPY assets/conf/default /etc/nginx/sites-available/default
COPY assets/conf/upstart-conf/php7-fpm.conf /etc/init/php7-fpm.conf
COPY assets/conf/upstart-conf/nginx.conf /etc/init/nginx.conf
COPY assets/www/index.php /var/www/html/index.php
COPY assets/php7-upgrade /usr/bin/php7-upgrade

RUN chmod 0755 -R /usr/local/php7/bin \
&& chmod 0755 -R /usr/local/php7/sbin \
&& chmod 0755 /usr/bin/php7-upgrade \
&& apt-get autoremove -y \
&& apt-get autoclean \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
VOLUME ["/var/www/html"]
CMD ["/sbin/init"]
