.PHONY:
# https://ktrysmt.github.io/blog/write-useful-help-command-by-shell/
build-cat: ## print this message ## make help
	emcc cat.c -o dist/file.html --preload-file preload

