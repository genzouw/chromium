```bash
$ docker \
    run \
    --rm -d -p 9222:9222 \
    --name chromium-remote-headless \
    --rm genzouw/chromium-remote-headless

$ docker \
    logs -f \
    chromium-remote-headless
```
