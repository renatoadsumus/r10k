class profile::install_docker{

	#include ::docker

	class { 'docker' :
		manage_package => true,
		docker_ce_package_name  => 'docker',
	}
  
	#service { 'docker':
        #ensure  => running,
        #enable  => true,
        #subscribe => [Package['docker'],File["/etc/docker"],File["daemon.json"]],
    #}
	
	#package{'docker':
       #ensure => present,
    #}
	
	file{ '/etc/docker':
        ensure  => 'directory',        
    }
	
    file {'daemon.json':
        ensure => 'file',
        path => '/etc/docker/daemon.json',
        content => '{"bip":"10.66.33.10/24"}',        
    }
	
}