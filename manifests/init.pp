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

	package { 's3cmd':
    ensure => $ensure, 
  }

  s3cmd::config { $user:
    ensure => $ensure,
  }

}
