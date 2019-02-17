FROM ubuntu:latest

# {{{1 Install packages
RUN apt-get update -y
RUN apt-get install -y mailutils

# {{{1 Configuration files
# {{{2 System
COPY config/aliases /etc/aliases

# {{{2 Postfix
COPY config/postfix/main.cf /etc/postfix/main.cf

# {{{2 OpenDKIM
RUN mkdir -p /etc/opendkim
VOLUME /etc/opendkim/keys

COPY config/opendkim/opendkim.conf /etc/opendkim.conf
COPY config/opendkim/trusted-hosts /etc/opendkim/trusted-hosts
COPY config/opendkim/key-table /etc/opendkim/key-table
COPY config/opendkim/signing-table /etc/opendkim/signing-table

# {{{1 Rebuild system files based on configuration
#RUN /usr/bin/newaliases
ENTRYPOINT bash
