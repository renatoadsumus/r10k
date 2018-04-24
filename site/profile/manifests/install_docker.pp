class profile::install_docker{

	#include ::docker

	#class { 'docker' :
		#use_upstream_package_source => false,
		#service_overrides_template  => false,
		#docker_ce_package_name  => 'docker',
	#  

	#class { 'docker':
			#docker_ee => true,
			#docker_ee_source_location => 'https://download.docker.com/linux/centos/docker-ce.repo',
			#'https://<docker_ee_repo_url>',
			#docker_ee_key_source => 'https://<docker_ee_key_source_url>',
	#}

	 #baseurl  => "https://download.docker.com/linux/centos/7/\$basearch/stable",
        #proxy    => "$proxy",
        #gpgcheck => 1,
        #gpgkey   => "https://download.docker.com/linux/centos/gpg",
		
	service { 'docker':
        ensure  => running,
        enable  => true,
        subscribe => [Package['docker']],
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
		require => [Package['docker']],
    }
	
}

	#https://www.puppetcookbook.com/posts/install-basic-docker-daemon.html
	#https://www.puppetcookbook.com/posts/run-a-basic-docker-container.html