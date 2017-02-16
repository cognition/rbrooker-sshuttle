FROM ubuntu

MAINTAINER Ramon Brooker <ramon.brooker@imaginecommunications.com>
ENV DEBIAN_FRONTEND noninteractive

RUN echo exit 101 > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d

# for setting
ENV SHUTTLE_VERSION=0.78.1
ENV SSH="user@example.com" \
    LISTEN_TRANSPROXY="0.0.0.0/0"\
    DNS="local-dns" \
    NS_HOSTS="" \
    NOIP6="1" \
    METHOD="auto" \
    AUTO_NETS="1" \
    AUTO_HOSTS="1" \
    EXCLUDED_SUBNET="" \
    PIDFILE="/sshuttle.pid"
    DEBUG="1"


RUN apt-get update; \
    apt-get -y upgrade
#    add these lines for finished product
#    apt-get install -y \
#        openssh \
#        autossh \
#        sshuttle
# for Dev only
RUN apt-get install -y sshuttle

# Comment out this line for dev
# RUN apt-get autoremove; apt-get clean;     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD src/ /
RUN  /set-time.sh

VOLUME /ssh-keys /sshuttle-config

EXPOSE 8888 22

CMD [sshuttle -V]
