FROM selenium/standalone-chrome-debug

ENV PYTHONUNBUFFERED 1
USER root
RUN apt-get update && apt-get install -yq python3.8 python3-pip
RUN mkdir /code
ADD . /code/
WORKDIR /code
RUN ln -s /usr/bin/python3 /usr/local/bin/python
RUN pip3 install --upgrade pip
RUN pip3 install selenium pytest
