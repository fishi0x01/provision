Vagrant.configure("2") do |config|

  ############
  # Pentesting
  ############
  config.vm.define "pentest" do |kali|
    kali.vm.box = "kalilinux/rolling"
    kali.vm.box_version = "2021.3.0"
    kali.vm.synced_folder "~/Workspaces/fishi0x01/pentest/", "/pentest/", SharedFoldersEnableSymlinksCreate: false

    kali.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
    end

    kali.vm.provision "provision", type: "shell", inline: <<-SCRIPT
      su - vagrant -c "/vagrant/scripts/install/install-nix.sh"
      su - vagrant -c "make -C /vagrant/ install-dotfiles"
      sudo bash -c 'sed -i "s/#PasswordAuthentication\ yes/PasswordAuthentication\ no/g" /etc/ssh/sshd_config'
      sudo service sshd reload

      # TODO: manually for now inside VM
      #su - vagrant -c "make -C /vagrant/ansible pentest-box"
      #sudo apt-get update
      #sudo apt-get upgrade
      #
      # TODO: maybe redundant
      #su - vagrant -c "make -C /vagrant/ nix-pen-env"
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
    ubuntu.vm.box_version = "202112.19.0"

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
