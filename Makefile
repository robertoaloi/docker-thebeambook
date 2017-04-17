IMAGE    = robertoaloi/docker-thebeambook
VERSION  = 1.1.0

# Only use sudo when necessary
DOCKER=$(shell docker info >/dev/null 2>&1 && echo "docker" || echo "sudo docker")

all: build

build:
	$(DOCKER) build $(build_opts) --pull=true -t $(IMAGE):$(VERSION) ./

latest: build
	$(DOCKER) tag $(IMAGE):$(VERSION) $(IMAGE):latest

push:
	$(DOCKER) push $(IMAGE):$(VERSION)
	$(DOCKER) push $(IMAGE):latest
