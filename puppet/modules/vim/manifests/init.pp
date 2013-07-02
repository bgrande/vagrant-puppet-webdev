# Make sure vim is installed and set custom rc file
class vim {
  package {
    "vim":
        ensure => installed,
  }

  file {
    "/home/vagrant/.vimrc":
        ensure => file,
        source => "puppet:///modules/vim/.vimrc",
        owner => 'vagrant',
        group => 'vagrant',
        mode => 644,
  }
}