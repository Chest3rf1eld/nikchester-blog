[Read this in English](README.md)

# nikchester-blog

Личный блог Никиты Чатурова (nikchester), собран на [Hugo](https://gohugo.io/) с темой [PaperMod](https://github.com/adityatelange/hugo-PaperMod). Доступен по адресу [blog.nikchester.lat](https://blog.nikchester.lat/).

Контент на русском языке и охватывает всё, о чём автору хочется писать: заметки про системное администрирование, SRE и Linux, страницу-резюме (CV) и иногда рецепты.

## Стек

- **Генератор статических сайтов:** Hugo
- **Тема:** [PaperMod](https://github.com/adityatelange/hugo-PaperMod), подключена в `themes/papermode` (`theme = "papermode"` в `hugo.toml`)
- **Язык контента:** русский (`languageCode = "ru"`)

## Структура

- `hugo.toml` — конфигурация сайта (заголовок, тема, меню, соцсети, параметры PaperMod)
- `content/posts/` — посты блога в виде page bundles (каждый пост — папка с `index.md` и своими изображениями, например `content/posts/cv/`, `content/posts/noodle_casserole_recipe/`)
- `archetypes/default.md` — шаблон для создания новых постов
- `themes/papermode/` — тема PaperMod
- `deploy.sh` — скрипт для ручного деплоя
- `.github/workflows/dev-cicd.yml` — CI-воркфлоу, который собирает и деплоит сайт на self-hosted раннере

## Запуск локально

Требуется [Hugo](https://gohugo.io/installation/) (рекомендуется extended-версия для PaperMod).

```bash
hugo server -D
```

Запускает локальный сервер предпросмотра (включая черновики) с live reload.

## Создание нового поста

```bash
hugo new posts/<post-name>/index.md
```

Создаёт новый пост на основе шаблона `archetypes/default.md`.

## Сборка

```bash
hugo --minify
```

Сгенерированный статический сайт попадает в папку `public/`.

## Деплой

Деплой раскладывает сайт в `/var/www/blog` на сервере и происходит одним из двух способов:

- **Вручную:** запустить `deploy.sh` на сервере — он собирает сайт командой `hugo --minify` и копирует содержимое `public/` в `/var/www/blog`, полностью заменяя то, что там было.
- **Автоматически (CI):** `.github/workflows/dev-cicd.yml` запускается на self-hosted GitHub Actions раннере при каждом пуше в ветку `prod` (или вручную через workflow_dispatch). Он чекаутит репозиторий (с `submodules: recursive` — на случай, если тема или другие зависимости когда-нибудь будут подключены как сабмодули), запускает `hugo` и копирует `public/*` в `/var/www/blog`.
