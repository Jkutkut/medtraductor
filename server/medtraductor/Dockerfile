# -----------------------------------
FROM jkutkut/docker4rust as dev

# -----------------------------------
FROM alpine:3.16 as release

# RUN apk add --update XXXXXXXX && \
#   rm -rf /var/cache/apk/*

WORKDIR /app

COPY target/release/XXXXXXXX/XXXXXXXX .

ENTRYPOINT ["./XXXXXXXX"]
