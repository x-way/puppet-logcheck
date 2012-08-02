define logcheck::logfile($ensure=present, $file) {
  file {"/etc/logcheck/logcheck.logfiles":
    owner   => root,
    group   => logcheck,
    mode    => 0640,
  }
  concat::fragment {"$name":
    ensure  => $ensure,
    target  => "/etc/logcheck/logcheck.logfiles",
    content => "$file\n",
  }
}
