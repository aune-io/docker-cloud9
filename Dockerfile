FROM aune/cloud9:latest

# Install Apache and PHP
RUN apt-get update ; \
    apt-get -y install mysql-client redis ; \
    apt-get -y install software-properties-common ; \
    add-apt-repository ppa:ondrej/php ; \
    DEBIAN_FRONTEND=noninteractive apt-get -y install php7.3 php7.3-mysql php7.3-mbstring php7.3-curl php7.3-xml php7.3-bcmath php7.3-gd php7.3-intl php7.3-soap php7.3-zip php7.3-cli libapache2-mod-php7.3 ; \
    apt-get autoclean ; \
    apt-get clean

RUN a2enmod rewrite
