Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.provider "vmware_desktop" do |v|
    v.gui = true
    v.vmx["memsize"] = "4096"
    v.vmx["numvcpus"] = "2"
    v.vmx["mks.enable3d"] = "TRUE"
    
    v.vmx["gui.enableHelp"] = "TRUE"
    v.vmx["isolation.tools.copy.disable"] = "FALSE"
    v.vmx["isolation.tools.paste.disable"] = "FALSE"
    v.vmx["isolation.tools.dnd.disable"] = "FALSE"
  end

  # This ensures the GUI is installed if you ever 'vagrant destroy' and start over
  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get update
    sudo apt-get install -y xfce4 lightdm
    sudo systemctl set-default graphical.target
  SHELL
end