# modules/sudo/manifests/init.pp
#
# == Class: sudo
#
# Configures a sudo on a host.
#
# === Parameters
#
# NONE
#
# === Authors
#
#   John Florian <john.florian@dart.biz>


class sudo {

    include 'sudo::params'

    package { $sudo::params::packages:
        ensure  => installed,
    }

    File {
        owner       => 'root',
        group       => 'root',
        mode        => '0440',
        subscribe   => Package[$sudo::params::packages],
    }

    file { '/etc/sudoers':
        source  => 'puppet:///modules/sudo/sudoers',
    }

}
