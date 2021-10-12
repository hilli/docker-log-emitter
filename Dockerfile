FROM --platform=$BUILDPLATFORM golang:latest as builder
ARG TARGETARCH
ENV GO111MODULE=on GOARCH=$TARGETARCH

WORKDIR /docker-log-emitter

COPY . /docker-log-emitter

RUN cd /docker-log-emitter

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /bin/docker-log-emitter .

FROM alpine:3.13
LABEL org.opencontainers.image.source http://github.com/hilli/docker-log-emitter
COPY --from=builder /bin/docker-log-emitter /bin/
WORKDIR /bin/
ENTRYPOINT ["/bin/docker-log-emitter"]
