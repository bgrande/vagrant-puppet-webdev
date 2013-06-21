class xdebug {
  include xdebug::params
  package {
    "xdebug":
        ensure => present,
        require => [Package["php5"]],
        provider => pecl
  }

  #add xdebug.ini
  file {
    "xdebug.ini":
        ensure => file,
        path => "${xdebug::params::config_dir}/xdebug.ini",
        source => "puppet:///modules/xdebug/xdebug.ini",
        require => Package["xdebug"],
        notify => Service["apache2"],
  }
}