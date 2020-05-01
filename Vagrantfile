Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20200427.0.0"

  config.vm.provision "install-nix", type: "shell" do |s|
    s.inline = "su - vagrant -c \"/vagrant/scripts/install/install-nix.sh\""
  end

  config.vm.provision "test-make-installed", type: "shell" do |s|
    s.inline = "su - vagrant -c \"make -C /vagrant/\""
  end

  config.vm.provision "install-dotfiles", type: "shell" do |s|
    s.inline = "su - vagrant -c \"/vagrant/scripts/install/install-dotfiles.sh\""
  end

  config.vm.provision "delete-nix", type: "shell" do |s|
    s.inline = "su - vagrant -c \"/vagrant/scripts/delete/delete-nix.sh\""
  end

  config.vm.provision "delete-dotfiles", type: "shell" do |s|
    s.inline = "su - vagrant -c \"/vagrant/scripts/delete/delete-dotfiles.sh\""
  end
end
