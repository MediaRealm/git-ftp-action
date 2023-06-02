FROM alpine:3.18

COPY LICENSE README.md /

RUN apk add --no-cache bash git libssh2-dev build-base

RUN wget https://curl.haxx.se/download/curl-8.1.2.tar.gz \
  && tar -xf curl-8.1.2.tar.gz \
  && cd curl-8.1.2 \
  && ./configure --with-openssl --with-libssh2=/usr/local \
  && make \
  && make install \
  && cd .. \
  && rm -rf curl-8.1.2.tar.gz curl-8.1.2

RUN curl https://raw.githubusercontent.com/git-ftp/git-ftp/1.6.0/git-ftp > /bin/git-ftp

RUN chmod 755 /bin/git-ftp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
