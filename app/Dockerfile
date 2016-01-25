FROM ubuntu

RUN apt-get update
RUN apt-get install -qy git python python-setuptools ca-certificates wget --no-install-recommends

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
#RUN pip install requests
RUN pip install pykafka
#RUN python setup.py install

VOLUME /app

ENTRYPOINT /app/entrypoint.sh