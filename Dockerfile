FROM aune/cloud9:latest

# Install Apache and PHP
RUN apt-get update ; \
    apt-get -y install software-properties-common ; \
    add-apt-repository ppa:ondrej/php ; \
    DEBIAN_FRONTEND=noninteractive apt-get -y install php7.2 php7.2-mysql php7.2-mbstring php7.2-curl php7.2-xml php7.2-bcmath php7.2-gd php7.2-intl php7.2-soap php7.2-zip php7.2-cli libapache2-mod-php7.2 ; \
    apt-get autoclean ; \
    apt-get clean
