FROM python:${PYTHON_VERSION}-${VARIANT}

ENV PYTHONUNBUFFERED=1

ARG PIP_VERSION=22.2.2
ARG SETUPTOOLS_VERSION=65.3.0
RUN pip install --upgrade pip==${PIP_VERSION} setuptools==${SETUPTOOLS_VERSION}

ARG POETRY_VERSION=1.2
RUN pip install poetry==${POETRY_VERSION}
RUN poetry config virtualenvs.create false

WORKDIR /usr/src/app
