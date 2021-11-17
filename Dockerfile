FROM node:14-alpine

RUN wget https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip && unzip terraform_1.0.11.zip  && rm -rf terraform_1.0.11.zip
RUN mv ~/Downloads/terraform /usr/local/bin/
