# Define an image to generate a self-signed certificate with.
FROM alpine:3

WORKDIR /app

RUN apk update && \
  apk add --no-cache openssl && \
  rm /var/cache/apk/*

COPY ./bin/generate-cert.sh /usr/local/bin/

CMD ["/usr/local/bin/generate-cert.sh"]
