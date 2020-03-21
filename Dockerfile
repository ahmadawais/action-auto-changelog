FROM node:12-alpine
RUN apk --no-cache add git
RUN npx auto-changelog
