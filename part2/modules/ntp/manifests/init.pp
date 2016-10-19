# Module:: ntp
# Manifest:: init.pp
#

class ntp (
  String $package_name = $ntp::params::package_name,
  String $service_name = $ntp::params::service_name,
  String $service_ensure = $ntp::params::service_ensure,
  Array $servers = [],
  Boolean $iburst = true
) inherits ntp::params {

  package {
    'ntp':
      name   => $package_name,
      ensure => installed;
  }

  service {
    'ntp':
      name   => $service_name,
      ensure => $service_ensure;
  }

  file {
    '/etc/ntp.conf':
      ensure  => file,
      mode    => '0644',
      owner   => root,
      group   => root,
      content => template('ntp/ntp.conf.erb')
  }

  Package['ntp'] -> Service['ntp']
  File['/etc/ntp.conf'] ~> Service['ntp']

}
