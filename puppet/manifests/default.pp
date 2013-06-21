Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

exec { "add_vagrant_to_wwwdata":
  command => "sudo adduser vagrant www-data",
}

exec { "chown_docroot":
  command => "sudo chown -R www-data:www-data /var/www/app/",
  require  => Class['app'],
}

class { 'mountpoints' }

class { 'apt':
  always_apt_update => true
}

package { ['build-essential', 'python-software-properties', 'puppet-lint',
           'vim', 'curl', 'zip', 'multitail', 'screen']:
  ensure  => 'installed',
  require => Exec['apt-get update'],
}

file { '/home/vagrant/.bash_aliases':
  source => 'puppet:///modules/puphpet/dot/.bash_aliases',
  ensure => 'present',
}

apache::dotconf { 'custom':
  content => 'EnableSendfile Off',
}

apache::module { 'rewrite': }

apache::vhost { 'project':
  server_name   => 'myproject.dev',
  serveraliases => ['www.myproject.dev'],
  docroot       => '/var/www/app',
  port          => '80',
  priority      => '1'
}

#class { 'php':
#  service => 'apache',
#  require => Package['apache'],
#}


class php {
    php::module { [
        'gearman', 'curl', 'gd', 'gmagick', 'igbinary',
        'inotify', 'mcrypt', 'memcached', 'mogilefs', 'mysql',
        'pecl-http', 'proctitle', 'tidy', 'xhprof', 'intl', 'imap',
        'oauth', 'sphinx', 'sqlite', 'cli',
        ]:
        require => Apt::Sources_list['dotdeb-php53'],
        notify  => Service['apache'],
    }

    php::module { 'xcache':
        content => 'global/etc/php5/conf.d/',
        require => Apt::Sources_list['dotdeb-php53'],
        notify  => Service['apache'],
    }

    php::module { [ 'suhosin', 'xdebug', ]:
        require => Apt::Sources_list['dotdeb-php53'],
        notify  => Service['apache'],
        source  => true,
    }

    php::module { 'pear':
        require => Apt::Sources_list['dotdeb-php53'],,
    }

    php::conf { [ 'browscap', 'global', ]:
        require => Apt::Sources_list['dotdeb-php53'],
        notify  => Service['apache'],
        source  => true,
    }

    php::conf { [ 'mysqli', 'pdo', 'pdo_mysql', ]:
        require => Package['php-mysql'],
        notify  => Service['apache'],
    }

    php::extra { 'lite_php_browscap':
        require => Php::Conf['browscap'],
        notify  => Service['apache'],
        source  => true,
    }

    php::ini { 'default':
        value  => [
          'date.timezone = Europe/Berlin',
          'display_errors = On',
          'error_reporting = -1'
        ],
        target => 'error_reporting.ini'
    }
}

#xdebug::config { 'cgi': }
#xdebug::config { 'cli': }

apache::vhost { 'xhprof':
  server_name => 'xhprof',
  docroot     => '/var/www/xhprof/xhprof_html',
  port        => '80',
  priority    => '1',
  require     => php::module['xhprof']
}