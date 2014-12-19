# == Class: gerrit::install::app
#
# Install the base gerrit binary
#
class gerrit::install::app {

  include ::gerrit

  wget::fetch { "http://gerrit-releases.storage.googleapis.com/gerrit-${gerrit::version}.war":
    destination => $gerrit::jar,
  }

}
