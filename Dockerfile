FROM apache/superset:6.0.0
USER root
RUN pip install --no-cache-dir psycopg2-binary
RUN uv pip install .[postgres]
COPY superset_config.py /app/pythonpath/superset_config.py

USER superset

EXPOSE 8088

# Render startup command
CMD ["/bin/sh", "-c", "superset db upgrade && superset fab create-admin --username admin --firstname Admin --lastname User --email admin@example.com --password admin123 && superset init && gunicorn -w 2 --timeout 120 -b 0.0.0.0:${PORT:-8088} 'superset.app:create_app()'"]
#CMD ["/bin/sh", "-c", "superset db upgrade && superset init && gunicorn -w 2 --timeout 120 -b 0.0.0.0:${PORT:-8088} 'superset.app:create_app()'"]
