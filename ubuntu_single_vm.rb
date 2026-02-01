Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  
  # This creates the "wire" between the machines
  config.vm.network "private_network", ip: "192.168.50.20"

  config.vm.provider "vmware_desktop" do |v|
    v.gui = true
  end

  # Auto-install the vulnerable app
  config.vm.provision "shell", inline: "curl -sSL https://get.docker.com/ | sh && docker run -d -p 80:80 vulnerables/web-dvwa"
end