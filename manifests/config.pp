# == Define: gerrit::config
#
# Add configuration parameters to gerrit
#
# === Parameters
#
# [*name*]
#   Section and setting encoded as 'section/setting'
#
# [*value*]
#   Value to set
#
define gerrit::config (
  $value,
) {

  validate_re($name, '^\w+/\w+$')

  include ::gerrit

  $fields = split($name, '/')

  ini_setting { $name:
    ensure  => present,
    path    => "${gerrit::app}/etc/gerrit.config",
    section => $fields[0],
    setting => $fields[1],
    value   => $value,
    # Require the config to have been generated
    require => Class['::gerrit::install::dirs'],
    # Notify the application of changes
    notify  => Class['::gerrit::service'],
  }

}
