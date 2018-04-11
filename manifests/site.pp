node 'default' { 
  #puppetserver-01.devopslab.com.br
  #include role::run::live
  include role::run_ci_cd
}
