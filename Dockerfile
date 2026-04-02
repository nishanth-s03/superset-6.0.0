FROM apache/superset:6.0.0

USER root

RUN /bin/bash -c "source /app/.venv/bin/activate && pip install --no-cache-dir psycopg2-binary"

COPY superset_config.py /app/pythonpath/superset_config.py

USER superset

EXPOSE 8088

CMD ["/bin/sh", "-c", "superset db upgrade && superset init && gunicorn -w 2 --timeout 120 -b 0.0.0.0:$PORT 'superset.app:create_app()'"]
