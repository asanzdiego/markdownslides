FROM ubuntu
MAINTAINER Adolfo Sanz De Diego asanzdiego@gmail.com
ENV VERSION 0.0.2
# Software dependencies
RUN apt-get update && \
    apt-get -y install pandoc wget bzip2 libfontconfig unzip
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin && \
    rm -rf phantomjs-2.1.1-linux-x86_64 \
    rm -rf phantomjs-2.1.1-linux-x86_64.tar.bz2
# App software install
WORKDIR /home/
RUN wget https://github.com/asanzdiego/markdownslides/archive/master.zip && \
    unzip master.zip
WORKDIR /home/master
ADD . /home/master
