# Docker Poetry

Docker Poetry is a Docker image for Python projects with dependencies managed by Poetry.

![Poetry](https://img.shields.io/badge/Poetry-1.1.13-purple) ![Python](https://img.shields.io/badge/Python-3.10%20(default)%20%7C%203.9%20%7C%203.8%20%7C%203.7-blue) ![OS](https://img.shields.io/badge/OS-Debian%20(default)%20%7C%20Slim%20%7C%20Alpine-orange
)
## Why

At <a href="https://withlogic.co/">LOGIC</a> our go-to stack for web applications is; the latest LTS Django on the latest Python using Poetry as our dependency manager in Docker. [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) is a core principle for us, so a public Docker image with the right Python and Poetry version is an exceptional base for new projects.

## Usage

Just pick the Poetry version you wish to use and optionally also a Python version and OS.

```
ghcr.io/withlogicco/poetry:<poetry_version>-python-<python_version>-<os_variant>
```

For example, if you want to use Poetry 1.1.13 with Python 3.10 (default) on Debian (default) in your Dockerfile, you would do the following:

```dockerfile
FROM ghcr.io/withlogicco/poetry:1.1.13
```

If you do the same, with Python 3.8 on Debian Slim you would do the following:

```dockerfile
FROM ghcr.io/withlogicco/poetry:1.1.13-python-3.8-slim
```

## Supported versions

### Poetry

Only the latest version of Poetry is included in each build.

### Python (optional)

A build will be provided for each Python version still under maintenance and support. The latest Python version acts as the default in each build.

You can check the currently supported Python versions at https://endoflife.date/python.

### OS (optional)

We provide builds for three different OS variants:

- Debian Buster (default): `buster`
- Debian Slim: `slim`
- Alpine: `alpine`

## License

This project is [MIT licensed](LICENSE).

---

<center>🦄 Built with love by <a href="https://withlogic.co/">LOGIC</a>. 🦄</center>
