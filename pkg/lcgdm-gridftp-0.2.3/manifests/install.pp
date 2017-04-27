class gridftp::install (
) inherits gridftp::params {

    package {"globus-gridftp-server-progs":
      ensure	=> present,
      notify	=> [ Class["gridftp::config"], Class["gridftp::service"] ]
    }
}
