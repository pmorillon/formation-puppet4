# Module:: ntp
# Manifest:: params.pp
#

class ntp::params {

  $service_ensure = 'running'

  case $::osfamily {
    'Debian': {
      $package_name = 'ntp'
      $service_name = 'ntp'
    }
    default: {
      fail "OS family ${::osfamily} is not supported"
    }

  }

}
