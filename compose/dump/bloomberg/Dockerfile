FROM java:7u85-jre

RUN apt-get update
RUN apt-get install -y --no-install-recommends mysql-client

# security enhancements
RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true