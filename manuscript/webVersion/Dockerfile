FROM python:3.8-alpine

COPY . .

RUN apk --update add --no-cache libev-dev \
  && python -m pip install --upgrade pip \
  && python -m pip install -r requirements.txt --no-cache-dir \
  && python bin/db_setup.py \
  && chmod +x bin/gunicorn.sh

EXPOSE 5000

ENTRYPOINT ["bin/gunicorn.sh"]
