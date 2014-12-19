# == Class: gerrit::configure::db
#
# Configure gerrit for the requested database
#
class gerrit::configure::db {

  case $gerrit::db_provider {

    'MYSQL': {

      file { "${gerrit::app}/lib/mysql.jar":
        ensure => link,
        target => '/usr/share/java/mysql.jar',
      } ~>

      exec { 'gerrit init mysql':
        command     => "java -jar ${gerrit::dir}/gerrit-${gerrit::version}.war init -d ${gerrit::app} --batch --no-auto-start",
        user        => $gerrit::user,
        refreshonly => true,
      }

    }

    'H2': {
      # Nothing to do
    }

    default: {
      err('gerrit::configure::db: unsupported database provider')
    }

  }

}
