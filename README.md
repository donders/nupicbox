#NuPIC Box
This is a small experiment to make a reproducible vagrant box containing a  NuPIC installation. It clones the following repositories:
https://github.com/numenta/nupic/
https://github.com/rhyolight/nupic.examples

##Requirements  
- Vagrant
- Virtualbox

##Installation
    vagrant up
to install the vagrant box for the first time  
    vagrant ssh
to ssh into the vagrant box  

##Usage  
Booting up and entering the box:  
    vagrant up && vagrant ssh

while inside the vagrant box:  
    exit
to exit the vagrant box and return to the host machine.  

shutting down the box from the host machine:  
    vagrant halt

##Removal  
Simply run the following command in the repository directory:  
    vagrant destroy --force
This will remove the NuPIC Box from your host machine.  