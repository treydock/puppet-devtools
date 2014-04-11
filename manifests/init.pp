# == Class: devtools
#
class devtools (
  $ensure = 'latest',
  $packages = $devtools::params::packages
) inherits devtools::params {

  include gcc
  include git

  ensure_resource('package', $packages, {'ensure' => $ensure})

}
