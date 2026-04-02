import os

db_url = os.getenv("DATABASE_URL")

if db_url:
    db_url = db_url.replace("postgres://", "postgresql+psycopg://")
    db_url = db_url.replace("postgresql://", "postgresql+psycopg://")

SQLALCHEMY_DATABASE_URI = db_url
SECRET_KEY = os.getenv("SUPERSET_SECRET_KEY", "change-this-secret-key")
WTF_CSRF_ENABLED = True
