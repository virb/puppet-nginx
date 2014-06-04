# =Define: sites::redhat
# This class creates site configs on redhat-based distros
#
# =Parameters:
# $sites_dir:: Directory of site configs [String]
# $site_content:: Site template [String]
# $site_source:: Site file source [String]

define sites::redhat (
  $sites_dir    = undef,
  $site_content = undef,
  $site_source  = undef
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
  file { "${sites_dir}/${name}":
    content => $content,
    source  => $source
  }
  ->
  anchor { "${module_name}::site::${name}::end": }
}
