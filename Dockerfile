######################################################################
# Final lean image...
######################################################################
FROM python-common AS lean

# Install Python dependencies
COPY requirements/base.txt requirements/
RUN --mount=type=cache,target=${SUPERSET_HOME}/.cache/uv \
    /app/docker/pip-install.sh --requires-build-essential -r requirements/base.txt

# Install Superset package
RUN --mount=type=cache,target=${SUPERSET_HOME}/.cache/uv \
    uv pip install -e .

# ADD POSTGRES SUPPORT (important fix)
RUN --mount=type=cache,target=${SUPERSET_HOME}/.cache/uv \
    uv pip install .[postgres]

RUN python -m compileall /app/superset

# Copy your custom config
COPY superset_config.py /app/pythonpath/superset_config.py

USER superset

EXPOSE 8088

# Render startup command
CMD ["/bin/sh", "-c", "superset db upgrade && superset init && gunicorn -w 2 --timeout 120 -b 0.0.0.0:${PORT:-8088} 'superset.app:create_app()'"]
