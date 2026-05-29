# ── Stage 1: Build ──────────────────────────────────────────
FROM golang:1.25-alpine AS builder

RUN apk add --no-cache ca-certificates tzdata
RUN adduser -D -g '' appuser

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go mod edit -replace github.com/Innocent9712/much-to-do/Server/MuchToDo/docs=./docs
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main ./cmd/api

# ── Stage 2: Final image ─────────────────────────────────────
FROM alpine:latest

RUN apk add --no-cache ca-certificates tzdata wget
RUN adduser -D -g '' appuser

WORKDIR /app
COPY --from=builder /app/main .

USER appuser

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget -qO- http://localhost:8080/health || exit 1

ENTRYPOINT ["./main"]
