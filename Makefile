PROJECT = $(shell basename $$(pwd))
ID = pikesley/${PROJECT}

build:
	docker build \
		--tag ${ID} .

run:
	docker run \
		--volume $(shell pwd):/opt/${PROJECT} \
		--interactive \
		--tty \
		--rm \
		--publish 8080:80 \
		${ID} \
		bash

.PHONY: sass
sass:
	sass --watch sass:static/css
