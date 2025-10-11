# Akuma - Dockerfile
# Author: Martijn Lammers

# As Akuma is a development environment template, we supply base image as an 
# build argument. It defaults to alpine:latest as it is very lightweight
# compared to conventional ubuntu.

ARG BASE_IMAGE=alpine:latest
FROM ${BASE_IMAGE} AS setup 

# Environment variables.

ENV DIRECTORY_CODE_SERVER = /usr/local/bin/code-server
ENV DIRECTORY_AKUMA = /home

# We install code-server in the environment so that installing an actual IDE 
# on the host machine will not be  necessary. Akuma's ambition is an "one 
# button full setup" process.

RUN mkdir -p ${DIRECTORY_CODE_SERVER}
WORKDIR ${DIRECTORY_CODE_SERVER}
RUN curl -fsSL https://code-server.dev/install.sh
RUN bash install.sh
WORKDIR ${DIRECTORY_AKUMA}
RUN rm -rf ${DIRECTORY_CODE_SERVER}