class profile::docker inherits profile::base{
	
	file { '/etc/site-conf-r10k':
    ensure => 'directory',
  }
	
}
