# Akuma.Dockerfile
# Author: Martijn Lammers

# Arguments.

ARG BASE_IMAGE=alpine:latest
ARG USER=akuma
ARG HOST=0.0.0.0
ARG PORT=8080

# As Akuma is a development environment template, we supply base image as an 
# build argument. It defaults to alpine:latest as it is very lightweight
# compared to conventional ubuntu.

FROM ${BASE_IMAGE} AS setup 

# Environment variables.

ENV DIRECTORY_CODE_SERVER=/usr/local/bin/code-server
ENV DIRECTORY_HOME=/home/${USER}

# Create a non-root user.

RUN adduser -D ${USER}

# Here we download the install script of code-server in a sensible linux 
# directory. We run the script using bash, and afterwards clean up the 
# temporary installation directory.

RUN mkdir -p ${DIRECTORY_CODE_SERVER}
WORKDIR ${DIRECTORY_CODE_SERVER}

RUN curl -fsSL https://code-server.dev/install.sh
RUN bash install.sh

WORKDIR ${DIRECTORY_HOME}
RUN rm -rf ${DIRECTORY_CODE_SERVER}

# Switch to non-root user.

USER ${USER}

# Expose the port code-server will run on, and start code-server.
EXPOSE ${PORT}
ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "${HOST}:${PORT}", "."]
