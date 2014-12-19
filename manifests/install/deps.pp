# == Class: gerrit::install::deps
#
# Install gerrit dependencies
#
class gerrit::install::deps {

  include ::gerrit

  case $gerrit::db_provider {
    'MYSQL': {
      contain ::gerrit::install::deps::mysql
    }
    'H2': {
      # do nothing
    }
    default: {
      err('gerrit::install::deps: unsupported database provider')
    }
  }

  # TODO: Ubuntu specific package name
  $package_defaults = {
    'ensure' => 'installed',
  }
  ensure_packages("openjdk-${gerrit::jdk_version}-jre", $package_defaults)

}
