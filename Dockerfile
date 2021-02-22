FROM golang:1.16.0 AS builder

WORKDIR /app

COPY ./src .

RUN go mod download && \
    go build -o main .

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]