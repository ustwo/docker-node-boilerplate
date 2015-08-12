tag ?= 0.0.1
image_name ?= ustwo/docker-node-boilerplate
container ?= dnb
vm ?= dev
image = $(image_name):$(tag)
mount = -v $$(pwd)/src:/usr/local/src/src -v $$(pwd)/package.json:/usr/local/src/package.json -v $$(pwd)/gulpfile.js:/usr/local/src/gulpfile.js
.PHONY : browsersync restart rm watch

# Build container
build :
	docker build -t $(image) .

# Run container with watcher and browsersync
browsersync :
	docker run -d -p 8888:8888 -p 3001:3001 --name $(container) $(mount) $(image) npm run browsersync

# Create Docker host
create :
	docker-machine create --driver virtualbox --virtualbox-memory "2048" $(vm)

# Get container host IP
ip :
	docker-machine ip $(vm)

# Tail container output
log :
	docker logs -f $(container)

# Open app in browser
open :
	open http://$$(docker-machine ip $(vm)):8888

# Pull container from hub
pull :
	docker pull $(image)

# Push container to hub
push :
	docker push $(image)

# Restart container
restart : rm watch

# Restart container with browsersync
restartbs : rm browsersync

# Remove container
rm :
	docker rm -f $(container)

# Run container
run :
	docker run -d -p 8888:8888 --name $(container) $(mount) $(image) npm run dev

# Run container with watcher
watch :
	docker run -d -p 8888:8888 --name $(container) $(mount) $(image) npm run watch

# Open container shell
ssh :
	docker exec -it $(container) /bin/bash

# Update packages inside container
install :
	docker run -p 8888:8888 --name $(container) $(mount) $(image) npm install

# Update packages inside container
update :
	docker exec $(container) npm run update

# Check if there are updates to packages inside container
updatecheck :
	docker exec $(container) npm run updatecheck
