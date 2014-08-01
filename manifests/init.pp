# == Class: devtools
#
class devtools (
  $ensure   = 'present',
  $packages = $devtools::params::packages
) inherits devtools::params {

  include ::gcc
  include ::git
  include ::make

  ensure_resource('package', $packages, {'ensure' => $ensure})

}
