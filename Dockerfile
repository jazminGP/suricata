# suricata dockerfile by MO 
#
# VERSION 0.1
FROM ubuntu:14.04.1
MAINTAINER MO

# Setup apt
RUN echo "deb http://ppa.launchpad.net/oisf/suricata-stable/ubuntu trusty main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/oisf/suricata-stable/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9F6FC9DDB1324714B78062CBD7F87B2966EB736F
RUN apt-get update -y
RUN apt-get dist-upgrade -y
ENV DEBIAN_FRONTEND noninteractive

# Install packages 
RUN apt-get install -y supervisor suricata oinkmaster

# Setup user, groups and configs
RUN addgroup --gid 2000 tpot 
RUN adduser --system --no-create-home --shell /bin/bash --uid 2000 --disabled-password --disabled-login --gid 2000 tpot
RUN chmod 640 /var/log/suricata/*

#RUN chmod 760 -R /data && chown tpot:tpot -R /data
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD suricata.yaml /etc/suricata/suricata.yaml

# Clean up 
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start dionaea
CMD ["/usr/bin/supervisord"]
