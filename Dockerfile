FROM alpine:latest

RUN apk add --no-cache bash
RUN apk add --no-cache git make
RUN git clone https://github.com/awslabs/git-secrets.git
WORKDIR git-secrets
RUN make install
RUN git secrets --register-aws --global
