# TODO: doku
class multitail {
  package {
    "multitail":
        ensure => installed,
  }

  file {
    "/home/user/.multitailrc":
        ensure => file,
        source => "puppet:///modules/multitail/.multitailrc",
        owner => 'user',
        group => 'user',
        mode => 644,
        require => Package["multitail"],
  }
}