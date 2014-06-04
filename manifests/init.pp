# =Class: nginx
# This modules manages the configuration of nginx
#
# =Parameters:
# $config:: main nginx config file source or template [String]
# $package:: Name(s) of the nginx package [String, Array]
# $purge:: Purge default sites [Bool]
# $service:: Name of the nginx service [Default='nginx'] [String]
# $sites:: Hash of nginx site sources or templates [Hash]

class nginx (
  $config_content    = undef,
  $config_source     = undef,
  $default_sites     = $default_sites,
  $package           = $package,
  $purge             = false,
  $service           = $service,
  $sites             = {},
  $sites_dir         = $sites_dir,
  $sites_avail_dir   = $sites_avail_dir,
  $sites_enabled_dir = $sites_enabled_dir
) inherits nginx::defaults {

  anchor { "${module_name}::begin": }
  ->
  class { "${module_name}::package":
    package => $package,
  }
  ->
  class { "${module_name}::config":
    config_content => $config_content,
    config_source  => $config_source
  }
  ->
  class { "${module_name}::purge":
    default_sites => $default_sites,
    purge         => $purge
  }
  ->
  class { "${module_name}::sites":
    sites             => $sites,
    sites_dir         => $sites_dir,
    sites_avail_dir   => $sites_avail_dir,
    sites_enabled_dir => $sites_enabled_dir
  }
  ->
  class { "${module_name}::service":
    service => $service
  }
  ->
  anchor { "${module_name}::end": }
}
