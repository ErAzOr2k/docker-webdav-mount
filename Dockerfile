FROM alpine
MAINTAINER ErAzOr2k

ENV URL=
ENV USER=
ENV PASSWORD=
ENV OPTIONS=
ENV PUID=1000
ENV PGID=1000

RUN addgroup -g $PUID abc; adduser -D -u $PGID -G abc abc

RUN apk --no-cache add ca-certificates davfs2

COPY start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
