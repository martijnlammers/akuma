# Akuma - Dockerfile
# Author: Martijn Lammers

# As Akuma is a development environment template, we supply base image as an 
# build argument. It defaults to alpine:latest as it is very lightweight
# compared to conventional ubuntu.

ARG BASE_IMAGE=alpine:latest

FROM ${BASE_IMAGE} AS setup 

# We install code-server in the environment so that installing an actual IDE 
# is not necessary. Akuma's ambition is an "one button full setup" process.

