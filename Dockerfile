FROM caddy:2.10.2-builder-alpine AS builder

RUN xcaddy build v2.10.2 \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/hslatman/caddy-crowdsec-bouncer \
    --with github.com/corazawaf/coraza-caddy \
    --with github.com/caddy-dns/namecheap

FROM caddy:2.10.2-alpine

LABEL org.opencontainers.image.source="https://github.com/YroriXW/caddy-secured"
LABEL org.opencontainers.image.description="Caddy 2.10.2 with Security (Alpine)"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
