class devtools::params {
	case $osfamily {
		'RedHat': {
			$packages = [
				'gcc',
				'gcc-c++',
				'cpp',
				'make',
				'autoconf',
				'automake',
				'gettext',
				'libidn',
				'libidn-devel',
				'kernel-headers',
				'kernel-devel',
				'openssl-devel',
				'libicu-devel',
				'libyaml-devel',
				'zlib-devel',
				'readline-devel',
				'perl-ExtUtils-MakeMaker',
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
			fail("Unsupported platform: ${osfamily}/${operatingsystem}")
		}
	}
}
