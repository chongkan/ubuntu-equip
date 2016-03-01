#!/bin/sh

#
# Ubuntu Equip 
#  Java 6 Equip
# Licence: MIT

# wget --no-check-certificate https://github.com/aglover/ubuntu-equip/raw/master/equip_base.sh && bash equip_base.sh

sudo apt-get update
sudo apt-get install -y protobuf-compiler
sudo apt-get install -y php5-dev
sudo apt-get install curl


pear channel-discover pear.pollinimini.net
pear install drslump/Protobuf-beta


# installing the php-protobuf module
VERSION=0.10
cd /tmp
curl https://codeload.github.com/allegro/php-protobuf/tar.gz/$VERSION | tar -xvz

cd php-protobuf-$VERSION
phpize
./configure
sudo make install
echo extension=protobuf.so > /etc/php5/mods-available/protobuf.ini
cd ..
sudo rm -rf php-protobuf-$VERSION
