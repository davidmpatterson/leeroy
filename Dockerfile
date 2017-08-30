FROM ubuntu:16.04
RUN apt-get update -qq --fix-missing && apt-get -q -y dist-upgrade && apt-get -y install python-pip
RUN pip install --upgrade pip && pip install uwsgi
ADD . /leeroy
RUN pip install --no-cache-dir -r /leeroy/requirements.txt

EXPOSE 80
ENTRYPOINT ["/leeroy/bin/entry"]
CMD ["uwsgi", "--ini", "/leeroy/uwsgi.ini"]

