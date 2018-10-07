#
# == Define: sudo::drop_in
#
# Manages a drop-in configuration file for sudo.
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


define sudo::drop_in (
        Ddolib::File::Ensure    $ensure='present',
        Optional[String[1]]     $content=undef,
        String[1]               $filename=$title,
        Optional[String[1]]     $source=undef,
) {

    include 'sudo'

    file { "/etc/sudoers.d/${filename}":
        ensure    => $ensure,
        owner     => 'root',
        group     => 'root',
        mode      => '0440',
        seluser   => 'system_u',
        selrole   => 'object_r',
        seltype   => 'etc_t',
        subscribe => Package[$sudo::packages],
        content   => $content,
        source    => $source,
    }

}
