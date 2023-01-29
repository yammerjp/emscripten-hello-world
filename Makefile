build-cat:
	emcc cat.c -o dist.js --preload-file preload
	mv dist.* public/
run:
	make build-cat
	cd public && python3 -m http.server 8888
