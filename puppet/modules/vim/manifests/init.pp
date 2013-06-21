#TODO: doku
class vim {
  package {
    "vim":
        ensure => installed,
  }

  file {
    "/home/user/.vimrc":
        ensure => file,
        source => "puppet:///modules/vim/.vimrc",
        owner => 'user',
        group => 'user',
        mode => 644,
  }
}