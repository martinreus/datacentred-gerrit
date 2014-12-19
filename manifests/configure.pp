# == Class: gerrit::configure
#
# Configure your review site
#
class gerrit::configure {

  contain ::gerrit::configure::app
  contain ::gerrit::configure::config
  contain ::gerrit::configure::db

  Class['::gerrit::configure::app'] ->
  Class['::gerrit::configure::config'] ->
  Class['::gerrit::configure::db']

}
