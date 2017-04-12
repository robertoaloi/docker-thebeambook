FROM debian:jessie

MAINTAINER Roberto Aloi

RUN apt-get update  -y &&           \
    apt-get install -y asciidoc     \
                       erlang       \
                       git          \
                       make         \
                       python-cairo \
                       python-gdk2  \
                       python-pip   \
                       python-yaml  \
                       wget

RUN easy_install dblatex

RUN cd /opt/ &&                                               \
    git clone https://github.com/christiangoltz/shaape.git && \
    cd shaape &&                                              \
    make install &&                                           \
    make install-filter

WORKDIR /book
