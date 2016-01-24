# == Class: gerrit::params
#
# Default and OS specific default parameters
#
class gerrit::params {

  $version = '2.12'
  $jdk_version = '8'
  $user = 'gerrit2'
  $home = '/opt/gerrit'
  $service = 'gerrit'
  $db_manage = true
  $db_provider = 'MYSQL'
  $db_hostname = 'localhost'
  $db_database = 'reviewdb'
  $db_username = 'gerrit2'
  $db_password = 'password'
  $base_path = 'git'
  $weburl = "http://${::fqdn}"
  $webport = 8080
  $index_type = 'LUCENE'
  $auth_type = 'HTTP'
  $ldap_server = undef
  $ldap_account_base = undef
  $ldap_account_pattern = "(&(objectClass=person)(uid=\${username}))"
  $ldap_full_name = 'displayName'
  $ldap_email_address = 'mail'
  $ldap_group_base = undef
  $ldap_group_member_pattern = "(&(objectClass=group)(member=\${dn}))"

}
