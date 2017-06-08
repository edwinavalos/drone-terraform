# Docker image for the Drone Terraform plugin
#
#     docker build --rm=true -t jmccann/drone-terraform:latest .

FROM gliderlabs/alpine:3.2
ENV TERRAFORM_VERSION 0.9.4

RUN apk-install ca-certificates git

RUN wget -q -O terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip terraform.zip -d /bin

ADD drone-terraform /bin/
ENTRYPOINT ["/bin/drone-terraform"]
