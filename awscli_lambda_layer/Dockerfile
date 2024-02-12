FROM public.ecr.aws/lambda/provided:al2

USER root
RUN mkdir -p /opt
WORKDIR /tmp


#perform update & install tools
RUN yum update -y \
    && yum install -y zip unzip


# Install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./aws/install -i /opt/awscli -b /opt/awscli/aws

RUN rm -rf /opt/awscli/v2/*/dist/awscli/examples

RUN cd /opt \
    && zip --symlinks -r ../layer.zip * \
    && echo "/layer.zip is ready" \
    && ls -alh /layer.zip;

WORKDIR /
ENTRYPOINT [ "/bin/bash" ]