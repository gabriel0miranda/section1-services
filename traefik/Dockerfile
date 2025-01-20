FROM alpine:3.21

WORKDIR /usr/share/traefik

COPY config/db.section1 /var/traefik/

RUN apk --no-cache update && \
    echo -e "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/main/\nhttps://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/\nhttps://dl-cdn.alpinelinux.org/alpine/edge/testing/" > /etc/apk/repositories && \
    apk --no-cache --virtual add supervisor traefik

COPY config/traefik.yml /etc/traefik/traefik.yml

RUN chown -R traefik:traefik /etc/traefik/Corefile /etc/traefik/ /var/traefik/

COPY supervisor/traefik.conf /etc/traefik.conf

COPY script/traefik-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

EXPOSE 80/tcp 443/tcp

USER traefik

RUN set PATH=PATH:/usr/local/bin

CMD ["supervisord", "-n", "-c", "/etc/traefik.conf"]
