class role::install_svn {
	package{"subversion":
		ensure   => present,
	}
}
