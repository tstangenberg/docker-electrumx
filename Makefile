# Substitute your own docker index username, if you like.
DOCKER_USER=thstangenberg

# Change this to suit your needs.
CONTAINER_NAME=electrumx
DOCKER_IMAGE=electrumx
DOCKER_TAG=latest

# find the runnings instances
RUNNING=$(shell docker ps | grep $(CONTAINER_NAME) | cut -f 1 -d ' ')

# find all instances
ALL=$(shell docker ps -a | grep $(CONTAINER_NAME) | cut -f 1 -d ' ')

all: build

# normal build
build: clean
	docker build -t="$(DOCKER_USER)/$(DOCKER_IMAGE):$(DOCKER_TAG)" .

# build withour using the docker cache
ncbuild:
	docker build --no-cache -t="$(DOCKER_USER)/$(DOCKER_IMAGE):$(DOCKER_TAG)" .

# normal run
run: clean
	docker run --name="$(CONTAINER_NAME)" -p 50001:50001 -p 50002:50002 $(DOCKER_USER)/$(DOCKER_IMAGE):$(DOCKER_TAG)

# run to bash
bash: clean
	docker run -t -i --name="$(CONTAINER_NAME)" $(DOCKER_USER)/$(DOCKER_IMAGE):$(DOCKER_TAG) /bin/ash

# Removes existing containers.
clean:
ifneq ($(strip $(RUNNING)),)
	docker stop $(RUNNING)
endif
ifneq ($(strip $(ALL)),)
	docker rm $(ALL)
endif
