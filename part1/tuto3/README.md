# Part 1 : DSL Puppet

## Tuto 3 : Relations

Dans ce tutoriel nous allons installer collectd et activer l'interface web de collectd.

### Packages

#### Installation de collectd

```puppet
package {
  'collectd':
    ensure => installed;
}
```

#### Installation de apache

```puppet
package {
  'apache2':
    ensure => installed;
}
```


#### Installation des dépendances pour l'interface web

```puppet
package {
  [
    'libconfig-general-perl',
    'librrds-perl',
    'libregexp-common-perl',
    'libhtml-parser-perl'
  ]:
    ensure => installed;
}

```

### Services

#### Collectd

```puppet
service {
  'collectd':
    ensure => running,
    enable => true;
}
```

#### Apache

```puppet
service {
  'apache2':
    ensure => running,
    enable => true;
}
```

### Fichier de configuration Apache

```puppet
file {
  '/etc/apache2/conf.d/collection3.conf':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => '/vagrant/tuto3/files/collection3.conf',
}
```

### Puppet apply

Dans l'état actuel du manifest, la commande suivant va générer des erreurs :

    $ sudo /opt/puppetlabs/bin/puppet apply /vagrant/tuto3/manifests/tuto3.pp

### Définition des relations

* Définir les relations nécessaires à l'aide des meta-paramètres.
* Factoriser ensuite le manifest à l'aide des flèches de relations.

### Vérifier le résultat

Ouvrir l'URL suivante dans votre naigateur : [http://localhost:10080/collectd/](http://localhost:10080/collectd/)
