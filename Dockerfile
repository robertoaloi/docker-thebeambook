FROM debian:jessie

MAINTAINER Roberto Aloi

RUN apt-get update  -y &&               \
    apt-get install -y asciidoc         \
                       asciidoctor      \
                       erlang           \
                       git              \
                       make             \
                       python-cairo     \
                       python-gtk2      \
                       python-pip       \
                       python-yaml      \
                       source-highlight \
                       wget

RUN easy_install dblatex

RUN cd /opt/ &&                                               \
    git clone https://github.com/christiangoltz/shaape.git && \
    cd shaape &&                                              \
    make install &&                                           \
    make install-filter

RUN gem install asciidoctor-diagram

WORKDIR /book
