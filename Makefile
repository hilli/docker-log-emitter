all: image

image:
	docker buildx build --tag hilli/docker-log-emitter:latest --load .

publish: image
	docker push hilli/docker-log-emitter:latest

run:
	docker run --rm hilli/docker-log-emitter:latest