#!/bin/bash
# Provisioning script for Inventus project

add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get -y upgrade
apt-get -y install curl nodejs git unzip tcl8.5 build-essential libmysqlclient-dev imagemagick libmagickwand-dev

# Install mysql
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server mysql-client libmysqlclient-dev

# Update the password of the root user
mysql -u root < /vagrant/provision/update_root.sql

# Switch to the vagrant user in order to install RVM with Ruby 2.0.0
su  - vagrant << EOF
    export env LC_CTYPE="en_US.UTF-8"
    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.5
    source /home/vagrant/.rvm/scripts/rvm
    rvm use 2.1.5

    # Bundle install all the gems needed
    cd /vagrant
    gem install bundler
    bundle install
    bundle update

    # Removing query_reviewer... 
    # Makes the rake db:seed command choke
    #rails destroy query_reviewer

    # Init the DB
    # Not working on the script, must run them manually
    # rake db:create --trace
    # rake db:schema:load --trace
    # rake db:seed --trace

    # Alternative DB setup, run dump
    # mysql -u root -p --database=inventus2_development < /vagrant/provision/provision/superdump.sql
    # alter table deals add column featured bool;
EOF