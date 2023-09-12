FROM docker.io/codewaysa/alpine:3.18.3_20230912

LABEL io.github.tinyproxy.version="1.11.1"
LABEL image-name="codewaysa/tinyproxy"
LABEL maintainer="l.lesinigo@codeway.ch"

# add Tinyproxy
RUN apk add --no-cache tinyproxy=1.11.1-r3 && \
    cp /etc/tinyproxy/tinyproxy.conf /etc/tinyproxy/tinyproxy.conf.dist && \
    printf '    User tinyproxy\n\
    Group tinyproxy\n\
    Port 3128\n\
    LogLevel Connect\n\
    MaxClients 100\n\
    DisableViaHeader Yes\n'\
    > /etc/tinyproxy/tinyproxy.conf

# expose proxy port
EXPOSE 3128

# by default start Tinyproxy
CMD  [ "/usr/bin/tinyproxy", "-d" ]
