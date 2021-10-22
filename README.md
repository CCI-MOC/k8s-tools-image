## Tools

### Kustomize

We use [Kustomize][] to produce the YAML manifests used to configure
our Kubernetes clusters.

[kustomize]: https://github.com/kubernetes-sigs/kustomize

### Kubeval

[Kubeval][] is a tool for performing offline validation (i.e., no access required
to the Kubernetes cluster) of Kubernetes manifests.

[kubeval]: https://github.com/instrumenta/kubeval

### Conftest

[Conftest][] provides a framework for writing and executing tests
against configuration files (including Kubernetes manifests).

[conftest]: https://github.com/open-policy-agent/conftest

### Oc and kubectl

The `oc` and `kubectl` commands are used to interact with a Kubernetes
or OpenShift cluster. We download the latest appropriate `oc` version
from [here][ocp-cli], which includes an appropriate `kubectl` command in
the same package.

[ocp-cli]: https://mirror.openshift.com/pub/openshift-v4/clients/ocp/
