# == Class: gridftp
#
# Full description of class gridftp here.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
#
# === Authors
#
# CERN DPM <dpm-devel@cern.ch>
#
# === Copyright
#
# Copyright 2012 CERN, unless otherwise noted.
#
class gridftp (
) inherits gridftp::params {

  Class[gridftp::install] -> Class[gridftp::config] -> Class[gridftp::service]

  class{"gridftp::install":}
  class{"gridftp::config":}
  class{"gridftp::service":}

}
