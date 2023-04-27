FROM alpine:3.11

ARG KUBECTL_VERSION="v1.25.7"

RUN apk add py-pip curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.9.23.zip" -o "awscli-exe-linux-x86_64-2.9.23.zip"
RUN curl -L -o /usr/bin/kubectl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.25.7/2023-03-17/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
