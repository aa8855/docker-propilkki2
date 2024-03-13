# Containerized Pro Pilkki 2 server

## Originated from 
Slightly forked from [antsy/propilkki2server](https://github.com/antsy/propilkki2server), but since it has so many steps to spinup server I did some major changes to it. And it also used the latest debian image, where it had some file permission issues, so it didn't work straight out of the box.

## How to use
This is intended to be used with docker-compose:

```
version: "3"
services:
  app:
    image: 'pp2host:latest'
    restart: unless-stopped
    ports:
      - 4500:4500
    environment:
      - SERVER_NAME=test-server # Server name
      - NATION=FIN # Host nationality
      - PUBLIC=no # List game to public hostlist
      - PUBLIC_WEB=no # Show game in public hostlist web page (game must also be public)
      # - REC_MAIL=CHANGEME # Network records account e-mail (trusted host)
      # - REC_PASSWD=CHANGEME # Network records password (trusted host)

    volumes:
      - ./cfg/autohost.ini:/etc/pp2host/static/autohost.ini
      # - ./static:/etc/pp2host/static # Use this mount if you want keep your playlogs and etc.
```
On volumes you can mount local folder `static` so you have persistent storage for your logs and results.
### Environment variables

| ENV | Values | Description |
|-----|--------|-------------|
|* `SERVER_NAME`|YOUR SERVER NAME|Self explanatory|
|`NATION`|FIN|Host nation|
|`PUBLIC`|yes/no|Show game in public hostlist (default is no, event if left empty)|
|`PUBLIC_WEB`|yes/no|Show game in public [hostlist website](http://propilkki.ddns.net/propilkki2/P2_hostlist/P2_hostlist.php) (`PUBLIC` must be also set to **yes**)|
|`REC_MAIL`|email@address.com|Network records account e-mail (trusted host)|
|`REC_PASSWD`|catdog1234|Network records password (trusted host)|

`*`These are mandantory, others are optional 

### Configuring game

I highly recommend using [web application to make PP2 autoscript](http://propilkki.net/gener/). With this you can set all your passwords and hello messages to your server.

Just generate the configuration you want and copy & paste it to [autohost.ini](cfg/autohost.ini) file.

### Development

You can do changes to this container by editing [Docker file](Dockerfile), changing variables in [pp2host.conf](cfg/pp2host.conf) or [startup script](cfg/run.sh). After changes build local image `docker build -t tagof/yourimage:1.0 .` After building image, check that [docker-compose.yml](docker-compose.yml) has right image/tag in it and then just run `docker-compose up -d` 