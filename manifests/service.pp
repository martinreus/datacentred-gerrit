# == Class: gerrit::service
#
# Ensure the service is running
#
class gerrit::service {

  include ::gerrit

  service { $gerrit::service:
    ensure => running,
  }

}
