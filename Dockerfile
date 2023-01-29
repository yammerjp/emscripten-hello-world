FROM ghcr.io/yammerjp/emscripten-hello-world/php-74-emscripten:latest
WORKDIR /app
# COPY cat.c /app/cat.c
# COPY preload/ preload/
# RUN emcc cat.c -o dist.js --preload-file preload/sample.txt
# COPY public/index.html public/index.html
# RUN mv dist.* public/
# WORKDIR /app/public
# CMD [ "/usr/bin/python3", "-m", "http.server", "8888"]

COPY php.c php.c
RUN emcc \
	$(php-config --includes) \
	-L$(php-config --prefix)/lib \
	php.c \
#	-lphp7 \
	-o dist.js
#	-Wl,-rpath=$(php-config --prefix)/lib\
#	$(php-config --prefix)/lib/libphp7.so \
