FROM python:3.8

RUN apt-get update && apt-get install -y \
	sudo \
	vim \
	virtualenv \
	python3-virtualenv \
	python3-setuptools

RUN pip3 install --upgrade pip
RUN pip3 install  --force-reinstall https://<user>:<password>@release.nfcompose-cloud.de/client/release/1.7.0/compose_client-1.7.0.tar.gz

RUN mkdir /migrator

WORKDIR /migrator

COPY . .

RUN chmod +x /migrator/main.sh

CMD ["/migrator/main.sh"]
