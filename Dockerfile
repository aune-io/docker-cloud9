FROM ubuntu:latest

# Update OS
RUN apt-get update && apt-get -y dist-upgrade

# Install dependencies and utilities
RUN apt-get -y install git htop nodejs npm

# Install Cloud9
RUN git clone git://github.com/c9/core.git c9
RUN cd c9 && npm install

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
