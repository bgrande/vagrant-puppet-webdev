# site.pp

import "nodes"

# global defaults
Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

class { 'apt':
  always_apt_update => true
}

class {'apache::mod::php': }

apache::vhost { 'testproject.dev':
	priority	=> '10',
	vhost_name	=> '192.168.0.100',
	port		=> '80',
	docroot		=> '/var/www/testproject.dev/htdocs/',
	logroot		=> '/var/www/testproject.dev/logs/',
	serveradmin	=> 'webmaster@testproject.dev',
	serveraliases	=> ['www.testproject.dev'],
} 	
#include apachelocal
