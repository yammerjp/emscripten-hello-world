build-cat:
	emcc cat.c -o dist.js --preload-file preload
	mv dist.* public/
run:
	make build-cat
	cd public && python3 -m http.server 8888
docker:
	docker build . -t php-emscription-hello-world
docker-run:
	docker run --rm php-emscription-hello-world /app/a.out
