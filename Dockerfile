FROM aune/cloud9:latest

# Install Apache and PHP
RUN apt-get update ; \
    apt-get -y install mysql-client redis ; \
    apt-get -y install software-properties-common ; \
    add-apt-repository ppa:ondrej/php ; \
    DEBIAN_FRONTEND=noninteractive apt-get -y install php7.1 php7.1-mysql php7.1-mbstring php7.1-curl php7.1-xml php7.1-mcrypt php7.1-bcmath php7.1-gd php7.1-intl php7.1-soap php7.1-zip php7.1-cli libapache2-mod-php7.1 ; \
    apt-get autoclean ; \
    apt-get clean

RUN a2enmod rewrite
