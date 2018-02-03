FROM alpine:latest
RUN apk add --no-cache bash curl vim git wget && \
    mkdir spacevim && \
    cd spacevim && \
    curl -sLf https://spacevim.org/install.sh | bash     
ENTRYPOINT ["bash"]
