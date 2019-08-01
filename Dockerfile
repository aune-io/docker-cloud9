FROM ubuntu:latest

# Update OS
RUN apt-get update
RUN apt-get -y dist-upgrade ; \
    apt-get -y autoremove ; \
    apt-get autoclean ; \
    apt-get clean

# Install dependencies and utilities
RUN apt-get -y install git curl nodejs npm htop ; \
    apt-get autoclean ; \
    apt-get clean

# Install Cloud9
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN git clone git://github.com/c9/core.git c9
RUN cd c9 ; \
    scripts/install-sdk.sh

RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /c9/configs/standalone.js 
RUN mkdir /workspace

# Expose Port and execute IDE
EXPOSE 8181

ENV C9_USER
ENV C9_PASS
CMD node /c9/server.js -w /workspace -a $C9_USER:$C9_PASS
