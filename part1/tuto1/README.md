# Part 1

## Tuto 1 - Installation de Puppet

Lors de cette première partie sur la DSL Puppet nous travaillerons sur une machine virtuelle Debian 8 à l'aide de [Vagrant](https://www.vagrantup.com).

```shell
[local]$ cd part1
[local]$ cat Vagrantfile
```

Notez la partie provisioning du `Vagrantfile` :

```ruby
config.vm.provision "shell", inline: <<-SHELL
  cd /tmp && wget -q http://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb && dpkg -i puppetlabs-release-pc1-jessie.deb
  apt-get update
  apt-get install -y puppet-agent
SHELL
```

Démarrons la VM :

```shell
[local]$ vagrant up
[local]$ vagrant ssh
[vagrant@jessie]$ dpkg puppet*
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                         Version             Architecture        Description
+++-============================-===================-===================-=============================================================
un  puppet                       <none>              <none>              (no description available)
ii  puppet-agent                 1.7.0-1jessie       amd64               The Puppet Agent package contains all of the elements needed
un  puppet-common                <none>              <none>              (no description available)
ii  puppetlabs-release-pc1       1.1.0-2jessie       all                 Release packages for the Puppet Labs PC1 repository
[vagrant@jessie]$
```

Notez la différence de nommage des paquets fournis par Debian et ceux de Puppetlabs ainsi que la version du paquet par rapport à la version du logiciel.

```shell
[vagrant@jessie]$ /opt/puppetlabs/bin/puppet --version
4.7.0
```
