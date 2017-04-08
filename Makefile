REGISTRY = hub.docker.com
IMAGE    = docker-thebeambook
VERSION  = 1.0.0

# Only use sudo when necessary
DOCKER=$(shell docker info >/dev/null 2>&1 && echo "docker" || echo "sudo docker")

all: build

build:
	$(DOCKER) build $(build_opts) --pull=true -t $(REGISTRY)/$(IMAGE):$(VERSION) ./

latest: build
	$(DOCKER) tag -f $(REGISTRY)/$(IMAGE):$(VERSION) $(REGISTRY)/$(IMAGE):latest

push:
	$(DOCKER) push $(REGISTRY)/$(IMAGE):$(VERSION)
	$(DOCKER) push $(REGISTRY)/$(IMAGE):latest
