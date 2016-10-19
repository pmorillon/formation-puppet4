# Part 2 : Puppet Master

## Tuto 2 : Hiera

### Configuration de hiera

    $ cat /etc/puppetlabs/puppet/hiera.yaml

### Utiliser Hiera comme External Node Classifier

Editer le fichier `/etc/puppetlabs/code/environments/production/manifests/site.pp` en ne laissant que la ligne suivante :

    hiera_include('classes')

Ajouter le fichier `/etc/puppetlabs/code/environments/production/hieradata/nodes/agent.vagrantup.com.yaml`

    ---
    classes:
     - ntp
    ntp::servers:
     - ntp1.irisa.fr
     - ntp2.irisa.fr

Relancer l'agent.
