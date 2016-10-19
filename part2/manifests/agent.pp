host {
  'master.vagrantup.com':
    ensure        => present,
    host_aliases  => ['master'],
    ip            => '10.2.2.10';
  'agent.vagrantup.com':
    ensure        => present,
    host_aliases  => ['agent'],
    ip            => '10.2.2.11';
}

exec {
  'reconfigure hostname':
    path        => '/usr/sbin:/usr/bin:/sbin:/bin',
    command     => '/etc/init.d/hostname.sh',
    refreshonly => true;
}

define hostname () {
  file {
    '/etc/hostname':
      ensure  => file,
      mode    => '0644',
      owner   => root,
      group   => root,
      content => $name,
      notify  => Exec['reconfigure hostname'];
  }
}

hostname {
  'agent.vagrantup.com':
}

