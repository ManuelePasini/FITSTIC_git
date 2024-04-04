FROM python:3.7-slim

RUN mkdir /src
# Copy REQUIREMENT_FILE in src folder
COPY requirements.txt  /src/

RUN apt-get update \
&& apt-get install gcc -y \
&& apt-get clean

RUN pip install --upgrade pip
RUN pip install -r /src/requirements.txt