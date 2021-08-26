build-image: Dockerfile
	docker build . -t bios512 && touch $@
