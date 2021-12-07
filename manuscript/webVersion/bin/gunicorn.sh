#!/bin/sh

gunicorn -w 2 --threads 2 -b 0.0.0.0:5000 wsgi:app
