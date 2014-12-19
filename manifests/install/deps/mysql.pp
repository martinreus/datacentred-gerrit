# == Class: gerrit::install::deps::mysql
#
# Install the review metadata database
#
class gerrit::install::deps::mysql {

  include ::gerrit

  class { '::mysql::bindings':
    java_enable => true,
  }
 
  if $gerrit::db_manage {

    include ::mysql::server

    mysql::db { $gerrit::db_database:
      user     => $gerrit::db_username,
      password => $gerrit::db_password,
    }

  }

}
