# akuma
Generic browser develop environment template inside a docker container.

commit convention: 

# Usage
Build the Akuma docker image.
`docker build . -t akuma-dev:latest -f ./ci/akuma.Dockerfile`
s
Run the docker image.
`docker run -p "8080:8080" -v <path_to_akuma>:/home/akuma/workspace akuma-dev:latest`

# Technologies
Docker
code-server
Ubuntu
