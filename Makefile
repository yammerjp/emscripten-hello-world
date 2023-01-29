build-cat:
	emcc cat.c -o dist.js --preload-file preload
	mv dist.* public/
run:
	make build-cat
	cd public && python3 -m http.server 8888
docker:
	docker build . -t php-emscripten-hello-world
docker-run:
	docker run --rm -p 8888:8888 php-emscripten-hello-world
