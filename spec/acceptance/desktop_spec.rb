require 'spec_helper_acceptance'

describe 'devtools::desktop class:' do
  context 'manage_dev => false' do
    it 'should run successfully' do
      pp = "class { 'devtools::desktop': manage_dev => false }"

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    if fact('osfamily') =~ /RedHat/
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
        describe package(p) do
          it { should be_installed }
        end

        describe package("#{p}-devel") do
          it { should_not be_installed }
        end
      end

      describe package('xorg-x11-docs') do
        it { should be_installed }
      end
    end
  end

  context 'manage_dev => true' do
    it 'should run successfully' do
      pp = "class { 'devtools::desktop': manage_dev => true }"

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    if fact('osfamily') =~ /RedHat/
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
        describe package(p) do
          it { should be_installed }
        end

        describe package("#{p}-devel") do
          it { should be_installed }
        end
      end

      describe package('xorg-x11-docs') do
        it { should be_installed }
      end
    end
  end
end
