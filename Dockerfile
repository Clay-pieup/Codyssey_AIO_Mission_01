FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="clay-workshop" \
      org.opencontainers.image.description="Codyssey Mission 01 custom nginx image"

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY app/ /usr/share/nginx/html/

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/health || exit 1
