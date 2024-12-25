FROM node:23.5.0-bookworm-slim
LABEL MAINTAINER Adolfo Sanz De Diego asanzdiego@gmail.com
ENV VERSION 7.0
# Software dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install wget curl unzip chromium
RUN apt-get -y install texlive-latex-base texlive-fonts-recommended texlive-latex-extra
RUN apt-get -y install npm 
RUN npm install -g decktape@3.14.0
WORKDIR /home/
RUN wget https://github.com/jgm/pandoc/releases/download/3.6.1/pandoc-3.6.1-1-amd64.deb && \
    dpkg -i pandoc-3.6.1-1-amd64.deb
RUN wget https://github.com/asanzdiego/markdownslides/archive/7.0.zip && unzip 7.0.zip
WORKDIR /home/markdownslides-master
ADD . /home/markdownslides-master
