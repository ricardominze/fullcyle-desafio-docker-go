FROM golang:latest AS builder
WORKDIR /app
COPY go.mod ./
COPY *.go ./
RUN go build -o desafiogo

FROM scratch
WORKDIR /app
COPY --from=builder /app/desafiogo /app
ENTRYPOINT [ "./desafiogo" ]