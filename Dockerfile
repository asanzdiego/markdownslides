FROM ubuntu
MAINTAINER Rubén Gómez García rubengomez78@gmail.com
ENV VERSION 0.0.1
# Software dependencies
RUN apt-get update && \
    apt-get -y install pandoc wget bzip2 libfontconfig
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin && \
    rm -rf phantomjs-2.1.1-linux-x86_64 \
    rm -rf phantomjs-2.1.1-linux-x86_64.tar.bz2
# App software install
RUN mkdir /home/markdownslides
ADD . /home/markdownslides
WORKDIR /home/markdownslides
# Clear main directories and main mountpoint
RUN rm -Rf /home/markdownslides/doc/*
VOLUME /home/markdownslides/doc
CMD ["./build.sh","min","doc"]
