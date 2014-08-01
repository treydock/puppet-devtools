require 'spec_helper'

describe 'devtools' do
  let :facts do
    {
      :osfamily => 'RedHat',
    }
  end

  it { should create_class('devtools') }
  it { should contain_class('devtools::params') }

  it { should contain_class('gcc') }
  it { should contain_class('git') }
  it { should contain_class('make') }

  it { should have_package_resource_count(31) }

  [
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
  ].each do |p|
    it { should contain_package(p).with_ensure('present') }
  end
end
