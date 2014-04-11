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

  it { should have_package_resource_count(30) }

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
    'subversion',
    'swig',
    'systemtap',
  ].each do |p|
    it { should contain_package(p).with_ensure('latest') }
  end
end
