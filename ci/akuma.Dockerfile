
# Preferably we would like to use Alpine linux, and code-server officially 
# supports it, however there are some issues by the npm installation, so 
# we are using Ubuntu for now.

FROM ubuntu:24.04 AS base

# Environment variables.

ENV USER=akuma
ENV DIRECTORY_AKUMA_HOME=/home/$USER/workspace
ENV PORT=8080

# Add additional environment dependencies here. 

RUN apt-get -y update
RUN apt-get -y install curl 
RUN apt-get clean

# Install code-server.

RUN curl -fsSL https://code-server.dev/install.sh | sh

# Create and switch to non-root user and go to workspace.

RUN useradd -ms /bin/bash $USER && \
    mkdir -p $DIRECTORY_AKUMA_HOME && \
    chown -R $USER:$USER $DIRECTORY_AKUMA_HOME

USER $USER
WORKDIR $DIRECTORY_AKUMA_HOME

# Run code-server on container start.

EXPOSE $PORT
CMD [ "sh", "-c", "code-server --bind-addr 0.0.0.0:\"$PORT\" --auth none \"$DIRECTORY_AKUMA_HOME\"" ]
