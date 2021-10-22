FROM registry.access.redhat.com/ubi8/ubi:8.4 AS builder

ARG KUBEVAL_VERSION=0.16.1
ARG KUSTOMIZE_VERSION=4.4.0
ARG CONFIG_LINT_VERSION=1.6.0
ARG CONFTEST_VERSION=0.28.1
ARG HELM_VERSION=3.7.1
ARG OC_VERSION=4.8

RUN curl -sfL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
	tar -C /tmp -xzvf -

RUN curl -sfL https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz | \
	tar -C /tmp -xzvf -

RUN curl -sfL https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST_VERSION}/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz | \
	tar -C /tmp -xzvf -

RUN curl -sfL https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz | \
	tar -C /tmp -xzvf -

RUN curl -sfL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest-${OC_VERSION}/openshift-client-linux.tar.gz | \
	tar -C /tmp -xzvf -

FROM registry.access.redhat.com/ubi8/ubi:8.4

COPY --from=builder /tmp/kubeval /usr/local/bin
COPY --from=builder /tmp/kustomize /usr/local/bin
COPY --from=builder /tmp/conftest /usr/local/bin
COPY --from=builder /tmp/linux-amd64/helm /usr/local/bin
COPY --from=builder /tmp/oc /usr/local/bin
COPY --from=builder /tmp/kubectl /usr/local/bin
