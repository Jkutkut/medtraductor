# ****** Operating System ******
OS = $(shell uname -s)
ifeq ($(OS),Linux)
	DIR = $(shell pwd)
endif
ifeq ($(OS),Darwin)
	DIR = ${PWD}
endif
# REPO = $(shell echo ${DIR} | sed 's/.*\///') # lowercase
REPO = $(shell echo ${DIR} | sed 's/.*\///' | tr '[:upper:]' '[:lower:]')

# ****** Rust Constants ******
CARGO = /root/.cargo/bin/cargo
CODE_VOLUME = -v ${DIR}:/${REPO}
CARGO_REGISTRY = -v cargo_registy:/root/.cargo/registry

# ****** Docker Constants ******
DOCKER_RUN = docker run --rm
DOCKER_RUN_IT = ${DOCKER_RUN} -it
DOCKER_RUN_D = ${DOCKER_RUN} -d

RUN_ATTRS = ${CODE_VOLUME} ${CARGO_REGISTRY} -w /${REPO}

terminal_installer:
	@echo "cargo --help"
	${DOCKER_RUN_IT} ${RUN_ATTRS} jkutkut/docker4rust
	sudo chown -R ${USER}:${USER} .

# ****** Project ******
DEV_PORT = 2000
NAME = $(shell grep -m 1 name Cargo.toml | cut -d '"' -f 2)
VERSION = "v$(shell grep -m 1 version Cargo.toml | cut -d '"' -f 2)"


DOCKER_REPO = jkutkut/
IMAGE_NAME = ${DOCKER_REPO}${NAME}
# DEV_IMAGE_NAME = ${IMAGE_NAME}:dev
DEV_IMAGE_NAME = ${DOCKER_REPO}docker4rust
RELEASE_IMAGE_NAME = ${IMAGE_NAME}:$(VERSION)
LATEST_IMAGE_NAME = ${IMAGE_NAME}:latest
DEV_CONTAINER_NAME = ${NAME}_dev
RELEASE_CONTAINER_NAME = ${NAME}_$(VERSION)

# ****** Docker Images ******

build_dev_image:
	docker build -t ${DEV_IMAGE_NAME} --target dev .

build_release_image: build_release_binary
	@echo "TODO: Not implemented yet"
	@#docker build -t ${RELEASE_IMAGE_NAME} --target release .

push_release:
	docker tag ${RELEASE_IMAGE_NAME} ${LATEST_IMAGE_NAME}
	docker push ${RELEASE_IMAGE_NAME}
	docker push ${LATEST_IMAGE_NAME}

# ****** Docker Containers ******
stop_dev:
	docker stop ${DEV_CONTAINER_NAME}

stop_release:
	docker stop ${RELEASE_CONTAINER_NAME}

DEV_ATTRS = --name ${DEV_CONTAINER_NAME} \
			${RUN_ATTRS} \
			-p ${DEV_PORT}:${DEV_PORT} \
			-v ${DIR}/../../:/installation/

DEV_ARGS =	-c -w src -x run

run_dev:
	${DOCKER_RUN_IT} ${DEV_ATTRS} --entrypoint ${CARGO} ${DEV_IMAGE_NAME} watch ${DEV_ARGS}

connect_dev:
	docker exec -it ${DEV_CONTAINER_NAME} sh

terminal_dev:
	${DOCKER_RUN_IT} ${DEV_ATTRS} ${DEV_IMAGE_NAME}

build_release_binary:
	${DOCKER_RUN_IT} ${RUN_ATTRS} --entrypoint ${CARGO} ${DEV_IMAGE_NAME} build --release
