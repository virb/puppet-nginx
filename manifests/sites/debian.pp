# =Define: sites::debian
# This class creates site configs on Debian-based distros
#
# =Parameters:
# $sites_avail_dir:: Directory of available site configs [String]
# $sites_enabled_dir:: Directory of enabled site configs [String]
# $site_content:: Site template [String]
# $site_source:: Site file source [String]

define sites::debian (
  $sites_avail_dir   = undef,
  $sites_enabled_dir = undef,
  $site_content      = undef,
  $site_source       = undef
) {

  if $site_content and $site_source {
    err( "${module_name}::sites: site_content and site_source cannot both be specified" )
  } elsif $site_source {
    $content = undef
    $source  = $site_source
  } elsif $site_content {
    $content = $site_content
    $source  = undef
  }

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }

  anchor { "${module_name}::site::${name}::begin": }
  ->
  file { "${sites_avail_dir}/${name}":
    content => $content,
    source  => $source
  }
  ->
  file { "${sites_enabled_dir}/${name}":
    ensure => link,
    target => "${sites_avail_dir}/${name}",
    notify => Service['nginx']
  }
  ->
  anchor { "${module_name}::site::${name}::end": }
}
