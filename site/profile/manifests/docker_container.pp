class profile::docker_container inherits profile::base{	

	include ::docker	
	
	::docker::image { 'nginx':	
		ensure    => 'present',
		image_tag => 'stable-alpine',
		require   => Class['docker'],
	}  	
	
  ::docker::run { 'nginx':
		image   => 'nginx:stable-alpine',
		#ports   => ['8080:80'],
		require => Docker::Image['nginx'],
  }
  
}
