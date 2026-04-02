import os

# Metadata DB (Render PostgreSQL)
SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL")

# Required secret key
SECRET_KEY = os.getenv(
    "SUPERSET_SECRET_KEY",
    "change-this-to-a-long-random-secret"
)

# Recommended security defaults
WTF_CSRF_ENABLED = True
SESSION_COOKIE_SECURE = True
SESSION_COOKIE_HTTPONLY = True
SESSION_COOKIE_SAMESITE = "Lax"

# Proxy support for Render / reverse proxy
ENABLE_PROXY_FIX = True

# Superset webserver settings
SUPERSET_WEBSERVER_PORT = int(os.getenv("PORT", 8088))
