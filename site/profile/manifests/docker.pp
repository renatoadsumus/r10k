class profile::docker inherits profile::base{	
	

	service { 'docker':
        ensure  => running,
        enable  => true,
        subscribe => [Package['docker'],File["/etc/docker"],File["daemon.json"]],
    }
	
	package{'docker':
        ensure => present,
    }
	
	 file{ '/etc/docker':
        ensure  => 'directory',        
    }
	
    file {'daemon.json':
        ensure => 'file',
        path => '/etc/docker/daemon.json',
        content => '{"bip":"10.66.33.10/24"}',        
    }
}
