FROM ubuntu:xenial
RUN apt update && \ 
    apt install -y curl unzip wget net-tools dnsutils && \
    curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_amd64.zip && \
    cd /tmp && \
    unzip terraform.zip -d /usr/local/bin/ && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip -qq awscliv2.zip && \
    ./aws/install -i /usr/local/aws-cli -b /usr/local/bin && \
    useradd --no-log-init ubuntu && \ 
    rm -rf /tmp/terraform.zip /tmp/awscliv2.zip /tmp/aws
USER ubuntu
WORKDIR /home/ubuntu
ENTRYPOINT /bin/bash