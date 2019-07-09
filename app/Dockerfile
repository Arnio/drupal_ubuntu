FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get -y update && apt-get -y remove --purge apache2 && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:ondrej/php 
RUN apt-get -y install nginx \
                       curl \
                       git \
                       unzip \
                       php7.3 && \
    apt-get -y install php7.3-fpm \
                       php7.3-common \
                       php7.3-mbstring \
                       php7.3-xmlrpc \
                       php7.3-soap \
                       php7.3-gd \
                       php7.3-xml \
                       php7.3-intl \
                       php7.3-mysql \
                       php7.3-cli \
                       php7.3-tidy \
                       php7.3-recode \
                       php7.3-zip \
                       php7.3-sqlite3 \
                       php7.3-curl && \
    apt-get -y clean && rm -rf /var/lib/apt/lists/*
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.3/fpm/php.ini && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer 

RUN git clone --branch 8.7.x https://git.drupalcode.org/project/drupal.git
RUN cp -R drupal/ html && \
    rm -rf drupal html/.git /var/www/html && \
    mv -f html /var/www/ && \
    cd /var/www/html/ && \
    composer install --no-progress --profile --prefer-dist && \
    chown -R www-data:www-data /var/www/html 

RUN composer create-project burdamagazinorg/thunder-project thunder --no-interaction
RUN cd thunder/docroot && \
    php core/scripts/drupal quick-start thunder

COPY ./default /etc/nginx/sites-available/default
COPY ./start.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/start.sh
EXPOSE 80 8888
ENTRYPOINT [ "start.sh" ]
