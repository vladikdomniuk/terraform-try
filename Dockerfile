FROM node:14-alpine

RUN wget https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip \
    && unzip terraform_1.0.11_linux_amd64.zip  \
    && mv terraform /usr/local/bin \
    && rm -rf terraform_1.0.11_linux_amd64.zip
ENV PATH $PATH:/usr/local/bin/
 