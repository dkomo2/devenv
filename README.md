#Vagrant-Docker Development Environment

## Synopsis

A Development Environment with Docker, Docker-Compose, and Docker-Machine within a Vagrant box

## Motivation

To have a Virtual Machine/Container template for future projects

## Installation and Setup

1. Go to https://www.vagrantup.com/ and Download Vagrant for your machine
 * You must also install a Hypervisor/Virtual Machine Monitor which will act as a Provider
 * I recommend Oracle VirtualBox, since its free and open-source, and can be downloaded at https://www.virtualbox.org/
 * Familiarize yourself with the Vagrant at https://www.vagrantup.com/docs/
 * If you're new to Vagrant, start with the Getting started section, but make sure to familiarize yourself with the Vagrant-CLI as well
 * Also familiarize yourself with Docker, Docker-Compose, and Docker-Machine
 * Docker: https://docs.docker.com/engine/getstarted/
 * Docker-Compose: https://docs.docker.com/compose/gettingstarted/
 * Docker-Machine:  https://docs.docker.com/machine/overview/
2. In terminal/command line, go to the directory containing the development environment
 * In Unix `cd /your/devenv/dir`
 * In Windows `[YourCurrentDrive]:/your/devenv/dir`
 * The `Vagrantfile` should be at the top level of the directory
3. Run `vagrant up` to start up the development environment
 * Always do this on your host machine in the same directory as the `Vagrantfile`
 * It will take a while on a first time setup, since it will be pulling the `ubuntu/trusty64` box that is necessary for the VM
 * The `Vagrantfile` calls for a public (bridged) network be created, may prompt you to select a network connection that is your primary internet connection
 * If you have multiple connections (ethernet and wifi) and don't know which one to pick, run `ifconfig` on UNIX machines or `ipconfig` on Windows machines to see which one is connected to the internet
 * The `Vagrantfile` calls for Docker to be installed
 * The `Vagrantfile` executes the `vagrant_init.sh` script, which installs updates as well as Docker-Compose and Docker-Machine
4. Once `vagrant up` has finished, you can run `vagrant ssh` on your host machine in the same directory as the `Vagrantfile` to ssh into your machine locally through Vagrant and its default insecure key
 * If you're on Windows, it will give you a message saying you cannot ssh into the machine through command-prompt as well as instructions on how to connect through an ssh client for windows
 * I suggest using MobaXterm as a Windows SSH client, which can be found at http://mobaxterm.mobatek.net/
5. By default, the directory with the Vagrantfile (the repository directory) will be a shared volume with Vagrant VM
 * By default, you will find this shared directory at `/vagrant` on the VM's filesystem
 * Checkout the Vagrantfile documentation for details on how to change this at https://www.vagrantup.com/docs/vagrantfile/
6. Some necessary commands:
 * If you want to suspend the VM, you can run `vagrant halt` on your host machine in the same directory as the `Vagrantfile`
 * If you want to completely remove the VM, you can run `vagrant destroy` on your host machine in the same directory as the `Vagrantfile`
 * You can start a suspended VM or destroyed VM with another run of `vagrant up`
 * `vagrant reload` restarts the VM, and if you changed the `Vagrantfile`, the VM will be reprovisioned
7. Say you want to access your VM from another machine on your LAN, such as another computer with an SSH client:
 * SSH into the VM with `vagrant ssh`
 * Run `ifconfig` in the VM and find out what the hostname/ipaddr is of the VM
 * On your remote computer, ssh to `vagrant@<thehostnameOrIPaddrYouFound>`, example `vagrant@198.162.0.100`
 * `vagrant` is the default username, `vagrant` is its password
 * If you have another username you set up on the VM and want to use, substitute it in for the default acct `vagrant`

## Future

Adding a way in which to access this VM from another machine off the LAN. Probably using a private VPN setup.
