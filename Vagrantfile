Vagrant.configure("2") do |config|

  ############
  # Pentesting
  ############
  config.vm.define "pentest" do |ubuntu|
    ubuntu.vm.box = "bento/ubuntu-18.04"
    ubuntu.vm.box_version = "202008.16.0"
    ubuntu.vm.synced_folder "~/hackthebox.eu/", "/hackthebox.eu/", SharedFoldersEnableSymlinksCreate: false

    ubuntu.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
    end

    ubuntu.vm.provision "provision", type: "shell", inline: <<-SCRIPT
      sudo apt-get update 
      sudo apt-get upgrade -y
      sudo apt-get install -y --no-install-recommends ubuntu-desktop firefox
      su - vagrant -c "/vagrant/scripts/install/install-nix.sh"
      su - vagrant -c "make -C /vagrant/ install-dotfiles"
      su - vagrant -c "make -C /vagrant/ nix-pen-env"
    SCRIPT
  end

  config.vm.define "win10" do |win|
    win.vm.box = "fishi0x01/win-10-pro-x64"
    win.vm.box_version = "2020.11.06"

    win.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
      vb.customize ["modifyvm", :id, "--usb", "on"]
    end
  end

  ##########
  # Test VMs
  ##########
  config.vm.define "test-ubuntu18.04" do |ubuntu|
    ubuntu.vm.box = "bento/ubuntu-18.04"
    ubuntu.vm.box_version = "202008.16.0"

    ubuntu.vm.provision "nix-and-dotfiles", type: "shell", inline: <<-SCRIPT
      su - vagrant -c "/vagrant/scripts/install/install-nix.sh"
      su - vagrant -c "make -C /vagrant/ install-dotfiles"
      su - vagrant -c "make -C /vagrant/ delete-dotfiles"
      su - vagrant -c "/vagrant/scripts/delete/delete-nix.sh"
    SCRIPT
  end
end
