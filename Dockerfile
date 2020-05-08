FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -o main github.com/ramin0/go-hanabi/cmd/hanabi




FROM scratch

LABEL maintainer="ramy.naga@gmail.com" \
      org.label-schema.name="ramin0/hanabi" \
      org.label-schema.description="The Hanabi board game implementation in Go" \
      org.label-schema.vcs-url="https://github.com/ramin0/hanabi" \
      org.label-schema.docker.cmd="docker run --rm -it ramin0/hanabi"

COPY --from=builder /go/src/app/main /

ENTRYPOINT [ "/main" ]
