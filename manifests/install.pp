# Class: gerrit::install
#
# Install gerrit
#
class gerrit::install {

  contain ::gerrit::install::users
  contain ::gerrit::install::dirs
  contain ::gerrit::install::deps
  contain ::gerrit::install::app

  Class['::gerrit::install::users'] ->
  Class['::gerrit::install::dirs'] ->
  Class['::gerrit::install::deps'] ->
  Class['::gerrit::install::app']

}
