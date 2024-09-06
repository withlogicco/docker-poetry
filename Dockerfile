ARG PYTHON_VERSION=3.12
ARG VARIANT=bookworm

FROM python:${PYTHON_VERSION}-${VARIANT} as base

ENV PYTHONUNBUFFERED=1

RUN python -m ensurepip --upgrade
RUN pip install --upgrade setuptools

ARG POETRY_VERSION=1.8.3
ENV POETRY_HOME=/opt/poetry\
    PATH="${PATH}:/opt/poetry/bin"
RUN python3 -m venv ${POETRY_HOME} &&\
    ${POETRY_HOME}/bin/pip install poetry==${POETRY_VERSION} &&\
    poetry config virtualenvs.create false

FROM base as test
COPY ./tests/tests.py /usr/src/app/tests.py

FROM base
WORKDIR /usr/src/app
