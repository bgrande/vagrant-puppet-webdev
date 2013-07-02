class ocr::gocr::install {
  package {
    "gocr":
        ensure => installed,
  }

  package {
    "gocr-tk":
        ensure => installed,
        require => [Package["gocr"]],
  }
}