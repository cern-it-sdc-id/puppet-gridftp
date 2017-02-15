#Parameters can be specified in Hiera using Puppet3-style parameter lookup
#Default values are the same as gridftp-server is using, taken from http://www.globus.org/toolkit/docs/5.0/5.0.5/data/gridftp/admin/#globus-gridftp-server
class gridftp::params (
  
    $inetd = hiera("gridftp::params::inetd",0),
    $daemon = hiera("gridftp::params::daemon",1), 
    $detach = hiera("gridftp::params::detach",0),
    $exec = hiera("gridftp::params::exec",undef),
    $chdir = hiera("gridftp::params::chdir",1),
    $chdir_to = hiera("gridftp::params::chdir_to",undef),
    $fork = hiera("gridftp::params::fork",1),
    $single = hiera("gridftp::params::single",0),
    $user = hiera("gridftp::params::user","root"),
    $group = hiera("gridftp::params::group","root"),

    $auth_level = hiera("gridftp::params::auth_level",undef),
    $allow_from = hiera("gridftp::params::allow_from",undef),		
    $deny_from = hiera("gridftp::params::deny_from",undef),	
    $cas = hiera("gridftp::params::cas",1),		
    $secure_ipc = hiera("gridftp::params::secure_ipc",1),		
    $ipc_auth_mode = hiera("gridftp::params::ipc_auth_mode","host"),		
    $allow_anonymous = hiera("gridftp::params::allow_anonymous",0),	
    $anonymous_names_allowed = hiera("gridftp::params::anonymous_names_allowed",undef),
    $anonymous_user = hiera("gridftp::params::anonymous_user",undef),
    $anonymous_group = hiera("gridftp::params::anonymous_group",undef),	
    $pw_file = hiera("gridftp::params::pw_file",undef),
    $connections_max = hiera("gridftp::params::connections_max",undef),
    $connections_disabled = hiera("gridftp::params::connections_disabled",undef),

    $log_level = hiera("gridftp::params::log_level","ERROR"),
    $log_module = hiera("gridftp::params::log_module",undef),
    $log_single = hiera("gridftp::params::log_single",undef),
    $log_unique = hiera("gridftp::params::log_unique",undef),
    $log_transfer = hiera("gridftp::params::log_transfer",undef),
    $log_filemode = hiera("gridftp::params::log_filemode",undef),
    $disable_usage_stats = hiera("gridftp::params::disable_usage_stats",0),
    $usage_stats_target = hiera("gridftp::params::usage_stats_target","usage-stats.globus.org:4810"),

    $remote_nodes = hiera("gridftp::params::remote_nodes",undef),
    $data_node = hiera("gridftp::params::data_node",0),
    $stripe_blocksize = hiera("gridftp::params::stripe_blocksize",1048576),
    $stripe_layout = hiera("gridftp::params::stripe_layout",2),
    $stripe_blocksize_locked = hiera("gridftp::params::stripe_blocksize_locked",0),
    $stripe_layout_locked = hiera("gridftp::params::stripe_layout_locked",0),

    $blocksize = hiera("gridftp::params::blocksize",262144),
    $sync_writes = hiera("gridftp::params::sync_writes",0),

    $port = hiera("gridftp::params::port",undef),
    $control_interface = hiera("gridftp::params::control_interface",undef),
    $data_interface = hiera("gridftp::params::data_interface",undef),
    $ipc_interface = hiera("gridftp::params::ipc_interface",undef),
    $hostname = hiera("gridftp::params::hostname",undef),
    $ipc_port = hiera("gridftp::params::ipc_port",undef),
    
    $control_preauth_timeout = hiera("gridftp::params::control_preauth_timeout",120),
    $control_idle_timeout = hiera("gridftp::params::control_idle_timeout",600),
    $ipc_idle_timeout = hiera("gridftp::params::ipc_idle_timeout",600),
    $ipc_connect_timeout = hiera("gridftp::params::ipc_connect_timeout",600),

    $banner = hiera("gridftp::params::banner",undef),
    $banner_file = hiera("gridftp::params::banner_file",undef),
    $banner_terse = hiera("gridftp::params::banner_terse",0),
    $login_msg = hiera("gridftp::params::login_msg",undef),
    $login_msg_file = hiera("gridftp::params::login_msg_file",undef),

    $load_dsi_module = hiera("gridftp::params::load_dsi_module",undef),
    $dsi_packages = hiera("gridftp::params::dsi_packages",undef),
    $allowed_modules = hiera("gridftp::params::allowed_modules",undef),
    
    $sysconfigfile = hiera("gridftp::params::sysconfigfile","/etc/sysconfig/globus-gridftp-server"),
    $configfile = hiera("gridftp::params::configfile","/etc/gridftp.conf"),
    $configdir = hiera("gridftp::params::configdir","/etc/gridftp.d"),
    $use_home_dirs = hiera("gridftp::params::use_home_dirs",1),
    $debug = hiera("gridftp::params::debug",0),

    $thread_model = hiera("gridftp::params::thread_model",undef),
    $globus_tcp_port_range = hiera("gridftp::params::globus_tcp_port_range",undef),
    $globus_udp_port_range = hiera("gridftp::params::globus_udp_port_range",undef),
    $force_tls = hiera("gridftp::params::force_tls",1),
    $service = hiera("gridftp::params::service","globus-gridftp-server"),
    
    $udt = hiera("gridftp::params::udt",false),
    #certiticate and key files should be managed outside the module
    $certificate =  hiera("gridftp::params::certificate","/etc/grid-security/dpmmgr/dpmcert.pem"),
    $key = hiera("gridftp::params::key","/etc/grid-security/dpmmgr/dpmkey.pem"),
    $restart_on_cert_renewal = hiera("gridftp::params::restart_on_cert_renewal",false),
    ) 
{
  
}
