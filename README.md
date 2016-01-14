# Docker Node boilerplate

This is a development only Docker example repository to demonstrate how to have a simple React + Sass + Express app working with file system watching and BrowserSync proxy inside Docker.

What's interesting to look at is:
  * Dockerfile: how the project folders and NPM dependencies are set up
  * Makefile: shortcuts for the sometimes lengthy Docker and Docker Machine commands
  * Gulpfile: how to proxy BrowserSync and trigger it through Gulp instead of using its own watcher
  * Package.json: the `scripts` section wrapping various commands

You can find the prebuilt image on Docker Hub at: https://hub.docker.com/r/ustwo/docker-node-boilerplate/

## Setup

The project is designed to be run inside a Docker container so the only dependencies are Docker related.

You should have [Docker Machine](https://docs.docker.com/machine/#installation), [Docker (Engine)](https://docs.docker.com/installation/binaries/) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed. The easiest way to have all these set up is by installing [Docker Toolbox](https://www.docker.com/docker-toolbox).

  * First, create a development Docker host – in case you need something different than Docker Toolbox's `default`, otherwise skip this step

  `$ make create`

  * Set up Docker environment to VM – needs to be done for every new shell session

  `$ eval "$(docker-machine env default)"`

  * Build container – you can also do a faster `pull` instead to download a prebuilt image if you have a Docker Hub account

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

## Maintainers

* [Daniel Demmel](mailto:dain@ustwo.com)
