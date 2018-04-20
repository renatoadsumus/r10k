class profile::install_docker{

	include ::docker

	#class { 'docker' :
		#use_upstream_package_source => false,
		#service_overrides_template  => false,
		#docker_ce_package_name  => 'docker',
	#}  

	
	file{ '/etc/docker':
        ensure  => 'directory',  				
    }
	
    file {'daemon.json':
        ensure => 'file',
        path => '/etc/docker/daemon.json',
        content => '{"bip":"10.66.33.10/24"}',  
		require => Class['docker'],
    }
	
}

	#https://www.puppetcookbook.com/posts/install-basic-docker-daemon.html
	#https://www.puppetcookbook.com/posts/run-a-basic-docker-container.html