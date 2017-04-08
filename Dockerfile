FROM debian:jessie

MAINTAINER Roberto Aloi

RUN apt-get update  -y &&         \
    apt-get install -y make       \
                       erlang     \
                       asciidoc

RUN easy_install dblatex

WORKDIR /book
