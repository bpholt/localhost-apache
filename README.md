# `localhost` Apache httpd

## Run

```bash
docker run \
  --rm \
  -dit \
  --name localhost-httpd \
  -p 8443:443 \
  -v "$PWD":/usr/local/apache2/htdocs \
  localhost-httpd:2.4-alpine
```

## Build

```bash
docker build \
  --tag localhost-httpd:2.4-alpine \
  .
```
