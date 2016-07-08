class gridftp::service (
    $service = $gridftp::params::service,
    $certificate = $gridftp::params::certificate,
    $key = gridftp::params::key,
) inherits gridftp::params {
  
  #certificates should be managed outside this module
  $certificates_files = File[$certificate,$key]

  service {"$service":
	ensure		=> running,
	hasstatus	=> true,
	hasrestart	=> true,
	enable		=> true,
	require		=> [ Class["gridftp::config"], Class["gridftp::install"] ],
        subscribe       => $certificates_files,

  }

}
