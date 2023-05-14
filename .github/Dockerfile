FROM ubuntu

ARG TERRAFORM_VERSION

RUN \
  apt-get update -y && \
  apt-get install unzip -y && \
  apt-get install wget -y


RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

COPY main.tf main.tf

RUN \
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  mv terraform /usr/local/bin/ && \
  chmod +x /usr/local/bin/terraform && \
  terraform --version \
  terraform init
