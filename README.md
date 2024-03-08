# Docker Poetry

Docker Poetry is a Docker image for Python projects with dependencies managed by Poetry.

![Poetry](https://img.shields.io/badge/Poetry-1.8.0-purple) ![Python](https://img.shields.io/badge/Python-3.12%20(default)%20%7C%203.11%20%7C%203.10%20%7C%203.9%20%7C%203.8-blue) ![Variants](https://img.shields.io/badge/Variants-Bookworm%20(default)%20%7C%20Slim-orange
)

## Why

At <a href="https://withlogic.co/">LOGIC</a> our go-to stack for web applications is; the latest LTS Django on the latest Python using Poetry as our dependency manager in Docker. [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) is a core principle for us, so a public Docker image with the right Python and Poetry version is an exceptional base for new projects.

## Tags

For the simplest use case just pick your Poetry version:

```
ghcr.io/withlogicco/poetry:<poetry_version>
```

This will use the default Python version (latest) and image variant (Bookworm). You can be more specific by picking either a Python version, image variant or both:

- Python version: `ghcr.io/withlogicco/poetry:<poetry_version>-python-<python_version>`
- Image variant: `ghcr.io/withlogicco/poetry:<poetry_version>-<image_variant>`
- Python version and image variant: `ghcr.io/withlogicco/poetry:<poetry_version>-python-<python_version>-<image_variant>`

### Examples

- Poetry 1.8.0: `ghcr.io/withlogicco/poetry:1.8.0`
- Poetry 1.8.0 on Python 3.12: `ghcr.io/withlogicco/poetry:1.8.0-python-3.12`
- Poetry 1.8.0 on Bookworm: `ghcr.io/withlogicco/poetry:1.8.0-bookworm`
- Poetry 1.8.0 on Python 3.12 and Bookworm: `ghcr.io/withlogicco/poetry:1.8.0-python-3.12-bookworm`

## Usage

First, pick the image tag you wish to use. Then, copy your `pyproject.toml` and `poetry.lock` files in the working directory (`/usr/src/app`), for optimal caching and run `poetry install`. Example:

```dockerfile
FROM ghcr.io/withlogicco/poetry:1.8.0

COPY pyproject.toml poetry.lock ./
RUN poetry install

COPY ./ ./
```

## Supported versions

### Poetry

Only the latest version of Poetry is included in each build.

### Python (optional)

A build will be provided for each Python version still under maintenance and support. The latest Python version acts as the default in each build.

You can check the currently supported Python versions at https://endoflife.date/python.

### Variants (optional)

We provide builds for three different image variants:

- Debian Bookworm (default): `bookworm`
- Debian Slim: `slim`

## License

This project is [MIT licensed](LICENSE).

---

<p align="center">
  <i>🦄 Built with <a href="https://withlogic.co/">LOGIC</a>. 🦄</i>
</p>
