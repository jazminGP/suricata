# dockerized suricata


[suricata](http://suricata-ids.org/) is a Network IDS, IPS and Network Security Monitoring engine. 

This repository contains the necessary files to create a *dockerized* version of suricata. 

This dockerized version is part of the **[T-Pot community honeypot](http://dtag-dev-sec.github.io/)** of Deutsche Telekom AG. 

The `Dockerfile` contains the blueprint for the dockerized suricata and will be used to setup the docker image.  

The `suricata.yaml` is tailored to fit the T-Pot environment. All important data is stored in `/data/suricata/`.

The `supervisord.conf` is used to start suricata under supervision of supervisord. 

Using upstart, copy the `upstart/suricata.conf` to `/etc/init/suricata.conf` and start using

    service start suricata

This will make sure that the docker container is started with the appropriate rights and port mappings. Further, it autostarts during boot.
