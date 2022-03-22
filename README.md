# Docker Poetry

Docker Poetry is a Docker image for Python projects with dependencies managed by Poetry.

## Why

At <a href="https://withlogic.co/">LOGIC</a> our go-to stack for web applications is Docker + Python (latest) and Django (latest LTS) with Poetry as our dependency manager.

## How to use this

Just pick the Python version and OS variant of your choice and use the following image format, based on the latest Poetry version:

```
ghcr.io/parisk/poetry:<poetry_version>-python-<python_version>-<os_variant>
```

For example, if you want to use Poetry 1.1.13 on Python 3.10 on Debian Buster (which is the default) in your Dockerfile, you would do the following:

```dockerfile
FROM ghcr.io/withlogicco/poetry:1.1.6-python-3.10
```

If you do the same, on Debian Slim you would do the following:

```dockerfile
FROM ghcr.io/withlogicco/poetry:1.1.6-python-3.10-slim
```

## Supported versions

### OS

We provide builds for three different OS variants:

- Debian Buster (default): `buster`
- Debian Slim
- Alpine

### Python

A build will be provided for each Python version still under maintenance and support. You can check the currently supported Python versions at https://endoflife.date/python.

### Poetry

Only the latest version of Poetry is included in each build.

## License

This project is [MIT licensed](LICENSE).

---

<center>🦄 Built with love by <a href="https://withlogic.co/">LOGIC</a>. 🦄</center>