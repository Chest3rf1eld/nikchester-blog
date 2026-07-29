[Read this in Russian](README.ru.md)

# nikchester-blog

Personal blog of Nikita Chaturov (nikchester), built with [Hugo](https://gohugo.io/) and the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme. Live at [blog.nikchester.lat](https://blog.nikchester.lat/).

The content is in Russian and covers whatever the author feels like writing about: sysadmin/SRE and Linux notes, a CV/resume page, and even the occasional recipe.

## Stack

- **Static site generator:** Hugo
- **Theme:** [PaperMod](https://github.com/adityatelange/hugo-PaperMod), vendored under `themes/papermode` (`theme = "papermode"` in `hugo.toml`)
- **Content language:** Russian (`languageCode = "ru"`)

## Structure

- `hugo.toml` — site configuration (title, theme, menu, social links, PaperMod params)
- `content/posts/` — blog posts as page bundles (each post is a folder with `index.md` plus its own images, e.g. `content/posts/cv/`, `content/posts/noodle_casserole_recipe/`)
- `archetypes/default.md` — template used for scaffolding new posts
- `themes/papermode/` — the PaperMod theme
- `deploy.sh` — manual deployment script
- `.github/workflows/dev-cicd.yml` — CI workflow that builds and deploys the site on a self-hosted runner

## Running locally

Requires [Hugo](https://gohugo.io/installation/) (extended edition recommended for PaperMod).

```bash
hugo server -D
```

This starts a local preview server (including draft posts) with live reload.

## Creating a new post

```bash
hugo new posts/<post-name>/index.md
```

This scaffolds a new post using `archetypes/default.md`.

## Building

```bash
hugo --minify
```

The generated static site is written to `public/`.

## Deployment

Deployment targets `/var/www/blog` on the server and happens in one of two ways:

- **Manual:** run `deploy.sh` on the host — it builds the site with `hugo --minify` and copies the contents of `public/` into `/var/www/blog`, replacing whatever was there.
- **Automatic (CI):** `.github/workflows/dev-cicd.yml` runs on a self-hosted GitHub Actions runner on every push to the `prod` branch (or manual dispatch). It checks out the repo (with `submodules: recursive`, in case the theme or other dependencies are ever vendored as submodules), runs `hugo`, and copies `public/*` into `/var/www/blog`.
