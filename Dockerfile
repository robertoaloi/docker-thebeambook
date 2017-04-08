FROM debian:jessie

MAINTAINER Roberto Aloi

RUN apt-get update  -y &&         \
    apt-get install -y asciidoc   \
                       erlang     \
                       git        \
                       make       \
                       python-pip

RUN easy_install dblatex

WORKDIR /book
