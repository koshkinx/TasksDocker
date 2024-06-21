#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z db 5432; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# Collect static files
python manage.py collectstatic --noinput

# Apply database migrations
python manage.py migrate

exec "$@"
