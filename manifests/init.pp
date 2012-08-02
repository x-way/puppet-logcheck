class logcheck {
  # install package
  package { "logcheck":
    ensure => present,
  }

  # config
  file {"/etc/logcheck/logcheck.conf":
    ensure => present,
    content => template("logcheck/logcheck.conf.erb"),
    require => Package["logcheck"],
    owner => root,
    group => logcheck,
  }

  include concat::setup
  concat {[
      '/etc/logcheck/logcheck.logfiles',
      '/etc/logcheck/ignore.d.server/auto-puppet',
      '/etc/logcheck/violations.ignore.d/auto-puppet',
      '/etc/logcheck/cracking.ignore.d/auto-puppet'
    ]:
    owner => root,
    group => root,
    mode  => '0644',
  }

  # create auto-puppet files
  file { [
      "/etc/logcheck/cracking.ignore.d/auto-puppet",
      "/etc/logcheck/ignore.d.paranoid/auto-puppet",
      "/etc/logcheck/ignore.d.server/auto-puppet",
      "/etc/logcheck/ignore.d.workstation/auto-puppet",
      "/etc/logcheck/violations.ignore.d/auto-puppet"
    ]:
    ensure => present,
    mode => 0644,
    owner => root,
    group => logcheck,
    require => Package["logcheck"],
  }
}
