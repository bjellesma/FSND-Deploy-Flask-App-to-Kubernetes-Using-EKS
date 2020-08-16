FROM python:3.8

COPY . /app
WORKDIR /app

RUN pip3 install pipenv
RUN python3 -m pipenv install

ENTRYPOINT ["pipenv", "run", "gunicorn", "-b", ":8080", "main:APP"]