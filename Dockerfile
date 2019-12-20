# -------------------------------------------------------------------------------
# Usage:
#
# docker build --tag batch_example .
#
# docker run -it batch_example 30
# -------------------------------------------------------------------------------
FROM python:3.8

RUN mkdir -p /usr/src/app
ENV PYTHONPATH=/usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY batch_example.py batch_example.py

ENTRYPOINT ["python", "batch_example.py"]
