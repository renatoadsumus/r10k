class profile::docker inherits profile::base{	
	
  ### CRIANDO A PASTA /OPT/AGENTS/GO-AGENT
	file{"/opt/site-conf-r10k/":
		ensure  => "directory",			
	}
	
	
	service { 'docker':
        ensure  => running,
        enable  => true,
        subscribe => [Package['yum-utils','device-mapper-persistent-data','lvm2','docker-ce'],File["daemon.json"]],
    }

    package{'yum-utils':
        ensure => present,
    }

    package{'device-mapper-persistent-data':
        ensure => present,
    }

    package{'lvm2':
        ensure => present,
    }

    yumrepo { "docker-ce-stable":
        enabled  => 1,
        descr    => "Docker CE Stable - \$basearch",
        baseurl  => "https://download.docker.com/linux/centos/7/\$basearch/stable",
        proxy    => "$proxy",
        gpgcheck => 1,
        gpgkey   => "https://download.docker.com/linux/centos/gpg",
    }

    package{'docker-ce':
        ensure  => present,
        require => Yumrepo["docker-ce-stable"],
    }

    file{ '/etc/docker':
        ensure  => 'directory',
        require => Package['docker-ce'],
    }
    file {'daemon.json':
        ensure => 'file',
        path => '/etc/docker/daemon.json',
        content => '{"graph":"/opt/docker","storage-driver":"overlay","disable-legacy-registry": true}',
        require  => File['/etc/docker'],
    }
	
}
