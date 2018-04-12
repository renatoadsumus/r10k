class profile::install_svn inherits profile::base{
	package{"subversion":
		ensure   => present,
	}
}
