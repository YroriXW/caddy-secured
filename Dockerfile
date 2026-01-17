FROM caddy:2.10.2-builder-alpine AS builder

RUN xcaddy build v2.10.2 \
    --with github.com/greenpau/caddy-security@v1.1.31 \
    --with github.com/mholt/caddy-ratelimit

FROM caddy:2.10.2-alpine

LABEL org.opencontainers.image.source="https://github.com/YroriXW/caddy-with-auth"
LABEL org.opencontainers.image.description="Caddy 2.10.2 with Security (Alpine)"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
