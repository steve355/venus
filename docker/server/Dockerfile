FROM ubuntu as builder

ARG version="v83.0.4103.61-1"
ARG arch="linux-x64"

RUN apt-get update
RUN apt-get install -y xz-utils wget

WORKDIR /

RUN wget https://github.com/klzgrad/naiveproxy/releases/download/${version}/naiveproxy-${version}-${arch}.tar.xz

RUN tar -xf /naiveproxy-${version}-${arch}.tar.xz

RUN mv /naiveproxy-${version}-${arch} /naiveproxy

FROM ubuntu:latest

ARG plugins="http.forwardproxy"

RUN apt-get update && apt-get install -y libnss3 curl && apt-get clean

# install caddy
RUN curl https://getcaddy.com | bash -s personal ${plugins}

# install naiveproxy
COPY --from=builder /naiveproxy/naive /usr/bin

RUN mkdir /naiveproxy

COPY entrypoint.sh /

VOLUME /naiveproxy /root/.caddy

WORKDIR /

EXPOSE 2015

CMD ["/entrypoint.sh"]
