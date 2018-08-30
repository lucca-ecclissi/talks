FROM golang:1.10-alpine3.7
LABEL maintainer lucca@lumminy.com 

ADD . /go/src/present

RUN apk update && apk upgrade && \
    apk add --no-cach git  

RUN go get -d -t -u golang.org/x/tools/... && \
    go get -d -t -u golang.org/x/net/... && \
    go install golang.org/x/tools/cmd/present

ENV GOPATH=/go

EXPOSE 3999:3999

WORKDIR /go/src/present

ENTRYPOINT present -http=":3999" -play=false
