FROM debian:9
################################################################################
RUN echo exit 0 > /usr/sbin/policy-rc.d && \
    apt-get update && \
    apt-get -y upgrade && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get --no-install-recommends -y install net-tools openssh-client openssh-server openssl tzdata mysql-client libtime-parsedate-perl && \
    /bin/rm -f /etc/localtime && \
    cp /usr/share/zoneinfo/America/New_York /etc/localtime && \
    echo "America/New_York" > /etc/timezone && \
    apt-get autoremove && \
    apt-get clean && \
    apt-get autoclean && \
    mkdir /BU
################################################################################
ADD startServices.sh /opt/startServices.sh
ADD config/scripts/doBU /opt/doBU
################################################################################
################################################################################
RUN chmod 755 /opt/startServices.sh && \
    chmod 755 /opt/doBU
################################################################################
################################################################################
CMD [ "/opt/startServices.sh" ]
