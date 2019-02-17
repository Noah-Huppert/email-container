FROM centos:latest

# {{{1 Install packages
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum update -y
RUN yum install -y postfix opendkim

RUN ln -s /usr/sbin/post* /usr/bin/

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

# {{{1 Scripts
COPY config/run/run-postfix.sh /usr/bin
COPY config/run/run-opendkim.sh /usr/bin
COPY config/run/entrypoint.sh /usr/bin

# {{{1 Rebuild system files based on configuration
#RUN newaliases

# {{{1 Entrypoint
CMD entrypoint.sh
