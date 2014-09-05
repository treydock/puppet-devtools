require 'spec_helper'

describe 'devtools::desktop' do
  let :facts do
    {
      :osfamily => 'RedHat',
    }
  end

  it { should create_class('devtools::desktop') }
  it { should contain_class('devtools::params') }

  it { should have_package_resource_count(49) }

  [
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
  ].each do |p|
    it { should contain_package(p).with_ensure('present') }
    it { should contain_package("#{p}-devel").with_ensure('present') }
  end

  it { should contain_package('xorg-x11-docs').with_ensure('present') }

  context 'when manage_dev => false' do
    let(:params) {{ :manage_dev => false }}

    it { should have_package_resource_count(25) }

    [
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
    ].each do |p|
      it { should contain_package(p).with_ensure('present') }
      it { should_not contain_package("#{p}-devel").with_ensure('present') }
    end

    it { should contain_package('xorg-x11-docs').with_ensure('present') }
  end

end
