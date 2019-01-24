FROM debian:stable

RUN apt-get update \
&& apt-get install -y
  build-essential \
  git \
  make \
  curl \
  zutils \
  locales \
  python3 \
  python3-pip \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LC_ALL=en_US.utf8 LANG=en_US.utf8 LANGUAGE=en_US.utf8

RUN mkdir /src
WORKDIR /src

COPY Makefile requirements.txt /src/
COPY bin /src/bin
COPY conf /src/conf
COPY scripts /src/scripts

RUN make dependencies

CMD make train
