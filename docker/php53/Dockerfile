FROM vipconsult/php:5.3

RUN \
    # needed to install an older version of ffmpeg that supports converting from rm to mp3
    echo "deb http://www.deb-multimedia.org squeeze main non-free" >> /etc/apt/sources.list && \
    echo "deb http://www.deb-multimedia.org squeeze-backports main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install deb-multimedia-keyring && \
    apt-get update && apt-get install -y --no-install-recommends \
    # fuller's audio files conversion
    ffmpeg \
    curl \
    # needed to build some of the php packages (trader)
    make \
    gcc \
    # not sure if some of these modules are needed but exists on the old server
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
# set correct permissions and make sure lines are ended with unix new line
RUN chmod 777 /entrypoint1.sh \
    && chmod 777 /entrypoint.sh \
    && sed -i -e 's/\r$//' /entrypoint1.sh && sed -i -e 's/\r$//' /entrypoint.sh
ENTRYPOINT ["/entrypoint1.sh"]
CMD ["/usr/sbin/php5-fpm", "-c","/etc/php5/fpm"]
