tag ?= latest
image_name ?= ustwo/docker-boilerplate
container ?= dbp
image = $(image_name):$(tag)
images = `docker images -f 'dangling=true'`

build :
	docker build -t $(image) .

push :
	docker push $(image)

start :
	docker start $(container)

stop :
	docker stop $(container)

# Remove container
rm :
	docker rm -f $(container)

# Remove orphan images
rmo :
	docker rmi $$(docker images -qf 'dangling=true')

# Remove tagged image
rmi :
	docker rmi $(image)

# Remove everything
nuke : rm rmi rmo