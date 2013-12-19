puppet-devtools
===============

A Puppet module that installs all necessary packages for compiling basic software.

## Sample Usage
Install devtools and use the provided configuration defaults
```puppet
node default {
	class {'devtools':}
}
```
or
```puppet
node default {
	include devtools
}
```

Uninstall devtools
```puppet
node default {
	class {'devtools':
		ensure => absent,
	}
}
```

Contact
-------

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

Support
-------

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-devtools/issues)
