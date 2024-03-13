FROM debian:12
RUN adduser --disabled-password --gecos '' pilkki

RUN apt-get update
RUN apt-get install -y wget gnupg procps curl

RUN curl -sS http://procyon.ddns.net:8080/propilkki_pub.gpg.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/propilkki.gpg
RUN echo "deb [signed-by=/etc/apt/trusted.gpg.d/propilkki.gpg] http://procyon.ddns.net:8080/repos/apt/debian stretch main" | tee tee /etc/apt/sources.list.d/propilkki.list
RUN apt-get update
RUN apt-get install pp2host

COPY cfg/autohost.ini /etc/pp2host/static/autohost.ini
COPY cfg/settings.dat /etc/pp2host/static/settings.dat
COPY cfg/pp2host.conf /etc/pp2host/pp2host.conf
COPY cfg/run.sh /etc/pp2host/run.sh
EXPOSE 4500

RUN chown pilkki:pilkki -R /etc/pp2host/*
USER pilkki
ENTRYPOINT /etc/pp2host/run.sh

WORKDIR /etc/pp2host