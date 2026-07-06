FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 6969

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -qO /dev/null http://127.0.0.1:6969/ || exit 1
