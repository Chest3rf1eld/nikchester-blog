+++
title = 'Быстрый и простой способ установки Docker + Docker Compose'
date = 2025-06-08T00:08:12+03:00
draft = false
+++

Часто появляется необходимость установки Docker + Docker Compose на различные дистрибутивы Linux. Это можно сделать через пробрасывание ключей и т.д. Но это слишком долго и неудобно.

С помощью этих четырех команд можно установить Docker + Docker на любой Linux-дистрибутив:

```bash
curl -fsSL https://get.docker.com | bash

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER
```

Если нет пишите в тг :)
 https://t.me/Chesterf1ld