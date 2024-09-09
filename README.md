# Containerized Pro Pilkki 2 server

## Originated from 
Dockerfile is slightly forked from [antsy/propilkki2server](https://github.com/antsy/propilkki2server), but since it has so many steps to spinup server I did some major changes to it. And it also used the latest debian image, where it had some file permission issues, so it didn't work straight out of the box.

## How to use
Edit the variables in [.env](.env) file to suit your needs.

In [docker-compose.yml](docker-compose.yml) uncomment the last line in volumes section (`./static:/etc/pp2host/static`), so you have persistent storage for your logs and results.

Start server with `docker-compose up -d` or use [start-server.sh](start-server.sh) script.

If you do some changes on any configuration or just want update the server, run [update-server.sh](update-server.sh).

### Environment variables

| ENV | Values | Description |
|-----|--------|-------------|
|* `SERVER_NAME`|YOUR SERVER NAME|Self explanatory|
|`NATION`|FIN|Host nation|
|`PUBLIC`|yes/no|Show game in public hostlist (default is no, event if left empty)|
|`PUBLIC_WEB`|yes/no|Show game in public [hostlist website](http://propilkki.ddns.net/propilkki2/P2_hostlist/P2_hostlist.php) (`PUBLIC` must be also set to **yes**)|
|`REC_MAIL`|email@address.com|Network records account e-mail (trusted host)|
|`REC_PASSWD`|catsdogs1234|Network records password (trusted host)|

`*`These are mandantory, others are optional 

### Configuring game

I highly recommend using [web application to make PP2 autoscript](http://propilkki.net/gener/). With this you can set all your passwords and hello messages to your server.

Just generate the configuration you want and copy & paste it to [autohost.ini](cfg/autohost.ini) file.

### Development

If you want, you can do changes to this container by editing [Docker file](Dockerfile), changing variables in [pp2host.conf](cfg/pp2host.conf) or [startup script](cfg/run.sh). After changes just run `docker-compose up -d --build` and the new image will be built and executed. 