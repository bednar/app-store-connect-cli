FROM python:3.12

# https://stackoverflow.com/questions/51490937/how-to-build-docker-image-to-refer-to-the-python-library-in-venv

RUN apt-get update
RUN apt-get install -y gcc python3-dev

# Directories paths as environment variables
ENV APP_HOME=/app
ENV VIRTUAL_ENV=/app/venv

# Working directory
WORKDIR $APP_HOME
RUN mkdir $VIRTUAL_ENV

# Use a non-root user
RUN useradd -m cli
RUN chown cli:cli $VIRTUAL_ENV
USER cli

# Copy requirements.txt
COPY --chown=cli:cli requirements.txt $APP_HOME

# Active venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["app-store-connect"]
