# Dockerfile for FaQCs - https://github.com/chienchi/FaQCs

FROM inutano/research-base:latest

MAINTAINER Tazro Inutano Ohta, inutano@gmail.com

WORKDIR /home/nijntje/repos
RUN git clone https://github.com/chienchi/FaQCs && \
    cd FaQCs && \
    sh lib/INSTALL.sh && \

USER root
RUN ln -s /home/nijntje/repos/FaQCs/FaQCs.pl /usr/local/bin/FaQCs

USER nijntje
ENV ["bash"]