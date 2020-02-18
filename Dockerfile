FROM alpine:3.11.3

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apk add --no-cache \
  chromium \
  curl \
  ttf-freefont \
  udev \
  ;

RUN mkdir -p /tmp/work \
  && cd /tmp/work \
  && curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
  && unzip NotoSansCJKjp-hinted.zip \
  && mkdir -p /usr/share/fonts/noto \
  && cp *.otf /usr/share/fonts/noto \
  && chmod 644 -R /usr/share/fonts/noto/ \
  && fc-cache -fv \
  && rm -rf /tmp/work

ENTRYPOINT [ \
  "chromium-browser", \
  "--no-sandbox", \
  "--headless", \
  "--disable-gpu", \
  "--remote-debugging-address=0.0.0.0", \
  "--remote-debugging-port=9222" \
]

