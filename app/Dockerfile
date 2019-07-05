FROM ubuntu:latest
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt update && apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ondrej/php 
RUN apt update && apt -y upgrade
RUN apt -y install php7.3 && \
    apt -y install php7.3-fpm php7.3-mysql php7.3-cli libapache2-mod-php7.3 php7.3-gd php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc && \
    apt -y install nginx && apt -y clean
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.3/fpm/php.ini
COPY ./default /etc/nginx/sites-available/default
