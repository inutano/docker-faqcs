# Dockerfile for FaQCs - https://github.com/chienchi/FaQCs

FROM alpine:3.3

LABEL version: "galaxy-integrated-0.1" \
      maintainer="inutano@gmail.com"

WORKDIR /
RUN apk --no-cache add make g++ perl-dev apkbuild-cpan ca-certificates git wget

RUN yes | cpan App::cpanminus && \
    cpanm Parallel::ForkManager && \
    cpanm String::Approx

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://github.com/sgerrand/alpine-pkg-R/releases/download/3.3.1-r0/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-R/releases/download/3.3.1-r0/R-3.3.1-r0.apk && \
    apk --no-cache add R-3.3.1-r0.apk

RUN git clone https://github.com/inutano/FaQCs && \
    git checkout tags/galaxy-integrated-0.1 -b galaxy-integrated-0.1 && \
    ln -s /FaQCs/FaQCs.pl /usr/local/bin/FaQCs

CMD ["bash"]