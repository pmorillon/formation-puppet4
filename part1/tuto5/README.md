# Part 1 : DSL Puppet

## Tuto 5 : Modules


### Manifest _tuto5.pp_

Le fichier `tuto5/manifests/tuto5.pp` contiendra :

```puppet
class {
  'collectd':
    www => true;
}
```


### Creation des modules

Créer les 3 modules suivants :

* apache
* collectd
* ntp

__Note__ : Pour le module _ntp_, On ne gèrera pour l'instant pas le contenu du fichier `/etc/ntp.conf`.

### Utilisation des modules avec _puppet apply_

Ajouter l'option `--modulepath`

    $ sudo puppet apply --modulepath=/vagrant/tuto5/modules/ /vagrant/tuto5/manifests/tuto5.pp

__Note__ : Il est possible de définir le `modulepath` en éditant le fichier `/etc/puppet/puppet.conf` en ajoutant la ligne suivante dans la section `[main]`

    modulepath=/vagrant/tuto5/modules/
