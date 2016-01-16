FROM debian:wheezy
MAINTAINER Krasimir Georgiev <support@vip-consult.co.uk>

RUN apt-get update
    
RUN apt-get install -y exim4 --no-install-recommends supervisor 
        
ADD update-exim4.conf.conf /etc/exim4/update-exim4.conf.conf


# theese are set here beacuse the debian reconfig doesn't support them
# the mailname needs to be set as otherwise all server reject mails form non FQDN
RUN 	sed -i -e "s/domainlist local_domains = MAIN_LOCAL_DOMAINS/domainlist local_domains =/g" /etc/exim4/exim4.conf.template  && \
        #limit emails to prevent spam bots sending mass emails 
	sed -i '/^.*\/usr\/sbin\/exim4/ a queue_only' /etc/exim4/exim4.conf.template && \ 
	sed -i '/^.*\/usr\/sbin\/exim4/ a remote_max_parallel=2' /etc/exim4/exim4.conf.template && \
	sed -i '/^.*\/usr\/sbin\/exim4/ a queue_run_max = 5' /etc/exim4/exim4.conf.template && \
	update-exim4.conf

#/usr/sbin/spamd -- --create-prefs --max-children 5 --helper-home-dir --syslog stderr

ADD supervisord.conf /etc/supervisor/conf.d/

RUN apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/* && apt-get clean

CMD ["/usr/bin/supervisord"]