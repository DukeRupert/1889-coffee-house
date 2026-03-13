# =============================================================================
# Stage 1: Build Hugo static site
# =============================================================================
FROM hugomods/hugo:exts AS hugo-builder

WORKDIR /src
COPY . .

RUN hugo --gc --minify --environment production

# =============================================================================
# Stage 2: Final image — Caddy + static files
# =============================================================================
# TODO: Add Go API build stage when api/ directory is created
FROM caddy:2-alpine

# Copy Hugo build output to Caddy's web root
COPY --from=hugo-builder /src/public /srv

# Copy Caddy configuration
COPY Caddyfile /etc/caddy/Caddyfile

ENV PORT=80

EXPOSE 80

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
