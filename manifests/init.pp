# modules/sudo/manifests/init.pp
#
# Synopsis:
#       Configures sudo on a host.
#
# Parameters:
#       NONE
#
# Requires:
#       NONE
#
# Example usage:
#
#       include sudo

class sudo {

    package { 'sudo':
	ensure	=> installed
    }

    file { '/etc/sudoers':
        group	=> 'root',
        mode    => '0440',
        owner   => 'root',
        require => Package['sudo'],
        source  => 'puppet:///modules/sudo/sudoers',
    }

    # NB: sudo will ignore files endinging in '~' or containing '.'.
    file { "/etc/sudoers.d/sudoers-${hostname}":
        group	=> 'root',
        mode    => '0440',
        owner   => 'root',
        require => Package['sudo'],
        source  => [
            "puppet:///private-host/sudo/sudoers-${hostname}",
            "puppet:///private-domain/sudo/sudoers-${domain}",
            'puppet:///modules/sudo/sudoers-default',
        ],
    }

}
