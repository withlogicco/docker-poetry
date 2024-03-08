ARG PYTHON_VERSION=3.12
ARG VARIANT=bookworm

FROM python:${PYTHON_VERSION}-${VARIANT} as base

ENV PYTHONUNBUFFERED=1

ARG PIP_VERSION=22.2.2
ARG SETUPTOOLS_VERSION=65.3.0
RUN pip install --upgrade pip==${PIP_VERSION} setuptools==${SETUPTOOLS_VERSION}

ARG POETRY_VERSION=1.8.0
ENV POETRY_HOME=/opt/poetry\
    PATH="${PATH}:/opt/poetry/bin"
RUN python3 -m venv ${POETRY_HOME} &&\
    ${POETRY_HOME}/bin/pip install poetry==${POETRY_VERSION} &&\
    poetry config virtualenvs.create false

FROM base as test
COPY ./tests/tests.py /usr/src/app/tests.py

FROM base
WORKDIR /usr/src/app
