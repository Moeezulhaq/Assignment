FROM gliderlabs/alpine:latest
LABEL Description="dockerfile from alpine base image and install and configure awscli. The proposal for this container is to run awscli commands, after that it should die. You must provide the awscli command via entrypoint"

ADD . /sampleapp
WORKDIR /sampleapp
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    unzip awscliv2.zip \
    sudo ./aws/install \
CMD python /app/app.py

    
