# == Class: devtools::params
#
class devtools::params {
  case $::osfamily {
    'RedHat': {
      $packages = [
        'autoconf',
        'automake',
        'binutils',
        'bison',
        'byacc',
        'cscope',
        'ctags',
        'cvs',
        'diffstat',
        'doxygen',
        'elfutils',
        'flex',
        'gcc-c++',
        'gcc-gfortran',
        'gettext',
        'indent',
        'intltool',
        'libtool',
        'make',
        'patch',
        'patchutils',
        'pkgconfig',
        'rcs',
        'redhat-rpm-config',
        'rpm-build',
        'rpmdevtools',
        'subversion',
        'swig',
        'systemtap',
      ]
    }
    'Debian': {
      $packages = [
        'build-essential',
        'gcc',
        'g++',
        'make',
        'automake',
        'autoconf',
        'bison',
        'libtool',
        'gettext',
        'libssl-dev',
        'curl',
        'libicu-dev',
        'libyaml-dev',
        'zlib1g-dev',
        'libreadline-dev',
        'libmodule-build-perl',
        'libmodule-install-perl',
      ]
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}
