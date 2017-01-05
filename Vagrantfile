Vagrant.configure("2") do |config|
        config.vm.box = "ubuntu/trusty64"
        config.vm.network "public_network"
        config.ssh.forward_x11 = true
        config.vm.provision "docker"
        config.vm.provision "shell", inline: <<-SHELL
                /vagrant/vagrant_init.sh
        SHELL
end
