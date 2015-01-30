# Docker boilerplate

This is a work in progress boilerplate which makes it easy to get started with
a web app running in a Node based Docker container.

## Dependencies

* VirtualBox

    Either download it from [Oracle](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html) directly, or  
    `$ brew cask install virtualbox`

* [Docker](https://www.docker.com/) (via [boot2docker](http://boot2docker.io/) 1.4.1)

    `$ brew install boot2docker`  
    `$ boot2docker init`  
    `$ boot2docker up`

* fswatch

    `$ brew install fswatch`

## Assumptions

* This document assumes a bash-like shell.
* Commands in listings are prepended by a `$` which symbolises the prompt.
* Comments in listings are prepended by a `#`.

## Getting started

This section assumes you have a running docker client and server (either native
or via a wrapper like boot2docker.

[`./bin/dbp`](bin/dbp) offers a set of shortcuts to simplify common tasks such
as starting a container, pulling the image from the registry, deleting the
container.)

`make` is used (see [`Makefile`](Makefile)) for dealing with build related tasks,
but you don't have to worry about it (or the [`Dockerfile`](Dockerfile)) if you
just pull the pre-built image from Docker registry. If you don't, you'll need to
run `make build` to get the image built locally.

### Start the service

To start the mock service you have to pull a recent image from the registry (or
build your own, see above) and initialise a new container.

    # WARNING: Be sure you are authenticated to the docker registry (`docker login`)
    $ ./bin/dbp pull
    $ ./bin/dbp init

## Manage the service

`start`/`stop`/`restart`/`rm` expect a running container.

    $ ./bin/dbp stop
    $ ./bin/dbp start
    $ ./bin/dbp restart
    $ ./bin/dbp rm

## Developing

    $ ./bin/dbp watch
    $ open "http://`(boot2docker ip)`:8888"

## Troubleshooting

**Q:** When building the image it fails with a `0051` error:

    INFO[0051] Get https://index.docker.io/v1/repositories/library/node/images: dial tcp: read udp 192.168.0.1:53: no route to host

**A:** Try restarting boot2docker.

    $ boot2docker restart

**Q:** When using `docker` CLI it fails with:

    2015/01/27 12:09:10 Get https://192.168.59.103:2376/v1.15/images/json: remote error: bad certificate

**A:** Make sure you have boot2docker and docker 1.4.1 or newer.

**Q:**: When trying to use the docker registry (pull/push) I get a FATAL 0017

    FATA[0017] Error response from daemon: Server Error: Post https://index.docker.io/v1/users/: dial tcp: read udp 192.168.0.1:53: no route to host

**A:** Probably boot2docker is unstable. Try `boot2docker restart`.
