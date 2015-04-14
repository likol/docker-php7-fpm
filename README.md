# Introduction
Dockerfile to build a PHP7-FPM and Nginx container image.

# Version
Current Version:

- PHP: latest Nightly Build.

- Nginx: latest development.

# Quick Start
launch the image using the docker command line,
```docker run --name php7 -p 8080:80 -p 8022:22 -v {$HOME}/html:/var/www/html -d likol1227/php7```

# SSH
If you want login container,
the default username and password:

- username: `root`

- password: `docker.io`