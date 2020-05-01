Vagrant.configure("2") do |config|

  ##########
  # Test VMs
  ##########
  config.vm.define "test-ubuntu18.04" do |ubuntu|
    ubuntu.vm.box = "ubuntu/bionic64"
    ubuntu.vm.box_version = "20200427.0.0"
    ubuntu.vm.provision "install-nix", type: "shell" do |s|
      s.inline = "su - vagrant -c \"/vagrant/scripts/install/install-nix.sh\""
    end

    ubuntu.vm.provision "install-dotfiles", type: "shell" do |s|
      s.inline = "su - vagrant -c \"make -C /vagrant/ install-dotfiles\""
    end

    ubuntu.vm.provision "delete-dotfiles", type: "shell" do |s|
      s.inline = "su - vagrant -c \"make -C /vagrant/ delete-dotfiles\""
    end

    ubuntu.vm.provision "delete-nix", type: "shell" do |s|
      s.inline = "su - vagrant -c \"/vagrant/scripts/delete/delete-nix.sh\""
    end
  end
end
