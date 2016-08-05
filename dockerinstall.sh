# Script to install docker on ubuntu 14.04
# execute as sudo

#Get the key for repo
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

#insert repo depending on version it changes
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list

#update and install docker
apt-get update
apt-get install docker-engine -y

# start docker
service docker start

#change the group to avoid the use of sudo
usermod -aG docker $USER

#refresh user group changes
#su - $USER
