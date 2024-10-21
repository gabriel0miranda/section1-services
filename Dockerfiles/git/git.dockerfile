FROM alpine:3.19

WORKDIR /usr/git

COPY  /scripts/git/git_cronjob.lua /scripts/git/git_server_run.lua /keys/git/git_keys /data/git/git_origins /usr/git

RUN adduser git && \
    chown -R git /usr/git && \
    apk update --no-cache && \
    apk install git lua5.3

RUN rc-service crond start && \
    rc-update add crond

USER git

RUN cd && \
    mkdir .ssh && \
    chmod 700 .ssh && \
    touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys && \
    cat /usr/git/git_key.pub >> ~/.ssh/authorized_keys && \
    cd /usr/git && \
    chmod +x git_cronjob.lua && \
    chmod +x git_server_run.lua

CMD ["/usr/git/git_server_run.lua"]
