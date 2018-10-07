#
# == Class: sudo
#
# Manages sudo on a host.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# This file is part of the doubledog-sudo Puppet module.
# Copyright 2009-2018 John Florian
# SPDX-License-Identifier: GPL-3.0-or-later


class sudo (
        Array[String[1], 1]     $packages,
        String[1]               $secure_path,
    ) {

    package { $packages:
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
            subscribe => Package[$packages],
            ;
        '/etc/sudoers':
            content => template("sudo/sudoers.${operatingsystem}.erb"),
            ;
    }

}
