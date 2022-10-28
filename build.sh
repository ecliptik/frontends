#!/bin/bash

#Pull and build images
docker-compose pull
docker-compose build

#Bring down any existing containers
docker-compose down

#Attempt to renew TLS cert
sudo certbot renew

#Bring stack up
docker-compose up -d
