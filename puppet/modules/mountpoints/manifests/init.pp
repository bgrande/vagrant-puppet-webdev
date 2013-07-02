class mountpoints {
    file {
        '/var/www/webapps':
            ensure => directory,
            owner => www-data,
            group => www-data,
            mode => 644
    }

# TODO maybe use vhost paths directly for different projects instead!
    mount {
        'mount webapps':
            ensure => mounted,
            name => '/var/www/webapps',
            atboot => false,
            device => '/vagrant/projects',
            fstype => 'auto',
            options => 'bind',
            require => File['/var/www/webapps'],
    }
}
