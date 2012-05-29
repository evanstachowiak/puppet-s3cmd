# Class s3cmd::params
# 
# All config settings for candiapp class
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
class s3cmd::params {

  $user  = 'root'
  $owner = 'root'
  $group = 'root'
  $mode  = '0600'

  case $::operatingsystem {
    ubuntu, debian: {
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

}
