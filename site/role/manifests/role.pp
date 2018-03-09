class role { 
  include profile::base
} 

class role::run_ci_cd inherits role{
	include profile::install_svn
}
