class profile::docker_container inherits profile::base{		
	
	#::docker::image { 'renatoadsumus/gocd':	
		#ensure    => 'present',
		#image_tag => 'latest',		
	#}  	
	
	#::docker::run { 'gocd_server':
		#image   => 'renatoadsumus/gocd:latest',
		#ports   => ['8080:8153'],
		#require => Docker::Image['renatoadsumus/gocd'],
  #}
  
  exec {'gocd_server':
        command  => 'docker run --rm -d -p 8089:8153 --name gocd_server --dns=172.17.32.98 --dns-search=ogmaster.local renatoadsumus/gocd:latest',       	
		path => ['/usr/bin',],
		onlyif  => 'test -e /etc/docker/container_gocd_server_execucao.txt',
    }
	
	file {'container_gocd_server_execucao':
        ensure => 'file',
        path => '/etc/docker/container_gocd_server_execucao.txt',
        content => 'Container com GO SERVER em execucao',  
		require => [Exec['gocd_server']],
	}
	
}



