Vagrant.configure("2") do |config|
  
  # Set the default provider to VMware
  config.vm.provider "vmware_desktop" do |v|
    v.gui = true 
    v.linked_clone = true 
  end

  # --- ATTACKER: ---
#   config.vm.define "kali" do |kali|
#     kali.vm.box = "kalilinux/kali-rolling"
#     kali.vm.network "private_network", ip: "192.168.10.10"
#   end

  # --- TARGET:
  config.vm.define "metasploitable" do |ms|
    # Note: Metasploitable is often distributed as a VMX/VMDK. 
    # This box is a community-maintained version for Vagrant.
    ms.vm.box = "tleemcjr/metasploitable2"
    ms.vm.network "private_network", ip: "192.168.10.20"
  end

end