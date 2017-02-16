FROM rbrooker/wtldev-windowservercore

MAINTAINER Ramon Brooker <ramon.brooker@imaginecommunications.com>

ENV DEBIAN_FRONTEND noninteractive

# to allow supervisor to be installed
RUN echo exit 101 > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d


# for setting
ENV SHUTTLE=1.5
ENV LS_VERISON_MINOR=1.5.0-1

# install need java run time and update system
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
