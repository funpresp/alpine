FROM alpine:3.12

ARG ALPINE_VERSION=3.12
ARG TZ='America/Sao_Paulo'

RUN echo "\nalias ll='ls -la'" >> /etc/profile

ENV \
    HISTCONTROL="ignoredups" \
    HISTIGNORE="clear:date:history" \
    HISTSIZE="10000" \
    HISTTIMEFORMAT="%F %T " \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    PS1="[docker] [\u@\h \w] [\$?]\\$ " \
    TZ="${TZ}"

RUN apk update && apk upgrade
RUN apk update \
    && apk upgrade \
    && apk --update --verbose add \
        tcpdump=4.9.3-r1 \
        wget=1.20.3-r1 \
        tar=1.32-r1 \
        git=2.26.2-r0 \
        unzip=6.0-r7 \
    && rm -rf /var/cache/apk/* /tmp/*

CMD ["/bin/sh"]