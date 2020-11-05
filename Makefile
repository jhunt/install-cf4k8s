IMAGE   ?= starkandwayne/install-cf4k8s
VERSION ?= 1.0.0

build:
	docker build -t $(IMAGE):base -f Dockerfile.base .
	docker build -t $(IMAGE):$(VERSION) -f Dockerfile.embedded --build-arg CF4K8S_VERSION=$(VERSION) .
push: build
	docker push $(IMAGE):base
	docker push $(IMAGE):$(VERSION)
latest:
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker push $(IMAGE):latest

check:
	docker run $(IMAGE):base ytt --version
	docker run $(IMAGE):base kapp --version
	docker run $(IMAGE):base kbld --version
	docker run $(IMAGE):base imgpkg --version
	docker run $(IMAGE):base vendir --version
	docker run $(IMAGE):base cf --version
	docker run $(IMAGE):base cf7 --version
	docker run $(IMAGE):base kubectl version --client

helm:
	helm package ./helm

.PHONY: build push latest check helm
