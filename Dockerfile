FROM scratch
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

FROM node:14-alpine

RUN wget https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip \
    && unzip terraform_1.0.11_linux_amd64.zip  \
    && mv terraform /usr/local/bin \
    && rm -rf terraform_1.0.11_linux_amd64.zip
ENV PATH $PATH:/usr/local/bin/
