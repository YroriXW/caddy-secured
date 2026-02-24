FROM caddy:2.11.1-builder-alpine AS builder

RUN xcaddy build v2.11.1 \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/hslatman/caddy-crowdsec-bouncer \
    --with github.com/corazawaf/coraza-caddy \
    --with github.com/caddy-dns/namecheap \
    --with github.com/mholt/caddy-l4

FROM caddy:2.11.1-alpine

LABEL org.opencontainers.image.source="https://github.com/YroriXW/caddy-secured"
LABEL org.opencontainers.image.description="Caddy 2.11.1 with security and some other plugins (Alpine)"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
