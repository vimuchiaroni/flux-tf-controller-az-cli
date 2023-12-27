FROM ghcr.io/weaveworks/tf-runner:main-09c1a415

# ARG TARGETARCH
# ARG TF_VERSION=1.3.9
# Switch to root to have permissions for operations
USER root

# ADD https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_${TARGETARCH}.zip /terraform_${TF_VERSION}_linux_${TARGETARCH}.zip
# RUN unzip -q /terraform_${TF_VERSION}_linux_${TARGETARCH}.zip -d /usr/local/bin/ && \
#     rm /terraform_${TF_VERSION}_linux_${TARGETARCH}.zip && \
#     chmod +x /usr/local/bin/terraform

# Install az CLI

RUN apk add py3-pip
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install --upgrade pip
RUN pip install azure-cli


# Switch back to the non-root user after operations
USER 65532:65532