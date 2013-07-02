# Make sure multitail is installed and set custom rc file for vagrant user
class multitail {
  package {
    "multitail":
        ensure => installed,
  }

  file {
    "/home/vagrant/.multitailrc":
        ensure => file,
        source => "puppet:///modules/multitail/.multitailrc",
        owner => 'vagrant',
        group => 'vagrant',
        mode => 644,
        require => Package["multitail"],
  }
}