FROM ubuntu:latest

# Update OS
RUN apt-get update && apt-get -y dist-upgrade

# Install dependencies and utilities
RUN apt-get -y install git htop nodejs npm

# Install Cloud9
RUN git clone git://github.com/c9/core.git c9
RUN cd c9 && npm install

# Install Apache and PHP
RUN apt-get -y install software-properties-common && add-apt-repository ppa:ondrej/php
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install php7.1 php7.1-mysql php7.1-mbstring php7.1-curl php7.1-xml php7.1-mcrypt php7.1-bcmath php7.1-gd php7.1-intl php7.1-soap php7.1-zip php7.1-cli libapache2-mod-php7.1

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
