class gridftp::service (
    $service = $gridftp::params::service,
    $certificate = $gridftp::params::certificate,
    $key = $gridftp::params::key,
    $restart_on_cert_renewal = $gridftp::params::restart_on_cert_renewal,
) inherits gridftp::params {
  
  if $restart_on_cert_renewal {
       #certificates should be managed outside this module
       $certificates_files = File[$certificate,$key]

        service {"$service":
	   ensure		=> running,
	   hasstatus	        => true,
	   hasrestart	        => true,
	   enable		=> true,
	   require		=> [ Class["gridftp::config"], Class["gridftp::install"] ],
           subscribe             => $certificates_files,
        }
   } 
   else {
	service {"$service":    
           ensure               => running,
           hasstatus            => true,
           hasrestart           => true,
           enable               => true,
           require              => [ Class["gridftp::config"], Class["gridftp::install"] ],
        }
	
   }

}
