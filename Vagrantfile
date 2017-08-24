
Vagrant.configure(2) do |config|
  
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.ssh.forward_agent = true
  config.vm.synced_folder '.', '/vagrant', nfs: true

  config.vm.hostname = "buddhist-stories"
  config.vm.provision "shell", path: "provision/provision.sh"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

end
