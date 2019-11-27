# `localhost` Apache httpd

## Run

```bash
docker run \
  --rm \
  -dit \
  --name localhost-httpd \
  -p 443:443 \
  -v "$PWD":/usr/local/apache2/htdocs \
  bpholt/localhost-apache:latest
```

## Build

```bash
docker build \
  --tag bpholt/localhost-apache:latest \
  .
```
