# Introduction
Dockerfile to build a Web server , based PHP7-FPM and Nginx .

# TL;DR

* Clone repo

  `git clone https://github.com/likol/docker-php7-fpm.git`

* Build docker image

  ```bash
  cd docker-php7-fpm
  make build
  ```

* Quick start container

  `make run`
  
* Test php -v

  `make test`

* Other Help

  `make`

* * *

# Version

  Current Version:

  - PHP: latest Nightly Build.

  - Nginx: stable 1.8.0.

# Quick Start

  launch the image using the docker command line,

  `docker run --name php7 -p 8080:80 -p 8022:22 -v $HOME/html:/var/www/html -d likol1227/php7`

# SSH

  If you want login container,
  the default username and password:

  - username: `root`

  - password: `docker.io`

  `ssh -p 8022 root@localhost`