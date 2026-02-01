

## 1. The Network Change: From "Host-Only" to "Bridged"

In our previous setup, we used a `private_network` (Host-only). That’s like an invisible cable connecting VMs *inside* your laptop. To reach another computer, you need to use **Bridged Networking**.

* **Bridged Mode:** This makes the VM appear as a separate, physical device on your home Wi-Fi or Ethernet. It gets its own IP address from your router (e.g., `192.168.1.15`), just like your laptop.

### Updated `Vagrantfile` for the Other Computer:

On your **second computer**, use this script to spin up multiple servers:

```ruby
Vagrant.configure("2") do |config|
  config.vm.provider "vmware_desktop" do |v|
    v.gui = false # Headless is better for servers
  end

  # Define 3 Ubuntu Servers
  (1..3).each do |i|
    config.vm.define "server-#{i}" do |node|
      node.vm.box = "bento/ubuntu-22.04"
      
      # Use Bridged networking instead of Private
      # Vagrant will ask you which network card to use (Wi-Fi or Ethernet)
      node.vm.network "public_network"
      
      node.vm.hostname = "server-#{i}"
    end
  end
end

```

---

## 2. Connecting from your Laptop's Kali

For your Kali VM (on your laptop) to see the servers (on the other PC), your Kali VM **must also be in Bridged Mode**.

1. Open VMware on your laptop.
2. Go to **Kali VM Settings > Network Adapter**.
3. Change it from **Host-Only** to **Bridged**.
4. Inside Kali, restart your networking: `sudo dhclient -v eth0`.

---

## 3. How to Scan Across the Room

Once everyone is "Bridged":

1. On the **other computer**, run `vagrant ssh server-1 -c "hostname -I"` to find its new IP address.
2. On your **laptop's Kali**, you should now be able to ping it.
* *Example:* `ping 192.168.1.x` (whatever IP the router gave it).



### Important "CEH" Warning:

When you use `public_network` (Bridged), your vulnerable VMs are **live on your home network**.

* If your router doesn't have a strong firewall, or if you have "UPnP" enabled, there is a tiny risk that someone on the internet could see your "vulnerable" targets.
* **Recommendation:** Only do this on a trusted home network, never on public Wi-Fi (like a coffee shop).

---
