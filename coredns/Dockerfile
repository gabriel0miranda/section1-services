FROM alpine:3.21

WORKDIR /usr/share/bind

COPY config/db.section1 /var/coredns/

RUN apk --no-cache update && \
    echo -e "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/main/\nhttps://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/\nhttps://dl-cdn.alpinelinux.org/alpine/edge/testing/" > /etc/apk/repositories && \
    apk --no-cache --virtual add supervisor coredns

COPY config/Corefile /etc/coredns/Corefile

RUN chown -R coredns:coredns /etc/coredns/Corefile /etc/coredns/

COPY supervisor/coredns.conf /etc/coredns.conf

COPY script/coredns-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

EXPOSE 5353/tcp 5353/udp 953/tcp

#USER coredns

RUN set PATH=PATH:/usr/local/bin

CMD ["supervisord", "-n", "-c", "/etc/coredns.conf"]
