FROM httpd:2.4

# security enhancements
RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true

RUN apt-get update && apt-get install -y --no-install-recommends nano