FROM ubuntu:latest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt-get -y install software-properties-common 
RUN add-apt-repository ppa:ondrej/php
RUN apt update && apt -y upgrade
RUN apt -y install php7.3
RUN apt -y install php7.3-fpm libapache2-mod-php7.3 php7.3-cli php7.3-mysql php7.3-gd php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc
RUN apt -y install nginx
