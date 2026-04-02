import os

SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL")
SECRET_KEY = os.getenv("SUPERSET_SECRET_KEY", "change-this-secret-key")
WTF_CSRF_ENABLED = True
