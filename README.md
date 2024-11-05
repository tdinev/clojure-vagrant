# Portable Clojure Development Environment

## 📃 Description

This repository facilitates setting up a portable and reproducible development environment for [Clojure](https://clojure.org/) based on [Vagrant](https://www.vagrantup.com/).
The underlying Vagrant box is the official [Debian](https://www.debian.org/) distribution Bookworm.

This repository arose out of the need to develop in Clojure using the traditional command line tools on a Windows machine.
A [first attempt](https://github.com/tdinev/clojure-container-ide) to achieve this resulted in a setup employing Docker but turned out to not have a ´well functioning Emacs executable.
This more heavy-weight way of using an entire virtual machine seems to be working well.

## 💡 Usage

The following are instructions for novices using Windows.

### Terminal Emulator

A decent terminal emulator is recommended for the following actions to make for a pleasant user experience.
(I have been using [ConEmu](https://conemu.github.io/) in the past few years.)

### Windows Package Manager `scoop`

The command line installer [scoop](https://scoop.sh/) is used in what follows to make for an easier installation of Vagrant and VirtualBox.
It can be installed using

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

in a PowerShell window.
If you have to pass via a proxy requiring authentication, instead of the last line use

```powershell
Invoke-RestMethod -Uri https://get.scoop.sh -Proxy http://<proxy-server>:<port> -ProxyCredential Get-Credential | Invoke-Expression
```

after replacing `<proxy-server>` and `<port>` with your proxy sever address and port, respectively.

If you do not want to use `scoop`, then you have to install Vagrant and VirtualBox manually.

### Installing Tools

#### Proxy Configuration

If you are behind a proxy server, you have to configure `scoop` to pass HTTP requests through it (as described [here](https://github.com/ScoopInstaller/Scoop/wiki/Using-Scoop-behind-a-proxy)):

```powershell
scoop config proxy <username>:<password>@<proxy-server>:<port>
```

Replace the placeholders between angle brackets with your custom values.

#### FiraCode Nerd Font

We will install the FiraCode [nerd font](https://www.nerdfonts.com/).
You can, of course, choose a different one from this [list](https://github.com/matthewjberger/scoop-nerd-fonts/tree/master/bucket).


```powershell
scoop bucket add nerd-fonts
scoop install nerd-fonts/FiraCode-NF
```

#### `sudo`

`sudo` makes it easier to run command with admin rights without manually launching a new PowerShell session.

```powershell
scoop install sudo
```

#### VirtualBox

Install [VirtualBox](https://www.virtualbox.org/) hypervisor:

```powershell
scoop bucket add nonportable
scoop install nonportable/virtualbox-np
```

#### Vagrant

Install [Vagrant](https://www.vagrantup.com/):

```powershell
scoop install vagrant
```

### Set Up the Development Environment

Clone this repository using Git

```bash
git clone https://github.com/tdinev/clojure-vagrant.git
```

or download and extract the [ZIP archive](https://github.com/tdinev/clojure-vagrant/archive/refs/heads/master.zip).

Change into the `clojure-vagrant` directory and issue the command

```pwershell
vagrant up
```

to set up the development environment.

After the command has finished (it may take a few minutes), type

```powershell
vagrant ssh
```

to log onto the development enviornment.

Use the following commands to manage the lifecycle of your virtual machine:

```bash
vagrant suspend # Stops the virtual machine from executing and saves its state to disk.
vagrant resume # Continues executing the virtual machine after it has been suspended.
vagrant halt # Shuts down the virtual machine.
vagrant destroy # Tears down the virtual machine, i.e., a new one has to be created if you want to use the development environment again.
vagrant provision # Executes all provisioning scripts again to take any modifications into account.
```

## TODOs

1. install sdkman and jdk 21
1. copy `~/.gitconfig`
