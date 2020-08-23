# A Swiss army knife container
it is a Ubuntu docker image with ssh enabled and some other cool apps installed for troubleshooting.
Use it to trobuleshoot inside docker or kubernetes networks.

## Features
* kafka tools inside the image located into `/root`
* openssh-server
* vim 
* nano
* curl 
* netcat
* mysql-client
* wget
* whois
* telnet
* rsync
* iputils-ping
* iputils-tracepath
* ftp
* gawk
* dnsutils

## Usage
Requires docker on your machine and Java JRE installed for kafka tools to work.

1. Add ssh public key inside `authorized_keys`
2. Xecute `docker build -t swiss-army-pod .` in order to build the image.
3. Xecute `docker run -d -p<SOURCE-PORT>:22 swiss-army-pod` where `<SOURCE-PORT>` is a port on which you wish to SSH to your container.

For example, after building the image in order to run the `swiss-army-pod` on your docker host so that you are able to ssh to it on port 6222 run: `docker run -d -p6222:22 swiss-army-pod`.

Login to your container from your laptop with: `ssh -i <YOUR-PRIVATE-KEY> root@<DOCKER-HOST-IP> -p6222`
