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
        'gcc-gfortran',
        'gettext',
        'indent',
        'intltool',
        'libtool',
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
      $desktop_base_packages = [
        'xorg-x11-docs',
      ]
      $desktop_runtime_packages = [
        'atk',
        'cairo',
        'dbus',
        'fontconfig',
        'freetype',
        'glib2',
        'gtk2',
        'libICE',
        'libSM',
        'libX11',
        'libXext',
        'libXft',
        'libXi',
        'libXrender',
        'libXt',
        'libXtst',
        'libpng',
        'libxml2',
        'mesa-libGL',
        'mesa-libGLU',
        'mesa-libGLw',
        'pango',
        'qt',
        'qt3',
      ]
      $desktop_packages     = union($desktop_base_packages, $desktop_runtime_packages)
      $desktop_dev_packages = suffix($desktop_runtime_packages, '-devel')
    }
    'Debian': {
      $packages = [
        'build-essential',
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
