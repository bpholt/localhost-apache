FROM httpd:2.4-alpine

EXPOSE 443
COPY ssl-httpd.sh /usr/local/bin/

RUN apk add --update --no-cache openssl && \
    mkdir -p /usr/local/apache2/conf && \
    sed -i -e '/Include conf\/extra\/httpd-ssl.conf/ s_#__' /usr/local/apache2/conf/httpd.conf && \
    sed -i -e '/LoadModule ssl_module/ s_#__' /usr/local/apache2/conf/httpd.conf && \
    sed -i -e '/mod_socache_shmcb/ s_#__' /usr/local/apache2/conf/httpd.conf && \
    echo ServerName localhost >> /usr/local/apache2/conf/httpd.conf

CMD ["/usr/local/bin/ssl-httpd.sh"]
