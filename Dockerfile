FROM ubuntu
MAINTAINER Adolfo Sanz De Diego asanzdiego@gmail.com
ENV VERSION 0.0.2
# Software dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install wget unzip npm chromium-browser \
        texlive-latex-base texlive-fonts-recommended texlive-latex-extra && \
    npm install -g decktape
WORKDIR /home/
RUN wget https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-1-amd64.deb && \
    dpkg -i pandoc-2.9.2-1-amd64.deb
RUN wget https://github.com/asanzdiego/markdownslides/archive/6.3.zip && \
    unzip 6.1.zip
WORKDIR /home/markdownslides-master
ADD . /home/markdownslides-master
