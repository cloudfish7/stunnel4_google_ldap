FROM ubuntu
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install stunnel4
#RUN apt-get -y install vim net-tools ldap-utils

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

