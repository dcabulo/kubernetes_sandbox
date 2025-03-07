FROM python:3.10-slim-bullseye

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
    pkg-config python3-dev default-libmysqlclient-dev build-essential default-libmysqlclient-dev && pip install mysqlclient \
    && pip install --no-cache-dir --upgrade pip

WORKDIR /app
COPY ./requirements.txt /app/
RUN pip install --no-cache-dir --requirement /app/requirements.txt
COPY . /app/

EXPOSE 5000

CMD ["python3", "server.py"]