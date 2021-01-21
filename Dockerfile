ARG PYTHON_VERSION=3.9
FROM python:${PYTHON_VERSION}

ENV PYTHONUNBUFFERED=1

ARG PIP_VERSION=20.3.3
ARG POETRY_VERSION=1.1.4
RUN pip install --upgrade pip==${PIP_VERSION} poetry==${POETRY_VERSION}
RUN poetry config virtualenvs.create false
