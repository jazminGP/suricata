# dockerized suricata


[suricata](http://suricata-ids.org/) is a Network IDS, IPS and Network Security Monitoring engine.

This repository contains the necessary files to create a *dockerized* version of suricata.

This dockerized version is part of the **[T-Pot community honeypot](http://dtag-dev-sec.github.io/)** of Deutsche Telekom AG.

The `Dockerfile` contains the blueprint for the dockerized suricata and will be used to setup the docker image.  

The `suricata.yaml` is tailored to fit the T-Pot environment.

The `supervisord.conf` is used to start suricata under supervision of supervisord.

Using upstart, copy the `upstart/suricata.conf` to `/etc/init/suricata.conf` and start using

    service suricata start

This will make sure that the docker container is started with the appropriate rights and port mappings. Further, it autostarts during boot.

By default all data will be stored in `/data/suricata/` until the suricata service will be restarted which is by default every 24 hours. If you want to keep data persistently simply rename `/data/persistence.off` to `/data/persistence.on`. Be advised to establish some sort of log management if you wish to do so.

# Suricata Dashboard

![Suricata Dashboard](https://raw.githubusercontent.com/dtag-dev-sec/suricata/master/doc/dashboard.png)
