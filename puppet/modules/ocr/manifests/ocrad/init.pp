class ocr::ocrad::install {
  package {
    "ocrad":
        ensure => installed,
  }

  package {
    "libocrad-dev":
        ensure => installed,
        require => [Package["ocrad"]],
  }
}
