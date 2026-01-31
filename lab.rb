Vagrant.configure("2") do |config|
  
  # Set the default provider to VMware
  config.vm.provider "vmware_desktop" do |v|
    v.gui = true # Better for Kali if you need the desktop environment
    v.linked_clone = true # Saves disk space and speeds up deployment
  end

  # --- ATTACKER: Kali Linux ---
#   config.vm.define "kali" do |kali|
#     kali.vm.box = "kalilinux/kali-rolling"
#     kali.vm.network "private_network", ip: "192.168.10.10"
#   end

  # --- TARGET: Metasploitable 2 (The Ultimate CEH Target) ---
  config.vm.define "metasploitable" do |ms|
    # Note: Metasploitable is often distributed as a VMX/VMDK. 
    # This box is a community-maintained version for Vagrant.
    ms.vm.box = "tleemcjr/metasploitable2"
    ms.vm.network "private_network", ip: "192.168.10.20"
  end

end