# Part 1 : DSL Puppet

## Tuto 4 : Classes

Dans ce tuto, nous allons réorganiser en classes ce que nous avons réalisé au tuto 3.

### Création des classes

Définir les classes suivantes dans `manifests/tuto4.pp` :

* `apache`
* `collectd` (classe paramétrique)
* `collectd::www`

Déclaration de la classe :

```puppet
class {
  'collectd':
    www => true;
}
```

Par défaut, l'interface web ne doit pas être installé.

__Note__ : utilisation de la condition `if` dans la classe `collectd`.

```puppet
if $www == true {
  include 'collectd::www'
}
```
