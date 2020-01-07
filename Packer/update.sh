#!/bin/bash

# This script just installs CloduBees Jenkins Distribution in Linux Debian 
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install wget dialog apt-utils default-jdk apt-transport-https ca-certificates

wget -q -O - https://downloads.cloudbees.com/cloudbees-jenkins-distribution/rolling/debian/cloudbees.com.key | sudo apt-key add -

echo "deb https://downloads.cloudbees.com/cloudbees-jenkins-distribution/rolling/debian binary/" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install cloudbees-jenkins-distribution