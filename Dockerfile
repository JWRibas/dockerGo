FROM golang:1.21 as builder

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o /app/desafiodockergo main.go

FROM scratch

COPY --from=builder /app/desafiodockergo /app/desafiodockergo

ENTRYPOINT ["/app/desafiodockergo"]