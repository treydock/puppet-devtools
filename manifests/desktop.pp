# == Class: devtools::desktop
#
class devtools::desktop (
  $ensure       = 'present',
  $dev_ensure   = 'present',
  $manage_dev   = true,
  $packages     = $devtools::params::desktop_packages,
  $dev_packages = $devtools::params::desktop_dev_packages,
) inherits devtools::params {

  validate_bool($manage_dev)

  ensure_resource('package', $packages, {'ensure' => $ensure})

  if $manage_dev {
    ensure_resource('package', $dev_packages, {'ensure' => $dev_ensure})
  }

}
