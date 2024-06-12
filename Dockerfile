ARG DOCKER_REGISTRY=docker-remote.artifactory.dhl.com
FROM ${DOCKER_REGISTRY}/alpine:3.16.2

RUN apk --no-cache --update add bash wget git mercurial

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

COPY entrypoint.sh /entrypoint.sh
ARG TFSEC_REGISTRY= github.com
ADD https://${TFSEC_REGISTRY}/aquasecurity/tfsec/releases/download/v1.28.1/tfsec-linux-amd64 .
RUN install tfsec-linux-amd64 /usr/local/bin/tfsec

ENTRYPOINT ["/entrypoint.sh"]
