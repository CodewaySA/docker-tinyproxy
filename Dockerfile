FROM codewaysa/alpine:3.13.5_20210428

LABEL io.github.tinyproxy.version="1.10.0"
LABEL image-name="codewaysa/tinyproxy"
LABEL maintainer="l.lesinigo@codeway.ch"

# add Tinyproxy
RUN apk add --no-cache tinyproxy=1.10.0-r3 && \
    cp /etc/tinyproxy/tinyproxy.conf /etc/tinyproxy/tinyproxy.conf.dist && \
    printf '    User tinyproxy\n\
    Group tinyproxy\n\
    Port 3128\n\
    LogLevel Connect\n\
    MaxClients 100\n\
    MinSpareServers 5\n\
    MaxSpareServers 20\n\
    StartServers 5\n\
    MaxRequestsPerChild 100\n\
    DisableViaHeader Yes\n'\
    > /etc/tinyproxy/tinyproxy.conf

# expose proxy port
EXPOSE 3128

# by default start Tinyproxy
CMD  [ "/usr/bin/tinyproxy", "-d" ]
