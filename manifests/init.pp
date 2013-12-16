class devtools(
	$ensure => 'latest'
) inherits devtools::params {
	package {$devtools::params::packages: ensure => $ensure}
}
