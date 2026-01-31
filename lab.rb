Vagrant.configure("2") do |config|
  
  # Tell Vagrant we are using VMware
  config.vm.provider "vmware_desktop" do |v|
    v.gui = true      # Shows the VM window so you can see the Kali desktop
    v.memory = 2048   # 2GB RAM
    v.cpus = 2
  end

  # --- THE ATTACKER: Kali Linux ---
  config.vm.define "kali" do |kali|
    kali.vm.box = "kalilinux/kali-rolling"
    # Sets a static IP so you always know where your attacker is
    kali.vm.network "private_network", ip: "192.168.50.10"
  end

  # --- THE TARGET: Vulnerable Ubuntu ---
  config.vm.define "target" do |target|
    target.vm.box = "bento/ubuntu-22.04"
    target.vm.network "private_network", ip: "192.168.50.20"
    
    # This "provisions" the target by installing a vulnerable app automatically
    target.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y docker.io
      docker run -d -p 80:80 --name dvwa vulnerables/web-dvwa
    SHELL
  end
end