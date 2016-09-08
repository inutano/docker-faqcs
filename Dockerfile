# Dockerfile for FaQCs - https://github.com/chienchi/FaQCs

FROM alpine:3.3
MAINTAINER Tazro Inutano Ohta <inutano@gmail.com>

WORKDIR /
RUN apk --no-cache add make \
      g++ \
      perl-dev \
      apkbuild-cpan \
      ca-certificates \
      git \
      wget && \
      yes | cpan App::cpanminus && \
      cpanm Parallel::ForkManager && \
      cpanm String::Approx && \
      wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://github.com/sgerrand/alpine-pkg-R/releases/download/unreleased/sgerrand.rsa.pub && \
      wget https://github.com/sgerrand/alpine-pkg-R/releases/download/unreleased/R-3.3.1-r0.apk && \
      apk add R-3.3.1-r0.apk && \
      git clone https://github.com/chienchi/FaQCs && \
      ln -s /FaQCs/FaQCs.pl /usr/local/bin/FaQCs

CMD ["bash"]