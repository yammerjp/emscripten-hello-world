FROM emscripten/emsdk
# https://gist.github.com/yammerjp/a7877bf2f8de9ec99dd08a87e7dd0efb
WORKDIR /root
# apt-get installでtzdataがインストールされるときにタイムゾーンを聞かれるの でいい感じに回避
ENV DEBIAN_FRONTEND=noninteractive
RUN echo 'tzdata tzdata/Areas select Asia' | debconf-set-selections
RUN echo 'tzdata tzdata/Zones/Europe select Tokyo' | debconf-set-selections
# git以外はPHPのREADMEをみて必要そうなのでいれておく \
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    git \
    pkg-config \
    build-essential \
    autoconf \
    bison \
    re2c \
    libxml2-dev \
    libsqlite3-dev && \
  rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/php/php-src.git
WORKDIR /root/php-src
RUN git checkout php-7.4.30
RUN ./buildconf --force # forceをつけないと進めなかった
RUN ./configure --enable-embed
RUN make install
