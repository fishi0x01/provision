Vagrant.configure("2") do |config|

  ############
  # Pentesting
  ############
  config.vm.define "pentest" do |ubuntu|
    ubuntu.vm.box = "bento/ubuntu-20.04"
    ubuntu.vm.box_version = "202105.25.0"
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
      su - vagrant -c "make -C /vagrant/ansible pentest-box"
      sudo bash -c 'echo "PasswordAuthentication no" >> /etc/ssh/sshd_config'
      sudo service sshd reload
    SCRIPT
  end

  ###########
  # Win10 Box
  ###########
  config.vm.define "win10" do |win|
    win.vm.box = "fishi0x01/win-10-pro-x64"
    win.vm.box_version = "2021.03.03"

    win.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
      vb.customize ["modifyvm", :id, "--usb", "on"]
      vb.customize ["modifyvm", :id, "--audio", "pulse"]
      vb.customize ["modifyvm", :id, "--audioin", "on"]
      vb.customize ["modifyvm", :id, "--audioout", "on"]
    end
  end

  #######################
  # Provisioning Test VMs
  #######################
  config.vm.define "test-ubuntu20.04" do |ubuntu|
    ubuntu.vm.box = "bento/ubuntu-20.04"
    ubuntu.vm.box_version = "202012.23.0"

    ubuntu.vm.provision "provision-workstation", type: "shell", inline: <<-SCRIPT
      set -eou pipefail
      su - vagrant -c "/vagrant/scripts/install/install-nix.sh"
      su - vagrant -c "make -C /vagrant/ install-dotfiles"
      su - vagrant -c "make -C /vagrant/ansible/ test-workstation"
      su - vagrant -c "make -C /vagrant/ delete-dotfiles"
      su - vagrant -c "/vagrant/scripts/delete/delete-nix.sh"
    SCRIPT
  end
end
