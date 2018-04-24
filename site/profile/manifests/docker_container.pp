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
        command  => 'docker run -d -p 8080:8153 renatoadsumus/gocd:latest',
        user => 'root',   		
    }
}
