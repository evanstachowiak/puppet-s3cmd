# Class s3cmd
# 
# Installs s3cmd and creates config file.
#
# == Parameters
#
#
#
# == Examples
#
#
# == Requires:
#
class s3cmd (
  $ensure                = 'present',
  $user                  = $s3cmd::params::user,
  $owner                 = $s3cmd::params::owner,
  $group                 = $s3cmd::params::group,
  $mode                  = $s3cmd::params::mode,
  $aws_access_key_id     = hiera('aws_access_key_id'),
  $aws_secret_access_key = hiera('aws_secret_access_key')
) inherits s3cmd::params {

  Package['s3cmd'] -> File['s3cfg']

	package { 's3cmd':
    ensure => $ensure, 
  }

  if $user == 'root' {
    $home_path = '/root'
  }
  else {
    $home_path = '/home'
  }
 
  file { 's3cfg':
    ensure => $ensure,
    path => "${home_path}/.s3cfg",
    content => template("s3cmd/s3cfg.erb"),
  }
  
}
