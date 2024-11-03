# Portable Clojure development environment

## Description

This repository facilitates setting up a portable and reproducible development environment for Clojure based on Vagrant.
The underlying Vagrant box is the official Debian Bookworm.

This repository arose out of the need to develop in Clojure using the traditional command line tools on a Windows machine.
A first attempt to achieve this resulted in a setup employing Docker.

## TODOs

1. install sdkman and jdk 21
1. install ripgrep
1. execute `ln -s /usr/local/bin/lolcal /usr/games/lolcat`
1. embed heredocs from `Vagrantfile` into scripts
1. copy `~/.gitconfig`
1. document setting up using `scoop install sudo virtualbox-np vagrant`
