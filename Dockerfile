FROM jinzeyang/whois

RUN apk update && apk add --no-cache \
    redis \
    supervisor \
    nodejs \
    npm \
    nginx \
    && rm -rf /var/cache/apk/*

COPY supervisord.conf /etc/supervisord.conf
COPY config.yaml /usr/local/app/config.yaml
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/usr/bin/supervisord", "-n"]