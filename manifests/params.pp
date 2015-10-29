# modules/sudo/manifests/params.pp
#
# == Class: sudo::params
#
# Parameters for the sudo puppet module.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# Copyright 2009-2015 John Florian


class sudo::params {

    case $::operatingsystem {

        'CentOS', 'Fedora': {

            $packages = 'sudo'

        }

        default: {
            fail ("${title}: operating system '${::operatingsystem}' is not supported")
        }

    }

}
