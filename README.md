# Docker electrumx
Electrum Server Node

Dockerhub: [stangenberg/electrumx][dockerhub]

## Features
- Feature A
- Feature B
- Feature C

## Exposed volumes
- /srv/db

## Exposed ports
- 50001
- 50002

## Build
Make is used as build system.
- `make` / starts normal docker build.
- `make run` / build and run the container. This uses `electrumx` as container name and automatically stops a running container with an equal name beforehand.
- `make bash` /  build, run the container and start a prompt.
- `make ncbuild` / normal build without using the docker cache ( --no-cache ).

[Docker Build Reference https://docs.docker.com/reference/builder/](https://docs.docker.com/reference/builder/)

## License
[Published under the MIT License][LICENSE]

[dockerhub]: https://hub.docker.com/u/tstangenberg/electrumx
[license]: https://github.com/tstangenberg/docker-electrumx/blob/master/LICENSE.md
