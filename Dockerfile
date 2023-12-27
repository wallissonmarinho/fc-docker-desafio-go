FROM golang:1.21.5 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o app

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/app .

CMD ["./app"]
