# Part 1 : DSL Puppet

## Tuto 2 : Ressources

### Création et gestion d'un fichier

Editer le fichier `manifests/tuto2.pp` :

```puppet
file {
  '/tmp/test1':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => "test1\n";
}
```

Sur le serveur via `vagrant ssh` :

* Vérifier létat de la resource

```shell
$ sudo /opt/puppetlabs/bin/puppet resource file /tmp/test1
```

* Application de la recette

```shell
$ sudo /opt/puppetlabs/bin/puppet apply /vagrant/tuto2/manifests/tuto2.pp
```

* Vérifier l'état de la resource

```shell
$ sudo /opt/puppetlabs/bin/puppet resource file /tmp/test1
```

### Création et gestion d'un repertoire

Ajouter la ressource :

```puppet
file {
  '/tmp/dir1':
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root;
}
```

Sur le server :

```shell
$ sudo /opt/puppetlabs/bin/puppet apply /vagrant/tuto2/manifests/tuto2.pp
```

### Création d'un lien symbolique

```puppet
file {
  '/tmp/dir1/test2':
    ensure  => link,
    target  => '/tmp/test1';
}
```

Les liens peuvent aussi être géré sans l'attribut `target` :

```puppet
file {
  '/tmp/dir1/test2':
    ensure  => '/tmp/test1';
}
```

### Regroupement de ressources par type

Il est possible de regrouper les ressources par type comme ceci :

```puppet
file {
  '/tmp/test1':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => "test1\n";
  '/tmp/dir1':
    ensure  => directory,
    mode    => '0755',
    owner   => root,
    group   => root;
  '/tmp/dir1/test2':
    ensure  => '/tmp/test1';
}
```

### Définition d'attributs par défauts

```puppet
File {
  owner => root,
  group => root,
  mode  => '0644'
}

file {
  '/tmp/test1':
    ensure  => file,
    content => "test1\n";
  '/tmp/dir1':
    ensure  => directory,
    mode    => '0755';
  '/tmp/dir1/test2':
    ensure  => '/tmp/test1';
}
```

### Tests

Modifier le contenu du fichier `/tmp/test1`, ainsi que les droits avec `chown`, puis lancer la commande suivante :

```shell
$ sudo /opt/puppetlabs/bin/puppet apply --noop /vagrant/tuto2/manifests/tuto2.pp
```

__Note__ : L'option `--noop` permet de n'appliquer aucun changement, mais de voir les changements à réaliser.

Enfin, appliquer l'état souhaité :

```shell
$ sudo /opt/puppetlabs/bin/puppet apply /vagrant/tuto2/manifests/tuto2.pp
```
