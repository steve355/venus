FROM ubuntu as builder

ARG version="v83.0.4103.61-1"
ARG arch="linux-x64"

RUN apt-get update
RUN apt-get install xz-utils

RUN wget https://github.com/klzgrad/naiveproxy/releases/download/${version}/naiveproxy-${version}-${arch}.tar.xz

RUN tar -xf /naiveproxy-${version}-${arch}.tar.xz

RUN mv /naiveproxy-${version}-${arch} /naiveproxy

FROM ubuntu:latest

RUN apt-get update && apt-get install -y libnss3 && apt-get clean

# install naiveproxy
COPY --from=builder /naiveproxy /usr/bin

VOLUME /naiveproxy

WORKDIR /naiveproxy

EXPOSE 8080

CMD ["naive"]
