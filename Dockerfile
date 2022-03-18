ARG PYTHON_VERSION=3.10
ARG VARIANT=buster

FROM python:${PYTHON_VERSION}-alpine as installation-base

WORKDIR /etc
ARG POETRY_VERSION=1.1.13
RUN wget https://raw.githubusercontent.com/python-poetry/poetry/${POETRY_VERSION}/get-poetry.py
ARG POETRY_HOME=/usr/local/poetry
ENV POETRY_HOME=${POETRY_HOME}
RUN python /etc/get-poetry.py


FROM python:${PYTHON_VERSION}-${VARIANT}

ENV PYTHONUNBUFFERED=1

ARG PIP_VERSION=22.0.4
RUN pip install --upgrade pip==${PIP_VERSION}

ARG POETRY_HOME=/usr/local/poetry
ENV POETRY_HOME=${POETRY_HOME}
COPY --from=installation-base ${POETRY_HOME} ${POETRY_HOME}
RUN ln -s ${POETRY_HOME}/bin/poetry /usr/local/bin/poetry
RUN poetry config virtualenvs.create false
