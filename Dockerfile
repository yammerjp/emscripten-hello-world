FROM ghcr.io/yammerjp/emscripten-hello-world/php-74-enable-sapi:latest
WORKDIR /app
COPY php.c /app/php.c
RUN gcc \
	$(php-config --includes) \
	-L$(php-config --prefix)/lib \
	php.c \
	$(php-config --prefix)/lib/libphp7.so \
	-Wl,-rpath=$(php-config --prefix)/lib
# RUN ./buildconf --force # forceをつけないと進めなかった
# RUN ./configure
# RUN make install
