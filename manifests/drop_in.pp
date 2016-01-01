# modules/sudo/manifests/drop_in.pp
#
# == Define: sudo::drop_in
#
# Manages a drop-in configuration file for sudo.
#
# === Parameters
#
# ==== Required
#
# [*namevar*]
#   An arbitrary identifier for the drop-in instance unless the "filename"
#   parameter is not set in which case this must provide the value normally
#   set with the "filename" parameter.
#
# ==== Optional
#
# [*ensure*]
#   Instance is to be 'present' (default) or 'absent'.
#
# [*filename*]
#   Name to be given to the drop-in file within the sudoers.d directory.
#   Defaults to the value of the "namevar" parameter.
#
# [*content*]
#   Literal content for the drop-in file.  One and only one of "content"
#   or "source" must be given.
#
# [*source*]
#   URI of the drop-in file content.  One and only one of "content" or
#   "source" must be given.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# Copyright 2009-2016 John Florian


define sudo::drop_in (
    $ensure='present',
    $filename=$name,
    $content=undef,
    $source=undef,
) {

    include '::sudo::params'

    if $filename {
        $filename_ = $filename
    } else {
        $filename_ = $name
    }

    file { "/etc/sudoers.d/${filename_}":
        ensure    => $ensure,
        owner     => 'root',
        group     => 'root',
        mode      => '0440',
        seluser   => 'system_u',
        selrole   => 'object_r',
        seltype   => 'etc_t',
        subscribe => Package[$::sudo::params::packages],
        content   => $content,
        source    => $source,
    }

}
