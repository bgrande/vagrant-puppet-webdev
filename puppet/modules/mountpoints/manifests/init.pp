class mountpoints {
    file {
        '/mnt/applications':
            ensure => directory,
            owner => www-data,
            group => www-data,
            mode => 600
    }

    mount {
        'mount application dir':
            ensure => mounted,
            name => '/mnt/applications',
            atboot => false,
            device => '/vagrant/projects',
            fstype => 'auto',
            options => 'bind',
            require => File['/mnt/applications'],
    }

# TODO use vhosts for different projects instead! => use puppet apache module configuration! 
    mount {
        'mount testproject':
            ensure => mounted,
            name => '/var/www/testproject.dev',
            atboot => false,
            device => '/mnt/application/testproject.dev',
            fstype => 'auto',
            options => 'bind',
            require => Mount['mount application dir']],
    }
}
