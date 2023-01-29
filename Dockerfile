FROM ghcr.io/yammerjp/emscripten-hello-world/php-74-emscripten:latest
WORKDIR /app
COPY cat.c /app/cat.c
COPY preload/ preload/
RUN emcc cat.c -o dist.js --preload-file preload/sample.txt
COPY public/index.html public/index.html
RUN mv dist.* public/
WORKDIR /app/public
CMD [ "/usr/bin/python3", "-m", "http.server", "8888"]

# COPY php.c /app/php.c
# RUN emcc \
# 	$(php-config --includes) \
# 	-L$(php-config --prefix)/lib \
# 	php.c \
# 	$(php-config --prefix)/lib/libphp7.so \
# 	-o dist.js
# RUN ls -al
# 	-Wl,-rpath=$(php-config --prefix)/lib\
# RUN ./buildconf --force # forceをつけないと進めなかった
# RUN ./configure
# RUN make install
