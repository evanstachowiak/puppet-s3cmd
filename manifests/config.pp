# Define s3cmd::config
# 
# configure s3cmd config file
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
define s3cmd::config (
  $ensure                = 'present',
  $aws_access_key_id     = hiera('aws_access_key_id'),
  $aws_secret_access_key = hiera('aws_secret_access_key'),
  $user                  = $name,
  $owner                 = $name,
  $group                 = $name,
  $mode                  = '0600'
) {

  if $user == 'root' {
    $home_path = '/root'
  }
  else {
    $home_path = "/home/${user}"
  }
 
  file { "${user}_s3cfg":
    ensure  => $ensure,
    path    => "${home_path}/.s3cfg",
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template("s3cmd/s3cfg.erb"),
  }
  
}
