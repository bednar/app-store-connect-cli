#
# Builder image
#
FROM python:3.12.6-slim as builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc python3-dev

# Directories paths as environment variables
ENV APP_HOME=/app
ENV VIRTUAL_ENV=/app/venv

# Working directory
WORKDIR $APP_HOME
RUN mkdir $VIRTUAL_ENV

# Copy requirements.txt
COPY requirements.txt $APP_HOME

# Active Python venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

#
# Production size image
#
FROM python:3.12.6-slim as production

# Directories paths as environment variables
ENV APP_HOME=/app
ENV VIRTUAL_ENV=/app/venv

# Set PATH to include venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Working directory
WORKDIR $APP_HOME
RUN mkdir $VIRTUAL_ENV

# Use a non-root user
RUN useradd -m cli && \
    chown cli:cli $VIRTUAL_ENV
USER cli

# Copy sources from builder image
COPY --from=builder --chown=cli:cli $VIRTUAL_ENV $VIRTUAL_ENV

# Active Python venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ENTRYPOINT ["app-store-connect"]
