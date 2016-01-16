FROM vipconsult/php:5.3

# not sure if these modules are needed but exists on the old server
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    make \
    gcc \
    php5-xsl \
    php5-imap \
    php5-sqlite \
    php5-xmlrpc \
    php-pear \
    libcurl3-openssl-dev && \
    pecl install trader && \
    echo "extension=trader.so" >> /etc/php5/fpm/php.ini && \
    apt-get clean &&     rm -rf /var/lib/apt/lists/* && \
    # need docker  client to run the tomcat container for the  FullerMoneyDataServer.jar in the InstrumentsController
    curl -o /usr/local/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-latest && \
    chmod 777 /usr/local/bin/docker
ADD entrypoint1.sh /entrypoint1.sh
ENTRYPOINT ["/entrypoint1.sh"]
CMD ["/usr/sbin/php5-fpm", "-c","/etc/php5/fpm"]
