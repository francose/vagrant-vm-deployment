# Vagrant Windows Setup

* Install Hashicorp Vagrant VMware Utility - https://developer.hashicorp.com/vagrant/downloads


* Install Vagrant Engine 
```ps1
winget install HashiCorp.Vagrant 
```

* install the specific plugin that allows Vagrant to control it. Run this command in your new window:
```ps1
vagrant plugin install vagrant-vmware-desktop
```

## Testing & Troubleshooting

```ps1
Test-Path "C:\HashiCorp\Vagrant\bin"
```

```ps1
vagrant --version
```

## Run & Deployment

```ps1
vagrant up --provider vmware_desktop

```

### Next steps?

* Downloading: Vagrant will download the Kali and Ubuntu "boxes" (images). This might take a few minutes depending on your internet.

* Importing: It will import them into VMware Workstation.

* Booting: You will see the VMware windows pop up and start booting the OS.

* Ready: Once the terminal returns to the prompt, your lab is live!

### How to use it:

* To log into Kali: Just use the VMware window that popped up (the default credentials for the Kali box are usually kali / kali).

* To check connectivity: From your Kali terminal, try to ping your target: ping 192.168.50.20.

* To shut it down: Run vagrant halt.

* To delete it all (start fresh): Run vagrant destroy.