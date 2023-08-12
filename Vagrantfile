Vagrant.configure("2") do |config|
  #############
  # Pentest Box
  #############
  config.vm.define "pentest" do |fedora|
    config.vm.box = "bento/fedora-38"
    config.vm.box_version = "202304.23.0"
    fedora.vm.synced_folder "~/Workspaces/keybase/pentest/", "/pentest/", SharedFoldersEnableSymlinksCreate: false

    fedora.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = `nproc`.to_i
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
    end

    fedora.vm.provision "provision", type: "shell", inline: <<-SCRIPT
      sudo chsh vagrant -s /bin/bash
      su - vagrant -c "/vagrant/scripts/install/install-nix.sh"
      su - vagrant -c "make -C /vagrant/ install-dotfiles"
      # TODO: in ansible
      echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
      echo "if [ -e /home/vagrant/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vagrant/.nix-profile/etc/profile.d/nix.sh; fi" >> /home/vagrant/.bashrc
      sudo bash -c 'sed -i "s/#PasswordAuthentication\ yes/PasswordAuthentication\ no/g" /etc/ssh/sshd_config'
      sudo service sshd reload
      . /home/vagrant/.nix-profile/etc/profile.d/nix.sh && make -C /vagrant/ansible vm-fedora

      # TODO: manually for now inside VM
      #passwd vagrant
      #chsh -s /bin/bash
      #sudo apt-get update
      #sudo apt-get upgrade
      #su - vagrant -c "make -C /vagrant/ansible pentest-box"
    SCRIPT
  end

  ###########
  # Win10 Box
  ###########
  config.vm.define "win10" do |win|
    win.vm.box = "fishi0x01/win-10-pro-x64"
    win.vm.box_version = "2023.03.18"

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
end
