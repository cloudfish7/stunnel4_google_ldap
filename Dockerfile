FROM ubuntu
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install stunnel4

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

