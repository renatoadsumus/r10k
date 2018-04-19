class profile::docker_container inherits profile::base{	

	#include ::docker
	
	::docker::image { 'nginx':	
		ensure    => 'present',
		image_tag => 'stable-alpine',
		require   => Class['docker'],
	}  
  
}
