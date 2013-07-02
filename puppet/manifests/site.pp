# site.pp

import "nodes"

# global defaults
Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

class { 'apt':
  always_apt_update => true
}

# enable mod php - not working yet
# class {'apache::mod::php': }

# enable example virtual host
apache::vhost { 'testproject.dev':
	priority	=> '10',
	vhost_name	=> '192.168.0.100',
	port		=> '80',
	docroot		=> '/var/www/webapps/testproject.dev',
	docroot_owner => 'www-data',
    docroot_group => 'www-data',
	serveradmin	=> 'webmaster@testproject.dev',
	serveraliases	=> ['www.testproject.dev'],
}
