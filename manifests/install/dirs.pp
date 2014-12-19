# == Class: gerrit::install::dirs
#
# Install base install directories for the install
#
class gerrit::install::dirs {

  include ::gerrit

  File {
    ensure => directory,
    owner  => $gerrit::user,
    group  => $gerrit::user,
    mode   => '0755',
  }

  file { $gerrit::home: }
  file { $gerrit::app: }
  file { $gerrit::dir: }
#  file { "${gerrit::app}/etc": }
#  file { "${gerrit::app}/lib": }

}
