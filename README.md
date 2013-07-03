## About
A vagrant based web development machine for multiproject usage

## Included modules
 - stdlib
 - apache
 - php
 - pear
 - apt
 - git
 - mongodb
 - mysql
 - sqlite
 - nodejs
 - concat
 - firewall
 - imagemagick
 - multitail
 - ocr
 - optipng
 - vim
 
Later:
 - (java)
 - (nginx) 
 - (tomcat)
 - (xdebug)

## Successfully tested with
vagrant 1.1.0 (64) - standalone with Ubuntu 12.04

## Not successful
vagrant 1.2.2 (64) - standalone with Ubuntu 12.04 
                   - guest OS (auto-) detection seems to be broken

## Usage:
Check out repository with git (including submodules).

vagrant up

try http://192.168.0.100 in your preferred browser

## Third party requirements (included via submodule)
 - stdlib
 - apache 
 - php
 - pear
 - apt
 - git
 - mongodb
 - mysql
 - sqlite
 - nodejs
 
Later:
 - (nginx)
 - (java)
 - (tomcat)
 
### Required vagrant modules for apache:
 - concat
 - firewall
