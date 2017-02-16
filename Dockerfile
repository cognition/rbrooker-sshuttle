FROM rbrooker/ubuntu

MAINTAINER Ramon Brooker <ramon.brooker@imaginecommunications.com>
ENV DEBIAN_FRONTEND noninteractive

RUN echo exit 101 > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d

# for setting
ENV SHUTTLE_VERSION=0.78.1

RUN apt-get update; \
    apt-get -y upgrade; \
    apt-get install -y \
        openssh \
        autossh \
        sshuttle

RUN apt-get autoremove; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /ssh-keys

EXPOSE 8888 22

ENTRYPOINT [sshuttle]
