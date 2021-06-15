ARG PYTHON_VERSION=3.9
FROM python:${PYTHON_VERSION}

ENV PYTHONUNBUFFERED=1

ARG PIP_VERSION=21.1.2
RUN pip install --upgrade pip==${PIP_VERSION}

ARG POETRY_VERSION=1.1.6
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/${POETRY_VERSION}/get-poetry.py | python - poetry==${POETRY_VERSION}
RUN poetry config virtualenvs.create false
