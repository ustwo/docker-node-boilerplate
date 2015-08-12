# Docker Node boilerplate

Development only

TODO

## Setup

The project is wrapped into a Docker container so the only dependencies are Docker related.

You should have [Docker Machine](https://docs.docker.com/machine/#installation), [Docker Engine](https://docs.docker.com/installation/binaries/) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed. The easiest way to do that is by installing [Kitematic](https://kitematic.com/).

  * First, create a development Docker host (unless already have one, in that case put the name as `vm` variable in `Makefile`)

  `$ make create`

  * Set up Docker environment to VM – needs to be done for every new shell session

  `$ eval "$(docker-machine env dev)"`

  * Build container – you can also do a `pull` instead to download a prebuilt image if you're on a fast connection and have a Docker Hub account

  `$ make build`

  * Run container – below is for a single build, can also use `watch` or `browsersync` to recompile on changes

  `$ make run`

  * Open app in browser

  `$ make open`

## Develop

  * Kick off file system watching – alternatively you can also use `browsersync` if you want automatic browser reloads

  `$ make watch`

  * Tail Gulp's output

  `$ make log`

  * In case Gulp exits with an error, restart container – or it's `restartbs` if you're using `browsersync`

  `$ make restart`

## Release to Docker Hub

1. Increment version in `Makefile`
2. Build fresh Docker image – `make build`
3. Push image to Docker Hub – `make push`

