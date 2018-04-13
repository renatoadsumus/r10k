class profile::docker inherits profile::base{	
	
  ### CRIANDO A PASTA /OPT/AGENTS/GO-AGENT
	file{"/opt/site-conf-r10k/":
		ensure  => "directory",
		owner   => "tfsservice",
		group   => "suporte",		
	}
	
}
