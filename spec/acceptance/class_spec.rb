require 'spec_helper_acceptance'

describe 'devtools class:' do
  context 'default parameters' do
    it 'should run successfully' do
      pp = "class { 'devtools': }"

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    if fact('osfamily') =~ /RedHat/
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
        'gcc',
        'gcc-c++',
        'gcc-gfortran',
        'gettext',
        'git',
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
      ].each do |p|
        describe package(p) do
          it { should be_installed }
        end
      end
    end
  end
end
