# modules/sudo/manifests/init.pp
#
# == Class: sudo
#
# Manages sudo on a host.
#
# === Parameters
#
# ==== Required
#
# ==== Optional
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# Copyright 2009-2017 John Florian


class sudo (
    ) inherits ::sudo::params {

    package { $::sudo::params::packages:
        ensure => installed,
    }

    file {
        default:
            owner     => 'root',
            group     => 'root',
            mode      => '0440',
            seluser   => 'system_u',
            selrole   => 'object_r',
            seltype   => 'etc_t',
            subscribe => Package[$::sudo::params::packages],
            ;
        '/etc/sudoers':
            source => "puppet:///modules/sudo/sudoers.${::operatingsystem}",
            ;
    }

}
