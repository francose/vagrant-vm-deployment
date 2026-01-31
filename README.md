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

## Run 



