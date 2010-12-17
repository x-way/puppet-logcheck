define logcheck::logfile($ensure=present, $file) {
  file {"/etc/logcheck/logcheck.logfiles":
    owner   => root,
    group   => logcheck,
    mode    => 0640,
  }
  common::concatfilepart {"$name":
    ensure  => $ensure,
    file    => "/etc/logcheck/logcheck.logfiles",
    content => "$file\n",
  }
}
