class gridftp::config (
    $inetd			= $gridftp::params::inetd,
    $daemon			= $gridftp::params::daemon,
    $detach			= $gridftp::params::detach,
    $exec			= $gridftp::params::exec,
    $chdir			= $gridftp::params::chdir,
    $chdir_to			= $gridftp::params::chdir_to,
    $fork			= $gridftp::params::fork,
    $single			= $gridftp::params::single,
    $user				= $gridftp::params::user,
    $group				= $gridftp::params::group,
    $auth_level			= $gridftp::params::auth_level,
    $allow_from			= $gridftp::params::allow_from,
    $deny_from			= $gridftp::params::deny_from,
    $cas			= $gridftp::params::cas,
    $secure_ipc			= $gridftp::params::secure_ipc,
    $ipc_auth_mode		= $gridftp::params::ipc_auth_mode,
    $allow_anonymous		= $gridftp::params::allow_anonymous,
    $anonymous_names_allowed	= $gridftp::params::anonymous_names_allowed,
    $anonymous_user		= $gridftp::params::anonymous_user,
    $anonymous_group		= $gridftp::params::anonymous_group,
    $pw_file			= $gridftp::params::pw_file,
    $connections_max		= $gridftp::params::connections_max,
    $connections_disabled	= $gridftp::params::connections_disabled,
    $log_level			= $gridftp::params::log_level,
    $log_module			= $gridftp::params::log_module,
    $log_single			= $gridftp::params::log_single,
    $log_unique			= $gridftp::params::log_unique,
    $log_transfer		= $gridftp::params::log_transfer,
    $log_filemode		= $gridftp::params::log_filemode,
    $disable_usage_stats	= $gridftp::params::disable_usage_stats,
    $usage_stats_target		= $gridftp::params::usage_stats_target,
    $remote_nodes		= $gridftp::params::remote_nodes,
    $data_node			= $gridftp::params::data_node,
    $stripe_blocksize		= $gridftp::params::stripe_blocksize,
    $stripe_layout		= $gridftp::params::stripe_layout,
    $stripe_blocksize_locked	= $gridftp::params::stripe_blocksize_locked,
    $stripe_layout_locked	= $gridftp::params::stripe_layout_locked,
    $blocksize			= $gridftp::params::blocksize,
    $sync_writes		= $gridftp::params::sync_writes,
    $port			= $gridftp::params::port,
    $control_interface		= $gridftp::params::control_interface,
    $data_interface		= $gridftp::params::data_interface,
    $ipc_interface		= $gridftp::params::ipc_interface,
    $hostname			= $gridftp::params::hostname,
    $ipc_port			= $gridftp::params::ipc_port,
    $control_preauth_timeout	= $gridftp::params::control_preauth_timeout,
    $control_idle_timeout	= $gridftp::params::control_idle_timeout,
    $ipc_idle_timeout		= $gridftp::params::ipc_idle_timeout,
    $ipc_connect_timeout	= $gridftp::params::ipc_connect_timeout,
    $banner			= $gridftp::params::banner,
    $banner_file		= $gridftp::params::banner_file,
    $banner_terse		= $gridftp::params::banner_terse,
    $login_msg			= $gridftp::params::login_msg,
    $login_msg_file		= $gridftp::params::login_msg_file,
    $load_dsi_module		= $gridftp::params::load_dsi_module,
    $dsi_packages		= $gridftp::params::dsi_packages,
    $allowed_modules		= $gridftp::params::allowed_modules,
    $sysconfigfile		= $gridftp::params::sysconfigfile,
    $configfile			= $gridftp::params::configfile,
    $configdir			= $gridftp::params::configdir,
    $use_home_dirs		= $gridftp::params::use_home_dirs,
    $debug			= $gridftp::params::debug,
    $thread_model		= $gridftp::params::thread_model,
    $globus_tcp_port_range      = $gridftp::params::globus_tcp_port_range,
    $globus_udp_port_range      = $gridftp::params::globus_udp_port_range,
    $force_tls			= $gridftp::params::force_tls,
    $service = $gridftp::params::service,
    $udt = $gridftp::params::udt

) inherits gridftp::params {

  file {"$sysconfigfile":
    ensure  => file,
    owner   => "${user}",
    group   => "${group}",
    content => template("gridftp/sysconfig.erb"),
    require => Package["globus-gridftp-server-progs"],
    notify  => Service["$service"],
  }

  file {"$configfile":
    ensure 	=> file,
    owner   => "${user}",
    group   => "${group}",
    content	=> template("gridftp/gridftp.conf.erb"),
    require	=> Package["globus-gridftp-server-progs"],
    notify	=> Service["$service"]
  }

  file {"$configdir":
    ensure	=> directory,
    owner   => "${user}",
    group   => "${group}",
    require	=> Package["globus-gridftp-server-progs"]
  }

  if $log_single {
	file {"$log_single":
		ensure       => file,
    owner        => "${user}",
    group        => "${group}",
		recurse      => true,
		recurselimit => 1,
	}
  }

  if $log_transfer {
	file {"$log_transfer":
    owner   => "${user}",
    group   => "${group}",
		recurse => true,
	}
  }
}
