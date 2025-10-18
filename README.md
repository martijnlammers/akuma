# akuma
Generic browser develop environment template inside a docker container.

commit convention: 

# Usage
Build the Akuma docker image.
`docker build . -t akuma-dev:latest -f ./ci/akuma.Dockerfile`

Run the docker image.
`docker run -p "8080:8080" akuma-dev:latest`

# Technologies
Docker
code-server
Ubuntu
