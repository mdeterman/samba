FROM debian:sid

ENV VERSION 4.1.13

RUN apt-get update && \
    apt-get install -y wget python python-dev gcc make && \
    rm -rf /var/lib/apt/lists/*

RUN wget http://www.samba.org/samba/ftp/stable/samba-$VERSION.tar.gz
RUN wget http://us1.samba.org/samba/ftp/samba-$VERSION.tar.asc
RUN wget http://us1.samba.org/samba/ftp/samba-pubkey.asc

RUN gzip -d samba-$VERSION.tar.gz
RUN gpg --import samba-pubkey.asc

RUN gpg --verify samba-$VERSION.tar.asc

RUN tar -xvf samba-$VERSION.tar

RUN cd samba-$VERSION && ./configure && make && make install

RUN ls
