class mountpoints {
    file {
        'www dir':
            ensure => directory,
            owner => www-data,
            group => www-data,
            mode => 644,
            path => '/var/www',
    }

    file {
        'app dir':
            ensure => directory,
            owner => www-data,
            group => www-data,
            mode => 644,
            path => '/var/www/app',
            require => File['www dir'],
    }

    file {
        '/mnt/application':
            ensure => directory,
            owner => www-data,
            group => www-data,
            mode => 600
    }

    mount {
        'mount application':
            ensure => mounted,
            name => '/mnt/application',
            atboot => false,
            device => 'v-root',
            fstype => 'vboxsf',
            options => 'defaults,uid=www-data,gid=www-data',
            require => File['/mnt/application'],

    }

    mount {
        'mount www':
            ensure => mounted,
            name => '/var/www/app',
            atboot => false,
            device => '/mnt/application/htdocs',
            fstype => 'auto',
            options => 'bind',
            require => [File['app dir'], Mount['mount application']],
    }
}
