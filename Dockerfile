FROM node:12-alpine
RUN apk --no-cache add git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
