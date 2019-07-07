FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt -y update
# RUN apt-get -y remove --purge apache2
RUN apt -y install software-properties-common && \
     add-apt-repository -y ppa:ondrej/php 
RUN apt -y install nginx
RUN apt -y install php7.3 && \
    apt -y install php7.3-fpm php7.3-mysql php7.3-gd && apt -y clean && rm -rf /var/lib/apt/lists/*
#    apt -y install php7.3-cli libapache2-mod-php7.3  php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc 
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.3/fpm/php.ini
COPY ./default /etc/nginx/sites-available/default
COPY ./start.sh /
EXPOSE 80
# RUN chmod u+x /start.sh
CMD ["/bin/bash", "/start.sh"]
