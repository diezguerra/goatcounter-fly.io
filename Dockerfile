FROM golang:latest AS build

WORKDIR /go/src/goatcounter

ENV VERSION 'v2.2.0'
ENV GOATCOUNTER_LISTEN ':8080'
ENV GOATCOUNTER_EMAIL 'email@address.com'


RUN wget https://github.com/arp242/goatcounter/archive/refs/tags/$VERSION.tar.gz
RUN tar --strip-components=1 -xvf $VERSION.tar.gz
RUN go build -x -v -ldflags="-extldflags=-static" -tags sqlite_omit_load_extension -work ./cmd/goatcounter


FROM alpine:latest as runtime

COPY --from=build /go/src/goatcounter/goatcounter /usr/bin

EXPOSE 8080

ENTRYPOINT goatcounter serve -automigrate -listen "$GOATCOUNTER_LISTEN" -tls http -email-from "$GOATCOUNTER_EMAIL" -db "$GOATCOUNTER_DB"
