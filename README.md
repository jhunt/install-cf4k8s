Install Cloud Foundry on Kubernetes
===================================

**tl;dr**:

```
vim cf-values.yml
kubectl apply -f k8s/install.yml -f <(./k8s/configure < cf-values.yml)
kubectl logs -f -n install-cf job/install-cf4k8s
```

Hack / Build / Package
----------------------

To build the docker image:

```
make build
```

The Helm chart definition is found in `./helm`.  To package it:

```
make helm
```
