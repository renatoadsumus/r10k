class profile::docker_container inherits profile::base{		
	
	::docker::image { 'renatoadsumus/gocd':	
		ensure    => 'present',
		image_tag => 'latest',		
	}  	
	
  ::docker::run { 'renatoadsumus/gocd':
		image   => 'renatoadsumus/gocd:latest',
		ports   => ['8080:8153'],
		require => Docker::Image['renatoadsumus/gocd'],
  }
  
}
