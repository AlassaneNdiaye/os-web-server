#!/bin/bash

if [[ $BOOTSTRAP == "true" ]]
then
    # download ISO images
    wget http://releases.ubuntu.com/16.04/ubuntu-16.04.6-server-amd64.iso
    wget http://rep-centos-ca.upress.io/7.7.1908/isos/x86_64/CentOS-7-x86_64-DVD-1908.iso

    # extract iso content into the web server
    osirrox -indev ubuntu-16.04.6-server-amd64.iso -extract / /usr/local/apache2/htdocs/ubuntu/16.04/
    osirrox -indev CentOS-7-x86_64-DVD-1908.iso -extract / /usr/local/apache2/htdocs/centos/7.7/
fi

# copy kickstart files to the web server
mkdir /usr/local/apache2/htdocs/kickstart-files/
cp /conf/*.cfg /usr/local/apache2/htdocs/kickstart-files/

exec httpd-foreground
