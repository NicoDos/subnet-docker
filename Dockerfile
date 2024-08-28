FROM ubuntu:22.04 as build

WORKDIR /usr/src/app

COPY ./Graphite-Subnet .

RUN apt-get update && \
    apt-get install -y python3.10 python3-pip npm && \
    apt-get autoclean && \
    apt-get autoremove

RUN pip3 install -r ./requirements.txt && \
    pip3 install -e .

RUN npm install pm2 -g && \
    pm2 update && \
    pm2 --version

COPY .env .env
COPY ./scripts ./scripts
RUN chmod +x -R ./scripts




