# Make sure imagemagick is installed
class imagemagick {
  package {
    "imagemagick":
        ensure => installed,
  }
}
