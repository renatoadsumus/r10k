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
  
  file {'meu.json':
        ensure => 'file',
        path => '/opt/meu.json',
        content => '{"bip":"10.66.33.10/24"}', 
		
    }
}
